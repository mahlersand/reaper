project(
    reaper-lib
    VERSION "${REAPER_VERSION}"
    DESCRIPTION "core library of reaper"
    LANGUAGES CXX
)

add_library(reaper
    include/reaper/util/mb_string_view.h
    include/reaper.h src/reaper.cpp
    include/reaper/parser.h
    include/reaper/grammar.h
    include/reaper/grammar/choice.h
    include/reaper/grammar/lookaround.h
    include/reaper/grammar/match.h
    include/reaper/grammar/repeat.h
    include/reaper/grammar/sequence.h
    include/reaper/grammar/stack.h
)
target_compile_features(reaper
    PUBLIC cxx_std_26
)
target_include_directories(reaper
    PUBLIC include
)
target_link_libraries(reaper
    PUBLIC ICU::uc
)
target_compile_options(reaper
    PUBLIC ${REAPER_COMPILE_OPTIONS}
)
target_link_options(reaper
    PUBLIC ${REAPER_LINK_OPTIONS}
)

message(STATUS "${REAPER_LINK_OPTIONS}")

install(TARGETS reaper)
