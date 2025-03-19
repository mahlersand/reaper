cmake_minimum_required(VERSION 3.31)

if("${REAPER_VERSION}")
    project(
        reap
        VERSION "${REAPER_VERSION}"
        DESCRIPTION "the parser generator of reaper"
        LANGUAGES CXX
    )
else()
    project(
        reap-standalone
        VERSION 0.0.1
        DESCRIPTION "the parser generator of reaper (standalone)"
        LANGUAGES CXX
    )
endif()

add_executable(reap
    src/main.cpp
)
target_link_libraries(reap
    PRIVATE reaper
)

install(TARGETS reap)
