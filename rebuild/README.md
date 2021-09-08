Hyperoid Re-Build Project Notes
===============================



HYPEROID.ALF
------------

Product of URSoft W32Dasm v8.93, a 32/16 bit disassembler/debugger. Applied on
[HYPEROID.EXE](#hyperoidexe). To be compared with
[ANALYSIS\HYPEROID.ALF](../analysis#hyperoidalf).

#### Notes

* A mysterious `___EXPORTEDSTUB` appeared in the exports, in Segment 3. Check out
  [HYPEROID.HDR](#hyperoidhdr) and [HYPEROID.MAP](#hyperoidmap) for more info about it.



HYPEROID.EXE
------------

This is the rebuilded EXE file which I attempted to make as similar to the original release EXE
as possible. I analyzed this file with various tools. See:

* [HYPEROID.ALF](#hyperoidalf)
* [HYPEROID.HDR](#hyperoidhdr)



HYPEROID.HDR
------------

Product of Microsoft EXEHDR v2.01 with `/verbose` option. Applied on
[HYPEROID.EXE](#hyperoidexe). To be compared with
[ANALYSIS\HYPEROID.HDR](../analysis#hyperoidhdr).

#### Notes

* The model looks pretty similar to the original. Resident Names Table and Entry Table values
  differ a little but that can be the caused by the `___EXPORTEDSTUB` export that catch one's
  eyes as a difference. Check out [HYPEROID.ALF](#hyperoidalf) for more.



HYPEROID.MAP
------------

The MAP file produced by the linker.

#### Notes

* A mysterious `___ExportedStub` appeared in the exports, in Segment 3. I was searcing for a
  long time to get some viable information about this particular item without success. I was
  unable to make it away by trying countless of options alone and in combinations. Check out
  [HYPEROID.HDR](#hyperoidhdr) for more.



REBUILD.BAT
-----------

The batch file which does the rebuild. I prefer this way over using maker utilities as a BAT
file is much more readable and understandable than a MAK. In order to be able to build Hyperoid,
you will need the following tools:

* **Microsoft C Professional Development System 6.0a** installed into default directories
  (`C:\C600`). Medium memory model and floating point emulator are a must settings. However, I
  recommend you to enable all math modes and memory models, and also keep the component
  libraries. This let you all the build settings availabe to toy with.

* **[Microsoft Windows 3.0][]** installed into `C:\WINDOWS`.

* **[Microsoft Windows 3.0 SDK][]** installed into default subdirectories (`C:\WINDEV`).

[Microsoft Windows 3.0]: https://archive.org/details/windows-3.0-cd-rom.ver.-3.0.-multi-eng
[Microsoft Windows 3.0 SDK]: https://archive.org/details/microsoft-windows-software-development-kit-v3.0

#### Notes

* The `/AM /W3 /Ze /O /Ol /Gs /DNDEBUG` CL options were taken from
  [Analysis/HYPEROID/HYPEROID.MAK](../analysis#hyperoidhyperoidmak). This determines the medium
  memory model which is fine as it seems to be the model of the original release too (compare
  the two HDR files).

* Without the `/Gw` option the game crashes _Windows 3.0_ with an _Unrecoverable Application
  Error_.

* The `/CP:0xffff /SE:0x80 /ST:0x2000` LINK options were taken from
  [Analysis/HYPEROID/HYPEROID.MAK](../analysis#hyperoidhyperoidmak). Note that the `/NOD` option
  got removed because it caused compiler errors
  (see [Analysis/HYPEROID/HYPEROID.DEF](../analysis#hyperoidhyperoiddef)).



REBUILD.LOG
-----------

The LOG file produced by [REBUILD.BAT](#rebuildbat).

#### Notes

* A mysterious `___ExportedStub` appeared in the exports, in Segment 3. I was searcing for a
  long time to get some viable information about this particular item without success. I was
  unable to make it away by trying countless of options alone and in combinations. Check out
  [HYPEROID.HDR](#hyperoidhdr) for more.
