add_executable(sfml_program main.cpp)
target_link_libraries(sfml_program PUBLIC fmt::fmt sfml-audio sfml-graphics sfml-system sfml-window)
