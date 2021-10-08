# Based on https://github.com/cpp-best-practices/cpp_starter_project

function(enable_sanitizers)

    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
        option(ENABLE_COVERAGE "Enable coverage reporting for gcc/clang" FALSE)

        if (ENABLE_COVERAGE)
            add_compile_options("$<$<CONFIG:DEBUG>:--coverage -O0 -g>")
            add_link_options("$<$<CONFIG:DEBUG>:--coverage>")
        endif ()

        set(SANITIZERS "")

        option(ENABLE_SANITIZER_ADDRESS "Enable address sanitizer" FALSE)
        if (ENABLE_SANITIZER_ADDRESS)
            message(STATUS "${CMAKE_PROJECT_NAME}: Enabling address sanitizer")
            list(APPEND SANITIZERS "address")
        endif ()

        option(ENABLE_SANITIZER_LEAK "Enable leak sanitizer" FALSE)
        if (ENABLE_SANITIZER_LEAK)
            list(APPEND SANITIZERS "leak")
        endif ()

        option(ENABLE_SANITIZER_UNDEFINED_BEHAVIOR "Enable undefined behavior sanitizer" FALSE)
        if (ENABLE_SANITIZER_UNDEFINED_BEHAVIOR)
            message(STATUS "${CMAKE_PROJECT_NAME}: Enabling undefined behavior sanitizer")
            list(APPEND SANITIZERS "undefined")
        endif ()

        option(ENABLE_SANITIZER_THREAD "Enable thread sanitizer" FALSE)
        if (ENABLE_SANITIZER_THREAD)
            if ("address" IN_LIST SANITIZERS OR "leak" IN_LIST SANITIZERS)
                message(WARNING "Thread sanitizer does not work with Address and Leak sanitizer enabled")
            else ()
                list(APPEND SANITIZERS "thread")
            endif ()
        endif ()

        option(ENABLE_SANITIZER_MEMORY "Enable memory sanitizer" FALSE)
        if (ENABLE_SANITIZER_MEMORY AND CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
            if ("address" IN_LIST SANITIZERS
                    OR "thread" IN_LIST SANITIZERS
                    OR "leak" IN_LIST SANITIZERS)
                message(WARNING "Memory sanitizer does not work with Address, Thread and Leak sanitizer enabled")
            else ()
                list(APPEND SANITIZERS "memory")
            endif ()
        endif ()

        list(
                JOIN
                SANITIZERS
                ","
                LIST_OF_SANITIZERS)

    endif ()

    if (LIST_OF_SANITIZERS)
        if (NOT
                "${LIST_OF_SANITIZERS}"
                STREQUAL
                "")
            add_compile_options("$<$<CONFIG:DEBUG>:-fsanitize=${LIST_OF_SANITIZERS}>")
            add_link_options("$<$<CONFIG:DEBUG>:-fsanitize=${LIST_OF_SANITIZERS}>")
            if (WIN32)
                set_property(GLOBAL PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
            endif ()
        endif ()
    endif ()

endfunction()
