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
    "contrib/pugixml/src/**.cpp",
    "contrib/zlib/**.c"
	}

  excludes
  {
    "code/AssetLib/C4D/**.cpp",
    "code/Common/Exporter.cpp",
    "code/AssetLib/IFC/IFCReaderGen_4.cpp",
    "code/AssetLib/StepFile/**.cpp",
    "contrib/zlib/contrib/testzlib/**.c",
    "contrib/zlib/contrib/vstudio/**.c",
    "code/AssetLib/glTF/*",
    "code/AssetLib/glTF2/*",
    "contrib/zlib/contrib/inflate86/*.c"
  }

	includedirs
	{
    ".",
    "code",
    "contrib",
    "contrib/openddlparser/include",
    "contrib/rapidjson/include",
    "contrib/pugixml/src",
    "contrib/zlib",
		"include"
	}

  defines
  {
    ASSIMP_NO_EXPORT,
    ASSIMP_BUILD_NO_GLTF_IMPORTER
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
