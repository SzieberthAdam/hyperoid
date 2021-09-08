;	Static Name Aliases
;
;	$S1355_szIni	EQU	szIni
;	$S1356_szLicense	EQU	szLicense
;	$S1357_szDrawDelay	EQU	szDrawDelay
;	$S1358_szMax	EQU	szMax
;	$S1359_szX	EQU	szX
;	$S1360_szY	EQU	szY
;	$S1361_szW	EQU	szW
;	$S1362_szH	EQU	szH
;	$S1363_szBW	EQU	szBW
;	$S1364_szPalette	EQU	szPalette
;	$S1365_szKeys	EQU	szKeys
;	$S1366_szShield	EQU	szShield
;	$S1367_szClockwise	EQU	szClockwise
;	$S1368_szCtrClockwise	EQU	szCtrClockwise
;	$S1369_szThrust	EQU	szThrust
;	$S1370_szRevThrust	EQU	szRevThrust
;	$S1371_szFire	EQU	szFire
;	$S1372_szBomb	EQU	szBomb
;	$S1373_szHi	EQU	szHi
;	$S1374_szColorName	EQU	szColorName
;	$S1391_dwColors	EQU	dwColors
	TITLE   ROIDSUPP.C
	.8087
INCLUDELIB	MLIBCE
ROIDSUPP_TEXT	SEGMENT  WORD PUBLIC 'CODE'
ROIDSUPP_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME DS: DGROUP, SS: DGROUP
PUBLIC  _LetterPart
PUBLIC  _szNumberDesc
PUBLIC  _szLetterDesc
EXTRN	MESSAGEBOX:FAR
EXTRN	MESSAGEBEEP:FAR
EXTRN	GETDEVICECAPS:FAR
EXTRN	ISICONIC:FAR
EXTRN	LOADCURSOR:FAR
EXTRN	CHANGEMENU:FAR
EXTRN	ISZOOMED:FAR
EXTRN	CREATEIC:FAR
EXTRN	LOADSTRING:FAR
EXTRN	DELETEDC:FAR
EXTRN	GETSYSTEMMENU:FAR
EXTRN	DIALOGBOX:FAR
EXTRN	GETPRIVATEPROFILEINT:FAR
EXTRN	CREATEPALETTE:FAR
EXTRN	GETPRIVATEPROFILESTRING:FAR
EXTRN	WRITEPRIVATEPROFILESTRING:FAR
EXTRN	ENDDIALOG:FAR
EXTRN	SETDLGITEMTEXT:FAR
EXTRN	_wsprintf:FAR
EXTRN	UPDATEWINDOW:FAR
EXTRN	REGISTERCLASS:FAR
EXTRN	HYPEROIDWNDPROC:FAR
EXTRN	CREATEWINDOW:FAR
EXTRN	CREATELETTER:FAR
EXTRN	SHOWWINDOW:FAR
EXTRN	_strlen:FAR
EXTRN	MAKEPROCINSTANCE:FAR
EXTRN	FREEPROCINSTANCE:FAR
EXTRN	_atoi:FAR
EXTRN	_atol:FAR
EXTRN	GETWINDOWRECT:FAR
EXTRN	_szAppName:BYTE
EXTRN	_hAppInst:WORD
EXTRN	_bBW:WORD
EXTRN	_nDrawDelay:WORD
EXTRN	_vkShld:WORD
EXTRN	_vkClkw:WORD
EXTRN	_vkCtrClkw:WORD
EXTRN	_vkThrst:WORD
EXTRN	_vkRvThrst:WORD
EXTRN	_vkFire:WORD
EXTRN	_vkBomb:WORD
EXTRN	_lHighScore:DWORD
_BSS      SEGMENT
COMM NEAR	PLOCALHEAP:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG1318	DB	'cakmck',  00H
$SG1319	DB	'dbl',  00H
$SG1320	DB	'abekm',  00H
$SG1321	DB	'abegjlk',  00H
$SG1322	DB	'mcfh',  00H
$SG1323	DB	'cbfgjlk',  00H
$SG1324	DB	'bdiljgi',  00H
$SG1325	DB	'acgl',  00H
$SG1326	DB	'bdjlieb',  00H
$SG1327	DB	'ljebdge',  00H
$SG1329	DB	'kdbemhf',  00H
$SG1330	DB	'kabegjlk',  00H
$SG1331	DB	'cbflm',  00H
$SG1332	DB	'kabejlk',  00H
$SG1333	DB	'cafgfkm',  00H
$SG1334	DB	'cafgfk',  00H
$SG1335	DB	'bdiljhg',  00H
$SG1336	DB	'kafhcm',  00H
$SG1337	DB	'bl',  00H
$SG1338	DB	'cjli',  00H
$SG1339	DB	'akcgm',  00H
$SG1340	DB	'akm',  00H
$SG1341	DB	'kagcm',  00H
$SG1342	DB	'kamc',  00H
$SG1343	DB	'bdiljeb',  00H
$SG1344	DB	'kabegf',  00H
$SG1345	DB	'mlidbejl',  00H
$SG1346	DB	'kabegfgm',  00H
$SG1347	DB	'ebdjli',  00H
$SG1348	DB	'lbac',  00H
$SG1349	DB	'ailjc',  00H
$SG1350	DB	'alc',  00H
$SG1351	DB	'akgmc',  00H
$SG1352	DB	'amgkc',  00H
$SG1353	DB	'aglgc',  00H
$SG1354	DB	'ackm',  00H
$SG1375	DB	'Black',  00H
$SG1376	DB	'DkGrey',  00H
$SG1377	DB	'Grey',  00H
$SG1378	DB	'White',  00H
$SG1379	DB	'DkRed',  00H
$SG1380	DB	'Red',  00H
$SG1381	DB	'DkGreen',  00H
$SG1382	DB	'Green',  00H
$SG1383	DB	'DkBlue',  00H
$SG1384	DB	'Blue',  00H
$SG1385	DB	'DkYellow',  00H
$SG1386	DB	'Yellow',  00H
$SG1387	DB	'DkCyan',  00H
$SG1388	DB	'Cyan',  00H
$SG1389	DB	'DkMagenta',  00H
$SG1390	DB	'Magenta',  00H
	ORG	$+355
