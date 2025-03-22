#pragma once

#include <string>
#include <utility>
#include <variant>

namespace reaper {

struct ParseFail {};

struct ParseError {
    std::string what;
};

enum ValidParseResult {
    Success,
    SuccessRetry,
    Fail,
};

template <typename Elem>
using ParseResult = std::variant<std::pair<Elem, ValidParseResult>, ParseError>;

} // namespace reaper
