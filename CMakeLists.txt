cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)
project(vts-browser-build-wrapper)

# disable in-source builds
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
    message(FATAL_ERROR "In-source build is disabled. Remove the already generated files and start again from dedicated build directory.")
endif()

# disable 32 bit builds
if(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
    message(FATAL_ERROR "64 bit generator is required.")
endif()

# make the project find our own provided libraries
# the libraries provided here should have higher priority than system libraries
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/modules")

# make cmake search for additional programs
# the programs provided here should have higher priority than system programs
list(INSERT CMAKE_PREFIX_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/programs")

# MS Visual Studio
if(MSVC)
    # disable warning: class 'type' needs to have dll-interface to be used by clients of class 'type2'
    add_definitions(/wd4251 /wd4275)

    # disable warning: conversion from 'type' to 'type2', possible loss of data
    add_definitions(/wd4267 /wd4244 /wd4305)

    # enable multi process compilation
    add_definitions(/MP)
endif()

# default to release build
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE RELEASE CACHE STRING "CMAKE_BUILD_TYPE")
    message(STATUS "Building RELEASE build by default. Set CMAKE_BUILD_TYPE to override it.")
endif()

# all final product files should be placed in some sane locations
foreach(conf IN ITEMS ${CMAKE_CONFIGURATION_TYPES} ${CMAKE_BUILD_TYPE})
    string(TOUPPER ${conf} conf_upper)
    string(TOLOWER ${conf} conf_lower)
    if(NOT CMAKE_RUNTIME_OUTPUT_DIRECTORY_${conf_upper})
        set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib/${conf_lower}")
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib/${conf_lower}")
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/bin/${conf_lower}")
    endif()
endforeach(conf)

# 3rd party libraries
message(STATUS "@@@ including 3rd party libraries")
add_subdirectory(externals EXCLUDE_FROM_ALL)

# vts browser
message(STATUS "@@@ including vts browser")
add_subdirectory(externals/browser/browser)

# ide groups for 3rd party targets
foreach(name IN ITEMS genfiles jpeg-static GeographicLib_STATIC jsoncpp_lib jsoncpp_lib_static libcurl png_static proj SDL2-static simd simd-objs zlibstatic gdal
    example minigzip zlib genprebuilt gensym genvers symbol-check uninstall dmg wrjpgcom testclean dist rdjpgcom udmg jpegtran-static tjtest tarball turbojpeg-static djpeg-static tjunittest-static cjpeg-static tjbench-static jsimdcfg md5cmp SDL2main )
    if(TARGET ${name})
        buildsys_ide_groups(${name} deps)
    endif()
endforeach()



