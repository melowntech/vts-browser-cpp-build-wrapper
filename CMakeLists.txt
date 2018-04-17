cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)
project(vts-browser-win)

set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
    message(FATAL_ERROR "In-source build is disabled. Remove the already generated files and start again from dedicated build directory.")
ENDIF()

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_SOURCE_DIR}/modules)


add_definitions(-DBOOST_THREAD_PROVIDES_NESTED_LOCKS)


message(STATUS "@@@ including externals")
add_subdirectory(externals EXCLUDE_FROM_ALL)


message(STATUS "@@@ including browser")
add_subdirectory(browser/browser)


