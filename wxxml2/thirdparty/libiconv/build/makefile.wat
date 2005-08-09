# =========================================================================
#     This makefile was generated by
#     Bakefile 0.1.9 (http://bakefile.sourceforge.net)
#     Do not modify, all changes will be overwritten!
# =========================================================================



# -------------------------------------------------------------------------
# These are configurable options:
# -------------------------------------------------------------------------

# C compiler 
CC = wcc386

# Standard flags for CC 
CFLAGS = 

# Standard preprocessor flags (common for CC and CXX) 
CPPFLAGS = 

# Standard linker flags 
LDFLAGS = 

# If set to zero a STATIC libxml library will be built [0,1]
SHARED = 0

# Compile Unicode build? [0,1]
UNICODE = 0

# Type of compiled binaries [debug,release]
BUILD = release



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

__iconv_lib___depname =
!ifeq SHARED 0
__iconv_lib___depname = ..\lib\iconv.lib
!endif
__iconv_dll___depname =
!ifeq SHARED 1
__iconv_dll___depname = ..\lib\iconv.dll
!endif
__DEBUGINFO_8 =
!ifeq BUILD debug
__DEBUGINFO_8 = debug all
!endif
!ifeq BUILD release
__DEBUGINFO_8 = 
!endif
__CONFIG2_SRCNAME_FILENAMES =
!ifeq SHARED 0
__CONFIG2_SRCNAME_FILENAMES = iconv.h.msvc-static
!endif
!ifeq SHARED 1
__CONFIG2_SRCNAME_FILENAMES = iconv.h.msvc-shared
!endif
__CONFIG3_SRCNAME_FILENAMES =
!ifeq SHARED 0
__CONFIG3_SRCNAME_FILENAMES = localcharset.h.in
!endif
!ifeq SHARED 1
__CONFIG3_SRCNAME_FILENAMES = localcharset.h.msvc-shared
!endif
__WARNINGS =
!ifeq BUILD debug
__WARNINGS = -wx
!endif
!ifeq BUILD release
__WARNINGS = 
!endif
__UNICODE_DEFINE_p =
!ifeq UNICODE 1
__UNICODE_DEFINE_p = -d_UNICODE
!endif
__OPTIMIZEFLAG =
!ifeq BUILD debug
__OPTIMIZEFLAG = -od
!endif
!ifeq BUILD release
__OPTIMIZEFLAG = -ot -ox
!endif
__DEBUGINFO =
!ifeq BUILD debug
__DEBUGINFO = -d2
!endif
!ifeq BUILD release
__DEBUGINFO = -d0
!endif
__ICONV_SHAREDDEF1_p =
!ifeq SHARED 1
__ICONV_SHAREDDEF1_p = -dBUILDING_LIBICONV
!endif
__ICONV_SHAREDDEF2_p =
!ifeq SHARED 1
__ICONV_SHAREDDEF2_p = -dBUILDING_DLL
!endif

### Variables: ###

ICONV_LIB_CFLAGS = $(__WARNINGS) $(__UNICODE_DEFINE_p) $(__OPTIMIZEFLAG) &
	$(__DEBUGINFO) $(__ICONV_SHAREDDEF1_p) $(__ICONV_SHAREDDEF2_p) &
	-dHAVE_CONFIG_H -dENABLE_RELOCATABLE=1 -dIN_LIBRARY -dNO_XMALLOC &
	-dset_relocation_prefix=libiconv_set_relocation_prefix &
	-drelocate=libiconv_relocate -i=..\include -i=..\libcharset\include &
	-i=..\libcharset $(CPPFLAGS) $(CFLAGS)
ICONV_LIB_OBJECTS =  &
	watcom\iconv_lib_iconv.obj &
	watcom\iconv_lib_localcharset.obj &
	watcom\iconv_lib_relocatable.obj
ICONV_DLL_CFLAGS = -bd $(__WARNINGS) $(__UNICODE_DEFINE_p) $(__OPTIMIZEFLAG) &
	$(__DEBUGINFO) $(__ICONV_SHAREDDEF1_p) $(__ICONV_SHAREDDEF2_p) &
	-dHAVE_CONFIG_H -dENABLE_RELOCATABLE=1 -dIN_LIBRARY -dNO_XMALLOC &
	-dset_relocation_prefix=libiconv_set_relocation_prefix &
	-drelocate=libiconv_relocate -i=..\include -i=..\libcharset\include &
	-i=..\libcharset $(CPPFLAGS) $(CFLAGS)
