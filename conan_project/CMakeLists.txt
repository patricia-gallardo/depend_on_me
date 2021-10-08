cmake_minimum_required(VERSION 3.20)

project(depend_on_me_conan
        VERSION "0.1.1"
        DESCRIPTION "Some description"
        LANGUAGES CXX)

if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.16.1/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/conan.cmake)
conan_add_remote(NAME conancenter URL https://center.conan.io)
conan_check(REQUIRED)
conan_cmake_autodetect(settings)
conan_cmake_install(PATH_OR_REFERENCE ${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt BUILD missing SETTINGS ${settings})

add_subdirectory(src)
add_subdirectory(test)
