cmake_minimum_required(VERSION 3.31)

project(
    reaper-examples
    VERSION "${REAPER_VERSION}"
    DESCRIPTION "example grammars for reaper"
    LANGUAGES CXX
)

add_reaper_grammar(value SOURCE value.reap)

add_executable(examples examples.cpp)
target_link_libraries(examples PUBLIC value)
