
message(STATUS "@@@ gdal")

add_library(gdal INTERFACE)

target_include_directories(gdal INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/gdal")

# todo
message(STATUS "GDAL is not yet implemented")


