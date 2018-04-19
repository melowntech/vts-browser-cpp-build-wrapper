# VTS Browser CPP - Windows Build Wrapper

[VTS Browser CPP](https://github.com/melown/vts-browser-cpp) is a library
that brings VTS capabilities to your native C++ applications.

[This wrapper](https://github.com/melown/vts-browser-cpp-win)
allows easy building of the VTS Browser on windows.

It provides configured git submodules for all dependent libraries
and integrated build scripts in cmake.

## Prerequisites

### Permission for Symlinks

On Windows, a specific permissions are required to allow creating symbolic file links.
There are two ways to acquire the permission.

 - Start git and cmake as administrator.
 - (Recommended) Enable Developer mode in windows.
   See Settings -> Update & Security -> For developers.

Moreover, it may be necessary to enable creating symlinks when installing the git.

### Compiler, Git & CMake

A C++11 capable compiler is required.
We recommend MS Visual Studio 2017 or newer.
It is freely available at: https://www.visualstudio.com/downloads/

The Visual Studio also contains git and cmake integrations.
However, we recommend standalone versions available here:
https://gitforwindows.org/ and https://cmake.org/download/

### Python

Python is available at: https://www.python.org/downloads/windows/
Make sure to choose Python 2.

Also, during the installation, select to add the Python to environment variable PATH.

## Building

Go to the directory where you have cloned the repository.

Make sure that all submodules are cloned too.
```bash
git pull
git submodule update --init --recursive
```

Configure and build.
```bash
mkdir build
cd build
cmake -G"Visual Studio 15 2017 Win64" ..
cmake --build . --config relwithdebinfo
```

If you are using different IDE, choose the exact name by running help.
```bash
cmake --help
```

## Notes

This repository is intended to be used on Windows.
However, if you prefer to have all the libraries
packed in, rather than using the system provided libraries,
you may use this repository too.


