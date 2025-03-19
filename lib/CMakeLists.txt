project(
    reaper-lib
    VERSION "${REAPER_VERSION}"
    DESCRIPTION "core library of reaper"
    LANGUAGES CXX
)

add_library(reaper
    include/mb_string_view.h
    include/reaper.h src/reaper.cpp
)
target_compile_features(reaper
    PUBLIC cxx_std_26
)
target_include_directories(reaper
    PUBLIC include
)

install(TARGETS reaper)
