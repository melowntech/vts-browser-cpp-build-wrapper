
cmake_policy(SET CMP0042 NEW) # use rpath
set(CMAKE_MACOSX_BUNDLE FALSE)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# disable warnings
if(MSVC)
    string(REPLACE "/W3" "/W0" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
    string(REPLACE "/W3" "/W0" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
endif()
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")

if(MSVC)
    #disable warnings that some files produced no symbols
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -ignore:4221")
    set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} -ignore:4221")
endif()

add_subdirectory(zlib)
add_subdirectory(jsoncpp)
add_subdirectory(png)
add_subdirectory(jpeg)
add_subdirectory(eigen)
add_subdirectory(boost)
add_subdirectory(proj)
add_subdirectory(gdal)
add_subdirectory(geographiclib)

if(NOT BUILDSYS_EMBEDDED)
    add_subdirectory(sdl)
endif()

if(NOT BUILDSYS_IOS)
    add_subdirectory(curl)
endif()
