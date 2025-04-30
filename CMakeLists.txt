cmake_minimum_required(VERSION 3.15)
project(test-yandex-sdk LANGUAGES Swift)

include(FetchContent)

function(tb_add_swift_package)
    set(oneValueArgs PKG_NAME REPOSITORY TAG)
    set(multiValueArgs FRAMEWORKS)
    cmake_parse_arguments(PARSE_ARGV 0 arg "${options}" "${oneValueArgs}"
                          "${multiValueArgs}")
    if(NOT arg_PKG_NAME)
        message(FATAL_ERROR "PKG_NAME is empty")
    endif()
    if(NOT arg_FRAMEWORKS)
        message(FATAL_ERROR "FRAMEWORKS is empty")
    endif()
    if(NOT arg_REPOSITORY)
        message(FATAL_ERROR "REPOSITORY is empty")
    endif()
    if(NOT arg_TAG)
        message(FATAL_ERROR "TAG is empty")
    endif()
    fetchcontent_declare(
        package
        GIT_REPOSITORY ${arg_REPOSITORY}
        GIT_TAG ${arg_TAG})
    fetchcontent_makeavailable(package)

    if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(osx_sysroot macosx)
        set(target_platform "macos")
        set(sdk_version 13)
    elseif(CMAKE_SYSTEM_NAME STREQUAL "iOS")
        set(osx_sysroot iphoneos)
        set(target_platform "ios")
        set(sdk_version 13)
    endif()
    set(triple "arm64-apple-${target_platform}${sdk_version}")
    execute_process(
        COMMAND xcrun --show-sdk-path --sdk ${osx_sysroot}
        OUTPUT_VARIABLE sdk_path
        OUTPUT_STRIP_TRAILING_WHITESPACE COMMAND_ECHO "STDOUT"
        COMMAND_ERROR_IS_FATAL ANY)
    execute_process(
        COMMAND swift build -c release -j 7 --sdk ${sdk_path} --build-path
                ${package_BINARY_DIR} --triple ${triple}
        WORKING_DIRECTORY ${package_SOURCE_DIR} COMMAND_ECHO "STDOUT"
                          COMMAND_ERROR_IS_FATAL ANY)

    foreach(framework IN ITEMS ${arg_FRAMEWORKS})
        find_library(
            path_to_framework
            NAMES ${framework}
            PATHS "${package_BINARY_DIR}/release/"
            NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH NO_CACHE REQUIRED)
        add_library(${framework} STATIC IMPORTED GLOBAL)
        set_target_properties(${framework} PROPERTIES IMPORTED_LOCATION
                                                      "${path_to_framework}")
        add_library(spm::${framework} ALIAS ${framework})
        unset(path_to_framework)
    endforeach()
endfunction()

tb_add_swift_package(
    PKG_NAME
    YandexMobileAdsPackage
    REPOSITORY
    https://github.com/yandexmobile/yandex-ads-sdk-ios
    TAG
    7.12.1
    FRAMEWORKS
    YandexMobileAds
    YandexMobileAdsInstream)

add_executable(test-yandex-sdk MACOSX_BUNDLE test.swift)
target_link_libraries(test-yandex-sdk PRIVATE spm::YandexMobileAds
                                              spm::YandexMobileAdsInstream)
set_target_properties(
    test-yandex-sdk PROPERTIES XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER
                               com.test.yandexsdk)