$SG1428	DB	'DISPLAY',  00H
$SG1439	DB	00H
$SG1479	DB	'0',  00H
$SG1483	DB	'Hyperoid License',  00H
$SG1484	DB	'This program is free software; you can redistribute it and/o'
	DB	'r modify it under the terms of the GNU General Public Licens'
	DB	'e as published by the Free Software Foundation; either versi'
	DB	'on 1, or (at your option) any later version. ',  0dH,  0aH,  0dH
	DB	0aH, 'This program is distributed in the hope that it will b'
	DB	'e useful, but WITHOUT ANY WARRANTY; without even the implied'
	DB	' warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR'
	DB	'POSE.  See the GNU General Public License for more details. '
	DB	0dH,  0aH,  0dH,  0aH, 'You should have received a copy of t'
	DB	'he GNU General Public License along with this program; if no'
	DB	't, write to the Free Software Foundation, Inc., 675 Mass Ave'
	DB	', Cambridge, MA 02139, USA. ',  00H
$SG1485	DB	'1',  00H
$SG1491	DB	'%lu',  00H
$SG1494	DB	'1',  00H
$SG1496	DB	'%d',  00H
$SG1497	DB	'%d',  00H
$SG1498	DB	'%d',  00H
$SG1499	DB	'%d',  00H
$SG1503	DB	'Hyperoid help',  00H
$SG1504	DB	'The following keys control your ship:',  0dH,  0aH,  0dH,  0aH
	DB	'  Left, Right Arrow .... spin left or right',  0dH,  0aH, ' '
	DB	' Down, Up Arrow ..... forward or reverse thrust',  0dH,  0aH
	DB	'  Space Bar .............. fire!',  0dH,  0aH, '  Tab ......'
	DB	'................... shields',  0dH,  0aH, '  S .............'
	DB	'................ smartbomb',  0dH,  0aH, '  Esc ............'
	DB	'............. pause/boss key',  0dH,  0aH,  0dH,  0aH, 'Note'
	DB	': You have 3 lives, unlimited fuel and firepower, 3 shields '
	DB	'and 3 smartbombs. Your ship gets darker when you lose a life'
	DB	', but you keep on playing (unless you hit an asteroid). You '
	DB	'get an extra life every 100,000 points. When you lose the ga'
	DB	'me, you start over immediately and can finish off the curren'
	DB	't level (which should now be 0) before starting over at leve'
	DB	'l 1 (There is no waiting around between games).',  00H
$SG1505	DB	'Hyperoid.ini help',  00H
$SG1506	DB	'The HYPEROID.INI file can be created/modified to change defa'
	DB	'ult settings in Hyperoid. Here are some of the items you can'
	DB	' set:',  0dH,  0aH,  0dH,  0aH, '[Hyperoid]',  0dH,  0aH, 'M'
	DB	'ax=<0/1>',  0dH,  0aH, '{X,Y,W,H}=<n>',  0dH,  0aH, 'Mono=<0'
	DB	'/1>',  0dH,  0aH, 'DrawDelay=<ms> ;microseconds/frame',  0dH
	DB	0aH,  0dH,  0aH, '[Palette]',  0dH,  0aH, '{Black,DkGrey,Gre'
	DB	'y,White,',  0dH,  0aH, ' DkRed,Red,DkGreen,Green,DkBlue,Blue'
	DB	',',  0dH,  0aH, ' DkYellow,Yellow,DkCyan,Cyan,',  0dH,  0aH, ' '
	DB	'DkMagenta,Magenta}=<r>,<g>,<b>',  0dH,  0aH,  0dH,  0aH, '[K'
	DB	'eys]',  0dH,  0aH, '{Shield,Clockwise,CtrClockwise,',  0dH,  0aH
	DB	' Thrust,RevThrust,Fire,Bomb}=<virtual keycode>',  0dH,  0aH,  0dH
	DB	0aH, 'Note: Virtual keycodes usually match the key''s ASCII '
	DB	'value.',  00H
