
message(STATUS "@@@ harfbuzz")

set(HB_HAVE_FREETYPE ON)
set(HB_BUILD_SUBSET OFF)
set(HB_BUILD_TESTS OFF)
set(SKIP_INSTALL_ALL ON)

add_subdirectory(harfbuzz)

target_include_directories(harfbuzz PUBLIC harfbuzz/src)
