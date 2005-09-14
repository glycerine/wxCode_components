# =========================================================================
#     This makefile was generated by
#     Bakefile 0.1.9 (http://bakefile.sourceforge.net)
#     Do not modify, all changes will be overwritten!
# =========================================================================



# -------------------------------------------------------------------------
# These are configurable options:
# -------------------------------------------------------------------------

# C++ compiler 
CXX = wpp386

# Standard flags for C++ 
CXXFLAGS = 

# Standard preprocessor flags (common for CC and CXX) 
CPPFLAGS = 

# Standard linker flags 
LDFLAGS = 

# The directory where wxWidgets library is installed 
WX_DIR = $(%WXWIN)

# Use DLL build of wx library to use? [0,1]
WX_SHARED = 0

# Compile Unicode build of wxWidgets? [0,1]
WX_UNICODE = 0

# Use debug build of wxWidgets (define __WXDEBUG__)? [0,1]
WX_DEBUG = 1

# Version of the wx library to build against. 
WX_VERSION = 26

# If 0 LUA won't be used [0,1]
USE_LUA = 1

# If 0 Python won't be used [0,1]
USE_PYTHON = 0

# If 0 CINT won't be used [0,1]
USE_CINT = 0

# If 0 UnderC won't be used [0,1]
USE_UNDERC = 0

# The LUA library main folder 
LUA_DIR = ..\thirdparty\lua

# The TOLUA library main folder 
TOLUA_DIR = ..\thirdparty\tolua

# The Python library main folder 
PYTHON_DIR = c:\Python

# The Python library version (2.2, 2.3, 2.4 ...) [2_2,2_3,2_4,2_5,2_6]
PYTHON_VER = 2_4

# The CINT library main folder 
CINT_DIR = c:\cint

# The UnderC library main folder 
UNDERC_DIR = c:\ucc



# -------------------------------------------------------------------------
# Do not modify the rest of this file!
# -------------------------------------------------------------------------

# Speed up compilation a bit:
!ifdef __LOADDLL__
!  loaddll wcc      wccd
!  loaddll wccaxp   wccdaxp
!  loaddll wcc386   wccd386
!  loaddll wpp      wppdi86
!  loaddll wppaxp   wppdaxp
!  loaddll wpp386   wppd386
!  loaddll wlink    wlink
!  loaddll wlib     wlibd
!endif

# We need these variables in some bakefile-made rules:
WATCOM_CWD = $+ $(%cdrive):$(%cwd) $-

### Conditionally set variables: ###

