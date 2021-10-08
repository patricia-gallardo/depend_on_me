find_package(SFML COMPONENTS system window graphics audio CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

add_executable(sfml_program main.cpp)
target_link_libraries(sfml_program PRIVATE fmt::fmt sfml-graphics sfml-audio)
