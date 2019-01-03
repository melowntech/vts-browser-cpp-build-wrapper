
if(NOT TARGET zlibstatic)
    message(FATAL "zlibstatic NOT FOUND")
endif()

if(NOT TARGET ZLIB::ZLIB)
    set(lib $<TARGET_LINKER_FILE:zlibstatic>)
    get_target_property(inc zlibstatic INTERFACE_INCLUDE_DIRECTORIES)

    add_library(ZLIB::ZLIB INTERFACE IMPORTED GLOBAL)
    set_target_properties(ZLIB::ZLIB PROPERTIES
        INTERFACE_LINK_LIBRARIES "${lib}"
        INTERFACE_INCLUDE_DIRECTORIES "${inc}"
    )
    add_dependencies(ZLIB::ZLIB zlibstatic)
endif()

get_target_property(Zlib_LIBRARIES ZLIB::ZLIB INTERFACE_LINK_LIBRARIES)
get_target_property(Zlib_INCLUDE_DIRS ZLIB::ZLIB INTERFACE_INCLUDE_DIRECTORIES)
set(Zlib_LIBRARY ${Zlib_LIBRARIES})
set(Zlib_INCLUDE_DIR ${Zlib_INCLUDE_DIRS})
set(Zlib_FOUND TRUE)

set(ZLIB_LIBRARIES ${Zlib_LIBRARIES})
set(ZLIB_INCLUDE_DIRS ${Zlib_INCLUDE_DIRS})
set(ZLIB_LIBRARY ${Zlib_LIBRARIES})
set(ZLIB_INCLUDE_DIR ${Zlib_INCLUDE_DIRS})
set(ZLIB_FOUND TRUE)

