
message(STATUS "@@@ harfbuzz")

option(HB_HAVE_FREETYPE "Enable freetype interop helpers" ON)
option(HB_BUILD_SUBSET "Build harfbuzz-subset" OFF)
option(HB_BUILD_TESTS "Build harfbuzz tests" OFF)
option(HB_HAVE_CORETEXT "Enable CoreText shaper backend on macOS" OFF)
set(SKIP_INSTALL_ALL ON)

add_subdirectory(harfbuzz)

target_include_directories(harfbuzz PUBLIC harfbuzz/src)
