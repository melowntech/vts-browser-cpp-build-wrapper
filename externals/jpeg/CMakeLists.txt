
message(STATUS "@@@ jpeg")

if(BUILDSYS_WASM)
    add_subdirectory(wasm)
    return()
endif()

option(ENABLE_SHARED "Build shared libraries" FALSE)

if(WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        list(INSERT CMAKE_PREFIX_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/yasm/win64")
    else()
        list(INSERT CMAKE_PREFIX_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/yasm/win32")
    endif()
endif()

if(CMAKE_CROSSCOMPILING)
    if(BUILDSYS_IOS)
        option(WITH_SIMD "Include SIMD extensions, if available for this platform" FALSE)
    endif()
else()
    option(REQUIRE_SIMD "Generate a fatal error if SIMD extensions are not available for this platform (default is to fall back to a non-SIMD build)" TRUE)
endif()

if(MSVC)
    option(WITH_CRT_DLL "/MT vs /MD" TRUE)
endif()

if(NOT CMAKE_INSTALL_DOCDIR)
    set(CMAKE_INSTALL_DOCDIR ${CMAKE_INSTALL_BINDIR})
endif()

add_subdirectory(jpeg)

target_include_directories(jpeg-static INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/jpeg")
target_include_directories(jpeg-static INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/jpeg")

