
message(STATUS "@@@ geographiclib")

set(GEOGRAPHICLIB_LIB_TYPE STATIC CACHE STRING "Types of library generated: SHARED, STATIC (default), or BOTH")

add_subdirectory(geographiclib)
