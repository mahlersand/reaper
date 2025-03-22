#include <cstring>
#include <filesystem>
#include <iostream>
#include <vector>
#include <fstream>

#include <reaper/util/mb_string_view.h>

constexpr auto F = ^^int;

int main(int argc, char** argv)
{
    std::vector<std::string> args;
    for(int i = 0; i < argc; ++i)
        args.push_back(std::string(argv[i], strlen(argv[i])));

    std::cout << "Welcome to reap" << "\n"
              << "Executing command \"";

    if(args.size() < 2)
        return 2;

    for(bool f = false; auto& s : args) {
        if(f)
            std::cout << " ";
        else
            f = true;
        std::cout << s;
    }
    std::cout << "\"" << std::endl;

    {
        std::ifstream f(args[1], std::ios_base::binary | std::ios_base::ate);
        if(!f.is_open()) {
            std::cerr << "File" + args[1] + " not found" << std::endl;
            return 1;
        }
        auto len = f.tellg();
        f.seekg(0);

        std::string s;
        s.resize(len, '\0');

        f.read(s.data(), len);

        std::cout << s << std::endl;
    }

    {
        using namespace std::literals;

        auto filename = std::filesystem::path(args[1]).filename().stem().string();

        std::ofstream f("include/grammars/"s + filename + ".h");
        f << "#define REAPER_GRAMMAR_"s + filename << std::endl;
    }
}
