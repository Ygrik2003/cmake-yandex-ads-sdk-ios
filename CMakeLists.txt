cmake_minimum_required(VERSION 3.15)
project(test-yandex-sdk LANGUAGES Swift)

add_library(yandex-mobile-ads STATIC IMPORTED)
# You can download lib on configure step
find_library(
    path_yandex_mobile_ads_lib
    NAMES YandexMobileAds
    PATHS "${CMAKE_CURRENT_LIST_DIR}/YandexMobileAds"
    NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH NO_CACHE REQUIRED)
set_target_properties(
    yandex-mobile-ads PROPERTIES IMPORTED_LOCATION
                                 "${path_yandex_mobile_ads_lib}")
add_library(yandex::mobile-ads ALIAS yandex-mobile-ads)

add_executable(test-yandex-sdk MACOSX_BUNDLE test.swift)
target_link_libraries(test-yandex-sdk PRIVATE yandex::mobile-ads)
set_target_properties(
    test-yandex-sdk PROPERTIES XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER
                               com.test.yandexsdk)
