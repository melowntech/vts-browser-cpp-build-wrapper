
message(STATUS "@@@ jsoncpp")

add_subdirectory(jsoncpp)

foreach(conf IN ITEMS ${CMAKE_CONFIGURATION_TYPES} ${CMAKE_BUILD_TYPE})
    string(TOUPPER ${conf} conf_upper)
    string(TOLOWER ${conf} conf_lower)
    set_target_properties(jsoncpp_lib_static PROPERTIES OUTPUT_NAME_${conf_upper} jsoncpp_3rd_party_${conf_lower})
endforeach()
