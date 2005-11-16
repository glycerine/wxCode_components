# =========================================================================
#     This makefile was generated by
#     Bakefile 0.1.9 (http://bakefile.sourceforge.net)
#     Do not modify, all changes will be overwritten!
# =========================================================================

!include config.wat

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

WXLIBPOSTFIX =
!ifeq BUILD debug
!ifeq UNICODE 1
WXLIBPOSTFIX = ud
!endif
!endif
!ifeq BUILD debug
!ifeq UNICODE 0
WXLIBPOSTFIX = d
!endif
!endif
!ifeq BUILD release
!ifeq UNICODE 1
WXLIBPOSTFIX = u
!endif
!endif
WXSUBLIBPOSTFIX =
!ifeq BUILD debug
!ifeq UNICODE 0
WXSUBLIBPOSTFIX = d
!endif
!endif
__WARNINGS_0 =
!ifeq BUILD debug
__WARNINGS_0 = -wx
!endif
!ifeq BUILD release
__WARNINGS_0 = 
!endif
__UNICODE_DEFINE_p =
!ifeq UNICODE 1
__UNICODE_DEFINE_p = -d_UNICODE
!endif
__OPTIMIZEFLAG_1 =
!ifeq BUILD debug
__OPTIMIZEFLAG_1 = -od
!endif
!ifeq BUILD release
__OPTIMIZEFLAG_1 = -ot -ox
!endif
__DEBUGINFO_2 =
!ifeq BUILD debug
__DEBUGINFO_2 = -d2
!endif
!ifeq BUILD release
__DEBUGINFO_2 = -d0
!endif
__DEBUGINFO_3 =
!ifeq BUILD debug
__DEBUGINFO_3 = debug all
!endif
!ifeq BUILD release
__DEBUGINFO_3 = 
!endif

### Variables: ###

WXRSSREADER_CXXFLAGS = $(__WARNINGS_0) $(__UNICODE_DEFINE_p) &
	$(__OPTIMIZEFLAG_1) $(__DEBUGINFO_2) $(CPPFLAGS) $(CXXFLAGS)
WXRSSREADER_OBJECTS =  &
	wxrssreader_wxrssreader.obj


### Targets: ###

all : .SYMBOLIC ..\..\bin\wxrssreader.exe

clean : .SYMBOLIC 
	-if exist .\*.obj del .\*.obj
	-if exist .\*.res del .\*.res
	-if exist .\*.lbc del .\*.lbc
	-if exist .\*.ilk del .\*.ilk
	-if exist .\*.pch del .\*.pch
	-if exist ..\..\bin\wxrssreader.exe del ..\..\bin\wxrssreader.exe

..\..\bin\wxrssreader.exe :  $(WXRSSREADER_OBJECTS)
	@%create wxrssreader.lbc
	@%append wxrssreader.lbc option quiet
	@%append wxrssreader.lbc name $^@
	@%append wxrssreader.lbc option caseexact
	@%append wxrssreader.lbc $(LDFLAGS) $(__DEBUGINFO_3) system nt_win ref '_WinMain@16'
	@for %i in ($(WXRSSREADER_OBJECTS)) do @%append wxrssreader.lbc file %i
	@for %i in ( kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib odbc32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib wxmsw27$(WXLIBPOSTFIX)_core.lib wxbase27$(WXLIBPOSTFIX).lib wxbase27$(WXLIBPOSTFIX)_net.lib wxmsw27$(WXLIBPOSTFIX)_adv.lib wxmsw27$(WXLIBPOSTFIX)_html.lib wxregex$(WXSUBLIBPOSTFIX).lib) do @%append wxrssreader.lbc library %i
	@%append wxrssreader.lbc
	wlink @wxrssreader.lbc

wxrssreader_wxrssreader.obj :  .AUTODEPEND .\..\..\src\common\wxrssreader.cpp
	$(CXX) -zq -fo=$^@ $(WXRSSREADER_CXXFLAGS) $<

