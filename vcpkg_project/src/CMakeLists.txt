find_package(SFML COMPONENTS audio graphics system window CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    find_package(OpenGL REQUIRED COMPONENTS OpenGL GLX)
endif ()

add_executable(sfml_program main.cpp)
target_link_libraries(sfml_program PUBLIC fmt::fmt sfml-audio sfml-graphics sfml-system sfml-window)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    target_link_libraries(sfml_program PUBLIC OpenGL::OpenGL OpenGL::GLX)
endif ()
