;	Static Name Aliases
;
;	$S1361_szIni	EQU	szIni
;	$S1362_szLicense	EQU	szLicense
;	$S1363_szDrawDelay	EQU	szDrawDelay
;	$S1364_szMax	EQU	szMax
;	$S1365_szX	EQU	szX
;	$S1366_szY	EQU	szY
;	$S1367_szW	EQU	szW
;	$S1368_szH	EQU	szH
;	$S1369_szBW	EQU	szBW
;	$S1370_szPalette	EQU	szPalette
;	$S1371_szKeys	EQU	szKeys
;	$S1372_szShield	EQU	szShield
;	$S1373_szClockwise	EQU	szClockwise
;	$S1374_szCtrClockwise	EQU	szCtrClockwise
;	$S1375_szThrust	EQU	szThrust
;	$S1376_szRevThrust	EQU	szRevThrust
;	$S1377_szFire	EQU	szFire
;	$S1378_szBomb	EQU	szBomb
;	$S1379_szHi	EQU	szHi
;	$S1380_szColorName	EQU	szColorName
;	$S1397_dwColors	EQU	dwColors
	TITLE   ROIDSUPP.C
	.186
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
EXTRN	MAKEPROCINSTANCE:FAR
EXTRN	FREEPROCINSTANCE:FAR
EXTRN	GETWINDOWRECT:FAR
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
EXTRN	_atoi:FAR
EXTRN	_atol:FAR
EXTRN	HYPEROIDWNDPROC:FAR
EXTRN	CREATEWINDOW:FAR
EXTRN	CREATELETTER:FAR
EXTRN	SHOWWINDOW:FAR
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
$SG1324	DB	'cakmck',  00H
$SG1325	DB	'dbl',  00H
$SG1326	DB	'abekm',  00H
$SG1327	DB	'abegjlk',  00H
$SG1328	DB	'mcfh',  00H
$SG1329	DB	'cbfgjlk',  00H
$SG1330	DB	'bdiljgi',  00H
$SG1331	DB	'acgl',  00H
$SG1332	DB	'bdjlieb',  00H
$SG1333	DB	'ljebdge',  00H
$SG1335	DB	'kdbemhf',  00H
$SG1336	DB	'kabegjlk',  00H
$SG1337	DB	'cbflm',  00H
$SG1338	DB	'kabejlk',  00H
$SG1339	DB	'cafgfkm',  00H
$SG1340	DB	'cafgfk',  00H
$SG1341	DB	'bdiljhg',  00H
$SG1342	DB	'kafhcm',  00H
$SG1343	DB	'bl',  00H
$SG1344	DB	'cjli',  00H
$SG1345	DB	'akcgm',  00H
$SG1346	DB	'akm',  00H
$SG1347	DB	'kagcm',  00H
$SG1348	DB	'kamc',  00H
$SG1349	DB	'bdiljeb',  00H
$SG1350	DB	'kabegf',  00H
$SG1351	DB	'mlidbejl',  00H
$SG1352	DB	'kabegfgm',  00H
$SG1353	DB	'ebdjli',  00H
$SG1354	DB	'lbac',  00H
$SG1355	DB	'ailjc',  00H
$SG1356	DB	'alc',  00H
$SG1357	DB	'akgmc',  00H
$SG1358	DB	'amgkc',  00H
$SG1359	DB	'aglgc',  00H
$SG1360	DB	'ackm',  00H
$SG1381	DB	'Black',  00H
$SG1382	DB	'DkGrey',  00H
$SG1383	DB	'Grey',  00H
$SG1384	DB	'White',  00H
$SG1385	DB	'DkRed',  00H
$SG1386	DB	'Red',  00H
$SG1387	DB	'DkGreen',  00H
$SG1388	DB	'Green',  00H
$SG1389	DB	'DkBlue',  00H
$SG1390	DB	'Blue',  00H
$SG1391	DB	'DkYellow',  00H
$SG1392	DB	'Yellow',  00H
$SG1393	DB	'DkCyan',  00H
$SG1394	DB	'Cyan',  00H
$SG1395	DB	'DkMagenta',  00H
$SG1396	DB	'Magenta',  00H
	ORG	$+355