$SG1519	DB	'High Score: %7.7lu',  00H
	ORG	$-2334
_LetterPart	DW	053H
	DW	023cH
	DW	040H
	DW	0200H
	DW	02dH
	DW	023cH
	DW	060H
	DW	016aH
	DW	020H
	DW	016aH
	DW	080H
	DW	0100H
	DW	00H
	DW	00H
	DW	00H
	DW	0100H
	DW	0a0H
	DW	016aH
	DW	0e0H
	DW	016aH
	DW	0adH
	DW	023cH
	DW	0c0H
	DW	0200H
	DW	0d3H
	DW	023cH
_szNumberDesc	DW	DGROUP:$SG1318
	DW	DGROUP:$SG1319
	DW	DGROUP:$SG1320
	DW	DGROUP:$SG1321
	DW	DGROUP:$SG1322
	DW	DGROUP:$SG1323
	DW	DGROUP:$SG1324
	DW	DGROUP:$SG1325
	DW	DGROUP:$SG1326
	DW	DGROUP:$SG1327
_szLetterDesc	DW	DGROUP:$SG1329
	DW	DGROUP:$SG1330
	DW	DGROUP:$SG1331
	DW	DGROUP:$SG1332
	DW	DGROUP:$SG1333
	DW	DGROUP:$SG1334
	DW	DGROUP:$SG1335
	DW	DGROUP:$SG1336
	DW	DGROUP:$SG1337
	DW	DGROUP:$SG1338
	DW	DGROUP:$SG1339
	DW	DGROUP:$SG1340
	DW	DGROUP:$SG1341
	DW	DGROUP:$SG1342
	DW	DGROUP:$SG1343
	DW	DGROUP:$SG1344
	DW	DGROUP:$SG1345
	DW	DGROUP:$SG1346
	DW	DGROUP:$SG1347
	DW	DGROUP:$SG1348
	DW	DGROUP:$SG1349
	DW	DGROUP:$SG1350
	DW	DGROUP:$SG1351
	DW	DGROUP:$SG1352
	DW	DGROUP:$SG1353
	DW	DGROUP:$SG1354
$S1355_szIni	DB	'HYPEROID.INI',  00H
	ORG	$+1
$S1356_szLicense	DB	'LicenseRead',  00H
$S1357_szDrawDelay	DB	'DrawDelay',  00H
$S1358_szMax	DB	'Max',  00H
$S1359_szX	DB	'X',  00H
$S1360_szY	DB	'Y',  00H
$S1361_szW	DB	'W',  00H
$S1362_szH	DB	'H',  00H
$S1363_szBW	DB	'Mono',  00H
	ORG	$+1
$S1364_szPalette	DB	'Palette',  00H
$S1365_szKeys	DB	'Keys',  00H
	ORG	$+1
$S1366_szShield	DB	'Shield',  00H
	ORG	$+1
$S1367_szClockwise	DB	'Clockwise',  00H
$S1368_szCtrClockwise	DB	'CtrClockwise',  00H
	ORG	$+1
$S1369_szThrust	DB	'Thrust',  00H
	ORG	$+1
$S1370_szRevThrust	DB	'RevThrust',  00H
$S1371_szFire	DB	'Fire',  00H
	ORG	$+1
$S1372_szBomb	DB	'Bomb',  00H
	ORG	$+1
$S1373_szHi	DB	'Hi',  00H
	ORG	$+1
$S1374_szColorName	DW	DGROUP:$SG1375
	DW	DGROUP:$SG1376
	DW	DGROUP:$SG1377
	DW	DGROUP:$SG1378
	DW	DGROUP:$SG1379
	DW	DGROUP:$SG1380
	DW	DGROUP:$SG1381
	DW	DGROUP:$SG1382
	DW	DGROUP:$SG1383
	DW	DGROUP:$SG1384
	DW	DGROUP:$SG1385
	DW	DGROUP:$SG1386
	DW	DGROUP:$SG1387
	DW	DGROUP:$SG1388
	DW	DGROUP:$SG1389
	DW	DGROUP:$SG1390
$S1391_dwColors	DD	00H
	DD	0808080H
	DD	0c0c0c0H
	DD	0ffffffH
	DD	080H
	DD	0ffH
	DD	08000H
	DD	0ff00H
	DD	0800000H
	DD	0ff0000H
	DD	08080H
	DD	0ffffH
	DD	0808000H
	DD	0ffff00H
	DD	0800080H
	DD	0ff00ffH
_DATA      ENDS
ROIDSUPP_TEXT      SEGMENT
	ASSUME	CS: ROIDSUPP_TEXT
; Line 1
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 19
; Line 32
; Line 194
	PUBLIC	PRINTLETTERS
PRINTLETTERS	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,16
	push	si
