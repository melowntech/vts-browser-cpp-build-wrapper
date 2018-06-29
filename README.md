# VTS Browser CPP - Build Wrapper

[VTS Browser CPP](https://github.com/melown/vts-browser-cpp) is a collection of libraries that bring VTS client capabilities to your native applications.

[This build wrapper](https://github.com/melown/vts-browser-cpp-build-wrapper) allows easy building of 3rd-party dependencies required for the browser.

It provides configured git submodules and cmake build scripts for all 3rd-party libraries and for the browser.

The primary intention of this repository is to allow building of the browser on Microsoft Windows.
However, the goal is to make it possible to build and embed all the libraries on all platforms supported by the browser.

## Building On Windows

### Permission For Symlinks

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
Make sure to choose Python *2*.

Also, during the installation, select to add the Python to environment variable PATH.

### Build

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


