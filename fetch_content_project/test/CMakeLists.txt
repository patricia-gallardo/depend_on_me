add_executable(tests_fetch_content test.cpp)
target_link_libraries(tests_fetch_content Catch2::Catch2)

add_test(NAME tests_fetch_content COMMAND tests_fetch_content)
