
message(STATUS "@@@ zlib")

set(SKIP_INSTALL_ALL 1)

add_subdirectory(zlib)

#target_include_directories(zlib PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/zlib)
#target_include_directories(zlib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/zlib)
target_include_directories(zlibstatic INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/zlib)
target_include_directories(zlibstatic INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/zlib)
