
message(STATUS "@@@ zlib")

if(BUILDSYS_WASM)
    add_subdirectory(wasm)
    return()
endif()

set(SKIP_INSTALL_ALL 1)

add_subdirectory(zlib)

target_include_directories(zlibstatic INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/zlib")
target_include_directories(zlibstatic INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/zlib")

if(APPLE)
    target_compile_options(zlibstatic PRIVATE -Wno-implicit-function-declaration)
endif()