$SG1434	DB	'DISPLAY',  00H
$SG1445	DB	00H
$SG1485	DB	'0',  00H
$SG1489	DB	'Hyperoid License',  00H
$SG1490	DB	'This program is free software; you can redistribute it and/o'
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
$SG1491	DB	'1',  00H
$SG1497	DB	'%lu',  00H
$SG1500	DB	'1',  00H
$SG1502	DB	'%d',  00H
$SG1503	DB	'%d',  00H
$SG1504	DB	'%d',  00H
$SG1505	DB	'%d',  00H
$SG1509	DB	'Hyperoid help',  00H
$SG1510	DB	'The following keys control your ship:',  0dH,  0aH,  0dH,  0aH
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
$SG1511	DB	'Hyperoid.ini help',  00H
$SG1512	DB	'The HYPEROID.INI file can be created/modified to change defa'
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
$SG1525	DB	'High Score: %7.7lu',  00H
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
_szNumberDesc	DW	DGROUP:$SG1324
	DW	DGROUP:$SG1325
	DW	DGROUP:$SG1326
	DW	DGROUP:$SG1327
	DW	DGROUP:$SG1328
	DW	DGROUP:$SG1329
	DW	DGROUP:$SG1330
	DW	DGROUP:$SG1331
	DW	DGROUP:$SG1332
	DW	DGROUP:$SG1333
_szLetterDesc	DW	DGROUP:$SG1335
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
	DW	DGROUP:$SG1355
	DW	DGROUP:$SG1356
	DW	DGROUP:$SG1357
	DW	DGROUP:$SG1358
	DW	DGROUP:$SG1359
	DW	DGROUP:$SG1360
$S1361_szIni	DB	'HYPEROID.INI',  00H
	ORG	$+1
$S1362_szLicense	DB	'LicenseRead',  00H
$S1363_szDrawDelay	DB	'DrawDelay',  00H
$S1364_szMax	DB	'Max',  00H
$S1365_szX	DB	'X',  00H
$S1366_szY	DB	'Y',  00H
$S1367_szW	DB	'W',  00H
$S1368_szH	DB	'H',  00H
$S1369_szBW	DB	'Mono',  00H
	ORG	$+1
$S1370_szPalette	DB	'Palette',  00H
$S1371_szKeys	DB	'Keys',  00H
	ORG	$+1
$S1372_szShield	DB	'Shield',  00H
	ORG	$+1
$S1373_szClockwise	DB	'Clockwise',  00H
$S1374_szCtrClockwise	DB	'CtrClockwise',  00H
	ORG	$+1
$S1375_szThrust	DB	'Thrust',  00H
	ORG	$+1
$S1376_szRevThrust	DB	'RevThrust',  00H
$S1377_szFire	DB	'Fire',  00H
	ORG	$+1
$S1378_szBomb	DB	'Bomb',  00H
	ORG	$+1
$S1379_szHi	DB	'Hi',  00H
	ORG	$+1
$S1380_szColorName	DW	DGROUP:$SG1381
	DW	DGROUP:$SG1382
	DW	DGROUP:$SG1383
	DW	DGROUP:$SG1384
	DW	DGROUP:$SG1385
	DW	DGROUP:$SG1386
	DW	DGROUP:$SG1387
	DW	DGROUP:$SG1388
	DW	DGROUP:$SG1389
	DW	DGROUP:$SG1390
	DW	DGROUP:$SG1391
	DW	DGROUP:$SG1392
	DW	DGROUP:$SG1393
	DW	DGROUP:$SG1394
	DW	DGROUP:$SG1395
	DW	DGROUP:$SG1396
$S1397_dwColors	DD	00H
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
	push	di
	push	si
