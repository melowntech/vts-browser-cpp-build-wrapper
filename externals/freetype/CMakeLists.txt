
message(STATUS "@@@ freetype")

set(FT_WITH_ZLIB ON)
set(BUILD_SHARED_LIBS OFF)
set(SKIP_INSTALL_ALL ON)

if(IOS_PLATFORM STREQUAL "iphoneos")
    set(IOS_PLATFORM "OS")
endif()

add_subdirectory(freetype2)
