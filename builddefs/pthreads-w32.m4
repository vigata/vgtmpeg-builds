PTHREADS_W32_CONFIGURE_BASE_OPT = 

DEFMOD([pthreads-w32], [HEAD],[pthreads-w32],[git], [$(NL_GIT_BASE)projects/],,[])
DEFMOD_COPT(pthreads-w32],[$(PTHREADS_W32_CONFIGURE_BASE_OPT)])
DEFMOD_MAKECMD([pthreads-w32],[make CROSS=i586-mingw32msvc- clean GC-static])
DEFMOD_INSTCMD([pthreads-w32],[make PREFIX=$(prefix) install_static])
DEFMOD_CONF_CMD([pthreads-w32],[:]) 