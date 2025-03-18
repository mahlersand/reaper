#include <iostream>
#include <vector>
#include <fstream>

#include <mb_string_view.h>

int main(int argc, char** argv)
{
    std::vector<std::string> args;
    for(int i = 0; i < argc; ++i)
        args.push_back(std::string(argv[i]));

    std::cout << "lol   ";
    for(auto& s : args)
        std::cout << s << " ";
    std::cout << std::endl;

    std::ifstream f("./" + args[1]);

    std::string s;
    f >> s;

    std::cout << s << std::endl;
}
