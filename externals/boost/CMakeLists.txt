
message(STATUS "@@@ boost")

option(BOOST_DOWNLOAD_TO_BINARY_DIR "Prefer downloading Boost to the binary directory instead of source directory" ON)

set(BOOST_LIBS_REQUIRED
    header,
    THREAD,
    ATOMIC,
    CHRONO,
    DATE_TIME,
    FILESYSTEM,
    IOSTREAMS,
    PROGRAM_OPTIONS,
    REGEX,
    SERIALIZATION,
    SYSTEM,
    THREAD
)

add_subdirectory(boost)

