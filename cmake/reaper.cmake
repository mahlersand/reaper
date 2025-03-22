include(cmake/reap_bootstrap.cmake)

function(add_reaper_grammar name)
    set(args_option)
    set(args_single SOURCE PREFIX)
    set(args_multi)

    cmake_parse_arguments("arg"
        "${args_option}"
        "${args_single}"
        "${args_multi}"
        ${ARGN}
    )

    if(NOT "${REAP_NO_BOOTSTRAP}")
        message(STATUS "[add_reaper_grammar] ${CMAKE_BINARY_DIR}/bootstrap/bin/reap ${arg_SOURCE}")
        file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/include/grammars/")
        execute_process(
            COMMAND
                "${CMAKE_BINARY_DIR}/bootstrap/bin/reap" "${CMAKE_CURRENT_SOURCE_DIR}/${arg_SOURCE}"
            WORKING_DIRECTORY
                ${CMAKE_CURRENT_BINARY_DIR}
        )
    endif(NOT "${REAP_NO_BOOTSTRAP}")

    add_custom_command(
        OUTPUT
            ${CMAKE_CURRENT_BINARY_DIR}/include/grammars/${name}.h
        COMMAND
            reap
        ARGS
            ${CMAKE_CURRENT_SOURCE_DIR}/${arg_SOURCE}
        DEPENDS
            ${CMAKE_CURRENT_SOURCE_DIR}/${arg_SOURCE}
    )

    add_library(${name} INTERFACE)
    target_link_libraries(${name}
        INTERFACE reaper
    )
    target_include_directories(${name}
        INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/include/"
    )
    target_sources(${name}
        INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/include/grammars/${name}.h"
        INTERFACE "${arg_SOURCE}"
    )
    target_compile_options(${name}
        INTERFACE ${REAPER_COMPILE_OPTIONS}
    )
    target_link_options(${name}
        INTERFACE ${REAPER_LINK_OPTIONS}
    )
endfunction(add_reaper_grammar)
