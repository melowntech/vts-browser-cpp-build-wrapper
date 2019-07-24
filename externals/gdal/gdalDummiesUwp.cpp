
/*
This file contains DUMMY implementation for supposedly unused gdal functions.
When any of these functions is called, the application will forcibly terminate.
The is to make you aware of using unsupported functions.
*/

#include "gdal.h"
#include "gdalwarper.h"

CPLMutex *CPLCreateMutex(void)
{
    std::terminate();
    return nullptr;
}

CPLMutex *CPLCreateMutexEx(int nOptions)
{
    std::terminate();
    return nullptr;
}

int CPLCreateOrAcquireMutex(CPLMutex **, double dfWaitInSeconds)
{
    std::terminate();
    return 0;
}

int CPLCreateOrAcquireMutexEx(CPLMutex **, double dfWaitInSeconds, int nOptions)
{
    std::terminate();
    return 0;
}

int CPLAcquireMutex(CPLMutex *hMutex, double dfWaitInSeconds)
{
    std::terminate();
    return 0;
}

void CPLReleaseMutex(CPLMutex *hMutex)
{}

void CPLDestroyMutex(CPLMutex *hMutex)
{}

GIntBig CPLGetPID(void)
{
    return 0;
}

int CPLGetCurrentProcessID(void)
{
    return 0;
}

CPLMutexHolder::CPLMutexHolder(CPLMutex **phMutex, double dfWaitInSeconds,
    const char *pszFile,
    int nLine,
    int nOptions)
{}

CPLMutexHolder::CPLMutexHolder(CPLMutex* hMutex, double dfWaitInSeconds,
    const char *pszFile,
    int nLine)
{}

CPLMutexHolder::~CPLMutexHolder()
{}

void VSIInstallLargeFileHandler(void)
{}

void VSIInstallCryptFileHandler(void)
{}

void *CPLGetTLS(int nIndex)
{
    return nullptr;
}

void *CPLGetTLSEx(int nIndex, int* pbMemoryErrorOccurred)
{
    return nullptr;
}

void CPLSetTLS(int nIndex, void *pData, int bFreeOnExit)
{}

void CPLSetTLSWithFreeFunc(int nIndex, void *pData, CPLTLSFreeFunc pfnFree)
{}

void CPLSetTLSWithFreeFuncEx(int nIndex, void *pData, CPLTLSFreeFunc pfnFree, int* pbMemoryErrorOccurred)
{}

