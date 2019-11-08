
message(STATUS "Using WASM dummy")
add_library(png_static STATIC wasm.cpp)
target_include_directories(png_static INTERFACE .)

