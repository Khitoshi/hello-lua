workspace "LuaTutorial"
   configurations { "Debug", "Release" }
   platforms { "x64" }
   location "build"

project "hello-lua"
   kind "ConsoleApp"
   language "C++"
   architecture "x64"
   targetdir "bin/%{cfg.buildcfg}"

   -- Luaソースコードのパス。適切に変更してください。
   local path = "C:/Program Files/lua-5.4.6"

   files { "src/**.h", "src/**.cpp" }
   
   -- Luaのインクルードディレクトリ
   includedirs { path .. "/src" }

   -- ライブラリとしてリンクするLuaの名前
   links { "lua" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

      -- デバッグビルド時に使用するライブラリディレクトリ
      libdirs { path .. "/bin/Debug" }

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

      -- リリースビルド時に使用するライブラリディレクトリ
      libdirs { path .. "/bin/Release" }
