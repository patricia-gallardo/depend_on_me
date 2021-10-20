find_package(Catch2 REQUIRED)

add_executable(tests_vcpkg test.cpp)
target_link_libraries(tests_vcpkg Catch2::Catch2)
