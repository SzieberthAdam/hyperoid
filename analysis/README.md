Hyperoid Source and Binary Release Analysis
===========================================

Observations
------------

This section contains the relevant observations I made during my research. Better to put it here
than after the sections of the individual files as those are very technical and hard to read
texts.

* _Microsoft C Professional Development System 6.0a_ LINK (v5.10) must be the linker (see
  [HYPEROID.HDR](#hyperoidhdr), [HYPEROID/MAKEFILE.MK](#hyperoidmakefilemk)).

* _Windows 3.0 Software Development Kit (SDK)_ should be the Windows SDK used. The Windows 3.1
  SDK was released later in par with Microsoft C/C++ 7.0. QuickC for Windows has a newer linker
  (v5.15) than the one used for building Hyperoid (see [LINKVER.md](LINKVER.md)).




HYPEROID/HYPEROID.DEF
---------------------

Module definition file of the original v1.1 release.

#### Notes

* `DATA` segment is defined as `MOVEABLE MULTIPLE`. All other segments are defined as
  `LOADONCALL`. This results the following linker warnings:
  ```
  RC: warning RW4002: Entry point segment 3 set to PRELOAD
  RC: warning RW4002: Non-discardable segment 4 set to PRELOAD
  ```
  Defining `DATA` as `PRELOAD MOVEABLE MULTIPLE` removes the second warning but I was not able
  to get rid of the first.

* Exports are case sensitive. One might thing this implies a `/NOI` linker option as it is set
  in [HYPEROID/HYPEROID.MAK](#hyperoidhyperoidmak). However, the `/NOI` option causes the
  following errors in the linker:
  ```
  LINK : error L2022: HyperoidAboutDlg (alias HyperoidAboutDlg) : export undefined
  LINK : error L2022: HyperoidWndProc (alias HyperoidWndProc) : export undefined
  ...
  ROIDSUPP.obj(ROIDSUPP.C) : error L2029: '_wsprintf' : unresolved external
  HYPEROID.obj(HYPEROID.C) : error L2029: '_wsprintf' : unresolved external
  ```
  The errors disappear when linked without the `/NOI` option.



HYPEROID/HYPEROID.EXE
---------------------

This is the original v1.1 release EXE file. I analyzed it with various tools. See:

* [HYPEROID.ALF](#hyperoidalf)
* [HYPEROID.HDR](#hyperoidhdr)



HYPEROID/HYPEROID.MAP
---------------------

A leftover MAP file which must have been included with the source code by accident.
Unfortunately it seems that is has not much use (see Notes below).

#### Notes

* The file has many error entries at the end so it is certainly not a final piece.

* The map looks like it was complied as a small model MS-DOS (real mode) C program with `/FPi`
  or `/FPc` option (see [Q37664](https://jeffpar.github.io/kbarchive/kb/037/Q37664/)).

* HYPEROIDABOUTDLG and HYPEROIDWNDPROC seems to get exported to the same segment which is in
  conflict with the released EXE (see [HYPEROID.HDR](#hyperoidhdr)).



HYPEROID/HYPEROID.MAK
---------------------

This shipped NMAKE file has some compiler and linker leads in it.

#### Notes

* The makefile is hardcoded to create a debug version. However, it contains release version
  options too, but probably not the ones used originally for the release build.

* QCL (Microsoft QuickC) is set up as compiler. As QuickC is definiately quick, I see some
  retionale behind this. Still, I am reluctant to assume QuickC was used to compile the original
  release version as it is inferior to Microsoft C 6.0. Moreover, there is no `/c` compiler
  option set which would be required to do the linking with the C 6.0 linker.

* The `/NOI` linker option causes linker errors (see
  [HYPEROID/HYPEROID.DEF](#hyperoidhyperoiddef)). This decreases this file's value even more.



HYPEROID/MAKEFILE.MK
--------------------

A custom made makefile. Contains some hints about the original build process.

#### Notes

* Microsoft C 6.0 mentioned as the main build tool

* 100k sum of missing files which were used for the build are mentioned but not included. One
  of them is surely named as `windows.mk`.



HYPEROID.ALF
------------

Product of URSoft W32Dasm v8.93, a 32/16 bit disassembler/debugger. Applied on
[HYPEROID/HYPEROID.EXE](#hyperoidhyperoidexe).



HYPEROID.HDR
------------

Product of Microsoft EXEHDR v2.01 with `/verbose` option. Applied on
[HYPEROID/HYPEROID.EXE](#hyperoidhyperoidexe).

#### Notes

* Linker version 5.10 is the LINK.EXE of the _Microsoft C Professional Development System 6.0a_.

* _Heap allocation_ (HEAPSIZE) and _Extra stack allocation_ (STACKSIZE) are hexadecimal values!

* Segments 3 and 4 has the PRELOAD flags. This is in conflict with the module definitions (see
  [HYPEROID/HYPEROID.DEF](#hyperoidhyperoiddef)).

* HYPEROIDWNDPROC was exported to Segment 1 while HYPEROIDABOUTDLG was exported to Segment 2.
  There are no other exports.