;	npszText = 18
;	Pos = 14
;	Vel = 10
;	byColor = 8
;	nSize = 6
;	nLen = -12
;	nCnt = -4
;	nSpace = -10
;	nBase = -8
;	nBaseStart = -6
;	npLtr = -16
; Line 196
	push	WORD PTR [bp+18]	;npszText
	call	FAR PTR _strlen
	add	sp,2
	mov	WORD PTR [bp-4],ax	;nCnt
; Line 197
	mov	cx,ax
	mov	ax,WORD PTR [bp+6]	;nSize
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+6]	;nSize
	mov	WORD PTR [bp-10],ax	;nSpace
; Line 199
	dec	cx
	imul	cx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+14]	;Pos
	mov	WORD PTR [bp-6],ax	;nBaseStart
; Line 201
	jmp	SHORT $L20014
$FC1404:
; Line 204
	mov	bx,WORD PTR [bp-4]	;nCnt
	mov	si,WORD PTR [bp+18]	;npszText
	mov	al,BYTE PTR [bx][si]
	push	ax
	mov	ax,WORD PTR [bp+6]	;nSize
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	FAR PTR CREATELETTER
	mov	WORD PTR [bp-16],ax	;npLtr
	or	ax,ax
	je	$I1407
; Line 206
	mov	ax,WORD PTR [bp-6]	;nBaseStart
	mov	bx,WORD PTR [bp-16]	;npLtr
	mov	WORD PTR [bx+4],ax
; Line 207
	mov	ax,WORD PTR [bp+16]
	mov	WORD PTR [bx+6],ax
; Line 208
	mov	ax,WORD PTR [bp+10]	;Vel
	mov	dx,WORD PTR [bp+12]
	mov	WORD PTR [bx+8],ax
	mov	WORD PTR [bx+10],dx
; Line 209
	mov	al,BYTE PTR [bp+8]	;byColor
	mov	BYTE PTR [bx+22],al
; Line 211
$I1407:
	mov	ax,WORD PTR [bp-10]	;nSpace
	sub	WORD PTR [bp-6],ax	;nBaseStart
; Line 212
$L20014:
	mov	ax,WORD PTR [bp-4]	;nCnt
	dec	WORD PTR [bp-4]	;nCnt
	or	ax,ax
	jne	$FC1404
; Line 213
	pop	si
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	14

PRINTLETTERS	ENDP
; Line 221
	PUBLIC	SPINLETTERS
SPINLETTERS	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,22
	push	si
;	npszText = 18
;	Pos = 14
;	Vel = 10
;	byColor = 8
;	nSize = 6
;	nLen = -12
;	nCnt = -4
;	nSpace = -10
;	nBase = -8
;	nBaseStart = -6
;	npLtr = -16
;	nSpin = -18
; Line 223
	push	WORD PTR [bp+18]	;npszText
	call	FAR PTR _strlen
	add	sp,2
	mov	WORD PTR [bp-12],ax	;nLen
	mov	WORD PTR [bp-4],ax	;nCnt
; Line 224
	mov	ax,WORD PTR [bp+6]	;nSize
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+6]	;nSize
	mov	WORD PTR [bp-10],ax	;nSpace
; Line 226
	mov	cx,WORD PTR [bp-12]	;nLen
	dec	cx
	imul	cx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+14]	;Pos
	mov	WORD PTR [bp-6],ax	;nBaseStart
	mov	ax,WORD PTR [bp-12]	;nLen
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-12]	;nLen
	neg	ax
	mov	cx,ax
	shl	ax,1
	mov	WORD PTR [bp-20],ax
	mov	al,5
	xchg	cx,ax
	shl	ax,cl
	mov	WORD PTR [bp-22],ax
; Line 228
	jmp	SHORT $L20015
$FC1420:
; Line 231
	mov	bx,WORD PTR [bp-4]	;nCnt
	mov	si,WORD PTR [bp+18]	;npszText
	mov	al,BYTE PTR [bx][si]
	push	ax
	mov	ax,WORD PTR [bp+6]	;nSize
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	FAR PTR CREATELETTER
	mov	WORD PTR [bp-16],ax	;npLtr
	or	ax,ax
	je	$I1423
; Line 234
	mov	ax,WORD PTR [bp-6]	;nBaseStart
	mov	bx,WORD PTR [bp-16]	;npLtr
	mov	WORD PTR [bx+4],ax
; Line 235
	mov	ax,WORD PTR [bp+16]
	mov	WORD PTR [bx+6],ax
; Line 236
	mov	ax,WORD PTR [bp+10]	;Vel
	mov	dx,WORD PTR [bp+12]
	mov	WORD PTR [bx+8],ax
	mov	WORD PTR [bx+10],dx
; Line 237
	mov	ax,WORD PTR [bp-22]
	add	WORD PTR [bx+8],ax
; Line 238
	mov	ax,WORD PTR [bp-20]
	neg	ax
	mov	WORD PTR [bx+16],ax
; Line 239
	mov	al,BYTE PTR [bp+8]	;byColor
	mov	BYTE PTR [bx+22],al
; Line 241
$I1423:
	mov	ax,WORD PTR [bp-10]	;nSpace
	sub	WORD PTR [bp-6],ax	;nBaseStart
