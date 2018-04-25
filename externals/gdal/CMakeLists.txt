
message(STATUS "@@@ gdal")

if (MSVC)

    # cmake does not provide an easy way to evaluate generator-expressions during configure phase
    # therefore, we have to make some assumptions about version numbers, proj library and output directory paths
    # some of these things could be improved, but who has the <strike>dragons</strike> time?

    # please note, that some of the paths and versions here needs to be kept in sync with other files, namely:
    # nmake.opt.in.cmake and nmake.run.bat.in.cmake in this directory
    # and the FindGDAL module

    get_filename_component(MY_COMPILER_DIR ${CMAKE_CXX_COMPILER} DIRECTORY)
    find_file(VCVARSALL_BAT vcvarsall.bat "${MY_COMPILER_DIR}/../../../../../../Auxiliary/Build/" NO_DEFAULT_PATH)
    if (NOT VCVARSALL_BAT)
        message(FATAL_ERROR "vcvarsall.bat not found")
    endif()

    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal")
    set(GDAL_PROJ_INC -I"${CMAKE_CURRENT_SOURCE_DIR}/../proj/proj/src") # dirty hack, no ducks given

    set(confs ${CMAKE_CONFIGURATION_TYPES} ${CMAKE_BUILD_TYPE})
    list(REMOVE_DUPLICATES confs)
    foreach(conf IN ITEMS ${confs})
        string(TOUPPER ${conf} conf_upper)
        string(TOLOWER ${conf} conf_lower)

        set(INTERMEDIATE_DIR "${CMAKE_CURRENT_BINARY_DIR}/gdal/${conf_lower}")
        set(BINARY_DIR "${INTERMEDIATE_DIR}/gdal")
        set(NMAKE_RUN "${INTERMEDIATE_DIR}/nmake.run.bat")
        set(NMAKE_OPT "${INTERMEDIATE_DIR}/nmake.opt")

        if (${conf_upper} STREQUAL "DEBUG")
            set(GDAL_DEBUG 1)
            set(GDAL_PROJ_LIB "${CMAKE_LIBRARY_OUTPUT_DIRECTORY_${conf_upper}}/proj_5_0_d.lib") # no ducks here either
        else()
            set(GDAL_DEBUG 0)
            set(GDAL_PROJ_LIB "${CMAKE_LIBRARY_OUTPUT_DIRECTORY_${conf_upper}}/proj_5_0.lib") # some ducks here maybe?
        endif()

        set(COPY_LIB_SOURCE "${BINARY_DIR}/lib/gdal_i.lib")
        set(COPY_LIB_TARGET "${CMAKE_BINARY_DIR}/lib/${conf_lower}/gdal.lib")
        set(COPY_DLL_SOURCE "${BINARY_DIR}/bin/gdal203.dll")
        set(COPY_DLL_TARGET "${CMAKE_BINARY_DIR}/bin/${conf_lower}/gdal203.dll")
        file(TO_NATIVE_PATH ${COPY_LIB_SOURCE} COPY_LIB_SOURCE)
        file(TO_NATIVE_PATH ${COPY_LIB_TARGET} COPY_LIB_TARGET)
        file(TO_NATIVE_PATH ${COPY_DLL_SOURCE} COPY_DLL_SOURCE)
        file(TO_NATIVE_PATH ${COPY_DLL_TARGET} COPY_DLL_TARGET)

        configure_file("${CMAKE_CURRENT_SOURCE_DIR}/nmake.run.bat.in.cmake" ${NMAKE_RUN})
        configure_file("${CMAKE_CURRENT_SOURCE_DIR}/nmake.opt.in.cmake" ${NMAKE_OPT})
    endforeach()

    set(GDAL_PRODUCT "${CMAKE_BINARY_DIR}/lib/${CMAKE_CFG_INTDIR}/gdal.lib")
    set(NMAKE_RUN "${CMAKE_CURRENT_BINARY_DIR}/gdal/${CMAKE_CFG_INTDIR}/nmake.run.bat")

    add_custom_command(OUTPUT ${GDAL_PRODUCT} COMMAND ${NMAKE_RUN} COMMENT "custom cmake command for gdal" VERBATIM)
    add_library(gdal INTERFACE)
    add_custom_target(gdalTarget DEPENDS ${GDAL_PRODUCT})
    add_dependencies(gdal gdalTarget proj)
    target_link_libraries(gdal INTERFACE ${GDAL_PRODUCT})
    target_include_directories(gdal INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/ogr;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/port;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/alg;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/gcore")

else() # MSVC

    message(FATAL_ERROR "GDAL building is not yet prepared for non-msvc compilers")

endif()
