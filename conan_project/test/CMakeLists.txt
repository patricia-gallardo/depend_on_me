enable_testing()

find_package(Catch2 REQUIRED)

add_executable(tests_conan test.cpp)
target_link_libraries(tests_conan Catch2::Catch2)

add_test(NAME tests_conan COMMAND tests_conan)
