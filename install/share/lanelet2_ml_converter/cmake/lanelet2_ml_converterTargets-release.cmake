#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "lanelet2_ml_converter::lanelet2_ml_converter" for configuration "Release"
set_property(TARGET lanelet2_ml_converter::lanelet2_ml_converter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(lanelet2_ml_converter::lanelet2_ml_converter PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblanelet2_ml_converter.so"
  IMPORTED_SONAME_RELEASE "liblanelet2_ml_converter.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS lanelet2_ml_converter::lanelet2_ml_converter )
list(APPEND _IMPORT_CHECK_FILES_FOR_lanelet2_ml_converter::lanelet2_ml_converter "${_IMPORT_PREFIX}/lib/liblanelet2_ml_converter.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
