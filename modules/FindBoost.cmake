
add_library(proxyBoost INTERFACE)
target_link_libraries(proxyBoost INTERFACE Boost::boost)

set(BOOST_LIBRARIES proxyBoost)
get_target_property(BOOST_INCLUDE_DIRS Boost::boost INTERFACE_INCLUDE_DIRECTORIES)
set(BOOST_LIBRARY ${BOOST_LIBRARIES})
set(BOOST_INCLUDE_DIR ${BOOST_INCLUDE_DIRS})
set(BOOST_VERSION ${Boost_FIND_VERSION})
set(BOOST_FOUND TRUE)

set(Boost_LIBRARIES ${BOOST_LIBRARIES})
set(Boost_INCLUDE_DIRS ${BOOST_INCLUDE_DIRS})
set(Boost_LIBRARY ${BOOST_LIBRARIES})
set(Boost_INCLUDE_DIR ${BOOST_INCLUDE_DIRS})
set(Boost_VERSION ${BOOST_VERSION})
set(Boost_FOUND TRUE)

get_filename_component(Boost_DIR "${BOOST_LIBRARY}" DIRECTORY)
set(Boost_LIBRARY_DIR_DEBUG ${Boost_DIR})
set(Boost_LIBRARY_DIR_RELEASE ${Boost_DIR})
set(Boost_INCLUDE_DIR ${BOOST_INCLUDE_DIR})

macro(boost_component COMPONENT)
    string(TOLOWER ${COMPONENT} component)
    target_link_libraries(proxyBoost INTERFACE Boost::${component})
    set(Boost_${COMPONENT}_LIBRARY ${BOOST_LIBRARIES})
    set(Boost_${COMPONENT}_LIBRARIES ${BOOST_LIBRARIES})
    set(Boost_${COMPONENT}_LIBRARY_DEBUG ${BOOST_LIBRARIES})
    set(Boost_${COMPONENT}_LIBRARY_RELEASE ${BOOST_LIBRARIES})
    set(Boost_${COMPONENT}_INCLUDE_DIR ${BOOST_INCLUDE_DIR})
    set(Boost_${COMPONENT}_INCLUDE_DIRS ${BOOST_INCLUDE_DIR})
    set(Boost_${COMPONENT}_FOUND TRUE)
    set(BOOST_${COMPONENT}_LIBRARY ${BOOST_LIBRARIES})
    set(BOOST_${COMPONENT}_LIBRARIES ${BOOST_LIBRARIES})
    set(BOOST_${COMPONENT}_LIBRARY_DEBUG ${BOOST_LIBRARIES})
    set(BOOST_${COMPONENT}_LIBRARY_RELEASE ${LIB})
    set(BOOST_${COMPONENT}_INCLUDE_DIR ${BOOST_INCLUDE_DIR})
    set(BOOST_${COMPONENT}_INCLUDE_DIRS ${BOOST_INCLUDE_DIR})
    set(BOOST_${COMPONENT}_FOUND TRUE)
endmacro(boost_component)

boost_component(ATOMIC)
boost_component(CHRONO)
boost_component(DATE_TIME)
boost_component(FILESYSTEM)
boost_component(IOSTREAMS)
boost_component(PROGRAM_OPTIONS)
boost_component(REGEX)
boost_component(SERIALIZATION)
boost_component(SYSTEM)
boost_component(THREAD)