; Line 242
$L20015:
	sub	WORD PTR [bp-20],2
	sub	WORD PTR [bp-22],32
	mov	ax,WORD PTR [bp-4]	;nCnt
	dec	WORD PTR [bp-4]	;nCnt
	or	ax,ax
	jne	$FC1420
; Line 243
	pop	si
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	14

SPINLETTERS	ENDP
; Line 250
	PUBLIC	CREATEHYPEROIDPALETTE
CREATEHYPEROIDPALETTE	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,130
	push	si
;	hPalette = -8
;	hIC = -6
;	t = -4
;	Pal = -80
;	npLogPalette = -82
;	dwColor = -118
;	szBuff = -114
;	r = -124
;	g = -126
;	b = -122
;	npBuff = -120
; Line 252
	mov	ax,OFFSET DGROUP:$SG1428
	push	ds
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	ax
	push	ax
	push	ax
	call	FAR PTR CREATEIC
	mov	WORD PTR [bp-6],ax	;hIC
; Line 255
	lea	ax,WORD PTR [bp-80]	;Pal
	mov	WORD PTR [bp-82],ax	;npLogPalette
; Line 258
	mov	WORD PTR _bBW,0
; Line 259
	push	WORD PTR [bp-6]	;hIC
	mov	ax,24
	push	ax
	call	FAR PTR GETDEVICECAPS
	cmp	ax,8
	jge	$I1432
	mov	WORD PTR _bBW,1
; Line 260
$I1432:
	push	WORD PTR [bp-6]	;hIC
	call	FAR PTR DELETEDC
; Line 261
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1363_szBW
	push	ds
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	je	$I1433
	mov	WORD PTR _bBW,1
; Line 263
$I1433:
	mov	WORD PTR [bp-80],768	;Pal
; Line 264
	mov	WORD PTR [bp-78],16
	mov	WORD PTR [bp-128],0
	mov	WORD PTR [bp-130],OFFSET DGROUP:$S1374_szColorName
; Line 266
$F1434:
; Line 268
	mov	bx,WORD PTR [bp-128]
	mov	ax,WORD PTR $S1391_dwColors[bx]
	mov	dx,WORD PTR $S1391_dwColors[bx+2]
	mov	WORD PTR [bp-118],ax	;dwColor
	mov	WORD PTR [bp-116],dx
; Line 272
	mov	ax,OFFSET DGROUP:$S1364_szPalette
	push	ds
	push	ax
	mov	bx,WORD PTR [bp-130]
	push	ds
	push	WORD PTR [bx]
	mov	ax,OFFSET DGROUP:$SG1439
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-114]	;szBuff
	push	ss
	push	ax
	mov	cx,32
	push	cx
	mov	cx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	cx
	call	FAR PTR GETPRIVATEPROFILESTRING
; Line 273
	cmp	BYTE PTR [bp-114],0	;szBuff
	jne	$JCC544
	jmp	$I1440
$JCC544:
; Line 277
	mov	ax,255
	mov	WORD PTR [bp-122],ax	;b
	mov	WORD PTR [bp-126],ax	;g
; Line 278
	lea	bx,WORD PTR [bp-114]	;szBuff
	mov	WORD PTR [bp-120],bx	;npBuff
	cmp	BYTE PTR [bx],32
	jne	$FB1447
$FC1446:
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],32
	je	$FC1446
$FB1447:
; Line 279
	push	WORD PTR [bp-120]	;npBuff
	call	FAR PTR _atoi
	add	sp,2
	mov	WORD PTR [bp-124],ax	;r
; Line 280
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	je	$FB1450
$FC1449:
	cmp	BYTE PTR [bx],44
	je	$FB1450
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	jne	$FC1449
$FB1450:
; Line 281
	cmp	BYTE PTR [bx],44
	jne	$L20005
	inc	WORD PTR [bp-120]	;npBuff
	push	WORD PTR [bp-120]	;npBuff
	call	FAR PTR _atoi
	add	sp,2
	mov	WORD PTR [bp-126],ax	;g
$L20005:
; Line 282
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	je	$FB1454
$FC1453:
	cmp	BYTE PTR [bx],44
	je	$FB1454
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	jne	$FC1453
$FB1454:
; Line 283
	cmp	BYTE PTR [bx],44
	jne	$I1455
	mov	ax,bx
	inc	ax
	push	ax
	call	FAR PTR _atoi
	add	sp,2
	mov	WORD PTR [bp-122],ax	;b
; Line 284
$I1455:
	mov	al,BYTE PTR [bp-124]	;r
	mov	ah,BYTE PTR [bp-126]	;g
	mov	cl,BYTE PTR [bp-122]	;b
	sub	ch,ch
	mov	WORD PTR [bp-118],ax	;dwColor
	mov	WORD PTR [bp-116],cx
; Line 286
$I1440:
	cmp	WORD PTR _bBW,0
	je	$I1456
	mov	ax,WORD PTR [bp-116]
	or	ax,WORD PTR [bp-118]	;dwColor
	jne	$L20010
	sub	ax,ax
	cwd	
	jmp	SHORT $L20011
	nop	
