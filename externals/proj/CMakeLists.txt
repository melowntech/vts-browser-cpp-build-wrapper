
message(STATUS "@@@ proj")

add_subdirectory(proj)

target_include_directories(proj INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/proj/src>)