;	nBaseStart = -6
;	npLtr = -16
;	npszText = 18
;	Pos = 14
;	Vel = 10
;	byColor = 8
;	nSize = 6
;	nLen = -12
;	nCnt = -4
;	nSpace = -10
;	nBase = -8
; Line 196
	push	ds
	pop	es
	mov	di,WORD PTR [bp+18]	;npszText
	mov	cx,-1
	xor	ax,ax
	repnz	scasb
	not	cx
	dec	cx
	mov	WORD PTR [bp-4],cx	;nCnt
; Line 197
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
	nop	
$FC1410:
; Line 204
	mov	bx,WORD PTR [bp+18]	;npszText
	mov	si,WORD PTR [bp-4]	;nCnt
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
	je	$I1413
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
$I1413:
	mov	ax,WORD PTR [bp-10]	;nSpace
	sub	WORD PTR [bp-6],ax	;nBaseStart
; Line 212
$L20014:
	mov	ax,WORD PTR [bp-4]	;nCnt
	dec	WORD PTR [bp-4]	;nCnt
	or	ax,ax
	jne	$FC1410
; Line 213
	pop	si
	pop	di
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	14
	nop	

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
	push	di
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
	push	ds
	pop	es
	mov	di,WORD PTR [bp+18]	;npszText
	mov	cx,-1
	xor	ax,ax
	repnz	scasb
	not	cx
	dec	cx
	mov	WORD PTR [bp-12],cx	;nLen
	mov	WORD PTR [bp-4],cx	;nCnt
; Line 224
	mov	ax,WORD PTR [bp+6]	;nSize
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+6]	;nSize
	mov	WORD PTR [bp-10],ax	;nSpace
; Line 226
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
	shl	cx,5
	mov	WORD PTR [bp-22],cx
; Line 228
	jmp	SHORT $L20015
$FC1426:
; Line 231
	mov	bx,WORD PTR [bp+18]	;npszText
	mov	si,WORD PTR [bp-4]	;nCnt
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
	je	$I1429
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
$I1429:
	mov	ax,WORD PTR [bp-10]	;nSpace
	sub	WORD PTR [bp-6],ax	;nBaseStart
; Line 242
$L20015:
	sub	WORD PTR [bp-20],2
	sub	WORD PTR [bp-22],32
	mov	ax,WORD PTR [bp-4]	;nCnt
	dec	WORD PTR [bp-4]	;nCnt
	or	ax,ax
	jne	$FC1426
; Line 243
	pop	si
	pop	di
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	14
	nop	

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
	push	ds
	push	OFFSET DGROUP:$SG1434
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	call	FAR PTR CREATEIC
	mov	WORD PTR [bp-6],ax	;hIC
; Line 255
	lea	ax,WORD PTR [bp-80]	;Pal
	mov	WORD PTR [bp-82],ax	;npLogPalette
; Line 258
	mov	WORD PTR _bBW,0
; Line 259
	push	WORD PTR [bp-6]	;hIC
	push	24
	call	FAR PTR GETDEVICECAPS
	cmp	ax,8
	jge	$I1438
	mov	WORD PTR _bBW,1
; Line 260
$I1438:
	push	WORD PTR [bp-6]	;hIC
	call	FAR PTR DELETEDC
; Line 261
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1369_szBW
	push	0
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	je	$I1439
	mov	WORD PTR _bBW,1
; Line 263
$I1439:
	mov	WORD PTR [bp-80],768	;Pal
; Line 264
	mov	WORD PTR [bp-78],16
	mov	WORD PTR [bp-128],0
	mov	WORD PTR [bp-130],OFFSET DGROUP:$S1380_szColorName
; Line 266
$F1440:
; Line 268
	mov	bx,WORD PTR [bp-128]
	mov	ax,WORD PTR $S1397_dwColors[bx]
	mov	dx,WORD PTR $S1397_dwColors[bx+2]
	mov	WORD PTR [bp-118],ax	;dwColor
	mov	WORD PTR [bp-116],dx
