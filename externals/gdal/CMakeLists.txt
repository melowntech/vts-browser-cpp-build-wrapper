
message(STATUS "@@@ gdal")
message(STATUS "MINIMAL gdal replacement library")

set(GDAL_SOURCES
  cpl_config.h
  gdal_version.h
  # OGR
  gdal/gdal/ogr/ogrspatialreference.cpp
  gdal/gdal/ogr/ogr_srsnode.cpp
  gdal/gdal/ogr/ogr_srs_xml.cpp
  gdal/gdal/ogr/ogr_srs_dict.cpp
  gdal/gdal/ogr/ogr_srs_proj4.cpp
  gdal/gdal/ogr/ogr_srs_usgs.cpp
  gdal/gdal/ogr/ogr_srs_esri.cpp
  gdal/gdal/ogr/ogr_fromepsg.cpp
  gdal/gdal/ogr/ogrct.cpp
  # CPL
  gdal/gdal/port/cpl_atomic_ops.cpp
  #gdal/gdal/port/cpl_aws.cpp
  #gdal/gdal/port/cpl_base64.cpp
  gdal/gdal/port/cpl_conv.cpp
  #gdal/gdal/port/cpl_cpu_features.cpp
  gdal/gdal/port/cpl_csv.cpp
  gdal/gdal/port/cpl_error.cpp
  gdal/gdal/port/cpl_findfile.cpp
  #gdal/gdal/port/cpl_getexecpath.cpp
  gdal/gdal/port/cplgetsymbol.cpp
  #gdal/gdal/port/cpl_google_cloud.cpp
  #gdal/gdal/port/cpl_google_oauth2.cpp
  #gdal/gdal/port/cpl_hash_set.cpp
  gdal/gdal/port/cpl_http.cpp
  #gdal/gdal/port/cplkeywordparser.cpp
  #gdal/gdal/port/cpl_list.cpp
  gdal/gdal/port/cpl_minixml.cpp
  #gdal/gdal/port/cpl_minizip_ioapi.cpp
  #gdal/gdal/port/cpl_minizip_unzip.cpp
  #gdal/gdal/port/cpl_minizip_zip.cpp
  gdal/gdal/port/cpl_multiproc.cpp
  #gdal/gdal/port/cpl_odbc.cpp
  gdal/gdal/port/cpl_path.cpp
  #gdal/gdal/port/cpl_progress.cpp
  #gdal/gdal/port/cpl_quad_tree.cpp
  gdal/gdal/port/cpl_recode.cpp
  #gdal/gdal/port/cpl_recode_iconv.cpp
  gdal/gdal/port/cpl_recode_stub.cpp
  #gdal/gdal/port/cpl_sha1.cpp
  #gdal/gdal/port/cpl_sha256.cpp
  #gdal/gdal/port/cpl_spawn.cpp
  gdal/gdal/port/cpl_string.cpp
  gdal/gdal/port/cplstring.cpp
  gdal/gdal/port/cplstringlist.cpp
  gdal/gdal/port/cpl_strtod.cpp
  #gdal/gdal/port/cpl_time.cpp
  #gdal/gdal/port/cpl_virtualmem.cpp
  gdal/gdal/port/cpl_vsi_error.cpp
  gdal/gdal/port/cpl_vsil_abstract_archive.cpp
  #gdal/gdal/port/cpl_vsil_buffered_reader.cpp
  gdal/gdal/port/cpl_vsil_cache.cpp
  gdal/gdal/port/cpl_vsil.cpp
  gdal/gdal/port/cpl_vsil_crypt.cpp
  #gdal/gdal/port/cpl_vsil_curl.cpp
  #gdal/gdal/port/cpl_vsil_curl_streaming.cpp
  #gdal/gdal/port/cpl_vsil_gzip.cpp
  #gdal/gdal/port/cpl_vsil_simple.cpp
  gdal/gdal/port/cpl_vsil_sparsefile.cpp
  gdal/gdal/port/cpl_vsil_stdin.cpp
  gdal/gdal/port/cpl_vsil_stdout.cpp
  gdal/gdal/port/cpl_vsil_subfile.cpp
  gdal/gdal/port/cpl_vsil_tar.cpp
  gdal/gdal/port/cpl_vsil_unix_stdio_64.cpp
  gdal/gdal/port/cpl_vsil_win32.cpp
  gdal/gdal/port/cpl_vsi_mem.cpp
  gdal/gdal/port/cpl_vsisimple.cpp
  #gdal/gdal/port/cpl_worker_thread_pool.cpp
  #gdal/gdal/port/cpl_xml_validate.cpp
)

set(CMAKE_CXX_STANDARD 11)

add_library(gdal STATIC ${GDAL_SOURCES})
target_include_directories(gdal PUBLIC SYSTEM "${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/ogr;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/port;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/alg;${CMAKE_CURRENT_SOURCE_DIR}/gdal/gdal/gcore;${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(gdal proj)


