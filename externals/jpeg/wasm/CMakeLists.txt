
message(STATUS "Using WASM dummy")
add_library(jpeg-static STATIC wasm.cpp)
target_include_directories(jpeg-static INTERFACE .)
