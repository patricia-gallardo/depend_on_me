find_package(SFML COMPONENTS
             audio graphics system window
             CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

add_executable(sfml_program main.cpp)
target_link_libraries(sfml_program PUBLIC
                      fmt::fmt
                      SFML::audio
                      SFML::graphics
                      SFML::system
                      SFML::window)
