#pragma once

#include <reaper/grammar.h>

namespace reaper {

class ChoiceRule {
public:
    constexpr ChoiceRule(Rule& lhs, Rule& rhs) :
        m_lhs(lhs), m_rhs(rhs)
    {  }

    constexpr Rule& lhs() { return m_lhs; }
    constexpr Rule& rhs() { return m_rhs; }

private:
    Rule& m_lhs;
    Rule& m_rhs;
};

} // namespace reaper
