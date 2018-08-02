
message(STATUS "@@@ boost")

option(BOOST_DOWNLOAD_TO_BINARY_DIR "Prefer downloading Boost to the binary directory instead of source directory" ON)

add_subdirectory(boost)

# BOOST_THREAD_PROVIDES_NESTED_LOCKS # make boost scoped_lock available as a nested class of mutex
# BOOST_ALL_NO_LIB # configure boost for manual linking libraries
# BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE # suppress boost compiler version check warnings
set_target_properties(Boost::boost PROPERTIES INTERFACE_COMPILE_DEFINITIONS "BOOST_THREAD_PROVIDES_NESTED_LOCKS;BOOST_ALL_NO_LIB;BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE")

if (UNIX)
  set_target_properties(Boost::boost PROPERTIES INTERFACE_COMPILE_OPTIONS "-Wno-unused-local-typedefs")
endif()
