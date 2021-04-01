cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

message(STATUS "Using WASM dummy")
add_library(vts-jpeg STATIC wasm.cpp)
target_include_directories(vts-jpeg INTERFACE .)
target_compile_options(vts-jpeg PUBLIC "SHELL:-s USE_LIBJPEG=1")
target_link_options(vts-jpeg PUBLIC "SHELL:-s USE_LIBJPEG=1")
