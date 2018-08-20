# VTS Browser CPP - Build Wrapper

[VTS Browser CPP](https://github.com/melown/vts-browser-cpp) is a collection of libraries that bring VTS client capabilities to your native applications.

[This build wrapper](https://github.com/melown/vts-browser-cpp-build-wrapper) allows easy building of 3rd-party dependencies required for the browser.

It provides configured git submodules and cmake build scripts for all 3rd-party libraries and for the browser.

The primary intention of this repository is to allow building of the browser on Microsoft Windows.
However, the goal is to make it possible to build all the libraries on all platforms supported by the browser to minimize number of external runtime dependencies.

## Building

Go to the directory where you have cloned the repository.

Make sure that all submodules are cloned too.
```bash
git pull
git submodule update --init --recursive
```

### Building On Windows

#### Permission For Symlinks

On Windows, a specific permissions are required to allow creating symbolic file links.
There are two ways to acquire the permission.

 - Start git and cmake as administrator.
 - (Recommended) Enable Developer mode in windows.
   See Settings -> Update & Security -> For developers.

Moreover, it may be necessary to enable creating symlinks when installing the git.

#### Compiler, Git & CMake

A C++11 capable compiler is required.
We recommend MS Visual Studio 2017 or newer.
It is freely available at: https://www.visualstudio.com/downloads/

The Visual Studio also contains git and cmake integrations.
However, we recommend standalone versions available here:
https://gitforwindows.org/ and https://cmake.org/download/

#### Python

Python is available at: https://www.python.org/downloads/windows/
Make sure to choose Python *2*.

Also, during the installation, select to add the Python to environment variable PATH.

#### Build

Configure and build.
```bash
mkdir build
cd build
cmake -G"Visual Studio 15 2017 Win64" ..
cmake --build . --config relwithdebinfo
```

### Building On Linux

Install some prerequisites.

```bash
sudo apt update
sudo apt install \
    cmake \
    nasm \
    python-minimal
```

Configure and build.
```bash
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELWITHDEBINFO ..
cmake --build .
```

### Building On Mac

Configure and build.
```bash
mkdir build
cd build
cmake -GXcode ..
```

Use the generated XCode project as usual.

### Building For iOS

Configure and build.
```bash
mkdir build-ios
cd build-ios
cmake -DCMAKE_TOOLCHAIN_FILE=../externals/browser/browser/cmake/ios.toolchain.cmake -GXcode ..
```

Use the generated XCode project as usual.

## Bug Reports

For bug reports or enhancement suggestions use the
[Issue tracker](https://github.com/melown/vts-browser-cpp-build-wrapper/issues).

## How To Contribute

Check the [CONTRIBUTING.md](https://github.com/Melown/vts-browser-cpp/blob/master/CONTRIBUTING.md) on the VTS Browser CPP repository.
It applies equally here.

## License

See the [LICENSE](LICENSE) file.