WX3RDPARTYLIBPOSTFIX =
!ifeq WX_DEBUG 1
WX3RDPARTYLIBPOSTFIX = d
!endif
PYTHON_MAJVER =
!ifeq PYTHON_VER 2_2
PYTHON_MAJVER = 2
!endif
!ifeq PYTHON_VER 2_3
PYTHON_MAJVER = 2
!endif
!ifeq PYTHON_VER 2_4
PYTHON_MAJVER = 2
!endif
!ifeq PYTHON_VER 2_5
PYTHON_MAJVER = 2
!endif
!ifeq PYTHON_VER 2_6
PYTHON_MAJVER = 2
!endif
PYTHON_MINVER =
!ifeq PYTHON_VER 2_2
PYTHON_MINVER = 2
!endif
!ifeq PYTHON_VER 2_3
PYTHON_MINVER = 3
!endif
!ifeq PYTHON_VER 2_4
PYTHON_MINVER = 4
!endif
!ifeq PYTHON_VER 2_5
PYTHON_MINVER = 5
!endif
!ifeq PYTHON_VER 2_6
PYTHON_MINVER = 6
!endif
SCRIPTINCLUDE1 =
!ifeq USE_PYTHON 1
SCRIPTINCLUDE1 = -i=$(PYTHON_DIR)\include
!endif
SCRIPTINCLUDE2 =
!ifeq USE_LUA 1
SCRIPTINCLUDE2 = -i=$(LUA_DIR)\include -i=$(TOLUA_DIR)\include
!endif
SCRIPTINCLUDE3 =
!ifeq USE_CINT 1
SCRIPTINCLUDE3 = -i=$(CINT_DIR)
!endif
SCRIPTINCLUDE4 =
!ifeq USE_UNDERC 1
SCRIPTINCLUDE4 = -i=$(UNDERC_DIR)
!endif
SCRIPTLIBPATH1 =
!ifeq USE_PYTHON 1
SCRIPTLIBPATH1 = libpath $(PYTHON_DIR)\libs
!endif
SCRIPTLIBPATH2 =
!ifeq USE_LUA 1
SCRIPTLIBPATH2 = libpath $(LUA_DIR)\lib libpath $(TOLUA_DIR)\lib
!endif
SCRIPTLIBPATH3 =
!ifeq USE_CINT 1
SCRIPTLIBPATH3 = libpath $(CINT_DIR)\lib
!endif
SCRIPTLIBPATH4 =
!ifeq USE_UNDERC 1
SCRIPTLIBPATH4 = libpath $(UNDERC_DIR)\lib
!endif
SCRIPTDEFINE1 =
!ifeq USE_PYTHON 0
SCRIPTDEFINE1 = -dwxSCRIPT_NO_PYTHON
!endif
SCRIPTDEFINE2 =
!ifeq USE_LUA 0
SCRIPTDEFINE2 = -dwxSCRIPT_NO_LUA
!endif
SCRIPTDEFINE3 =
!ifeq USE_CINT 0
SCRIPTDEFINE3 = -dwxSCRIPT_NO_CINT
!endif
SCRIPTDEFINE4 =
!ifeq USE_UNDERC 0
SCRIPTDEFINE4 = -dwxSCRIPT_NO_UNDERC
!endif
__wxscript_lib___depname =
!ifeq WX_SHARED 0
__wxscript_lib___depname = ..\lib\wxscript$(WXLIBPOSTFIX).lib
!endif
__wxscript_dll___depname =
!ifeq WX_SHARED 1
__wxscript_dll___depname = ..\lib\wxscript$(WXLIBPOSTFIX).dll
!endif
__WARNINGS =
!ifeq WX_DEBUG 0
__WARNINGS = 
!endif
!ifeq WX_DEBUG 1
__WARNINGS = -wx
!endif
__OPTIMIZEFLAG =
!ifeq WX_DEBUG 0
__OPTIMIZEFLAG = -ot -ox
!endif
!ifeq WX_DEBUG 1
__OPTIMIZEFLAG = -od
!endif
__DEBUGINFO =
!ifeq WX_DEBUG 0
__DEBUGINFO = -d0
!endif
!ifeq WX_DEBUG 1
__DEBUGINFO = -d2
!endif
__DEBUGINFO_0 =
!ifeq WX_DEBUG 0
__DEBUGINFO_0 = 
!endif
!ifeq WX_DEBUG 1
__DEBUGINFO_0 = debug all
!endif
__WX_SHAREDDEFINE_p =
!ifeq WX_SHARED 1
__WX_SHAREDDEFINE_p = -dWXUSINGDLL
!endif
__WXUNICODE_DEFINE_p =
!ifeq WX_UNICODE 1
__WXUNICODE_DEFINE_p = -d_UNICODE
!endif
__WXDEBUG_DEFINE_p =
!ifeq WX_DEBUG 1
__WXDEBUG_DEFINE_p = -d__WXDEBUG__
!endif
WXLIBPOSTFIX =
!ifeq WX_DEBUG 0
!ifeq WX_UNICODE 1
WXLIBPOSTFIX = u
!endif
!endif
!ifeq WX_DEBUG 1
!ifeq WX_UNICODE 0
WXLIBPOSTFIX = d
!endif
!endif
!ifeq WX_DEBUG 1
!ifeq WX_UNICODE 1
WXLIBPOSTFIX = ud
!endif
!endif
__SCRIPTLIB1_p =
!ifeq USE_PYTHON 1
__SCRIPTLIB1_p = python$(PYTHON_MAJVER)$(PYTHON_MINVER).lib
!endif
__SCRIPTLIB2A_p =
!ifeq USE_LUA 1
__SCRIPTLIB2A_p = lua.lib
!endif
__SCRIPTLIB2B_p =
!ifeq USE_LUA 1
__SCRIPTLIB2B_p = lualib.lib
!endif
__SCRIPTLIB2C_p =
!ifeq USE_LUA 1
__SCRIPTLIB2C_p = tolua.lib
!endif
__SCRIPTLIB3_p =
!ifeq USE_CINT 1
__SCRIPTLIB3_p = cint.lib
!endif
__SCRIPTLIB4_p =
!ifeq USE_UNDERC 1
__SCRIPTLIB4_p = ucc12.lib
!endif
__WXLIBPATH_FILENAMES =
!ifeq WX_SHARED 0
__WXLIBPATH_FILENAMES = \lib\wat_lib
!endif
!ifeq WX_SHARED 1
__WXLIBPATH_FILENAMES = \lib\wat_dll
!endif

