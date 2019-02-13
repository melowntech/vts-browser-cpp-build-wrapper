
message(STATUS "@@@ freetype")

set(FT_WITH_ZLIB ON)
set(BUILD_SHARED_LIBS OFF)
set(SKIP_INSTALL_ALL ON)

add_subdirectory(freetype2)
