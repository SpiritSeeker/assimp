project "assimp"
  kind "StaticLib"
  language "C++"
  staticruntime "on"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
    "code/**.cpp",
    "contrib/clipper/**.cpp",
    "contrib/irrXML/**.cpp",
    "contrib/openddlparser/**.cpp",
    "contrib/poly2tri/**.cc",
    "contrib/unzip/**.c",
    "contrib/zip/src/**.c",
    "contrib/zlib/**.c"
	}

  excludes
  {
    "code/C4D/**.cpp",
    "code/Importer/IFC/IFCReaderGen_4.cpp",
    "code/Importer/StepFile/**.cpp",
    "contrib/zlib/contrib/testzlib/**.c",
    "contrib/zlib/contrib/vstudio/**.c"
  }

	includedirs
	{
    ".",
    "code",
    "contrib",
    "contrib/openddlparser/include",
    "contrib/rapidjson/include",
    "contrib/zlib",
		"include"
	}

	filter "system:linux"
		buildoptions { "-std=c++11", "-fPIC" }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
