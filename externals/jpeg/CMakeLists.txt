
message(STATUS "@@@ jpeg")

option(ENABLE_SHARED "Build shared libraries" FALSE)
#option(WITH_SIMD "Include SIMD extensions, if available for this platform" false)

if(NOT CMAKE_INSTALL_DOCDIR)
    set(CMAKE_INSTALL_DOCDIR ${CMAKE_INSTALL_BINDIR})
endif()

add_subdirectory(jpeg)

target_include_directories(jpeg-static INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/jpeg)
target_include_directories(jpeg-static INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/jpeg)

