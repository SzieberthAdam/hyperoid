Hyperoid Re-Build Project Notes
===============================



HYPEROID.ALF
------------

Product of URSoft W32Dasm v8.93, a 32/16 bit disassembler/debugger. Applied on
[HYPEROID.EXE](#hyperoidexe). To be compared with [ANALYSIS\HYPEROID.ALF]().

#### Notes

* A mysterious `___EXPORTEDSTUB` appeared in the exports, in Segment 3. I was searcing for a
  long time to get some viable information about this particular item without success. I was
  unable to make it away by trying many many options alone and in combinations. Check out
  [HYPEROID.HDR](#hyperoidhdr) for more.

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
[HYPEROID.EXE](#hyperoidexe). To be compared with [ANALYSIS\HYPEROID.HDR]().

#### Notes

* The model looks pretty similar to the original. Resident Names Table and Entry Table values
  differ a little but that can be the caused by the `___EXPORTEDSTUB` export that catch one's
  eyes as a difference. Check out [HYPEROID.ALF](#hyperoidalf) for more.
