add_library(reaper reaper.cpp)
target_include_directories(reaper
    PUBLIC ../include
)
target_compile_features(reaper
    PUBLIC cxx_std_26
)
