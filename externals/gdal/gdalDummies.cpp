
/*
This file contains DUMMY implementation for supposedly unused gdal functions.
When any of these functions is called, the application will forcibly terminate.
The is to make you aware of using unsupported functions.
*/

#include "gdal.h"
#include "gdalwarper.h"

GDALWarpOperation::~GDALWarpOperation()
{
    std::terminate();
}

GDALWarpKernel::~GDALWarpKernel()
{
    std::terminate();
}
