cmake_minimum_required(VERSION 3.31)

project(
    reaper
    VERSION 0.0.1
    DESCRIPTION "a reflection-enabled parser framework"
    LANGUAGES CXX
)

find_package(ICU REQUIRED COMPONENTS uc)

include(cmake/reaper.cmake)

add_subdirectory(lib)
add_subdirectory(reap)

add_subdirectory(examples)