$L20010:
	mov	ax,-1
	mov	dx,255
$L20011:
	mov	WORD PTR [bp-118],ax	;dwColor
	mov	WORD PTR [bp-116],dx
; Line 287
$I1456:
	mov	al,BYTE PTR [bp-118]	;dwColor
	mov	si,WORD PTR [bp-128]
	mov	BYTE PTR [bp-76][si],al
; Line 288
	mov	al,BYTE PTR [bp-117]
	mov	si,WORD PTR [bp-128]
	mov	BYTE PTR [bp-75][si],al
; Line 289
	mov	al,BYTE PTR [bp-116]
	mov	si,WORD PTR [bp-128]
	mov	BYTE PTR [bp-74][si],al
; Line 290
	mov	si,WORD PTR [bp-128]
	mov	BYTE PTR [bp-73][si],0
	add	WORD PTR [bp-128],4
	add	WORD PTR [bp-130],2
	cmp	WORD PTR [bp-130],OFFSET DGROUP:$S1374_szColorName+32
	jae	$JCC783
	jmp	$F1434
$JCC783:
; Line 294
	lea	ax,WORD PTR [bp-80]	;Pal
	push	ds
	push	ax
	call	FAR PTR CREATEPALETTE
; Line 295
	pop	si
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	
	nop	

CREATEHYPEROIDPALETTE	ENDP
; Line 302
	PUBLIC	CREATEHYPEROIDCLASS
CREATEHYPEROIDCLASS	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,28
;	Class = -28
; Line 306
	push	WORD PTR _hAppInst
	mov	ax,100
	push	ax
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,32
	push	ax
	call	FAR PTR LOADSTRING
; Line 308
	mov	WORD PTR [bp-28],3	;Class
; Line 309
	mov	WORD PTR [bp-26],OFFSET HYPEROIDWNDPROC
	mov	WORD PTR [bp-24],SEG HYPEROIDWNDPROC
; Line 311
	sub	ax,ax
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
; Line 312
	mov	ax,WORD PTR _hAppInst
	mov	WORD PTR [bp-18],ax
; Line 314
	sub	ax,ax
	mov	WORD PTR [bp-16],ax
	push	ax
	mov	ax,32515
	cwd	
	push	dx
	push	ax
	call	FAR PTR LOADCURSOR
	mov	WORD PTR [bp-14],ax
; Line 315
	mov	WORD PTR [bp-12],0
; Line 316
	mov	ax,OFFSET _szAppName
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],ds
; Line 317
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-4],ds
; Line 319
	lea	ax,WORD PTR [bp-28]	;Class
	push	ss
	push	ax
	call	FAR PTR REGISTERCLASS
; Line 320
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	

CREATEHYPEROIDCLASS	ENDP
; Line 327
	PUBLIC	SETHYPEROIDMENU
SETHYPEROIDMENU	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,42
;	hWnd = 8
;	nFirstID = 6
;	nLastID = 4
;	szMenuName = -40
;	hMenu = -42
; Line 332
	push	WORD PTR [bp+8]	;hWnd
	mov	ax,1
	push	ax
	call	FAR PTR GETSYSTEMMENU
	mov	WORD PTR [bp-42],ax	;hMenu
	or	ax,ax
	jne	$I1465
	push	WORD PTR [bp+8]	;hWnd
	push	ax
	call	FAR PTR GETSYSTEMMENU
	mov	WORD PTR [bp-42],ax	;hMenu
; Line 333
$I1465:
	or	ax,ax
	je	$EX1462
; Line 335
	mov	ax,WORD PTR [bp+6]	;nFirstID
	cmp	WORD PTR [bp+4],ax	;nLastID
	jl	$EX1462
$FC1468:
; Line 337
	push	WORD PTR _hAppInst
	push	WORD PTR [bp+6]	;nFirstID
	lea	ax,WORD PTR [bp-40]	;szMenuName
	push	ss
	push	ax
	mov	ax,40
	push	ax
	call	FAR PTR LOADSTRING
; Line 338
	push	WORD PTR [bp-42]	;hMenu
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-40]	;szMenuName
	push	ss
	push	ax
	push	WORD PTR [bp+6]	;nFirstID
	mov	ax,256
	push	ax
	call	FAR PTR CHANGEMENU
; Line 340
	mov	ax,WORD PTR [bp+4]	;nLastID
	inc	WORD PTR [bp+6]	;nFirstID
	cmp	WORD PTR [bp+6],ax	;nFirstID
	jle	$FC1468
; Line 341
$EX1462:
	mov	sp,bp
	pop	bp
	ret	6

SETHYPEROIDMENU	ENDP
; Line 348
	PUBLIC	CREATEHYPEROIDWINDOW
CREATEHYPEROIDWINDOW	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,44
;	hWnd = -36
;	x = -42
;	y = -44
;	w = -38
;	h = -40
;	szBuff = -34
;	lpszCmd = 8
;	nCmdShow = 6
; Line 354
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	cx,OFFSET DGROUP:$S1373_szHi
	push	ds
	push	cx
	mov	cx,OFFSET DGROUP:$SG1479
	push	ds
	push	cx
	lea	cx,WORD PTR [bp-34]	;szBuff
	push	ss
	push	cx
	mov	dx,32
	push	dx
	mov	dx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	dx
	call	FAR PTR GETPRIVATEPROFILESTRING