; Line 272
	push	ds
	push	OFFSET DGROUP:$S1370_szPalette
	mov	bx,WORD PTR [bp-130]
	push	ds
	push	WORD PTR [bx]
	push	ds
	push	OFFSET DGROUP:$SG1445
	lea	ax,WORD PTR [bp-114]	;szBuff
	push	ss
	push	ax
	push	32
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILESTRING
; Line 273
	cmp	BYTE PTR [bp-114],0	;szBuff
	jne	$JCC544
	jmp	$I1446
$JCC544:
; Line 277
	mov	ax,255
	mov	WORD PTR [bp-122],ax	;b
	mov	WORD PTR [bp-126],ax	;g
; Line 278
	lea	bx,WORD PTR [bp-114]	;szBuff
	mov	WORD PTR [bp-120],bx	;npBuff
	cmp	BYTE PTR [bx],32
	jne	$FB1453
$FC1452:
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],32
	je	$FC1452
$FB1453:
; Line 279
	push	WORD PTR [bp-120]	;npBuff
	call	FAR PTR _atoi
	add	sp,2
	mov	WORD PTR [bp-124],ax	;r
; Line 280
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	je	$FB1456
$FC1455:
	cmp	BYTE PTR [bx],44
	je	$FB1456
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	jne	$FC1455
$FB1456:
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
	je	$FB1460
$FC1459:
	cmp	BYTE PTR [bx],44
	je	$FB1460
	inc	WORD PTR [bp-120]	;npBuff
	mov	bx,WORD PTR [bp-120]	;npBuff
	cmp	BYTE PTR [bx],0
	jne	$FC1459
$FB1460:
; Line 283
	cmp	BYTE PTR [bx],44
	jne	$I1461
	mov	ax,bx
	inc	ax
	push	ax
	call	FAR PTR _atoi
	add	sp,2
	mov	WORD PTR [bp-122],ax	;b
; Line 284
$I1461:
	mov	al,BYTE PTR [bp-124]	;r
	mov	ah,BYTE PTR [bp-126]	;g
	mov	cl,BYTE PTR [bp-122]	;b
	sub	ch,ch
	mov	WORD PTR [bp-118],ax	;dwColor
	mov	WORD PTR [bp-116],cx
; Line 286
$I1446:
	cmp	WORD PTR _bBW,0
	je	$I1462
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
$I1462:
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
	cmp	WORD PTR [bp-130],OFFSET DGROUP:$S1380_szColorName+32
	jae	$JCC783
	jmp	$F1440
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
	push	100
	push	ds
	push	OFFSET _szAppName
	push	32
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
	push	ax
	push	32515
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
	nop	

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
	push	1
	call	FAR PTR GETSYSTEMMENU
	mov	WORD PTR [bp-42],ax	;hMenu
	or	ax,ax
	jne	$I1471
	push	WORD PTR [bp+8]	;hWnd
	push	ax
	call	FAR PTR GETSYSTEMMENU
	mov	WORD PTR [bp-42],ax	;hMenu
; Line 333
$I1471:
	or	ax,ax
	je	$EX1468
; Line 335
	mov	ax,WORD PTR [bp+6]	;nFirstID
	cmp	WORD PTR [bp+4],ax	;nLastID
	jl	$EX1468
$FC1474:
; Line 337
	push	WORD PTR _hAppInst
	push	WORD PTR [bp+6]	;nFirstID
	lea	ax,WORD PTR [bp-40]	;szMenuName
	push	ss
	push	ax
	push	40
	call	FAR PTR LOADSTRING
; Line 338
	push	WORD PTR [bp-42]	;hMenu
	push	0
	lea	ax,WORD PTR [bp-40]	;szMenuName
	push	ss
	push	ax
	push	WORD PTR [bp+6]	;nFirstID
	push	256
	call	FAR PTR CHANGEMENU
; Line 340
	mov	ax,WORD PTR [bp+4]	;nLastID
	inc	WORD PTR [bp+6]	;nFirstID
	cmp	WORD PTR [bp+6],ax	;nFirstID
	jle	$FC1474