### Variables: ###

WXSCRIPT_LIB_CXXFLAGS = $(__WARNINGS) $(__OPTIMIZEFLAG) $(__DEBUGINFO) -bm &
	$(__WX_SHAREDDEFINE_p) $(__WXUNICODE_DEFINE_p) $(__WXDEBUG_DEFINE_p) &
	-d__WXMSW__ -i=$(WX_DIR)$(__WXLIBPATH_FILENAMES)\msw$(WXLIBPOSTFIX) &
	-i=$(WX_DIR)\include -i=..\include $(SCRIPTDEFINE1) $(SCRIPTDEFINE2) &
	$(SCRIPTDEFINE3) $(SCRIPTDEFINE4) $(SCRIPTINCLUDE1) $(SCRIPTINCLUDE2) &
	$(SCRIPTINCLUDE3) $(SCRIPTINCLUDE4) $(CPPFLAGS) $(CXXFLAGS)
WXSCRIPT_LIB_OBJECTS =  &
	watcom\wxscript_lib_script.obj &
	watcom\wxscript_lib_scpython.obj &
	watcom\wxscript_lib_sccint.obj &
	watcom\wxscript_lib_scunderc.obj &
	watcom\wxscript_lib_sclua.obj
WXSCRIPT_DLL_CXXFLAGS = -bd $(__WARNINGS) $(__OPTIMIZEFLAG) $(__DEBUGINFO) -bm &
	$(__WX_SHAREDDEFINE_p) $(__WXUNICODE_DEFINE_p) $(__WXDEBUG_DEFINE_p) &
	-d__WXMSW__ -i=$(WX_DIR)$(__WXLIBPATH_FILENAMES)\msw$(WXLIBPOSTFIX) &
	-i=$(WX_DIR)\include -i=..\include -dWXMAKINGDLL_WXSCRIPT $(SCRIPTDEFINE1) &
	$(SCRIPTDEFINE2) $(SCRIPTDEFINE3) $(SCRIPTDEFINE4) $(SCRIPTINCLUDE1) &
	$(SCRIPTINCLUDE2) $(SCRIPTINCLUDE3) $(SCRIPTINCLUDE4) $(CPPFLAGS) &
	$(CXXFLAGS)
WXSCRIPT_DLL_OBJECTS =  &
	watcom\wxscript_dll_script.obj &
	watcom\wxscript_dll_scpython.obj &
	watcom\wxscript_dll_sccint.obj &
	watcom\wxscript_dll_scunderc.obj &
	watcom\wxscript_dll_sclua.obj
TEST1_CXXFLAGS = $(__WARNINGS) $(__OPTIMIZEFLAG) $(__DEBUGINFO) -bm &
	$(__WX_SHAREDDEFINE_p) $(__WXUNICODE_DEFINE_p) $(__WXDEBUG_DEFINE_p) &
	-d__WXMSW__ -i=$(WX_DIR)$(__WXLIBPATH_FILENAMES)\msw$(WXLIBPOSTFIX) &
	-i=$(WX_DIR)\include -i=..\include $(SCRIPTDEFINE1) $(SCRIPTDEFINE2) &
	$(SCRIPTDEFINE3) $(SCRIPTDEFINE4) $(SCRIPTINCLUDE1) $(SCRIPTINCLUDE2) &
	$(SCRIPTINCLUDE3) $(SCRIPTINCLUDE4) $(CPPFLAGS) $(CXXFLAGS)
TEST1_OBJECTS =  &
	watcom\test1_test.obj