ICONV_DLL_OBJECTS =  &
	watcom\iconv_dll_iconv.obj &
	watcom\iconv_dll_localcharset.obj &
	watcom\iconv_dll_relocatable.obj


all : watcom
watcom :
	-if not exist watcom mkdir watcom

### Targets: ###

all : .SYMBOLIC ..\lib\config.h ..\include\iconv.h ..\libcharset\include\localcharset.h ..\libcharset\config.h $(__iconv_lib___depname) $(__iconv_dll___depname)

clean : .SYMBOLIC 
	-if exist watcom\*.obj del watcom\*.obj
	-if exist watcom\*.res del watcom\*.res
	-if exist watcom\*.lbc del watcom\*.lbc
	-if exist watcom\*.ilk del watcom\*.ilk
	-if exist watcom\*.pch del watcom\*.pch
	-if exist ..\lib\config.h del ..\lib\config.h
	-if exist ..\include\iconv.h del ..\include\iconv.h
	-if exist ..\libcharset\include\localcharset.h del ..\libcharset\include\localcharset.h
	-if exist ..\libcharset\config.h del ..\libcharset\config.h
	-if exist ..\lib\iconv.lib del ..\lib\iconv.lib
	-if exist ..\lib\iconv.dll del ..\lib\iconv.dll
	-if exist ..\lib\iconv.lib del ..\lib\iconv.lib

..\lib\config.h :  ..\lib\config.h.msvc
	copy ..\lib\config.h.msvc ..\lib\config.h

..\include\iconv.h :  ..\include\$(__CONFIG2_SRCNAME_FILENAMES)
	copy ..\include\$(__CONFIG2_SRCNAME_FILENAMES) ..\include\iconv.h

..\libcharset\include\localcharset.h :  ..\libcharset\include\$(__CONFIG3_SRCNAME_FILENAMES)
	copy ..\libcharset\include\$(__CONFIG3_SRCNAME_FILENAMES) ..\libcharset\include\localcharset.h

..\libcharset\config.h :  ..\libcharset\config.h.msvc
	copy ..\libcharset\config.h.msvc ..\libcharset\config.h

!ifeq SHARED 0
..\lib\iconv.lib :  $(ICONV_LIB_OBJECTS) ..\lib\config.h ..\include\iconv.h ..\libcharset\include\localcharset.h ..\libcharset\config.h
	@%create watcom\iconv_lib.lbc
	@for %i in ($(ICONV_LIB_OBJECTS)) do @%append watcom\iconv_lib.lbc +%i
	wlib -q -p4096 -n -b $^@ @watcom\iconv_lib.lbc
!endif

!ifeq SHARED 1
..\lib\iconv.dll :  $(ICONV_DLL_OBJECTS) ..\lib\config.h ..\include\iconv.h ..\libcharset\include\localcharset.h ..\libcharset\config.h
	@%create watcom\iconv_dll.lbc
	@%append watcom\iconv_dll.lbc option quiet
	@%append watcom\iconv_dll.lbc name $^@
	@%append watcom\iconv_dll.lbc option caseexact
	@%append watcom\iconv_dll.lbc $(LDFLAGS) $(__DEBUGINFO_8)
	@for %i in ($(ICONV_DLL_OBJECTS)) do @%append watcom\iconv_dll.lbc file %i
	@for %i in () do @%append watcom\iconv_dll.lbc library %i
	@%append watcom\iconv_dll.lbc
	@%append watcom\iconv_dll.lbc system nr_dll
	wlink @watcom\iconv_dll.lbc
	wlib -q -n -b ..\lib\iconv.lib +$^@
!endif

watcom\iconv_lib_iconv.obj :  .AUTODEPEND .\..\lib\iconv.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_LIB_CFLAGS) $<

watcom\iconv_lib_localcharset.obj :  .AUTODEPEND .\..\libcharset\lib\localcharset.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_LIB_CFLAGS) $<

watcom\iconv_lib_relocatable.obj :  .AUTODEPEND .\..\lib\relocatable.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_LIB_CFLAGS) $<

watcom\iconv_dll_iconv.obj :  .AUTODEPEND .\..\lib\iconv.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_DLL_CFLAGS) $<

watcom\iconv_dll_localcharset.obj :  .AUTODEPEND .\..\libcharset\lib\localcharset.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_DLL_CFLAGS) $<

watcom\iconv_dll_relocatable.obj :  .AUTODEPEND .\..\lib\relocatable.c
	$(CC) -bt=nt -zq -fo=$^@ $(ICONV_DLL_CFLAGS) $<

