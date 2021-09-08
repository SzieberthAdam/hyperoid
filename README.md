Hyperoid Re-Build Project
=========================

**Status: PARTIALLY SUCCEEDED**

I was able to build a working HYPEROID.EXE file from the officially published source code.
Unfortunately I was not able to build a bit-exact clone yet (see Issues below).

_Thank you Edward Hutchins for this wonderful and high quality Win16 game and the source!_


Issues
------

* **There is an issue with the build environment which should be fixed!**

* While original build runs on Windows 3.0, the rebuild version does an Unrecoverable
  Application Error and crashes Windows. On Windows 3.1 it runs nicely.

* My build has an extra ___EXPORTEDSTUB export in it and the stack handling is also different.
  For more, see [Hyperoid Re-Build Project Notes/HYPEROID.ALF](rebuild#hyperoidalf).
