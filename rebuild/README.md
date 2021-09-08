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

* Instead of doing `push CONSTANT` instructions like the original EXE, the rebuilt one usually
  put the constant to the AX and does a `push ax`. Example:
  ```
  ANALYSIS\HYPEROID.ALF; Line 7270:
  :0002.04A9 68FC02                 push 02FC
  :0002.04AC 6A00                   push 0000
  :0002.04AE 1E                     push ds

  REBUILD\\HYPEROID.ALF; Line 7497:
  :0002.048E B8FC02                 mov ax, 02FC
  :0002.0491 1E                     push ds
  :0002.0492 50                     push ax
  :0002.0493 2BC0                   sub ax, ax
  :0002.0495 50                     push ax
  ```
  I was unable to change this behavior. I tried many many compiler and linker options alone and
  in combinations without success.



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

The batch file which does the rebuild. I prefer this way over using make helpers as a BAT file
is much more readable and understandable than a MAK. In order to be able to build Hyperoid, you
will need the following tools:

* [Microsoft C Professional Development System 6.0a][] installed into `C:\C600` directory, with
  combined libraries, all three math options, all memory models (especially medium), default
  names, componenet libraries kept, and parts into default subdirectories.

* [Microsoft Windows 3.0][] installed into `C:\WIN30`.

* [Microsoft Windows 3.1][] installed into `C:\WINDOWS`.

* [Microsoft Windows 3.0 SDK][] installed into `C:\WINDEV30`, parts into default subdirectories,
  Windows set in `C:\WIN30`, both math coporcessors, all memory models (especially medium).

[Microsoft C Professional Development System 6.0a]: https://winworldpc.com/download/45e280a2-46c5-a018-c39a-11c3a4e284a2)
[Microsoft Windows 3.0]: https://winworldpc.com/download/c2bbc28f-177a-c2b2-5311-c3a4c2ac5a54
[Microsoft Windows 3.0 SDK]: https://winworldpc.com/download/3d012254-18c3-9a11-c3a4-e284a2c3a570
[Microsoft Windows 3.1]: https://winworldpc.com/download/41574932-18c3-9a11-c3a4-e284a2c3a570

#### Notes

* This messy build environment is a result of my experiment. It should be fixed as it might be
  the cause of the rebuild Hyperoid version to not run on Windows 3.0.

* The `/AM /W3 /Ze /O /Ol /Gs /DNDEBUG` CL options were taken from
  [Analysis/HYPEROID/HYPEROID.MAK](../analysis#hyperoidhyperoidmak). This determines the medium
  memory model which is fine as it seems to be the model of the original release too (compare
  the two HDR files).

* The `/CP:0xffff /SE:0x80 /ST:0x2000` LINK options were taken from
  [Analysis/HYPEROID/HYPEROID.MAK](../analysis#hyperoidhyperoidmak). Note that the `\NOD` option
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
