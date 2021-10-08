find_package(SFML COMPONENTS system window graphics audio CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    find_package(OpenGL REQUIRED COMPONENTS OpenGL GLX)
endif ()

add_executable(sfml_program main.cpp)
target_link_libraries(sfml_program PUBLIC fmt::fmt sfml-graphics sfml-audio)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    target_link_libraries(sfml_program PUBLIC OpenGL::OpenGL OpenGL::GLX)
endif ()