TEST2_CXXFLAGS = $(__WARNINGS) $(__OPTIMIZEFLAG) $(__DEBUGINFO) -bm &
	$(__WX_SHAREDDEFINE_p) $(__WXUNICODE_DEFINE_p) $(__WXDEBUG_DEFINE_p) &
	-d__WXMSW__ -i=$(WX_DIR)$(__WXLIBPATH_FILENAMES)\msw$(WXLIBPOSTFIX) &
	-i=$(WX_DIR)\include -i=..\include $(SCRIPTDEFINE1) $(SCRIPTDEFINE2) &
	$(SCRIPTDEFINE3) $(SCRIPTDEFINE4) $(SCRIPTINCLUDE1) $(SCRIPTINCLUDE2) &
	$(SCRIPTINCLUDE3) $(SCRIPTINCLUDE4) $(CPPFLAGS) $(CXXFLAGS)
TEST2_OBJECTS =  &
	watcom\test2_test.obj


all : watcom
watcom :
	-if not exist watcom mkdir watcom

### Targets: ###

all : .SYMBOLIC $(__wxscript_lib___depname) $(__wxscript_dll___depname) ..\tests\test1\test1.exe ..\tests\test2\test2.exe

clean : .SYMBOLIC 
	-if exist watcom\*.obj del watcom\*.obj
	-if exist watcom\*.res del watcom\*.res
	-if exist watcom\*.lbc del watcom\*.lbc
	-if exist watcom\*.ilk del watcom\*.ilk
	-if exist watcom\*.pch del watcom\*.pch
	-if exist ..\lib\wxscript$(WXLIBPOSTFIX).lib del ..\lib\wxscript$(WXLIBPOSTFIX).lib
	-if exist ..\lib\wxscript$(WXLIBPOSTFIX).dll del ..\lib\wxscript$(WXLIBPOSTFIX).dll
	-if exist ..\lib\wxscript$(WXLIBPOSTFIX).lib del ..\lib\wxscript$(WXLIBPOSTFIX).lib
	-if exist ..\tests\test1\test1.exe del ..\tests\test1\test1.exe
	-if exist ..\tests\test2\test2.exe del ..\tests\test2\test2.exe

tarball :  
	-cd ..
	-tar -cvzf ..\wxscript.tar.gz --exclude=*.pdb --exclude=*.log --exclude=*.o* *

zip :  
	-cd ..
	-zip -r9 ..\wxscript.zip *  -x *.pdb -x *.log -x *.o*

deepclean :  
	-del /S ..\*.a
	-del /S ..\*.lib
	-del /S ..\*.pdb
	-del /S ..\*.dll
	-del /S ..\*.exp
	-del /S ..\*.so*
	-del /S ..\*.exe
	-del /S ..\*.obj
	-del /S ..\*.o
	-del /S ..\*.log
	-del /S ..\*.manifest*
	-del /S ..\*.log
	-del /S ..\.bakefile_gen.state
	-del /S ..\*.pch
	-del /S ..\*.ncb
	-del /S ..\*.plg
	-del /S ..\*.ncb
	-del /S ..\*.aps
	-del /S ..\*.suo
	-del /S ..\*.user
	-del /S ..\*.res
	-del /S ..\*.il?
	-del /S ..\*.tds
	-del /S ..\*.idb
	-del /S ..\*.map
	-if exist ..\autom4te.cache rmdir /S /Q ..\autom4te.cache
	-if exist ..\.deps rmdir /S /Q ..\.deps
	-del /S ..\config.status
	-del /S ..\config.log
	-del /S ..\Makefile
	-del /S ..\bk-deps
	-del /S .\*.a
	-del /S .\*.lib
	-del /S .\*.pdb
	-del /S .\*.dll
	-del /S .\*.exp
	-del /S .\*.so*
	-del /S .\*.exe
	-del /S .\*.obj
	-del /S .\*.o
	-del /S .\*.log
	-del /S .\*.manifest*
	-del /S .\*.log
	-del /S .\.bakefile_gen.state
	-del /S .\*.pch
	-del /S .\*.ncb
	-del /S .\*.plg
	-del /S .\*.ncb
	-del /S .\*.aps
	-del /S .\*.suo
	-del /S .\*.user
	-del /S .\*.res
	-del /S .\*.il?
	-del /S .\*.tds
	-del /S .\*.idb
	-del /S .\*.map
	-if exist .\autom4te.cache rmdir /S /Q .\autom4te.cache
	-if exist .\.deps rmdir /S /Q .\.deps
	-del /S .\config.status
	-del /S .\config.log
	-del /S .\Makefile
	-del /S .\bk-deps

