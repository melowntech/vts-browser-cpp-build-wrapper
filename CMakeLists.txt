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
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_SOURCE_DIR}/modules)

# boost
add_definitions(
  -DBOOST_THREAD_PROVIDES_NESTED_LOCKS # make boost scoped_lock available as a nested class of mutex
  -DBOOST_ALL_NO_LIB # make boost link statically
  -DBOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE # suppress boost compiler version check warnings
)

# disable warning: class 'type' needs to have dll-interface to be used by clients of class 'type2'
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /wd4251 /wd4275")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4251 /wd4275")

# enable multi process compilation
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /MP")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")

# all final product files should be placed in a sane locations
foreach(conf IN ITEMS ${CMAKE_CONFIGURATION_TYPES} ${CMAKE_BUILD_TYPE})
    string(TOUPPER ${conf} conf_upper)
    string(TOLOWER ${conf} conf_lower)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/lib")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${conf_upper} "${CMAKE_BINARY_DIR}/bin")
endforeach(conf)

# 3rd party libraries
message(STATUS "@@@ including externals")
add_subdirectory(externals EXCLUDE_FROM_ALL)

# vts browser
message(STATUS "@@@ including browser")
add_subdirectory(browser/browser)

#ide groups for 3rd party libraries
buildsys_ide_groups(genfiles deps)
buildsys_ide_groups(jpeg-static deps)
buildsys_ide_groups(GeographicLib_STATIC deps)
buildsys_ide_groups(jsoncpp_lib_static deps)
buildsys_ide_groups(libcurl deps)
buildsys_ide_groups(png_static deps)
buildsys_ide_groups(proj deps)
buildsys_ide_groups(SDL2 deps)
buildsys_ide_groups(simd deps)
buildsys_ide_groups(simd-objs deps)
buildsys_ide_groups(zlibstatic deps)


