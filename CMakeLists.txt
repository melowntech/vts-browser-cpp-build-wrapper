cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)
project(vts-browser-win)

# disable in-source builds
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
    message(FATAL_ERROR "In-source build is disabled. Remove the already generated files and start again from dedicated build directory.")
ENDIF()

# make the project find our own provided libraries
# the libraries provided here should have higher priority than system libraries
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/modules")

# make cmake search for additional programs etc. in the extra folder
# the programs provided here should have higher priority than system programs
list(INSERT CMAKE_PREFIX_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/extra")

# boost
add_definitions(
    -DBOOST_THREAD_PROVIDES_NESTED_LOCKS # make boost scoped_lock available as a nested class of mutex
    -DBOOST_ALL_NO_LIB # configure boost for manual linking libraries
    -DBOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE # suppress boost compiler version check warnings
)

# MS Visual Studio
if(MSVC)
    # disable warning: class 'type' needs to have dll-interface to be used by clients of class 'type2'
    add_definitions(/wd4251 /wd4275)

    # disable warning: conversion from 'type' to 'type2', possible loss of data
    add_definitions(/wd4267 /wd4244 /wd4305)

    # enable multi process compilation
    add_definitions(/MP)
endif()

# all final product files should be placed in a sane locations
foreach(conf IN ITEMS ${CMAKE_CONFIGURATION_TYPES} ${CMAKE_BUILD_TYPE})
    string(TOUPPER ${conf} conf_upper)
    string(TOLOWER ${conf} conf_lower)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib/${conf_lower}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib/${conf_lower}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/bin/${conf_lower}")
endforeach(conf)

# 3rd party libraries
message(STATUS "@@@ including externals")
add_subdirectory(externals EXCLUDE_FROM_ALL)

# vts browser
message(STATUS "@@@ including browser")
add_subdirectory(externals/browser/browser)

#ide groups for 3rd party libraries
foreach(name IN ITEMS genfiles jpeg-static GeographicLib_STATIC jsoncpp_lib_static libcurl png_static proj SDL2 simd simd-objs zlibstatic gdalBuild)
    if(TARGET ${name})
        buildsys_ide_groups(${name} deps)
    endif()
endforeach()



