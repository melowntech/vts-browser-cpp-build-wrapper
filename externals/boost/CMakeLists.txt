
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

get_target_property(boost_path Boost::boost INTERFACE_INCLUDE_DIRECTORIES)
if (NOT boost_path)
  message(STATUS "fixing include path for boost")
  file(GLOB_RECURSE boost_path "${CMAKE_CURRENT_BINARY_DIR}/boost/*/asio.hpp")
  get_filename_component(boost_path "${boost_path}" DIRECTORY) # remove asio.hpp
  get_filename_component(boost_path "${boost_path}" DIRECTORY) # parent directory
  set_target_properties(Boost::boost PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${boost_path}")
endif()



