#build types:
# native
# win32

ifeq ($(buildtype),linux-x86_64)
	export build_os=linux
	export build_arch=x86_32
endif

ifeq ($(buildtype),windows-x86_32)
	export build_os=windows
	export build_arch=x86_32
endif

ifeq ($(buildtype),darwin)
	export buildtype=darwin
endif

topdir=$(PWD)
distdir=$(topdir)/${builddef}/$(buildtype)/dist
prefix=$(topdir)/${builddef}/$(buildtype)/build
srcdir=$(topdir)/${builddef}/$(buildtype)/src
build=`gcc -dumpmachine`


ifeq ($(buildtype),windows-x86_32)
	CONFIGURE_BASE_OPT=--host=i586-mingw32msvc --build=$(build) --prefix=$(prefix)
	export CC=i586-mingw32msvc-gcc
	export AR=i586-mingw32msvc-ar
	export AS=i586-mingw32msvc-as
	export RC=i586-mingw32msvc-windres
	export STRIP=i586-mingw32msvc-strip
	export RANLIB=i586-mingw32msvc-ranlib
	export LD=i586-mingw32msvc-ld
	export PKG_CONFIG_LIBDIR=${prefix}/lib/pkgconfig/
	export PKG_CONFIG_PATH=${PKG_CONFIG_LIBDIR}
	export CONFIG_SITE=$(pwd)/config.site
	export CFLAGS=-g -O2 -I${prefix}/include -D_WIN32_WINNT=0x0501
	export CXXFLAGS=-g -O2 -I${prefix}/include
	export LDFLAGS=-L${prefix}/lib
	export INCLUDE_PATH=${prefix}/include
	export LIBRARY_PATH=${prefix}/lib
	export BIN_PATH=${prefix}/bin
else
	CONFIGURE_BASE_OPT= --prefix=$(prefix)
	export PKG_CONFIG_LIBDIR=${prefix}/lib/pkgconfig/
	export PKG_CONFIG_PATH=${PKG_CONFIG_LIBDIR}
	export CFLAGS=-g -O2 -I${prefix}/include 
	export CXXFLAGS=-g -O2 -I${prefix}/include
	export LDFLAGS=-L${prefix}/lib
	export INCLUDE_PATH=${prefix}/include
	export BIN_PATH=${prefix}/bin
	export LIBRARY_PATH=${prefix}/lib
	export PATH:=$(BIN_PATH):$(PATH)
endif
