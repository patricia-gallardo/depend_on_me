enable_testing()

find_package(Catch2 REQUIRED)

add_executable(tests_cpm test.cpp)
target_link_libraries(tests_cpm Catch2::Catch2)

add_test(NAME tests_cpm COMMAND tests_cpm)
