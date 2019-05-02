#include <fstream>

#include "Template.hpp"

const char* platform()
{
#ifdef PLATFORM_LINUX
	return "Linux";
#elif PLATFORM_WINDOWS
	return "Windows";
#elif PLATFORM_MACOS
	return "MacOS";
#else
	return "Platform not specified!";
#endif
}

int main()
{
	PremakeTemplate::Template t;
	printf("%s\n", t.ToString());

	// Print platform name
	printf("%s\n", platform());

	// Open file
	std::ifstream f("file.txt");
	if (f.is_open()) { printf("%s\n", "file.txt"); }
	f.close();

	return 0;
}
