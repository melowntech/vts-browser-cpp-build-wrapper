
/*
This file contains DUMMY implementation for supposedly unused gdal functions.
When any of these functions is called, the application will forcibly terminate.
This is to make you aware of using unsupported functions.
*/

#include "gdal.h"
#include "gdalwarper.h"

GDALWarpOperation::~GDALWarpOperation()
{
    fprintf(stderr, "GDALWarpOperation::~GDALWarpOperation\n");
    std::terminate();
}

GDALWarpKernel::~GDALWarpKernel()
{
    fprintf(stderr, "GDALWarpKernel::~GDALWarpKernel\n");
    std::terminate();
}
