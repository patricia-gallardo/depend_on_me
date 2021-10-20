enable_testing()

find_package(Catch2 REQUIRED)

add_executable(tests_conda test.cpp)
target_link_libraries(tests_conda Catch2::Catch2)

add_test(NAME tests_conda COMMAND tests_conda)
