
message(STATUS "@@@ png")

option(PNG_SHARED "Build shared lib" OFF)
option(PNG_TESTS  "Build libpng tests" OFF)
set(SKIP_INSTALL_ALL ON)

add_subdirectory(png)

target_include_directories(png_static INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/png)
target_include_directories(png_static INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/png)

