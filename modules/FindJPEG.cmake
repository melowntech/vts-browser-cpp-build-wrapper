
if(NOT TARGET vts-jpeg)
    message(FATAL_ERROR "vts-jpeg NOT FOUND")
endif()

set(Jpeg_LIBRARIES vts-jpeg)
get_target_property(Jpeg_INCLUDE_DIRS vts-jpeg INTERFACE_INCLUDE_DIRECTORIES)
set(Jpeg_LIBRARY ${Freetype_LIBRARIES})
set(Jpeg_INCLUDE_DIR ${Freetype_INCLUDE_DIRS})
set(Jpeg_FOUND TRUE)

set(JPEG_LIBRARIES ${Jpeg_LIBRARIES})
set(JPEG_INCLUDE_DIRS ${Jpeg_INCLUDE_DIRS})
set(JPEG_LIBRARY ${Jpeg_LIBRARIES})
set(JPEG_INCLUDE_DIR ${Jpeg_INCLUDE_DIRS})
set(JPEG_FOUND TRUE)

