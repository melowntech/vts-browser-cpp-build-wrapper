
message(STATUS "Using WASM dummy")
add_library(harfbuzz STATIC wasm.cpp)
target_include_directories(harfbuzz INTERFACE .)
