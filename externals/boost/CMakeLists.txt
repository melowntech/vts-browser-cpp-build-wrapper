
message(STATUS "@@@ boost")

option(BOOST_DOWNLOAD_TO_BINARY_DIR "Prefer downloading Boost to the binary directory instead of source directory" ON)

set(BOOST_URL "https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.bz2" CACHE STRING "Boost download URL" FORCE)
set(BOOST_URL_SHA256 "8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406" CACHE STRING "Boost download URL SHA256 checksum" FORCE)

add_subdirectory(boost)

# BOOST_THREAD_PROVIDES_NESTED_LOCKS # make boost scoped_lock available as a nested class of mutex
# BOOST_ALL_NO_LIB # configure boost for manual linking libraries
# BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE # suppress boost compiler version check warnings
set_property(TARGET Boost::boost APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS BOOST_THREAD_PROVIDES_NESTED_LOCKS BOOST_ALL_NO_LIB BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE)

if(UNIX)
    set_property(TARGET Boost::boost APPEND PROPERTY INTERFACE_COMPILE_OPTIONS -Wno-unused-local-typedefs)
endif()

get_target_property(boost_path Boost::boost INTERFACE_INCLUDE_DIRECTORIES)
if(NOT boost_path)
    message(STATUS "fixing include path for boost")
    file(GLOB_RECURSE boost_path "${CMAKE_CURRENT_BINARY_DIR}/boost/*/asio.hpp")
    get_filename_component(boost_path "${boost_path}" DIRECTORY) # remove asio.hpp
    get_filename_component(boost_path "${boost_path}" DIRECTORY) # parent directory
    set_target_properties(Boost::boost PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${boost_path}")
endif()

macro(strhas name)
    string(FIND "${s}" "${name}" found)
    if(NOT found EQUAL -1)
        set(ok FALSE)
    endif()
endmacro()

if(BUILDSYS_UWP)
    set(extraIncludes "")
    foreach(l Boost_filesystem Boost_iostreams)
        get_target_property(sources ${l} SOURCES)
        set(sources2 "")
        foreach(s ${sources})
            set(ok TRUE)
            strhas("operations.cpp")
            strhas("unique_path.cpp")
            strhas("file_descriptor.cpp")
            strhas("mapped_file.cpp")
            strhas("windows_file_codecvt.cpp")
            if(ok)
                list(APPEND sources2 "${s}")
            else()
                get_filename_component(s "${s}" DIRECTORY)
                list(APPEND extraIncludes "${s}")
            endif()
        endforeach()
        set_target_properties(${l} PROPERTIES SOURCES "${sources2}")
    endforeach()
    target_sources(Boost_filesystem PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/boostDummiesUwp.cpp")
    target_include_directories(Boost_filesystem PRIVATE ${extraIncludes})
endif()

if(BUILDSYS_WASM)
    set_property(TARGET Boost::boost APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS BOOST_ASIO_DISABLE_STD_STRING_VIEW BOOST_ASIO_DISABLE_STD_EXPERIMENTAL_STRING_VIEW)
endif()
