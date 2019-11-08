
message(STATUS "Using WASM dummy")
add_library(freetype STATIC wasm.cpp)
target_include_directories(freetype INTERFACE .)
