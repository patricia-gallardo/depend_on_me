find_package(SFML COMPONENTS audio graphics system window CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

add_executable(sfml_program main.cpp)
if(UNIX)
target_link_libraries(sfml_program PUBLIC fmt::fmt SFML::audio SFML::graphics SFML::system SFML::window)
else()
target_link_libraries(sfml_program PUBLIC fmt::fmt sfml-audio sfml-graphics sfml-system sfml-window)
endif()