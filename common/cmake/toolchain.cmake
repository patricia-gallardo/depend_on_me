include(${CMAKE_CURRENT_LIST_DIR}/CompilerWarnings.cmake)
set_project_warnings()

include(${CMAKE_CURRENT_LIST_DIR}/Sanitizers.cmake)
set(ENABLE_SANITIZER_ADDRESS YES)
enable_sanitizers()