; Line 341
$EX1468:
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
;	lpszCmd = 8
;	nCmdShow = 6
;	hWnd = -36
;	x = -42
;	y = -44
;	w = -38
;	h = -40
;	szBuff = -34
; Line 354
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1379_szHi
	push	ds
	push	OFFSET DGROUP:$SG1485
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	push	32
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILESTRING
; Line 355
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ax
	call	FAR PTR _atol
	add	sp,2
	mov	WORD PTR _lHighScore,ax
	mov	WORD PTR _lHighScore+2,dx
; Line 357
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1365_szX
	push	-32768
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-42],ax	;x
; Line 358
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1366_szY
	push	-32768
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-44],ax	;y
; Line 359
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1367_szW
	push	-32768
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-38],ax	;w
; Line 360
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1368_szH
	push	-32768
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR [bp-40],ax	;h
; Line 362
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1364_szMax
	push	0
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	je	$I1486
	cmp	WORD PTR [bp+6],1	;nCmdShow
	jne	$I1486
	mov	WORD PTR [bp+6],3	;nCmdShow
; Line 364
$I1486:
; Line 366
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET _szAppName
	push	207
	push	0
	push	WORD PTR [bp-42]	;x
	push	WORD PTR [bp-44]	;y
	push	WORD PTR [bp-38]	;w
	push	WORD PTR [bp-40]	;h
	push	0
	push	0
	push	WORD PTR _hAppInst
	push	0
	push	0
	call	FAR PTR CREATEWINDOW
	mov	WORD PTR [bp-36],ax	;hWnd
	or	ax,ax
	je	$EX1478
; Line 368
	push	ax
	push	WORD PTR [bp+6]	;nCmdShow
	call	FAR PTR SHOWWINDOW
; Line 369
	push	WORD PTR [bp-36]	;hWnd
	call	FAR PTR UPDATEWINDOW
; Line 370
	push	WORD PTR [bp-36]	;hWnd
	push	200
	push	201
	call	SETHYPEROIDMENU
; Line 373
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1362_szLicense
	push	0
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	or	ax,ax
	jne	$I1488
; Line 375
	push	64
	call	FAR PTR MESSAGEBEEP
; Line 376
	push	WORD PTR [bp-36]	;hWnd
	push	ds
	push	OFFSET DGROUP:$SG1490
	push	ds
	push	OFFSET DGROUP:$SG1489
	push	64
	call	FAR PTR MESSAGEBOX
; Line 378
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1362_szLicense
	push	ds
	push	OFFSET DGROUP:$SG1491
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 381
$I1488:
	mov	ax,WORD PTR [bp-36]	;hWnd
; Line 382
$EX1478:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	6

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
	je	$I1496
; Line 396
	push	WORD PTR _lHighScore+2
	push	WORD PTR _lHighScore
	push	ds
	push	OFFSET DGROUP:$SG1497
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 397
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1379_szHi
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 400
$I1496:
	push	WORD PTR [bp+6]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC1453
	jmp	$EX1493
$JCC1453:
; Line 401
	push	WORD PTR [bp+6]	;hWnd
	call	FAR PTR ISZOOMED
	or	ax,ax
	je	$I1499
; Line 403
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1364_szMax
	push	ds
	push	OFFSET DGROUP:$SG1500
	jmp	$L20016
	nop	
; Line 406
$I1499:
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1364_szMax
	push	0
	push	0
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 408
	push	WORD PTR [bp+6]	;hWnd
	lea	ax,WORD PTR [bp-42]	;rect
	push	ss
	push	ax
	call	FAR PTR GETWINDOWRECT