; Line 355
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ax
	call	FAR PTR _atol
	add	sp,2
	mov	WORD PTR _lHighScore,ax
	mov	WORD PTR _lHighScore+2,dx
; Line 357
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1359_szX
	push	ds
	push	ax
	mov	ax,-32768
	push	ax
	mov	cx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	cx
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-42],ax	;x
; Line 358
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1360_szY
	push	ds
	push	ax
	mov	ax,-32768
	push	ax
	mov	cx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	cx
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-44],ax	;y
; Line 359
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1361_szW
	push	ds
	push	ax
	mov	ax,-32768
	push	ax
	mov	cx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	cx
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-38],ax	;w
; Line 360
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1362_szH
	push	ds
	push	ax
	mov	ax,-32768
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-40],ax	;h
; Line 362
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1358_szMax
	push	ds
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	je	$I1480
	cmp	WORD PTR [bp+6],1	;nCmdShow
	jne	$I1480
	mov	WORD PTR [bp+6],3	;nCmdShow
; Line 364
$I1480:
; Line 366
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	push	ds
	push	ax
	sub	ax,ax
	mov	dx,207
	push	dx
	push	ax
	push	WORD PTR [bp-42]	;x
	push	WORD PTR [bp-44]	;y
	push	WORD PTR [bp-38]	;w
	push	WORD PTR [bp-40]	;h
	push	ax
	push	ax
	push	WORD PTR _hAppInst
	sub	cx,cx
	push	cx
	push	cx
	call	FAR PTR CREATEWINDOW
	mov	WORD PTR [bp-36],ax	;hWnd
	or	ax,ax
	je	$EX1472
; Line 368
	push	ax
	push	WORD PTR [bp+6]	;nCmdShow
	call	FAR PTR SHOWWINDOW
; Line 369
	push	WORD PTR [bp-36]	;hWnd
	call	FAR PTR UPDATEWINDOW
; Line 370
	push	WORD PTR [bp-36]	;hWnd
	mov	ax,200
	push	ax
	mov	ax,201
	push	ax
	call	SETHYPEROIDMENU
; Line 373
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1356_szLicense
	push	ds
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	jne	$I1482
; Line 375
	mov	ax,64
	push	ax
	call	FAR PTR MESSAGEBEEP
; Line 376
	push	WORD PTR [bp-36]	;hWnd
	mov	ax,OFFSET DGROUP:$SG1484
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG1483
	push	ds
	push	ax
	mov	ax,64
	push	ax
	call	FAR PTR MESSAGEBOX
; Line 378
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1356_szLicense
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG1485
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 381
$I1482:
	mov	ax,WORD PTR [bp-36]	;hWnd
; Line 382
$EX1472:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	6
	nop	

CREATEHYPEROIDWINDOW	ENDP
; Line 389
	PUBLIC	SAVEHYPEROIDWINDOWPOS
SAVEHYPEROIDWINDOWPOS	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,42
;	hWnd = 6
;	rect = -42
;	szBuff = -34
; Line 394
	mov	ax,WORD PTR _lHighScore+2
	or	ax,WORD PTR _lHighScore
	je	$I1490
; Line 396
	push	WORD PTR _lHighScore+2
	push	WORD PTR _lHighScore
	mov	ax,OFFSET DGROUP:$SG1491
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 397
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1373_szHi
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 400
$I1490:
	push	WORD PTR [bp+6]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC1511
	jmp	$EX1487
$JCC1511:
; Line 401
	push	WORD PTR [bp+6]	;hWnd
	call	FAR PTR ISZOOMED
	or	ax,ax
	je	$I1493
; Line 403
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1358_szMax
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG1494
	push	ds
	jmp	$L20016
	nop	
; Line 406
$I1493:
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	cx,OFFSET DGROUP:$S1358_szMax
	push	ds
	push	cx
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	cx
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 408
	push	WORD PTR [bp+6]	;hWnd
	lea	ax,WORD PTR [bp-42]	;rect
	push	ss
	push	ax
	call	FAR PTR GETWINDOWRECT
; Line 409
	push	WORD PTR [bp-42]	;rect
	mov	ax,OFFSET DGROUP:$SG1496
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 410
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1359_szX
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 411
	push	WORD PTR [bp-40]
	mov	ax,OFFSET DGROUP:$SG1497
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 412
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1360_szY
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 413
	mov	ax,WORD PTR [bp-38]
	sub	ax,WORD PTR [bp-42]	;rect
	push	ax
	mov	ax,OFFSET DGROUP:$SG1498
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 414
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1361_szW
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 415
	mov	ax,WORD PTR [bp-36]
	sub	ax,WORD PTR [bp-40]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1499
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 416
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1362_szH
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
$L20016:
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 417
$EX1487:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	2
	nop	

