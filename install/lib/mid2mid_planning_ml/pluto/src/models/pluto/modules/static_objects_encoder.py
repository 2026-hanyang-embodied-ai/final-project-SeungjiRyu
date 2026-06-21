import math
import torch
import torch.nn as nn

from ..layers.fourier_embedding import FourierEmbedding


class StaticObjectsEncoder(nn.Module):
    def __init__(self, dim) -> None:
        super().__init__()

        self.obj_encoder = FourierEmbedding(2, dim, 64)
        self.type_emb = nn.Embedding(4, dim)

        nn.init.normal_(self.type_emb.weight, mean=0.0, std=0.01)

    def forward(self, data):
        pos = data["static_objects"]["position"]
        heading = data["static_objects"]["heading"]
        shape = data["static_objects"]["shape"]
        category = data["static_objects"]["category"].long()
        valid_mask = data["static_objects"]["valid_mask"]  # [bs, N]

        # Handle edge case: static objects exist in parsing but are empty in tensor conversion
        # This happens when static objects are counted but don't have valid data
        if shape.shape[1] == 0:  # No actual static objects data
            batch_size = pos.shape[0]
            empty_emb = torch.zeros(batch_size, 0, self.obj_encoder.hidden_dim, device=pos.device)
            empty_pos = torch.zeros(batch_size, 0, 3, device=pos.device)
            empty_mask = torch.zeros(batch_size, 0, dtype=torch.bool, device=pos.device)
            return empty_emb, empty_pos, empty_mask

        obj_emb_tmp = self.obj_encoder(shape) + self.type_emb(category.long())
        obj_emb = torch.zeros_like(obj_emb_tmp)
        
        # Check dimension compatibility before indexing
        # valid_mask와 obj_emb_tmp의 차원이 맞는지 확인
        if valid_mask.shape[1] != obj_emb_tmp.shape[1]:
            # valid_mask와 obj_emb_tmp의 객체 수가 다른 경우 처리
            batch_size = pos.shape[0]
            # obj_emb_tmp의 실제 객체 수에 맞춰 빈 텐서 반환
            actual_num_objects = obj_emb_tmp.shape[1]
            empty_emb = torch.zeros(batch_size, actual_num_objects, self.obj_encoder.hidden_dim, device=pos.device)
            empty_pos = torch.zeros(batch_size, actual_num_objects, 3, device=pos.device)
            empty_mask = torch.ones(batch_size, actual_num_objects, dtype=torch.bool, device=pos.device)
            return empty_emb, empty_pos, empty_mask
        
        # Only assign values where valid_mask is True, and both tensors have compatible shapes
        if valid_mask.any():
            obj_emb[valid_mask] = obj_emb_tmp[valid_mask]

        heading = (heading + math.pi) % (2 * math.pi) - math.pi
        obj_pos = torch.cat([pos, heading.unsqueeze(-1)], dim=-1)

        return obj_emb, obj_pos, ~valid_mask