; Line 409
	push	WORD PTR [bp-42]	;rect
	push	ds
	push	OFFSET DGROUP:$SG1502
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 410
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1365_szX
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 411
	push	WORD PTR [bp-40]
	push	ds
	push	OFFSET DGROUP:$SG1503
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 412
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1366_szY
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 413
	mov	ax,WORD PTR [bp-38]
	sub	ax,WORD PTR [bp-42]	;rect
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1504
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 414
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1367_szW
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 415
	mov	ax,WORD PTR [bp-36]
	sub	ax,WORD PTR [bp-40]
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1505
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 416
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1368_szH
	lea	ax,WORD PTR [bp-34]	;szBuff
	push	ss
	push	ax
$L20016:
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR WRITEPRIVATEPROFILESTRING
; Line 417
$EX1493:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	2

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
	push	ds
	push	OFFSET _szAppName
	push	ds
	push	OFFSET DGROUP:$S1363_szDrawDelay
	push	50
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _nDrawDelay,ax
; Line 426
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1372_szShield
	push	9
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkShld,ax
; Line 427
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1373_szClockwise
	push	37
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkClkw,ax
; Line 428
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1374_szCtrClockwise
	push	39
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkCtrClkw,ax
; Line 429
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1375_szThrust
	push	40
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkThrst,ax
; Line 430
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1376_szRevThrust
	push	38
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkRvThrst,ax
; Line 431
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1377_szFire
	push	32
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
	call	FAR PTR GETPRIVATEPROFILEINT
	mov	WORD PTR _vkFire,ax
; Line 432
	push	ds
	push	OFFSET DGROUP:$S1371_szKeys
	push	ds
	push	OFFSET DGROUP:$S1378_szBomb
	push	83
	push	ds
	push	OFFSET DGROUP:$S1361_szIni
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
	push	ds
	push	OFFSET DGROUP:$SG1510
	push	ds
	push	OFFSET DGROUP:$SG1509
	push	64
	call	FAR PTR MESSAGEBOX
; Line 442
	push	WORD PTR [bp+6]	;hWnd
	push	ds
	push	OFFSET DGROUP:$SG1512
	push	ds
	push	OFFSET DGROUP:$SG1511
	push	64
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
	je	$SC1532
	sub	ax,256
	je	$SC1522
	dec	ax
	je	$SC1526
; Line 483
$L20017:
	sub	ax,ax
	jmp	SHORT $EX1517
	nop	
$SC1522:
; Line 455
	mov	ax,WORD PTR _lHighScore+2
	or	ax,WORD PTR _lHighScore
	je	$SB1519
; Line 458
	push	WORD PTR _lHighScore+2
	push	WORD PTR _lHighScore
	push	ds
	push	OFFSET DGROUP:$SG1525
	lea	ax,WORD PTR [bp-42]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 459
	push	WORD PTR [bp+14]	;hDlg
	push	502
	lea	ax,WORD PTR [bp-42]	;szBuff
	push	ss
	push	ax
	call	FAR PTR SETDLGITEMTEXT
; Line 461
	jmp	SHORT $SB1519
; Line 463
$SC1526:
; Line 464
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 475
	dec	ax
	je	$SC1532
	sub	ax,500
	jne	$L20017
; Line 467
	push	WORD PTR [bp+14]	;hDlg
	push	cs
	call	NEAR PTR HYPEROIDHELP
; Line 469
$SC1532:
; Line 470
	push	WORD PTR [bp+14]	;hDlg
	push	0
	call	FAR PTR ENDDIALOG
; Line 484
$SB1519:
; Line 485
	mov	ax,1
; Line 486
$EX1517:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10
	nop	

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
	push	SEG HYPEROIDABOUTDLG
	push	OFFSET HYPEROIDABOUTDLG
	push	WORD PTR _hAppInst
	call	FAR PTR MAKEPROCINSTANCE
	mov	WORD PTR [bp-6],ax	;lpprocAbout
	mov	WORD PTR [bp-4],dx
; Line 495
	push	WORD PTR _hAppInst
	push	0
	push	500
	push	WORD PTR [bp+6]	;hWnd
	push	dx
	push	ax
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

ABOUTHYPEROID	ENDP
ROIDSUPP_TEXT	ENDS
END
