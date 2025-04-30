set(CMAKE_SYSTEM_NAME iOS)
set(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE NO)
set(CMAKE_XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET 13.0)
set(CMAKE_XCODE_LINK_BUILD_PHASE_MODE BUILT_ONLY)

# Team ID "3L3DY2377U" -> Entity name "EAST-GAMES, MChJ"
# from: [https://developer.apple.com/account#MembershipDetailsCard]
set(CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "3L3DY2377U")
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Apple Development")
set(CMAKE_XCODE_ATTRIBUTE_PROVISIONING_PROFILE_SPECIFIER "XC: * Dev")

# By default, search both the specified iOS SDK and the remainder of the host filesystem.
# It was get from https://github.com/leetal/ios-cmake/blob/master/ios.toolchain.cmake
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)

# https://gitlab.kitware.com/cmake/cmake/-/issues/20104
set(full_triple
    "arm64-apple-ios${CMAKE_XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET}")

set(CMAKE_C_COMPILER_TARGET
    "${full_triple}"
    CACHE STRING "")
set(CMAKE_CXX_COMPILER_TARGET
    "${full_triple}"
    CACHE STRING "")
set(CMAKE_Swift_COMPILER_TARGET
    "${full_triple}"
    CACHE STRING "")
