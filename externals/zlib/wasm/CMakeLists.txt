
message(STATUS "Using WASM dummy")
add_library(zlibstatic STATIC wasm.cpp)
target_include_directories(zlibstatic INTERFACE .)
