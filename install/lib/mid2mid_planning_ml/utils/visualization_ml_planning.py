#!/usr/bin/env python3
'''
  @file         visualization_ml_planning.py
  @brief        Visualization utilities for ML planning model input

  @authors      Seungji Ryu (seungjiryu@hanyang.ac.kr)

  @date         2025-10-25 created by Seungji Ryu

  This module provides visualization functions for ML planning model inputs
  in local (ego-centered) coordinates using matplotlib.
'''

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import rospy


def visualize_model_input(model_input, save_path=None):
    """
    Visualize model input tensors in local coordinates

    Args:
        model_input: Dictionary containing model input tensors
            - map.point_position: [1, M, 3, 20, 2] - (batch, lane segments, 3 lines, points, xy)
            - map.point_vector: [1, M, 1, 20, 2] - (batch, lane segments, 1 centerline, points, xy)
            - map.valid_mask: [1, M, 20] - (batch, lane segments, points)
            - agent.position: [1, A, T, 2] - (batch, agents, timesteps, xy)
            - agent.shape: [1, A, 2] or similar - vehicle dimensions (length, width)
            - agent.heading: [1, A, T] - vehicle heading angles
            - reference_line.position: [1, R, N_points, 2] - (batch, reference lines, points, xy)
        save_path: Path to save the visualization image (optional)

    Returns:
        None (saves image to disk if save_path is provided)
    """
    try:
        fig, ax = plt.subplots(figsize=(20, 20))

        # Set axis properties
        ax.set_aspect('equal')
        ax.grid(True, alpha=0.3)
        ax.set_xlabel('X (m) - Local Frame', fontsize=14)
        ax.set_ylabel('Y (m) - Local Frame', fontsize=14)
        ax.set_title('Model Input Visualization (Ego-Centered Local Frame)', fontsize=16, fontweight='bold')

        # 1. Visualize Map Centerlines with arrows (point_vector)
        if 'map' in model_input and model_input['map'] is not None:
            map_data = model_input['map']

            # point_position: [1, M, 3, 20, 2] - we use centerline (line_idx=0)
            # point_vector: [1, M, 1, 20, 2] - only centerline vectors
            if 'point_position' in map_data and 'point_vector' in map_data:
                # Convert tensors to numpy [batch=0]
                point_positions = map_data['point_position'][0].cpu().numpy()  # [M, 3, 20, 2]
                point_vectors = map_data['point_vector'][0].cpu().numpy()      # [M, 1, 20, 2]

                # Get additional polygon attributes
                polygon_on_route = None
                polygon_type = None
                polygon_tl_status = None

                if 'polygon_on_route' in map_data:
                    polygon_on_route = map_data['polygon_on_route'][0].cpu().numpy()  # [M]
                if 'polygon_type' in map_data:
                    polygon_type = map_data['polygon_type'][0].cpu().numpy()  # [M]
                if 'polygon_tl_status' in map_data:
                    polygon_tl_status = map_data['polygon_tl_status'][0].cpu().numpy()  # [M]

                # Use valid_mask if available
                if 'valid_mask' in map_data:
                    valid_mask = map_data['valid_mask'][0].cpu().numpy()  # [M, 20]
                else:
                    valid_mask = np.ones((point_positions.shape[0], point_positions.shape[2]))

                num_lanes = point_positions.shape[0]  # Dynamic number of lane segments
                rospy.loginfo_throttle(5, f"Visualizing {num_lanes} lane segments (centerlines only)")

                # First pass: Draw on_route lanes as background (thick, light blue, low alpha)
                if polygon_on_route is not None:
                    for lane_idx in range(num_lanes):
                        if polygon_on_route[lane_idx] > 0.5:  # Lane is on route
                            centerline_positions = point_positions[lane_idx, 0, :, :]  # [20, 2]
                            line_valid = valid_mask[lane_idx, :]

                            valid_indices = np.where(line_valid > 0.5)[0]
                            if len(valid_indices) == 0:
                                continue

                            valid_positions = centerline_positions[valid_indices]

                            # Draw thick, light blue, transparent line for on_route
                            ax.plot(valid_positions[:, 0], valid_positions[:, 1],
                                   color='lightblue', alpha=0.45, linewidth=10.0,
                                   zorder=1,  # Draw at bottom
                                   label='On Route' if lane_idx == np.where(polygon_on_route > 0.5)[0][0] else '')

                # Second pass: Draw regular centerlines and arrows
                for lane_idx in range(num_lanes):
                    # Use centerline (line_idx=0) from point_position
                    centerline_positions = point_positions[lane_idx, 0, :, :]  # [20, 2]
                    # point_vector only has 1 line dimension (index 0)
                    centerline_vectors = point_vectors[lane_idx, 0, :, :]      # [20, 2]
                    line_valid = valid_mask[lane_idx, :]                       # [20]

                    # Filter valid points
                    valid_indices = np.where(line_valid > 0.5)[0]
                    if len(valid_indices) == 0:
                        continue

                    valid_positions = centerline_positions[valid_indices]
                    valid_vectors = centerline_vectors[valid_indices]

                    # Determine if this is a traffic light controlled lane (polygon_type == 1)
                    is_traffic_light_lane = (polygon_type is not None and
                                            int(polygon_type[lane_idx]) == 1)

                    # Get traffic light status color
                    if is_traffic_light_lane and polygon_tl_status is not None:
                        tl_status = int(polygon_tl_status[lane_idx])
                        # 0: green, 1: yellow, 2: red, 3: unknown (black)
                        tl_color_map = {
                            0: 'green',
                            1: 'yellow',
                            2: 'red',
                            3: 'black'
                        }
                        arrow_color = tl_color_map.get(tl_status, 'black')
                        arrow_label = f'TL {arrow_color.capitalize()}'
                    else:
                        arrow_color = 'blue'
                        arrow_label = 'Centerline'

                    # Plot centerline
                    ax.plot(valid_positions[:, 0], valid_positions[:, 1],
                           'b-', alpha=0.5, linewidth=1.5, zorder=2,
                           label=arrow_label if lane_idx == 0 else '')

                    # Plot arrows for direction vectors (downsample)
                    # arrow_step = max(1, len(valid_positions) // 5)  # ~5 arrows per each lane segment
                    arrow_step = 1 # all arrows per each lane segment
                    for i in range(0, len(valid_positions), arrow_step):
                        if i < len(valid_vectors):
                            x = float(valid_positions[i, 0])
                            y = float(valid_positions[i, 1])
                            dx = float(valid_vectors[i, 0])
                            dy = float(valid_vectors[i, 1])

                            # Normalize vector for consistent arrow size
                            vec_norm = np.sqrt(dx**2 + dy**2)
                            if vec_norm > 1e-6:
                                arrow_scale = 1.5  # Arrow length in meters
                                dx_norm = (dx / vec_norm) * arrow_scale
                                dy_norm = (dy / vec_norm) * arrow_scale

                                ax.arrow(x, y, dx_norm, dy_norm,
                                       head_width=0.6, head_length=0.4,
                                       fc=arrow_color, ec=arrow_color,
                                       alpha=0.7, linewidth=1.2, zorder=3)

        # 2. Visualize Agents (Ego + Objects)
        # agent.position: [1, A, T, 2] - dynamic number of agents
        if 'agent' in model_input and model_input['agent'] is not None:
            agent_data = model_input['agent']

            # Get category information if available
            agent_category = None
            if 'category' in agent_data:
                agent_category = agent_data['category'][0].cpu().numpy()  # [A]

            # Category mapping: 0: Ego, 1: Vehicle, 2: Pedestrian, 3: Bicycle
            category_map = {
                0: 'Ego',
                1: 'Vehicle',
                2: 'Pedestrian',
                3: 'Bicycle'
            }

            if 'position' in agent_data:
                positions = agent_data['position'][0].cpu().numpy()  # [A, T, 2]

                num_agents = positions.shape[0]  # Dynamic number of agents
                rospy.loginfo_throttle(5, f"Visualizing {num_agents} agents")

                for agent_idx in range(num_agents):
                    agent_positions = positions[agent_idx]  # [T, 2]

                    # Get agent category
                    if agent_idx == 0:
                        # First agent is always Ego
                        category_name = 'Ego'
                    elif agent_category is not None:
                        category_id = int(agent_category[agent_idx])
                        category_name = category_map.get(category_id, 'Unknown')
                    else:
                        category_name = 'Unknown'

                    if agent_idx == 0:
                        # Ego agent - red rectangle
                        if 'shape' in agent_data:
                            shape_tensor = agent_data['shape'][0, agent_idx].cpu().numpy()

                            # Flatten to 1-d array and extract length, width
                            shape_flat = shape_tensor.flatten()
                            if len(shape_flat) >= 2:
                                width = float(shape_flat[0])
                                length = float(shape_flat[1])
                            else:
                                # Default ego vehicle size if shape not available
                                width = 4.5
                                length = 2.0
                        else:
                            # Default ego vehicle size
                            width = 4.5
                            length = 2.0

                        # Get heading if available
                        if 'heading' in agent_data:
                            heading = float(agent_data['heading'][0, agent_idx, -1].cpu().numpy())
                        else:
                            heading = 0.0

                        # Create rotated rectangle for ego (red)
                        rect = patches.Rectangle(
                            (-length/2, -width/2), length, width,
                            fill=False, edgecolor='red', linewidth=2.5, alpha=1.0,
                            label='Ego'
                        )
                        # Apply rotation and translation
                        t = patches.transforms.Affine2D().rotate(heading).translate(
                            float(agent_positions[-1, 0]), float(agent_positions[-1, 1])
                        ) + ax.transData
                        rect.set_transform(t)
                        ax.add_patch(rect)

                        # Add direction indicator (equilateral triangle)
                        # Triangle points toward heading direction
                        # heading = 0 means pointing right (x-axis), positive heading is counter-clockwise
                        triangle_size = 1.2  # Size of the triangle
                        # Vertices of equilateral triangle pointing right (in local coordinates)
                        # Right-pointing triangle (heading=0 points to +x direction)
                        triangle_local = np.array([
                            [triangle_size * 0.866, 0],       # Right vertex (tip)
                            [-triangle_size * 0.433, triangle_size * 0.5],   # Top left
                            [-triangle_size * 0.433, -triangle_size * 0.5]   # Bottom left
                        ])

                        # Create triangle patch
                        triangle = patches.Polygon(triangle_local, closed=True,
                                                  facecolor='red', edgecolor='darkred',
                                                  linewidth=1.5, alpha=0.8, zorder=5)
                        # Apply rotation (counter-clockwise for positive heading) and translation
                        t_tri = patches.transforms.Affine2D().rotate(heading).translate(
                            float(agent_positions[-1, 0]), float(agent_positions[-1, 1])
                        ) + ax.transData
                        triangle.set_transform(t_tri)
                        ax.add_patch(triangle)

                        # Add class text above ego
                        ax.text(agent_positions[-1, 0], agent_positions[-1, 1] + width/2 + 1.0,
                               f'Class: {category_name}',
                               fontsize=9, color='red', fontweight='bold',
                               ha='center', va='bottom', zorder=10)
                    else:
                        # Other agents - orange bounding box
                        # Add object bounding box if shape is available
                        if 'shape' in agent_data:
                            shape_tensor = agent_data['shape'][0, agent_idx].cpu().numpy()

                            # Flatten to 1-d array and extract length, width
                            shape_flat = shape_tensor.flatten()
                            if len(shape_flat) >= 2:
                                width = float(shape_flat[0])
                                length = float(shape_flat[1])
                            else:
                                # Not enough elements, skip bounding box
                                continue

                            # Get heading if available
                            if 'heading' in agent_data:
                                heading = float(agent_data['heading'][0, agent_idx, -1].cpu().numpy())
                            else:
                                heading = 0.0

                            # Create rotated rectangle (orange for objects)
                            rect = patches.Rectangle(
                                (-length/2, -width/2), length, width,
                                fill=False, edgecolor='orange', linewidth=1.8, alpha=0.7,
                                label='Objects' if agent_idx == 1 else ''
                            )
                            # Apply rotation and translation
                            t = patches.transforms.Affine2D().rotate(heading).translate(
                                float(agent_positions[-1, 0]), float(agent_positions[-1, 1])
                            ) + ax.transData
                            rect.set_transform(t)
                            ax.add_patch(rect)

                            # Add direction indicator (equilateral triangle)
                            # Triangle points toward heading direction
                            # heading = 0 means pointing right (x-axis), positive heading is counter-clockwise
                            triangle_size = 1.0  # Slightly smaller for objects
                            # Vertices of equilateral triangle pointing right (in local coordinates)
                            # Right-pointing triangle (heading=0 points to +x direction)
                            triangle_local = np.array([
                                [triangle_size * 0.866, 0],       # Right vertex (tip)
                                [-triangle_size * 0.433, triangle_size * 0.5],   # Top left
                                [-triangle_size * 0.433, -triangle_size * 0.5]   # Bottom left
                            ])

                            # Create triangle patch
                            triangle = patches.Polygon(triangle_local, closed=True,
                                                      facecolor='orange', edgecolor='darkorange',
                                                      linewidth=1.2, alpha=0.7, zorder=5)
                            # Apply rotation (counter-clockwise for positive heading) and translation
                            t_tri = patches.transforms.Affine2D().rotate(heading).translate(
                                float(agent_positions[-1, 0]), float(agent_positions[-1, 1])
                            ) + ax.transData
                            triangle.set_transform(t_tri)
                            ax.add_patch(triangle)

                            # Add class text above object
                            ax.text(agent_positions[-1, 0], agent_positions[-1, 1] + width/2 + 1.0,
                                   f'Class: {category_name}',
                                   fontsize=8, color='orange', fontweight='normal',
                                   ha='center', va='bottom', zorder=10)

        # 3. Visualize Reference Lines
        # reference_line.position: [1, R, N_points, 2] - dynamic number of reference lines
        if 'reference_line' in model_input and model_input['reference_line'] is not None:
            ref_line_data = model_input['reference_line']

            if 'position' in ref_line_data:
                ref_positions = ref_line_data['position'][0].cpu().numpy()  # [R, N_points, 2]

                num_refs = ref_positions.shape[0]  # Dynamic number of reference lines
                rospy.loginfo_throttle(5, f"Visualizing {num_refs} reference lines")

                # Visualize all reference lines
                for ref_idx in range(num_refs):
                    line_points = ref_positions[ref_idx]  # [N_points, 2]
                    ax.plot(line_points[:, 0], line_points[:, 1],
                           'g--', linewidth=2.0, alpha=0.8,
                           label=f'Reference Line' if ref_idx == 0 else '')

        # Add legend
        handles, labels = ax.get_legend_handles_labels()
        by_label = dict(zip(labels, handles))  # Remove duplicates
        ax.legend(by_label.values(), by_label.keys(), loc='upper right', fontsize=11)

        # Auto-scale with some margin
        ax.margins(0.1)

        # Save figure
        if save_path is not None:
            plt.savefig(save_path, dpi=300, bbox_inches='tight')
            rospy.loginfo(f"Saved visualization to: {save_path}")

        plt.close(fig)

    except Exception as e:
        rospy.logerr(f"Failed to visualize model input: {e}")
        import traceback
        rospy.logerr(traceback.format_exc())
        if 'fig' in locals():
            plt.close(fig)
