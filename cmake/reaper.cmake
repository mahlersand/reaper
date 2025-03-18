include(cmake/reap_bootstrap.cmake)

function(add_reaper_grammar name)
    if("${REAP_NO_BOOTSTRAP}")
        return()
    endif()
    set(args_option)
    set(args_single SOURCE)
    set(args_multi)

    cmake_parse_arguments("arg"
        "${args_option}"
        "${args_single}"
        "${args_multi}"
        ${ARGN}
    )

    file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/include/grammars/")
    file(TOUCH "${CMAKE_CURRENT_BINARY_DIR}/include/grammars/${name}.h")

    execute_process(COMMAND "${CMAKE_BINARY_DIR}/bootstrap/bin/reap" "${arg_SOURCE}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
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
endfunction(add_reaper_grammar)
