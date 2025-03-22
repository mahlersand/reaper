cmake_minimum_required(VERSION 3.31)

project(
    reaper
    VERSION 0.0.1
    DESCRIPTION "a reflection-enabled parser framework"
    LANGUAGES CXX
)

#set(REAP_NO_BOOTSTRAP true)

include(cmake/reaper.cmake)

set(REAPER_COMPILE_OPTIONS
    -nostdinc++ -isystem /opt/p2996_llvm/include/c++/v1
    -freflection-latest
    -fno-access-contexts
)

set(REAPER_LINK_OPTIONS
    -nostdlib++
    -L /opt/p2996_llvm/lib
    -lc++
    -Wl,-rpath,/opt/p2996_llvm/lib,-rpath,/opt/p2996_llvm/lib/x86_64-unknown-linux-gnu
)

find_package(ICU REQUIRED COMPONENTS uc)

add_subdirectory(lib)
add_subdirectory(reap)
add_subdirectory(examples)
