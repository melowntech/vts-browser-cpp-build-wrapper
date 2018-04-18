
message(STATUS "@@@ curl")

option(BUILD_CURL_EXE "Set to ON to build curl executable." OFF)
#option(CURL_STATICLIB "Set to ON to build libcurl with static linking." ON)
option(HTTP_ONLY "disables all protocols except HTTP (This overrides all CURL_DISABLE_* options)" ON)
option(CMAKE_USE_WINSSL "enable Windows native SSL/TLS" ON)

add_subdirectory(curl)

target_include_directories(libcurl INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/curl/include)
