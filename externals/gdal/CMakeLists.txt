
message(STATUS "@@@ gdal")
message(STATUS "MINIMAL gdal replacement library")

set(GDAL_SOURCES
  # GDAL
  gdalDummies.cpp
  # OGR
  gdal/gdal/ogr/ogr_fromepsg.cpp
  gdal/gdal/ogr/ogr_srs_dict.cpp
  gdal/gdal/ogr/ogr_srs_esri.cpp
  gdal/gdal/ogr/ogr_srs_proj4.cpp
  gdal/gdal/ogr/ogr_srs_usgs.cpp
  gdal/gdal/ogr/ogr_srs_xml.cpp
  gdal/gdal/ogr/ogr_srsnode.cpp
  gdal/gdal/ogr/ogrct.cpp
  gdal/gdal/ogr/ogrspatialreference.cpp
  # CPL
  gdal/gdal/port/cpl_atomic_ops.cpp
  gdal/gdal/port/cpl_conv.cpp
  gdal/gdal/port/cpl_csv.cpp
  gdal/gdal/port/cpl_error.cpp
  gdal/gdal/port/cpl_findfile.cpp
  gdal/gdal/port/cplgetsymbol.cpp
  gdal/gdal/port/cpl_http.cpp
  gdal/gdal/port/cpl_minixml.cpp
  gdal/gdal/port/cpl_multiproc.cpp
  gdal/gdal/port/cpl_path.cpp
  gdal/gdal/port/cpl_recode.cpp
  gdal/gdal/port/cpl_recode_stub.cpp
  gdal/gdal/port/cpl_string.cpp
  gdal/gdal/port/cplstring.cpp
  gdal/gdal/port/cplstringlist.cpp
  gdal/gdal/port/cpl_strtod.cpp
  gdal/gdal/port/cpl_vsi_error.cpp
  gdal/gdal/port/cpl_vsil_abstract_archive.cpp
  gdal/gdal/port/cpl_vsil_cache.cpp
  gdal/gdal/port/cpl_vsil.cpp
  gdal/gdal/port/cpl_vsil_crypt.cpp
  gdal/gdal/port/cpl_vsil_sparsefile.cpp
  gdal/gdal/port/cpl_vsil_stdin.cpp
  gdal/gdal/port/cpl_vsil_stdout.cpp
  gdal/gdal/port/cpl_vsil_subfile.cpp
  gdal/gdal/port/cpl_vsil_tar.cpp
  gdal/gdal/port/cpl_vsil_unix_stdio_64.cpp
  gdal/gdal/port/cpl_vsil_win32.cpp
  gdal/gdal/port/cpl_vsi_mem.cpp
  gdal/gdal/port/cpl_vsisimple.cpp
)

#set(CMAKE_CXX_STANDARD 11)

#configure_file("gdal/gdal/gcore/gdal_version.h.in" "gdal_version.h" COPYONLY)

if(MSVC)
  configure_file("gdal/gdal/port/cpl_config.h.vc" "cpl_config.h" COPYONLY)
elseif(APPLE)
  configure_file("cpl_config.h.apple" "cpl_config.h" COPYONLY)
else()
  configure_file("cpl_config.h.linux" "cpl_config.h" COPYONLY)
endif()

add_library(gdal STATIC ${GDAL_SOURCES})
target_include_directories(gdal PUBLIC SYSTEM "${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/ogr;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/port;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/alg;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/gcore;${CMAKE_CURRENT_BINARY_DIR}")
target_link_libraries(gdal proj)
target_compile_definitions(gdal PRIVATE "PROJ_STATIC=1")
target_compile_definitions(gdal PRIVATE "NOMINMAX=1")
target_compile_definitions(gdal PRIVATE "GDAL_COMPILATION=1")
target_compile_definitions(gdal PRIVATE "CPL_DISABLE_DLL")
set_target_properties(gdal PROPERTIES OUTPUT_NAME minigdal)