docs :  
	-cd ..\docs
	-doxygen

cleandocs :  
	-if exist ..\docs\html rmdir /S /Q ..\docs\html

!ifeq WX_SHARED 0
..\lib\wxscript$(WXLIBPOSTFIX).lib :  $(WXSCRIPT_LIB_OBJECTS)
	@%create watcom\wxscript_lib.lbc
	@for %i in ($(WXSCRIPT_LIB_OBJECTS)) do @%append watcom\wxscript_lib.lbc +%i
	wlib -q -p4096 -n -b $^@ @watcom\wxscript_lib.lbc
!endif

!ifeq WX_SHARED 1
..\lib\wxscript$(WXLIBPOSTFIX).dll :  $(WXSCRIPT_DLL_OBJECTS)
	@%create watcom\wxscript_dll.lbc
	@%append watcom\wxscript_dll.lbc option quiet
	@%append watcom\wxscript_dll.lbc name $^@
	@%append watcom\wxscript_dll.lbc option caseexact
	@%append watcom\wxscript_dll.lbc $(LDFLAGS) $(__DEBUGINFO_0)  libpath $(WX_DIR)$(__WXLIBPATH_FILENAMES) libpath ..\lib $(SCRIPTLIBPATH1) $(SCRIPTLIBPATH2) $(SCRIPTLIBPATH3) $(SCRIPTLIBPATH4)
	@for %i in ($(WXSCRIPT_DLL_OBJECTS)) do @%append watcom\wxscript_dll.lbc file %i
	@for %i in ( $(__SCRIPTLIB1_p) $(__SCRIPTLIB2A_p) $(__SCRIPTLIB2B_p) $(__SCRIPTLIB2C_p) $(__SCRIPTLIB3_p) $(__SCRIPTLIB4_p) wxmsw$(WX_VERSION)$(WXLIBPOSTFIX)_core.lib wxbase$(WX_VERSION)$(WXLIBPOSTFIX).lib wxtiff$(WX3RDPARTYLIBPOSTFIX).lib wxjpeg$(WX3RDPARTYLIBPOSTFIX).lib wxpng$(WX3RDPARTYLIBPOSTFIX).lib wxzlib$(WX3RDPARTYLIBPOSTFIX).lib wxregex$(WXLIBPOSTFIX).lib wxexpat$(WX3RDPARTYLIBPOSTFIX).lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib) do @%append watcom\wxscript_dll.lbc library %i
	@%append watcom\wxscript_dll.lbc
	@%append watcom\wxscript_dll.lbc system nr_dll
	wlink @watcom\wxscript_dll.lbc
	wlib -q -n -b ..\lib\wxscript$(WXLIBPOSTFIX).lib +$^@
!endif

..\tests\test1\test1.exe :  $(TEST1_OBJECTS) $(__wxscript_lib___depname)
	@%create watcom\test1.lbc
	@%append watcom\test1.lbc option quiet
	@%append watcom\test1.lbc name $^@
	@%append watcom\test1.lbc option caseexact
	@%append watcom\test1.lbc $(LDFLAGS) $(__DEBUGINFO_0)  libpath $(WX_DIR)$(__WXLIBPATH_FILENAMES) libpath ..\lib $(SCRIPTLIBPATH1) $(SCRIPTLIBPATH2) $(SCRIPTLIBPATH3) $(SCRIPTLIBPATH4) system nt ref 'main_'
	@for %i in ($(TEST1_OBJECTS)) do @%append watcom\test1.lbc file %i
	@for %i in ( ..\lib\wxscript$(WXLIBPOSTFIX).lib $(__SCRIPTLIB1_p) $(__SCRIPTLIB2A_p) $(__SCRIPTLIB2B_p) $(__SCRIPTLIB2C_p) $(__SCRIPTLIB3_p) $(__SCRIPTLIB4_p) wxmsw$(WX_VERSION)$(WXLIBPOSTFIX)_core.lib wxbase$(WX_VERSION)$(WXLIBPOSTFIX).lib wxtiff$(WX3RDPARTYLIBPOSTFIX).lib wxjpeg$(WX3RDPARTYLIBPOSTFIX).lib wxpng$(WX3RDPARTYLIBPOSTFIX).lib wxzlib$(WX3RDPARTYLIBPOSTFIX).lib wxregex$(WXLIBPOSTFIX).lib wxexpat$(WX3RDPARTYLIBPOSTFIX).lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib) do @%append watcom\test1.lbc library %i
	@%append watcom\test1.lbc
	wlink @watcom\test1.lbc

