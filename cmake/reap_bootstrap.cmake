if(NOT "${REAP_NO_BOOTSTRAP}")
    message(STATUS "Building reap")
    if(NOT EXISTS "${CMAKE_BINARY_DIR}/bootstrap")
        message(STATUS "No reap build found, setting up")
        message(STATUS "${CMAKE_COMMAND} -DREAP_NO_BOOTSTRAP=1 -DCMAKE_BUILD_TYPE=Release -S \"${CMAKE_SOURCE_DIR}\" -B \"${CMAKE_BINARY_DIR}/bootstrap\"")
        execute_process(COMMAND ${CMAKE_COMMAND}
            -DREAP_NO_BOOTSTRAP=1
            -DCMAKE_BUILD_TYPE=Release
            -S "${CMAKE_SOURCE_DIR}"
            -B "${CMAKE_BINARY_DIR}/bootstrap"
        )
    endif()

    message(STATUS "${CMAKE_COMMAND} --build \"${CMAKE_BINARY_DIR}/bootstrap\" --config Release --target reap")
    execute_process(COMMAND ${CMAKE_COMMAND}
        --build "${CMAKE_BINARY_DIR}/bootstrap"
        --target reap
    )

    message(STATUS "${CMAKE_COMMAND} --install \"${CMAKE_BINARY_DIR}/bootstrap\" --prefix \"${CMAKE_BINARY_DIR}/bootstrap\"")
    execute_process(COMMAND ${CMAKE_COMMAND}
        --install "${CMAKE_BINARY_DIR}/bootstrap"
        --prefix "${CMAKE_BINARY_DIR}/bootstrap"
    )
endif(NOT "${REAP_NO_BOOTSTRAP}")

