cmake_minimum_required(VERSION 3.15)
project(test-yandex-sdk LANGUAGES Swift)

include(FetchContent)

function(tb_init_cocoapods)

    if(TP_REBUILD_COCOAPODS)
        execute_process(
            COMMAND pod install --repo-update
                    --project-directory=${CMAKE_SOURCE_DIR}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ECHO_OUTPUT_VARIABLE
                              ECHO_ERROR_VARIABLE COMMAND_ERROR_IS_FATAL ANY)
        # By default CocoaPods generate this file for working. But we use integrate_targets
        # for download all Pods on configure step, when xcodeproj doesn't exist. In this case
        # xcworkspace doesn't generated automaticaly(
        file(
            CONFIGURE
            OUTPUT
            "${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.xcworkspace/contents.xcworkspacedata"
            CONTENT
            [[
<?xml version="1.0" encoding="UTF-8"?>
<Workspace version = "1.0">
    <FileRef location = "container:test-yandex-sdk.xcodeproj"/>
    <FileRef location = "container:@CMAKE_SOURCE_DIR@/Pods/Pods.xcodeproj"/>
</Workspace>
        ]]
            @ONLY)
    else()
        file(REMOVE "${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.xcworkspace")
    endif()
endfunction()

function(tb_integrate_cocoapods_for_target target)
    # Create custom target instead link with "-framework Pods_${target}"
    # because it doenst work with our tb_target_create_modules_init_file
    add_library(Pods_${target} INTERFACE)
    target_link_libraries(Pods_${target} INTERFACE "-framework Pods_${target}")
    target_link_libraries(${target} PRIVATE Pods_${target})
    set_target_properties(
        ${target}
        PROPERTIES
            XCODE_XCCONFIG
            "${CMAKE_SOURCE_DIR}/Pods/Target Support Files/Pods-${target}/Pods-${target}.$<IF:$<CONFIG:Debug>,debug,release>.xcconfig"
            XCODE_ATTRIBUTE_MODULEMAP_FILE
            "${CMAKE_SOURCE_DIR}/Pods/Target Support Files/Pods-${target}/Pods-${target}.modulemap"
            XCODE_ATTRIBUTE_PODS_CONFIGURATION_BUILD_DIR
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Release$(EFFECTIVE_PLATFORM_NAME)"
            XCODE_ATTRIBUTE_PODS_CONFIGURATION_BUILD_DIR[variant=Debug]
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Debug$(EFFECTIVE_PLATFORM_NAME)"
            # https://www.realtech-vr.com/home/?p=1998
            XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Release$(EFFECTIVE_PLATFORM_NAME)"
            XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS[variant=Debug]
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Debug$(EFFECTIVE_PLATFORM_NAME)"
            XCODE_ATTRIBUTE_LIBRARY_SEARCH_PATHS
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Release$(EFFECTIVE_PLATFORM_NAME)"
            XCODE_ATTRIBUTE_LIBRARY_SEARCH_PATHS[variant=Debug]
            "${CMAKE_SOURCE_DIR}/Pods/prebuild/Debug$(EFFECTIVE_PLATFORM_NAME)")
    set(copy_script
        "${CMAKE_SOURCE_DIR}/Pods/Target Support Files/Pods-${target}/Pods-${target}-resources.sh"
    )
    if(EXISTS copy_script)
        add_custom_command(
            TARGET ${target}
            POST_BUILD
            COMMAND
                /bin/sh
                "${CMAKE_SOURCE_DIR}/Pods/Target Support Files/Pods-${target}/Pods-${target}-resources.sh"
        )
    endif()
endfunction()

tb_init_cocoapods()
add_executable(default MACOSX_BUNDLE test.swift)

set_target_properties(
    default PROPERTIES XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER
                       com.test.yandexsdk)

target_include_directories(
    default
    PRIVATE
        ${CMAKE_SOURCE_DIR}/Pods/YandexMobileAds/static/YandexMobileAds.xcframework/ios-arm64/YandexMobileAds.framework/Headers
)
tb_integrate_cocoapods_for_target(default)
