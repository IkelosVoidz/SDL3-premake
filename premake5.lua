local cmakeOptions = {
    "-S .",
    "-B build",
    "-DSDL_SHARED=OFF",
    "-DSDL_STATIC=ON", -- We make it a static library
    "-DSDL_TEST_LIBRARY=OFF",
    "-DSDL_TESTS=OFF",
    "-DSDL_DISABLE_INSTALL=OFF",
    "-DSDL_DISABLE_INSTALL_DOCS=OFF",
    "-DSDL_INSTALL_TESTS=OFF",
    "-DSDL_LIBC=ONj"
}

local cmakeCommand = "cmake " .. table.concat(cmakeOptions, " ")
os.execute(cmakeCommand)

externalproject "SDL3-static"
    location "build"
    uuid "57940020-8E99-AEB6-271F-61E0F7F6B73B"
    kind "StaticLib"
    language "C"

    buildcommands {
        "cmake --build build --config %{cfg.buildcfg}",
    }

    includedirs {
        "build/include-%{cfg.buildcfg}"  
    }