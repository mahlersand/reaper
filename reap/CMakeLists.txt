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
    reaper
)
# This should not be necessary, is this a bug in CMake?
target_link_options(reap
    PRIVATE ${REAPER_LINK_OPTIONS}
)

install(TARGETS reap)
