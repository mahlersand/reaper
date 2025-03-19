#include <iostream>
#include <vector>
#include <fstream>

#include <mb_string_view.h>

int main(int argc, char** argv)
{
    std::vector<std::string> args;
    for(int i = 0; i < argc; ++i)
        args.push_back(std::string(argv[i]));

    std::cout << "Welcome to reap" << "\n"
              << "Executing command \"";
    for(bool f = false; auto& s : args) {
        if(f)
            std::cout << " ";
        else
            f = true;
        std::cout << s;
    }
    std::cout << "\"" << std::endl;

    std::ifstream f("./" + args[1], std::ios_base::binary | std::ios_base::ate);
    auto len = f.tellg();
    f.seekg(0);

    std::string s;
    s.resize(len, '\0');

    f.read(s.data(), len);

    std::cout << s << std::endl;
}
