
message(STATUS "Using WASM dummy")
add_library(zlib STATIC wasm.cpp)
target_include_directories(zlib INTERFACE .)
