cmake_minimum_required(VERSION 3.31)

project(
    reaper
    VERSION 0.0.1
    DESCRIPTION "a reflection-enabled parser framework"
    LANGUAGES CXX
)

include(cmake/reaper.cmake)

add_subdirectory(src)
add_subdirectory(src/reap)
add_subdirectory(examples)
