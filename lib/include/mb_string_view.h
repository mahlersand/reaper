#pragma once

#include <memory>
#include <vector>

class mb_string;

class mb_char_ref
{


private:
    std::shared_ptr<mb_string> string_ref;
}; // class mb_char_ref

class mb_string : std::enable_shared_from_this<mb_string>
{
private:
    mb_string(const std::string& str)
    {
        internal = str;

        size_t current = 0;
        ssize_t remaining = str.size();
        std::mbstate_t mb = std::mbstate_t();

        while (remaining > 0) {
            size_t len = std::mbrlen(str.c_str() + current, remaining, &mb);

            if(len == 0)
                break;
            if(len == std::size_t(-1) || len == std::size_t(-2))
                throw std::runtime_error("No");

            offsets.push_back(current);
            current += len;
            remaining -= len;
        }
    }

    std::string internal;
    std::vector<size_t> offsets;

public:
    static std::shared_ptr<mb_string> create(const std::string& str)
    {
        try {
            auto s = std::shared_ptr<mb_string>(new mb_string(str));
            return s;
        } catch (...) {
            return nullptr;
        }
    }

    size_t length() const
    {
        return offsets.size();
    }

    friend class mb_char_ref;
}; // class mb_string