..\tests\test2\test2.exe :  $(TEST2_OBJECTS) $(__wxscript_lib___depname)
	@%create watcom\test2.lbc
	@%append watcom\test2.lbc option quiet
	@%append watcom\test2.lbc name $^@
	@%append watcom\test2.lbc option caseexact
	@%append watcom\test2.lbc $(LDFLAGS) $(__DEBUGINFO_0)  libpath $(WX_DIR)$(__WXLIBPATH_FILENAMES) libpath ..\lib $(SCRIPTLIBPATH1) $(SCRIPTLIBPATH2) $(SCRIPTLIBPATH3) $(SCRIPTLIBPATH4) system nt ref 'main_'
	@for %i in ($(TEST2_OBJECTS)) do @%append watcom\test2.lbc file %i
	@for %i in ( ..\lib\wxscript$(WXLIBPOSTFIX).lib $(__SCRIPTLIB1_p) $(__SCRIPTLIB2A_p) $(__SCRIPTLIB2B_p) $(__SCRIPTLIB2C_p) $(__SCRIPTLIB3_p) $(__SCRIPTLIB4_p) wxmsw$(WX_VERSION)$(WXLIBPOSTFIX)_core.lib wxbase$(WX_VERSION)$(WXLIBPOSTFIX).lib wxtiff$(WX3RDPARTYLIBPOSTFIX).lib wxjpeg$(WX3RDPARTYLIBPOSTFIX).lib wxpng$(WX3RDPARTYLIBPOSTFIX).lib wxzlib$(WX3RDPARTYLIBPOSTFIX).lib wxregex$(WXLIBPOSTFIX).lib wxexpat$(WX3RDPARTYLIBPOSTFIX).lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib) do @%append watcom\test2.lbc library %i
	@%append watcom\test2.lbc
	wlink @watcom\test2.lbc

watcom\wxscript_lib_script.obj :  .AUTODEPEND .\..\src\script.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_LIB_CXXFLAGS) $<

watcom\wxscript_lib_scpython.obj :  .AUTODEPEND .\..\src\scpython.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_LIB_CXXFLAGS) $<

watcom\wxscript_lib_sccint.obj :  .AUTODEPEND .\..\src\sccint.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_LIB_CXXFLAGS) $<

watcom\wxscript_lib_scunderc.obj :  .AUTODEPEND .\..\src\scunderc.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_LIB_CXXFLAGS) $<

watcom\wxscript_lib_sclua.obj :  .AUTODEPEND .\..\src\sclua.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_LIB_CXXFLAGS) $<

watcom\wxscript_dll_script.obj :  .AUTODEPEND .\..\src\script.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_DLL_CXXFLAGS) $<

watcom\wxscript_dll_scpython.obj :  .AUTODEPEND .\..\src\scpython.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_DLL_CXXFLAGS) $<

watcom\wxscript_dll_sccint.obj :  .AUTODEPEND .\..\src\sccint.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_DLL_CXXFLAGS) $<

watcom\wxscript_dll_scunderc.obj :  .AUTODEPEND .\..\src\scunderc.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_DLL_CXXFLAGS) $<

watcom\wxscript_dll_sclua.obj :  .AUTODEPEND .\..\src\sclua.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(WXSCRIPT_DLL_CXXFLAGS) $<

watcom\test1_test.obj :  .AUTODEPEND .\..\tests\test1\test.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(TEST1_CXXFLAGS) $<

watcom\test2_test.obj :  .AUTODEPEND .\..\tests\test2\test.cpp
	$(CXX) -bt=nt -zq -fo=$^@ $(TEST2_CXXFLAGS) $<

