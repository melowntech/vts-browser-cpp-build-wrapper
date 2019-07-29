
/*
This file contains DUMMY implementation for supposedly unused gdal functions.
When any of these functions is called, the application will forcibly terminate.
This is to make you aware of using unsupported functions.
*/

#include "gdal.h"
#include "gdalwarper.h"

CPLMutex *CPLCreateMutex(void)
{
    fprintf(stderr, "CPLCreateMutex\n");
    std::terminate();
    return nullptr;
}

CPLMutex *CPLCreateMutexEx(int nOptions)
{
    fprintf(stderr, "CPLCreateMutexEx\n");
    std::terminate();
    return nullptr;
}

int CPLCreateOrAcquireMutex(CPLMutex **, double dfWaitInSeconds)
{
    fprintf(stderr, "CPLCreateOrAcquireMutex\n");
    std::terminate();
    return 0;
}

int CPLCreateOrAcquireMutexEx(CPLMutex **, double dfWaitInSeconds, int nOptions)
{
    fprintf(stderr, "CPLCreateOrAcquireMutexEx\n");
    std::terminate();
    return 0;
}

int CPLAcquireMutex(CPLMutex *hMutex, double dfWaitInSeconds)
{
    fprintf(stderr, "CPLAcquireMutex\n");
    std::terminate();
    return 0;
}

void CPLReleaseMutex(CPLMutex *hMutex)
{
    fprintf(stderr, "CPLReleaseMutex\n");
    std::terminate();
}

void CPLDestroyMutex(CPLMutex *hMutex)
{
    fprintf(stderr, "CPLDestroyMutex\n");
    std::terminate();
}

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

