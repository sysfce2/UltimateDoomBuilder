
all: linux

run:
	cd Build && mono Builder.exe

linux: builder native

mac: builder nativemac

builder:
	msbuild /nologo /verbosity:minimal -p:Configuration=Release BuilderMono.sln

nativemac:
	g++ -std=c++14 -O2 --shared -g3 -o Build/libBuilderNative.so -fPIC -I Source/Native Source/Native/*.cpp Source/Native/OpenGL/*.cpp Source/Native/OpenGL/gl_load/*.c -ldl

native:
	g++ -std=c++14 -O2 --shared -g3 -o Build/libBuilderNative.so -fPIC -I Source/Native Source/Native/*.cpp Source/Native/OpenGL/*.cpp Source/Native/OpenGL/gl_load/*.c -lX11 -ldl
