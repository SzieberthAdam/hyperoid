@ECHO OFF
rem subst w: /d >nul
rem subst w: .
mkdir c >NUL
mklink /J ".\c\hyperoid" "..\hyperoid" 2>NUL
mklink /J ".\c\rebuild" "..\rebuild" 2>NUL
.\dosbox\dosbox-x -conf ".\dosbox-x.conf"
