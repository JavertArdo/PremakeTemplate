workspace "MyProject"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
	}

project "LibraryProject"
	location "Library"
	kind "StaticLib"
	language "C++"

	targetdir ("Build/%{cfg.buildcfg}-%{cfg.architecture}/%{prj.name}")
	objdir ("Build/obj/%{prj.name}")

	files
	{
		"%{prj.location}/include/Template.hpp",
		"%{prj.location}/source/Template.cpp"
	}

	includedirs
	{
		"%{prj.location}/include"
	}

	filter "system:linux"
		cppdialect "C++17"

	filter "configurations:Debug"
		defines "DEBUG_MODE"
		symbols "On"

	filter "configurations:Release"
		defines "RELEASE_MODE"
		optimize "On"

project "ApplicationProject"
	location "Application"
	kind "ConsoleApp"
	language "C++"

	targetdir ("Build/%{cfg.buildcfg}-%{cfg.architecture}/%{prj.name}")
	objdir ("Build/obj/%{prj.name}")

	files
	{
		"%{prj.location}/App.cpp"
	}

	includedirs
	{
		"Library/include"
	}

	links
	{
		"LibraryProject"
	}

	filter "system:linux"
		cppdialect "C++17"

		defines
		{
			"PLATFORM_LINUX"
		}

		prelinkcommands
		{
			"cp %{wks.location}/Library/resource/file.txt %{cfg.targetdir}"
		}

	filter "configurations:Debug"
		defines "DEBUG_MODE"
		symbols "On"

	filter "configurations:Release"
		defines "RELEASE_MODE"
		optimize "On"
