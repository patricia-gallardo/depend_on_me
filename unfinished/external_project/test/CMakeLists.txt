enable_testing()

find_package(Catch2 REQUIRED)

add_executable(tests_external_project test.cpp)
target_link_libraries(tests_external_project Catch2::Catch2)

add_test(NAME tests_external_project COMMAND tests_external_project)
