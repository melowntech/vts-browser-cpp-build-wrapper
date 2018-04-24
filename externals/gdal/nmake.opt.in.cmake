
BINDIR = "${BINARY_DIR}/bin"
PLUGINDIR = "${BINARY_DIR}/bin/gdalplugins"
LIBDIR = "${BINARY_DIR}/lib"
INCDIR = "${BINARY_DIR}/include"
DATADIR = "${BINARY_DIR}/data"
HTMLDIR = "${BINARY_DIR}/html"
DEBUG = ${GDAL_DEBUG}
WIN64 = YES
VERSION = 203

DLLBUILD = 0
INCLUDE_OGR_FRMTS = 0
INCLUDE_GNM_FRMTS = 0
BSB_SUPPORTED = 0
ODBC_SUPPORTED = 0
JPEG_SUPPORTED = 0
JPEG12_SUPPORTED = 0
GRIB_SETTING = 0
MRF_SETTING = 0


PROJ_FLAGS = -DPROJ_STATIC -DPROJ_VERSION=5
PROJ_INCLUDE = ${GDAL_PROJ_INC}
PROJ_LIBRARY = ${GDAL_PROJ_LIB}

#ZLIB_EXTERNAL_LIB = 1
#ZLIB_INC = -I"${ZLIB_INCLUDE_DIRS}"
#ZLIB_LIB = "${ZLIB_LIBRARY}"


#if using an external jpeg library uncomment the following lines
#JPEG_EXTERNAL_LIB = 1
#JPEGDIR = c:/projects/jpeg-6b
#JPEG_LIB = $(JPEGDIR)/libjpeg.lib

#if using an external png library uncomment the following lines
#PNG_EXTERNAL_LIB = 1
#PNGDIR = c:/projects/libpng-1.0.8
#PNG_LIB = $(PNGDIR)/libpng.lib
