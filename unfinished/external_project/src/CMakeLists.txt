add_executable(sfml_program main.cpp)
target_include_directories(sfml_program PRIVATE ${EXTERNAL_PREFIX}/include)
target_link_libraries(sfml_program fmt sfml-system sfml-audio sfml-window sfml-graphics)
