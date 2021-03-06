FFMPEG_CONFIGURE_BASE_OPT = --prefix=$(prefix) --enable-doc --pkg-config-flags="--static" --pkg-config="pkg-config" --disable-shared --enable-libx265 --enable-encoder=libx265  --enable-gpl


ifeq ($(buildtype),linux-x86_64)
	FFMPEG_CONFIGURE_BASE_OPT += --enable-pthreads --arch=x86_64
endif

ifeq ($(buildtype),linux-x86_32)
	FFMPEG_CONFIGURE_BASE_OPT += --enable-pthreads --arch=x86_32 --enable-cross-compile --target-os=linux
endif

ifeq ($(buildtype),windows-x86_32)
    dnl DPTW32_STATIC_LIB  is needed because it triggers some protocol in pthreads.h (w32) to initialize this on windows
	FFMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads --extra-cflags="-DPTW32_STATIC_LIB -static-libgcc -static-libstdc++ -static -O3 -s" --extra-ldflags="-static-libgcc -static-libstdc++ -static"   --arch=i386 --enable-cross-compile --target-os=mingw32 --cross-prefix=$(tools_prefix) --enable-memalign-hack 
dnl    export LIBX264_OPT_LIBS= -lpthreadGC2 
endif

ifeq ($(buildtype),windows-x86_64)
	FFMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads --extra-cflags="-DPTW32_STATIC_LIB -static-libgcc -static-libstdc++ -static -O3 -s" --extra-ldflags="-static-libgcc -static-libstdc++ -static" --arch=x86_64 --enable-cross-compile --target-os=mingw32 --cross-prefix=$(tools_prefix) --enable-memalign-hack 
dnl    export LIBX264_OPT_LIBS= -lpthreadGC2 
endif

ifeq ($(buildtype),darwin-x86_32)
	FFMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads --arch=i386
endif

ifeq ($(buildtype),darwin-x86_64)
	FFMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads  --arch=x86_64
endif


DEFMOD([ffmpeg],[n2.5.4], [ffmpeg], [git], [$(BB_GIT_BASE)] )
DEFMOD_COPT([ffmpeg],[$(FFMPEG_CONFIGURE_BASE_OPT)])