SAVEHYPEROIDWINDOWPOS	ENDP
; Line 424
	PUBLIC	GETHYPEROIDINI
GETHYPEROIDINI	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
; Line 425
	mov	ax,OFFSET _szAppName
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1357_szDrawDelay
	push	ds
	push	ax
	mov	ax,50
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _nDrawDelay,ax
; Line 426
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1366_szShield
	push	ds
	push	ax
	mov	ax,9
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkShld,ax
; Line 427
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1367_szClockwise
	push	ds
	push	ax
	mov	ax,37
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkClkw,ax
; Line 428
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1368_szCtrClockwise
	push	ds
	push	ax
	mov	ax,39
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkCtrClkw,ax
; Line 429
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1369_szThrust
	push	ds
	push	ax
	mov	ax,40
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkThrst,ax
; Line 430
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1370_szRevThrust
	push	ds
	push	ax
	mov	ax,38
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkRvThrst,ax
; Line 431
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1371_szFire
	push	ds
	push	ax
	mov	ax,32
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkFire,ax
; Line 432
	mov	ax,OFFSET DGROUP:$S1365_szKeys
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$S1372_szBomb
	push	ds
	push	ax
	mov	ax,83
	push	ax
	mov	ax,OFFSET DGROUP:$S1355_szIni
	push	ds
	push	ax
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkBomb,ax
; Line 433
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	

GETHYPEROIDINI	ENDP
; Line 440
	PUBLIC	HYPEROIDHELP
HYPEROIDHELP	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
;	hWnd = 6
; Line 441
	push	WORD PTR [bp+6]	;hWnd
	mov	ax,OFFSET DGROUP:$SG1504
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG1503
	push	ds
	push	ax
	mov	ax,64
	push	ax
	call	FAR PTR MESSAGEBOX
; Line 442
	push	WORD PTR [bp+6]	;hWnd
	mov	ax,OFFSET DGROUP:$SG1506
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG1505
	push	ds
	push	ax
	mov	ax,64
	push	ax
	call	FAR PTR MESSAGEBOX
; Line 443
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	2

HYPEROIDHELP	ENDP
; Line 451
	PUBLIC	HYPEROIDABOUTDLG
HYPEROIDABOUTDLG	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,42
;	hDlg = 14
;	mess = 12
;	wParam = 10
;	lParam = 6
;	szBuff = -42
; Line 452
	mov	ax,WORD PTR [bp+12]	;mess
; Line 484
	sub	ax,16
	je	$SC1526
	sub	ax,256
	je	$SC1516
	dec	ax
	je	$SC1520
; Line 483
$L20017:
	sub	ax,ax
	jmp	SHORT $EX1511
	nop	
$SC1516:
; Line 455
	mov	ax,WORD PTR _lHighScore+2
	or	ax,WORD PTR _lHighScore
	je	$SB1513
; Line 458
	push	WORD PTR _lHighScore+2
	push	WORD PTR _lHighScore
	mov	ax,OFFSET DGROUP:$SG1519
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-42]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 459
	push	WORD PTR [bp+14]	;hDlg
	mov	ax,502
	push	ax
	lea	ax,WORD PTR [bp-42]	;szBuff
	push	ss
	push	ax
	call	FAR PTR SETDLGITEMTEXT
; Line 461
	jmp	SHORT $SB1513
; Line 463
$SC1520:
; Line 464
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 475
	dec	ax
	je	$SC1526
	sub	ax,500
	jne	$L20017
; Line 467
	push	WORD PTR [bp+14]	;hDlg
	push	cs
	call	NEAR PTR HYPEROIDHELP
; Line 469
$SC1526:
; Line 470
	push	WORD PTR [bp+14]	;hDlg
	sub	ax,ax
	push	ax
	call	FAR PTR ENDDIALOG
; Line 484
$SB1513:
; Line 485
	mov	ax,1
; Line 486
$EX1511:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10

HYPEROIDABOUTDLG	ENDP
; Line 493
	PUBLIC	ABOUTHYPEROID
ABOUTHYPEROID	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	sub	sp,6
;	hWnd = 6
;	lpprocAbout = -6
; Line 494
	mov	ax,OFFSET HYPEROIDABOUTDLG
	mov	dx,SEG HYPEROIDABOUTDLG
	push	dx
	push	ax
	push	WORD PTR _hAppInst
	call	FAR PTR MAKEPROCINSTANCE
	mov	WORD PTR [bp-6],ax	;lpprocAbout
	mov	WORD PTR [bp-4],dx
; Line 495
	push	WORD PTR _hAppInst
	mov	ax,500
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+6]	;hWnd
	push	WORD PTR [bp-4]
	push	WORD PTR [bp-6]	;lpprocAbout
	call	FAR PTR DIALOGBOX
; Line 496
	push	WORD PTR [bp-4]
	push	WORD PTR [bp-6]	;lpprocAbout
	call	FAR PTR FREEPROCINSTANCE
; Line 497
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	2
	nop	

ABOUTHYPEROID	ENDP
ROIDSUPP_TEXT	ENDS
END
