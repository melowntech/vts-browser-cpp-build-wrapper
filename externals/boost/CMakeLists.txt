
message(STATUS "@@@ boost")

set(BOOST_LIBS_OPTIONAL
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
