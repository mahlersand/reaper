cmake_minimum_required(VERSION 3.31)

project(
    reap
    VERSION "${REAPER_VERSION}"
    DESCRIPTION "the parser generator of reaper"
    LANGUAGES CXX
)

add_executable(reap
    src/main.cpp
)
target_link_libraries(reap
    PRIVATE reaper
)

install(TARGETS reap)
