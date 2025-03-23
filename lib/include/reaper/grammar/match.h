#pragma once

#include <string>

#include <reaper/grammar.h>

namespace reaper {

class ExactMatchRule {
public:
    constexpr ExactMatchRule(std::string match) :
        m_match(match)
    {  }

    constexpr std::string& match() { return m_match; }

private:
    std::string m_match;
};

} // namespace reaper
