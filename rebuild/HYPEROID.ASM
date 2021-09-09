;	Static Name Aliases
;
;	$S1346_dwSeed	EQU	dwSeed
;	$S1347_nScoreLen	EQU	nScoreLen
;	$S1348_szScore	EQU	szScore
;	$S1349_rectScoreClip	EQU	rectScoreClip
;	$S1350_rectShotClip	EQU	rectShotClip
;	$S1351_Player	EQU	Player
;	$S1352_Spinner	EQU	Spinner
;	$S1353_Swarmer	EQU	Swarmer
;	$S1354_Hunter	EQU	Hunter
;	$S1355_Bonus	EQU	Bonus
;	$S1503_nNextBonus	EQU	nNextBonus
;	$S1574_nNextHunter	EQU	nNextHunter
;	$S1612_nNextSwarmer	EQU	nNextSwarmer
;	$S1644_nNextSpinner	EQU	nNextSpinner
;	$S1779_nBombing	EQU	nBombing
;	$S1780_nShotDelay	EQU	nShotDelay
	TITLE   HYPEROID.C
	.286p
	.287
INCLUDELIB	MLIBCE
HYPEROID_TEXT	SEGMENT  WORD PUBLIC 'CODE'
HYPEROID_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME DS: DGROUP, SS: DGROUP
EXTRN	__acrtused:ABS
EXTRN	SPINLETTERS:FAR
EXTRN	SETTIMER:FAR
EXTRN	CREATEHYPEROIDPALETTE:FAR
EXTRN	KILLTIMER:FAR
EXTRN	CREATEHYPEROIDCLASS:FAR
EXTRN	GETSYSTEMMETRICS:FAR
EXTRN	GETOBJECT:FAR
EXTRN	LOADBITMAP:FAR
EXTRN	DRAWICON:FAR
EXTRN	GETMESSAGE:FAR
EXTRN	CREATEHYPEROIDWINDOW:FAR
EXTRN	DELETEOBJECT:FAR
EXTRN	GETWINDOWDC:FAR
EXTRN	ISICONIC:FAR
EXTRN	TRANSLATEMESSAGE:FAR
EXTRN	GETDC:FAR
EXTRN	SELECTOBJECT:FAR
EXTRN	DISPATCHMESSAGE:FAR
EXTRN	SAVEHYPEROIDWINDOWPOS:FAR
EXTRN	RELEASEDC:FAR
EXTRN	GETHYPEROIDINI:FAR
EXTRN	ISZOOMED:FAR
EXTRN	LOADICON:FAR
EXTRN	CREATECOMPATIBLEDC:FAR
EXTRN	DELETEDC:FAR
EXTRN	_sin:FAR
EXTRN	MOVETO:FAR
EXTRN	GETSYSCOLOR:FAR
EXTRN	LINETO:FAR
EXTRN	SELECTPALETTE:FAR
EXTRN	ABOUTHYPEROID:FAR
EXTRN	REALIZEPALETTE:FAR
EXTRN	MULDIV:FAR
EXTRN	POLYLINE:FAR
EXTRN	FILLRECT:FAR
EXTRN	SETMAPMODE:FAR
EXTRN	__aFchkstk:FAR
EXTRN	__aFulmul:FAR
EXTRN	_wsprintf:FAR
EXTRN	__aFlmul:FAR
EXTRN	PATBLT:FAR
EXTRN	SETWINDOWEXT:FAR
EXTRN	__aFldiv:FAR
EXTRN	BITBLT:FAR
EXTRN	SETVIEWPORTORG:FAR
EXTRN	BEGINPAINT:FAR
EXTRN	DEFWINDOWPROC:FAR
EXTRN	ENDPAINT:FAR
EXTRN	SETVIEWPORTEXT:FAR
EXTRN	POSTQUITMESSAGE:FAR
EXTRN	SETPIXEL:FAR
EXTRN	GETCURRENTTIME:FAR
EXTRN	INVALIDATERECT:FAR
EXTRN	INTERSECTCLIPRECT:FAR
EXTRN	CREATEPEN:FAR
EXTRN	CREATESOLIDBRUSH:FAR
EXTRN	SETBRUSHORG:FAR
EXTRN	SHOWWINDOW:FAR
EXTRN	_strlen:FAR
EXTRN	GETINSTANCEDATA:FAR
EXTRN	SETWINDOWTEXT:FAR
EXTRN	GETASYNCKEYSTATE:FAR
EXTRN	PRINTLETTERS:FAR
EXTRN	GETCLIENTRECT:FAR
EXTRN	__aFftol:FAR
EXTRN	GETWINDOWRECT:FAR
EXTRN	_cos:FAR
_BSS      SEGMENT
COMM NEAR	_Obj:	 88:	 100
COMM NEAR	_hBitmap:	 2:	 17
_BSS      ENDS
EXTRN	_LetterPart:BYTE
EXTRN	_szNumberDesc:BYTE
EXTRN	_szLetterDesc:BYTE
_BSS      SEGMENT
COMM NEAR	_szAppName:	 1:	 32
COMM NEAR	_hAppInst:	BYTE:	 2
COMM NEAR	_hAppWnd:	BYTE:	 2
COMM NEAR	_hAppPalette:	BYTE:	 2
COMM NEAR	_nDrawDelay:	BYTE:	 2
COMM NEAR	_nLevel:	BYTE:	 2
COMM NEAR	_nSafe:	BYTE:	 2
COMM NEAR	_nShield:	BYTE:	 2
COMM NEAR	_nBomb:	BYTE:	 2
_BSS      ENDS
EXTRN	__ctype:BYTE
_BSS      SEGMENT
COMM NEAR	_nBadGuys:	BYTE:	 2
COMM NEAR	_lScore:	BYTE:	 4
COMM NEAR	PLOCALHEAP:	BYTE:	 2
COMM NEAR	_lLastLife:	BYTE:	 4
COMM NEAR	_lHighScore:	BYTE:	 4
COMM NEAR	_bRestart:	BYTE:	 2
COMM NEAR	_bPaused:	BYTE:	 2
COMM NEAR	_bBW:	BYTE:	 2
COMM NEAR	_vkShld:	BYTE:	 2
COMM NEAR	_vkClkw:	BYTE:	 2
COMM NEAR	_vkCtrClkw:	BYTE:	 2
COMM NEAR	_vkThrst:	BYTE:	 2
COMM NEAR	_vkRvThrst:	BYTE:	 2
COMM NEAR	_vkFire:	BYTE:	 2
COMM NEAR	_vkBomb:	BYTE:	 2
COMM NEAR	_npPlayer:	BYTE:	 2
COMM NEAR	_FreeList:	BYTE:	 4
COMM NEAR	_RoidList:	BYTE:	 4
COMM NEAR	_ShotList:	BYTE:	 4
COMM NEAR	_FlameList:	BYTE:	 4
COMM NEAR	_SpinnerList:	BYTE:	 4
COMM NEAR	_HunterList:	BYTE:	 4
COMM NEAR	_HunterShotList:	BYTE:	 4
COMM NEAR	_SwarmerList:	BYTE:	 4
COMM NEAR	_LetterList:	BYTE:	 4
COMM NEAR	_BonusList:	BYTE:	 4
COMM NEAR	_nCos:	 2:	 256
COMM NEAR	_nSin:	 2:	 256
COMM NEAR	_hPen:	 2:	 16
EXTRN	__fltused:NEAR
_BSS      ENDS
_DATA      SEGMENT
	ORG	$+116
$SG1413	DB	'GAME OVER',  00H
$SG1415	DB	'GET READY',  00H
$SG1417	DB	'LEVEL %u',  00H
$SG1424	DB	'EXTRA LIFE',  00H
$SG1471	DB	'l',  00H
$SG1521	DB	'%ld',  00H
$SG1523	DB	'EXTRA SHIELD',  00H
$SG1525	DB	'EXTRA BOMB',  00H
	ORG	$+12
$SG1839	DB	'%2.2u',  00H
$SG1843	DB	'%7.7lu',  00H
$SG1896	DB	'Program Manager Help - PROGMAN.HLP',  00H
	ORG	$-246
$S1351_Player	DW	00H
	DW	00H
	DW	0a0H
	DW	096H
	DW	00H
	DW	0faH
	DW	060H
	DW	096H
	DW	00H
	DW	00H
$S1352_Spinner	DW	0a0H
	DW	096H
	DW	0e0H
	DW	064H
	DW	060H
	DW	064H
	DW	020H
	DW	096H
	DW	0a0H
	DW	096H
$S1353_Swarmer	DW	00H
	DW	064H
	DW	040H
	DW	064H
	DW	080H
	DW	064H
	DW	0c0H
	DW	064H
	DW	00H
	DW	064H
$S1354_Hunter	DW	0a0H
	DW	096H
	DW	00H
	DW	0faH
	DW	0c0H
	DW	01eH
	DW	040H
	DW	01eH
	DW	00H
	DW	0faH
	DW	060H
	DW	096H
	DW	080H
	DW	096H
	DW	0a0H
	DW	096H
$S1355_Bonus	DW	00H
	DW	096H
	DW	066H
	DW	096H
	DW	0cdH
	DW	096H
	DW	033H
	DW	096H
	DW	09aH
	DW	096H
	DW	00H
	DW	096H
	ORG	$+70
$S1503_nNextBonus	DW	03e8H
$S1574_nNextHunter	DW	0c8H
$S1612_nNextSwarmer	DW	03e8H
$S1644_nNextSpinner	DW	03e8H
$S1779_nBombing	DW	00H
$S1780_nShotDelay	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+50
$S1346_dwSeed	DW 02H DUP (?)
	ORG	$-6
$S1347_nScoreLen	DW 01H DUP (?)
	ORG	$-50
$S1348_szScore	DW 014H DUP (?)
	ORG	$+14
$S1349_rectScoreClip	DW 04H DUP (?)
	ORG	$-22
$S1350_rectShotClip	DW 04H DUP (?)
_BSS      ENDS
HYPEROID_TEXT      SEGMENT
	ASSUME	CS: HYPEROID_TEXT
; Line 1
; Line 17
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 19
; Line 32
; Line 106
	PUBLIC	ARAND
ARAND	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
;	x = 4
; Line 108
	mov	ax,WORD PTR [bp+4]	;x
	cwd	
	push	dx
	push	ax
	push	3
	push	17405
	push	WORD PTR $S1346_dwSeed+2
	push	WORD PTR $S1346_dwSeed
	call	FAR PTR __aFulmul
	add	ax,-24893
	adc	dx,38
	mov	WORD PTR $S1346_dwSeed,ax
	mov	WORD PTR $S1346_dwSeed+2,dx
	and	dh,127
	push	0
	push	dx
	call	FAR PTR __aFulmul
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	sub	dh,dh
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
; Line 109
	mov	sp,bp
	pop	bp
	ret	2

ARAND	ENDP
; Line 116
	PUBLIC	ADDHEAD
ADDHEAD	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	npList = 6
;	npNode = 4
; Line 117
	mov	bx,WORD PTR [bp+6]	;npList
	cmp	WORD PTR [bx],0
	je	$I1361
; Line 118
; Line 119
	mov	ax,WORD PTR [bx]
	mov	si,WORD PTR [bp+4]	;npNode
	mov	WORD PTR [si],ax
; Line 120
	mov	WORD PTR [si+2],0
; Line 121
	mov	di,WORD PTR [bx]
	mov	WORD PTR [di+2],si
	mov	si,WORD PTR [bx]
	mov	ax,WORD PTR [si+2]
	mov	WORD PTR [bx],ax
; Line 122
; Line 123
	jmp	SHORT $I1362
$I1361:
; Line 124
; Line 125
	mov	ax,WORD PTR [bp+4]	;npNode
	mov	WORD PTR [bx+2],ax
	mov	WORD PTR [bx],ax
; Line 126
	mov	bx,ax
	sub	cx,cx
	mov	WORD PTR [bx+2],cx
	mov	WORD PTR [bx],cx
; Line 127
$I1362:
; Line 128
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4
	nop	

ADDHEAD	ENDP
; Line 135
	PUBLIC	REMHEAD
REMHEAD	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
	push	si
;	npList = 4
; Line 136
	mov	bx,WORD PTR [bp+4]	;npList
	cmp	WORD PTR [bx],0
	je	$I1365
; Line 137
;	npNode = -2
; Line 138
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npNode
; Line 139
	cmp	WORD PTR [bx+2],ax
	je	$I1367
; Line 140
; Line 141
	mov	si,ax
	mov	ax,WORD PTR [si]
	mov	WORD PTR [bx],ax
; Line 142
	mov	bx,WORD PTR [bp-2]	;npNode
	mov	bx,WORD PTR [bx]
	mov	WORD PTR [bx+2],0
; Line 143
; Line 144
	jmp	SHORT $I1368
$I1367:
	sub	ax,ax
	mov	WORD PTR [bx+2],ax
	mov	WORD PTR [bx],ax
$I1368:
; Line 145
	mov	ax,WORD PTR [bp-2]	;npNode
	jmp	SHORT $EX1364
$I1365:
	sub	ax,ax
; Line 148
$EX1364:
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

REMHEAD	ENDP
; Line 155
	PUBLIC	REMOVE
REMOVE	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
;	npList = 6
;	npNode = 4
; Line 156
	mov	bx,WORD PTR [bp+4]	;npNode
	cmp	WORD PTR [bx+2],0
	je	$I1373
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bx+2]
	jmp	SHORT $L20031
$I1373:
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bp+6]	;npList
$L20031:
	mov	WORD PTR [bx],ax
; Line 158
	mov	bx,WORD PTR [bp+4]	;npNode
	cmp	WORD PTR [bx],0
	je	$I1375
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bx]
	jmp	SHORT $L20032
$I1375:
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp+6]	;npList
$L20032:
	mov	WORD PTR [bx+2],ax
; Line 160
	mov	sp,bp
	pop	bp
	ret	4
	nop	

REMOVE	ENDP
; Line 167
	PUBLIC	DRAWOBJECT
DRAWOBJECT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	nCnt = -2
;	nDir = -40
;	x = -36
;	y = -38
;	Pts = -34
;	hDC = 6
;	npObj = 4
; Line 169
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+16]
	add	WORD PTR [bx+14],ax
	mov	ax,WORD PTR [bx+14]
	mov	WORD PTR [bp-40],ax	;nDir
; Line 170
	mov	ax,WORD PTR [bx+8]
	add	WORD PTR [bx+4],ax
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-36],ax	;x
; Line 171
	mov	ax,WORD PTR [bx+10]
	add	WORD PTR [bx+6],ax
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-38],ax	;y
; Line 174
	cmp	WORD PTR [bp-36],-8492	;x
	jge	$I1385
	mov	ax,8492
	mov	WORD PTR [bp-36],ax	;x
	jmp	SHORT $L20035
	nop	
$I1385:
	cmp	WORD PTR [bp-36],8492	;x
	jle	$I1387
	mov	ax,-8492
	mov	WORD PTR [bp-36],ax	;x
	mov	bx,WORD PTR [bp+4]	;npObj
$L20035:
	mov	WORD PTR [bx+4],ax
; Line 176
$I1387:
	cmp	WORD PTR [bp-38],-8492	;y
	jge	$I1388
	mov	ax,8492
	jmp	SHORT $L20036
	nop	
$I1388:
	cmp	WORD PTR [bp-38],8492	;y
	jle	$I1390
	mov	ax,-8492
$L20036:
	mov	WORD PTR [bp-38],ax	;y
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+6],ax
; Line 179
$I1390:
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	dec	ax
	mov	WORD PTR [bp-2],ax	;nCnt
	jmp	SHORT $F1391
	nop	
$FC1392:
; Line 180
;	wDeg = -42
;	nLen = -44
; Line 181
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,bx
	add	bx,WORD PTR [bp+4]	;npObj
	mov	cl,BYTE PTR [bx+24]
	add	cl,BYTE PTR [bp-40]	;nDir
	sub	ch,ch
	mov	WORD PTR [bp-42],cx	;wDeg
; Line 182
	mov	dx,WORD PTR [bx+26]
	mov	WORD PTR [bp-44],dx	;nLen
; Line 183
	push	0
	push	16384
	mov	bx,ax
	mov	ax,dx
	cwd	
	push	dx
	push	ax
	mov	si,cx
	shl	si,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[si]
	mov	di,dx
	cwd	
	push	dx
	push	ax
	mov	WORD PTR [bp-48],cx
	mov	WORD PTR [bp-46],di
	mov	di,bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	ax,WORD PTR [bp-36]	;x
	mov	WORD PTR [bp-34][di],ax
; Line 184
	push	0
	push	16384
	push	WORD PTR [bp-46]
	push	WORD PTR [bp-48]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	ax,WORD PTR [bp-38]	;y
	mov	WORD PTR [bp-32][di],ax
; Line 185
	dec	WORD PTR [bp-2]	;nCnt
$F1391:
	cmp	WORD PTR [bp-2],0	;nCnt
	jge	$FC1392
; Line 187
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	BYTE PTR [bx+23],1
	ja	$JCC573
	jmp	$I1396
$JCC573:
; Line 188
; Line 189
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR _hPen
	call	FAR PTR SELECTOBJECT
; Line 190
	push	WORD PTR [bp+6]	;hDC
	mov	ax,WORD PTR [bp+4]	;npObj
	add	ax,56
	push	ds
	push	ax
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	push	ax
	call	FAR PTR POLYLINE
; Line 191
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	WORD PTR [bx+18],0
	jg	$JCC622
	jmp	$I1402
$JCC622:
; Line 192
; Line 193
	push	WORD PTR [bp+6]	;hDC
	mov	bl,BYTE PTR [bx+22]
	sub	bh,bh
	shl	bx,1
	push	WORD PTR _hPen[bx]
	call	FAR PTR SELECTOBJECT
; Line 194
	push	WORD PTR [bp+6]	;hDC
	lea	ax,WORD PTR [bp-34]	;Pts
	push	ss
	push	ax
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	push	ax
	call	FAR PTR POLYLINE
; Line 195
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	dec	ax
	mov	WORD PTR [bp-2],ax	;nCnt
	jmp	SHORT $F1398
$FC1399:
; Line 196
	mov	si,WORD PTR [bp-2]	;nCnt
	shl	si,2
	mov	ax,WORD PTR [bp-34][si]
	mov	dx,WORD PTR [bp-32][si]
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+56][si],ax
	mov	WORD PTR [bx+58][si],dx
	dec	WORD PTR [bp-2]	;nCnt
$F1398:
	cmp	WORD PTR [bp-2],0	;nCnt
	jge	$FC1399
; Line 197
; Line 198
; Line 199
	jmp	SHORT $I1402
$I1396:
; Line 200
; Line 201
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bx+56]
	push	WORD PTR [bx+58]
	push	256
	push	0
	call	FAR PTR SETPIXEL
; Line 202
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	WORD PTR [bx+18],0
	jle	$I1402
; Line 203
; Line 204
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bp-34]	;Pts
	push	WORD PTR [bp-32]
	mov	al,BYTE PTR [bx+22]
	sub	ah,ah
	push	256
	push	ax
	call	FAR PTR SETPIXEL
; Line 205
	mov	ax,WORD PTR [bp-34]	;Pts
	mov	dx,WORD PTR [bp-32]
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+56],ax
	mov	WORD PTR [bx+58],dx
; Line 206
; Line 207
$I1402:
; Line 208
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4

DRAWOBJECT	ENDP
; Line 215
	PUBLIC	SETRESTART
SETRESTART	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,36
	call	FAR PTR __aFchkstk
;	Pt = -36
;	szBuff = -32
;	Restart = 4
; Line 219
	cmp	WORD PTR _bRestart,0
	je	$JCC804
	jmp	$SB1409
$JCC804:
; Line 220
	push	WORD PTR _hAppWnd
	push	2
	push	5000
	push	0
	push	0
	call	FAR PTR SETTIMER
; Line 221
	mov	WORD PTR _bRestart,1
; Line 223
	sub	ax,ax
	mov	WORD PTR [bp-34],ax
	mov	WORD PTR [bp-36],ax	;Pt
; Line 224
	mov	ax,WORD PTR [bp+4]	;Restart
	jmp	SHORT $S1408
; Line 225
; Line 226
$SC1412:
; Line 227
	push	OFFSET DGROUP:$SG1413
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	5
	push	400
	call	FAR PTR SPINLETTERS
; Line 228
	mov	sp,bp
	pop	bp
	ret	2
	nop	
; Line 229
$SC1414:
; Line 230
	push	OFFSET DGROUP:$SG1415
$L20037:
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	9
	push	300
	call	FAR PTR PRINTLETTERS
; Line 231
	mov	sp,bp
	pop	bp
	ret	2
	nop	
; Line 232
$SC1416:
; Line 233
	mov	ax,WORD PTR _nLevel
	inc	ax
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1417
	lea	ax,WORD PTR [bp-32]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 234
	lea	ax,WORD PTR [bp-32]	;szBuff
	push	ax
	jmp	SHORT $L20037
$S1408:
	or	ax,ax
	je	$SC1412
	dec	ax
	je	$SC1414
	dec	ax
	je	$SC1416
$SB1409:
; Line 237
	mov	sp,bp
	pop	bp
	ret	2

SETRESTART	ENDP
; Line 244
	PUBLIC	PRINTPLAYERMESSAGE
PRINTPLAYERMESSAGE	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	FAR PTR __aFchkstk
;	Pos = -4
;	Vel = -8
;	npszText = 4
; Line 247
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],dx
; Line 248
	sub	WORD PTR [bp-2],400
; Line 249
	mov	WORD PTR [bp-8],0	;Vel
; Line 250
	mov	WORD PTR [bp-6],-50
; Line 251
	push	WORD PTR [bp+4]	;npszText
	push	WORD PTR [bp-2]
	push	ax
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;Vel
	push	7
	push	150
	call	FAR PTR PRINTLETTERS
; Line 252
	mov	sp,bp
	pop	bp
	ret	2

PRINTPLAYERMESSAGE	ENDP
; Line 259
	PUBLIC	ADDEXTRALIFE
ADDEXTRALIFE	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
; Line 260
	push	OFFSET DGROUP:$SG1424
	call	PRINTPLAYERMESSAGE
; Line 261
	mov	bx,WORD PTR _npPlayer
	inc	WORD PTR [bx+18]
; Line 262
	mov	bx,WORD PTR _npPlayer
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 263
	mov	bx,WORD PTR _npPlayer
	cmp	BYTE PTR [bx+22],3
	jbe	$I1425
	mov	BYTE PTR [bx+22],3
; Line 264
$I1425:
	mov	sp,bp
	pop	bp
	ret	
	nop	

ADDEXTRALIFE	ENDP
; Line 271
	PUBLIC	HIT
HIT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
	push	si
;	nCnt = -2
;	hDC = 6
;	npObj = 4
; Line 274
	mov	WORD PTR [bp-2],0	;nCnt
$FC1431:
; Line 275
;	npFlame = -4
; Line 277
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npFlame
	or	ax,ax
	jne	$JCC1102
	jmp	$EX1428
$JCC1102:
; Line 278
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+4]
	mov	si,WORD PTR [bp-4]	;npFlame
	mov	WORD PTR [si+4],ax
; Line 279
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 280
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 281
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [si+10],ax
; Line 282
	mov	ah,BYTE PTR [bp-2]	;nCnt
	sub	al,al
	mov	cx,6
	cwd	
	idiv	cx
	add	ax,WORD PTR [bx+14]
	mov	WORD PTR [si+14],ax
; Line 283
	mov	WORD PTR [si+16],0
; Line 284
	push	8
	call	ARAND
	add	ax,10
	mov	WORD PTR [si+18],ax
; Line 285
	mov	BYTE PTR [si+22],11
; Line 286
	mov	BYTE PTR [si+23],1
; Line 287
	sub	ax,ax
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+24],ax
; Line 288
	push	ax
	push	16384
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,50
	sub	cx,WORD PTR [si+18]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,50
	sub	cx,WORD PTR [si+18]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+10],ax
; Line 289
	push	OFFSET DGROUP:_FlameList
	push	si
	call	ADDHEAD
; Line 290
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],6	;nCnt
	jge	$JCC1267
	jmp	$FC1431
$JCC1267:
; Line 291
$EX1428:
	pop	si
	mov	sp,bp
	pop	bp
	ret	4
	nop	

HIT	ENDP
; Line 298
	PUBLIC	EXPLODE
EXPLODE	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	nCnt = -2
;	nSize = -4
;	hDC = 6
;	npObj = 4
; Line 299
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	mov	WORD PTR [bp-4],ax	;nSize
; Line 301
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	DRAWOBJECT
; Line 302
	mov	WORD PTR [bp-2],0	;nCnt
	jmp	SHORT $F1440
$I1446:
	mov	si,WORD PTR [bp-2]	;nCnt
	shl	si,2
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+28][si]
	mov	dx,WORD PTR [bx+30][si]
	mov	bx,WORD PTR [bp-6]	;npFlame
	mov	WORD PTR [bx+28],ax
	mov	WORD PTR [bx+30],dx
$I1447:
; Line 319
	push	0
	push	16384
	mov	bx,WORD PTR [bp-6]	;npFlame
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,60
	mov	bx,WORD PTR [bp-6]	;npFlame
	sub	cx,WORD PTR [bx+18]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-6]	;npFlame
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,60
	mov	bx,WORD PTR [bp-6]	;npFlame
	sub	cx,WORD PTR [bx+18]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-6]	;npFlame
	add	WORD PTR [bx+10],ax
; Line 320
	push	OFFSET DGROUP:_FlameList
	push	bx
	call	ADDHEAD
; Line 321
$FC1441:
	inc	WORD PTR [bp-2]	;nCnt
$F1440:
	mov	ax,WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-4],ax	;nSize
	jg	$JCC1441
	jmp	$FB1442
$JCC1441:
; Line 303
;	npFlame = -6
; Line 305
	push	2
	call	ARAND
	or	ax,ax
	jne	$FC1441
; Line 306
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-6],ax	;npFlame
	or	ax,ax
	jne	$JCC1466
	jmp	$EX1437
$JCC1466:
; Line 307
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+4]
	mov	si,WORD PTR [bp-6]	;npFlame
	mov	WORD PTR [si+4],ax
; Line 308
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 309
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 310
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [si+10],ax
; Line 311
	push	32
	call	ARAND
	mov	cx,ax
	mov	ah,BYTE PTR [bp-2]	;nCnt
	sub	al,al
	cwd	
	idiv	WORD PTR [bp-4]	;nSize
	add	cx,ax
	mov	bx,WORD PTR [bp+4]	;npObj
	add	cx,WORD PTR [bx+14]
	mov	WORD PTR [si+14],cx
; Line 312
	push	31
	call	ARAND
	sub	ax,15
	mov	WORD PTR [si+16],ax
; Line 313
	push	16
	call	ARAND
	add	ax,25
	mov	WORD PTR [si+18],ax
; Line 314
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+22]
	mov	BYTE PTR [si+22],al
; Line 315
	mov	BYTE PTR [si+23],2
; Line 316
	mov	di,WORD PTR [bp-2]	;nCnt
	shl	di,2
	mov	ax,WORD PTR [bx+24][di]
	mov	dx,WORD PTR [bx+26][di]
	mov	WORD PTR [si+24],ax
	mov	WORD PTR [si+26],dx
; Line 317
	mov	ax,WORD PTR [bp-4]	;nSize
	sub	ax,WORD PTR [bp-2]	;nCnt
	dec	ax
	je	$JCC1588
	jmp	$I1446
$JCC1588:
	mov	ax,WORD PTR [bx+24]
	mov	dx,WORD PTR [bx+26]
	mov	WORD PTR [si+28],ax
	mov	WORD PTR [si+30],dx
; Line 318
	jmp	$I1447
$FB1442:
; Line 322
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bp+4]	;npObj
	call	HIT
; Line 323
$EX1437:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4
	nop	

EXPLODE	ENDP
; Line 330
	PUBLIC	HITPLAYER
HITPLAYER	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	FAR PTR __aFchkstk
	push	si
;	Vel = -6
;	nMass = -2
;	nSpin = -8
;	hDC = 6
;	npObj = 4
; Line 334
	cmp	WORD PTR _nSafe,0
	jne	$I1455
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jg	$I1454
$I1455:
	sub	ax,ax
	jmp	$EX1450
; Line 337
$I1454:
	mov	ax,WORD PTR [bx+12]
	mov	si,WORD PTR [bp+4]	;npObj
	mov	cx,ax
	add	ax,WORD PTR [si+12]
	mov	WORD PTR [bp-2],ax	;nMass
; Line 339
	mov	dx,WORD PTR [bx+16]
	add	dx,WORD PTR [si+16]
	mov	WORD PTR [bp-8],dx	;nSpin
; Line 340
	push	dx
	push	cx
	push	ax
	call	FAR PTR MULDIV
	sub	WORD PTR [si+16],ax
; Line 341
	push	WORD PTR [bp-8]	;nSpin
	push	WORD PTR [si+12]
	push	WORD PTR [bp-2]	;nMass
	call	FAR PTR MULDIV
	mov	bx,WORD PTR _npPlayer
	sub	WORD PTR [bx+16],ax
; Line 343
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+8]
	sub	ax,WORD PTR [si+8]
	mov	WORD PTR [bp-6],ax	;Vel
; Line 344
	mov	cx,WORD PTR [bx+10]
	sub	cx,WORD PTR [si+10]
	mov	WORD PTR [bp-4],cx
; Line 345
	push	ax
	push	WORD PTR [bx+12]
	push	WORD PTR [bp-2]	;nMass
	call	FAR PTR MULDIV
	add	WORD PTR [si+8],ax
; Line 346
	push	WORD PTR [bp-4]
	mov	bx,WORD PTR _npPlayer
	push	WORD PTR [bx+12]
	push	WORD PTR [bp-2]	;nMass
	call	FAR PTR MULDIV
	add	WORD PTR [si+10],ax
; Line 347
	push	WORD PTR [bp-6]	;Vel
	push	WORD PTR [si+12]
	push	WORD PTR [bp-2]	;nMass
	call	FAR PTR MULDIV
	mov	bx,WORD PTR _npPlayer
	sub	WORD PTR [bx+8],ax
; Line 348
	push	WORD PTR [bp-4]
	push	WORD PTR [si+12]
	push	WORD PTR [bp-2]	;nMass
	call	FAR PTR MULDIV
	mov	bx,WORD PTR _npPlayer
	sub	WORD PTR [bx+10],ax
; Line 350
	mov	bx,WORD PTR _npPlayer
	dec	WORD PTR [bx+18]
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	je	$I1456
; Line 351
; Line 352
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 353
	mov	bx,WORD PTR _npPlayer
	cmp	BYTE PTR [bx+22],3
	jbe	$I1457
	mov	BYTE PTR [bx+22],3
; Line 354
$I1457:
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR _npPlayer
	call	HIT
; Line 355
	mov	ax,1
	jmp	SHORT $EX1450
; Line 356
	nop	
; Line 359
$I1456:
	mov	BYTE PTR [bx+22],3
; Line 360
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR _npPlayer
	call	EXPLODE
; Line 361
	push	0
	call	SETRESTART
	jmp	$I1455
; Line 363
$EX1450:
	pop	si
	mov	sp,bp
	pop	bp
	ret	4
	nop	

HITPLAYER	ENDP
; Line 370
	PUBLIC	CREATELETTER
CREATELETTER	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	mov	ax,10
	call	FAR PTR __aFchkstk
	push	si
;	npLtr = -4
;	nCnt = -6
;	npDesc = -8
;	cLetter = 8
;	nSize = 6
; Line 375
	cmp	BYTE PTR [bp+8],48	;cLetter
	jl	$I1464
	cmp	BYTE PTR [bp+8],57	;cLetter
	jg	$I1464
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szNumberDesc[bx-96]
$L20039:
	mov	WORD PTR [bp-8],ax	;npDesc
; Line 376
	jmp	SHORT $I1469
$I1464:
	cmp	BYTE PTR [bp+8],65	;cLetter
	jl	$I1466
	cmp	BYTE PTR [bp+8],90	;cLetter
	jg	$I1466
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szLetterDesc[bx-130]
	jmp	SHORT $L20039
$I1466:
	cmp	BYTE PTR [bp+8],97	;cLetter
	jl	$I1468
	cmp	BYTE PTR [bp+8],122	;cLetter
	jg	$I1468
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szLetterDesc[bx-194]
	jmp	SHORT $L20039
$I1468:
	cmp	BYTE PTR [bp+8],46	;cLetter
	je	$JCC2002
	jmp	$I1470
$JCC2002:
	mov	WORD PTR [bp-8],OFFSET DGROUP:$SG1471	;npDesc
; Line 379
$I1469:
; Line 381
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npLtr
	or	ax,ax
	je	$I1473
; Line 382
; Line 383
	mov	bx,ax
	mov	WORD PTR [bx+12],1
; Line 384
	mov	WORD PTR [bx+14],0
; Line 385
	mov	WORD PTR [bx+16],0
; Line 386
	mov	WORD PTR [bx+18],40
; Line 387
	mov	BYTE PTR [bx+22],3
; Line 388
	push	WORD PTR [bp-8]	;npDesc
	call	FAR PTR _strlen
	add	sp,2
	mov	WORD PTR [bp-6],ax	;nCnt
	mov	al,BYTE PTR [bp-6]	;nCnt
	mov	bx,WORD PTR [bp-4]	;npLtr
	mov	BYTE PTR [bx+23],al
; Line 389
$FC1475:
	mov	ax,WORD PTR [bp-6]	;nCnt
	dec	WORD PTR [bp-6]	;nCnt
	or	ax,ax
	je	$FB1476
; Line 390
; Line 391
	mov	bx,WORD PTR [bp-8]	;npDesc
	mov	si,WORD PTR [bp-6]	;nCnt
	mov	al,BYTE PTR [bx][si]
	cbw	
	mov	bx,ax
	shl	bx,2
	mov	ax,WORD PTR _LetterPart[bx-388]
	mov	dx,WORD PTR _LetterPart[bx-386]
	shl	si,2
	add	si,WORD PTR [bp-4]	;npLtr
	mov	WORD PTR [si+24],ax
	mov	WORD PTR [si+26],dx
; Line 392
	push	dx
	push	WORD PTR [bp+6]	;nSize
	push	256
	call	FAR PTR MULDIV
	mov	WORD PTR [si+26],ax
; Line 393
	jmp	SHORT $FC1475
	nop	
$I1470:
	sub	ax,ax
	jmp	SHORT $EX1460
$FB1476:
; Line 394
	push	OFFSET DGROUP:_LetterList
	push	WORD PTR [bp-4]	;npLtr
	call	ADDHEAD
; Line 395
; Line 396
$I1473:
	mov	ax,WORD PTR [bp-4]	;npLtr
; Line 397
$EX1460:
	pop	si
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	4
	nop	

CREATELETTER	ENDP
; Line 404
	PUBLIC	DRAWLETTERS
DRAWLETTERS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
;	npLtr = -2
;	npNext = -4
;	hDC = 4
; Line 407
	mov	ax,WORD PTR _LetterList
	jmp	SHORT $L20040
; Line 411
; Line 412
$SC1488:
; Line 413
	mov	bx,WORD PTR [bp-2]	;npLtr
	dec	BYTE PTR [bx+22]
; Line 414
$SB1485:
; Line 420
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npLtr
	call	DRAWOBJECT
; Line 421
	mov	ax,WORD PTR [bp-4]	;npNext
$L20040:
	mov	WORD PTR [bp-2],ax	;npLtr
	or	ax,ax
	je	$FB1483
; Line 408
; Line 409
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 410
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
	or	ax,ax
	je	$SC1489
	sub	ax,3
	je	$SC1488
	jmp	SHORT $SB1485
	nop	
; Line 415
$SC1489:
; Line 416
	push	OFFSET DGROUP:_LetterList
	push	WORD PTR [bp-2]	;npLtr
	call	REMOVE
; Line 417
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npLtr
	call	ADDHEAD
; Line 418
	jmp	SHORT $SB1485
$FB1483:
; Line 422
	mov	sp,bp
	pop	bp
	ret	2

DRAWLETTERS	ENDP
; Line 429
	PUBLIC	CREATEBONUS
CREATEBONUS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
	push	si
;	npBonus = -4
;	nCnt = -2
; Line 433
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npBonus
	or	ax,ax
	jne	$JCC2279
	jmp	$I1494
$JCC2279:
; Line 434
; Line 435
	push	16984
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+4],ax
; Line 436
	mov	WORD PTR [bx+6],-8492
; Line 437
	mov	WORD PTR [bx+10],0
	mov	WORD PTR [bx+8],0
; Line 438
	push	256
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+14],ax
; Line 439
	push	2
	call	ARAND
	cmp	ax,1
	sbb	ax,ax
	and	al,232
	add	ax,12
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+16],ax
; Line 440
	push	4
	call	ARAND
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+18],ax
; Line 441
	push	128
	call	ARAND
	add	ax,64
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+20],ax
; Line 442
	mov	WORD PTR [bx+12],1
; Line 443
	mov	al,BYTE PTR [bx+18]
	shl	al,1
	add	al,3
	mov	BYTE PTR [bx+22],al
; Line 444
	mov	BYTE PTR [bx+23],6
; Line 445
	mov	WORD PTR [bp-2],0	;nCnt
$FC1496:
; Line 446
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,WORD PTR $S1355_Bonus[bx]
	mov	dx,WORD PTR $S1355_Bonus[bx+2]
	mov	cx,bx
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	si,cx
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],6	;nCnt
	jl	$FC1496
; Line 447
	push	0
	push	16384
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npBonus
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npBonus
	add	WORD PTR [bx+10],ax
; Line 448
	push	OFFSET DGROUP:_BonusList
	push	bx
	call	ADDHEAD
; Line 449
; Line 450
$I1494:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

CREATEBONUS	ENDP
; Line 457
	PUBLIC	DRAWBONUSES
DRAWBONUSES	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	FAR PTR __aFchkstk
	push	si
;	npBonus = -2
;	npNext = -4
;	hDC = 4
; Line 461
	cmp	WORD PTR _nBadGuys,0
	je	$I1504
	dec	WORD PTR $S1503_nNextBonus
	jns	$I1504
; Line 462
; Line 463
	call	CREATEBONUS
; Line 464
	mov	WORD PTR $S1503_nNextBonus,1000
; Line 465
; Line 467
$I1504:
	mov	ax,WORD PTR _BonusList
	jmp	$L20042
; Line 480
; Line 481
$SC1517:
; Line 482
;	szBuff = -48
;	lBonus = -52
; Line 485
	mov	ax,1000
	imul	WORD PTR _nLevel
	mov	WORD PTR [bp-52],ax	;lBonus
	mov	WORD PTR [bp-50],dx
	or	dx,ax
	jne	$I1520
	mov	WORD PTR [bp-52],500	;lBonus
	mov	WORD PTR [bp-50],0
; Line 486
$I1520:
	mov	ax,WORD PTR [bp-52]	;lBonus
	mov	dx,WORD PTR [bp-50]
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 487
	push	dx
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1521
	lea	ax,WORD PTR [bp-48]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 488
	lea	ax,WORD PTR [bp-48]	;szBuff
	push	ax
$L20043:
	call	PRINTPLAYERMESSAGE
; Line 489
; Line 490
$SB1514:
; Line 505
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	WORD PTR [bx+18],0
; Line 506
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 507
	push	OFFSET DGROUP:_BonusList
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 508
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 509
; Line 510
$FB1531:
; Line 521
; Line 522
	mov	bx,WORD PTR [bp-2]	;npBonus
	cmp	WORD PTR [bx+18],0
	je	$I1535
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1535
; Line 523
; Line 524
	dec	WORD PTR [bx+18]
; Line 525
	push	128
	call	ARAND
	add	ax,64
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	WORD PTR [bx+20],ax
; Line 526
	mov	al,BYTE PTR [bx+18]
	shl	al,1
	add	al,3
	mov	BYTE PTR [bx+22],al
; Line 527
	cmp	WORD PTR [bx+18],0
	jne	$I1535
; Line 528
; Line 529
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 530
	push	OFFSET DGROUP:_BonusList
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 531
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 532
; Line 533
$I1535:
; Line 534
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npBonus
	sub	ax,WORD PTR [bx+4]
$L20045:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 535
	cmp	ax,-16
	jl	$FB1539
	cmp	ax,16
	jg	$JCC2771
	jmp	$FB1538
$JCC2771:
$FB1539:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20045
; Line 491
$SC1522:
; Line 492
	mov	WORD PTR _nSafe,15
; Line 493
	inc	WORD PTR _nShield
; Line 494
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],7
; Line 495
	push	OFFSET DGROUP:$SG1523
	jmp	$L20043
; Line 497
$SC1524:
; Line 498
	inc	WORD PTR _nBomb
; Line 499
	push	OFFSET DGROUP:$SG1525
	jmp	$L20043
; Line 501
$SC1526:
; Line 502
	call	ADDEXTRALIFE
; Line 503
	jmp	$SB1514
$I1511:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jle	$JCC2831
	jmp	$FB1531
$JCC2831:
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jg	$JCC2843
	jmp	$FB1531
$JCC2843:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jle	$JCC2855
	jmp	$FB1531
$JCC2855:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jg	$JCC2867
	jmp	$FB1531
$JCC2867:
; Line 511
; Line 512
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20044
	nop	
; Line 515
$I1532:
	mov	WORD PTR [bx+18],1
; Line 516
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	WORD PTR [bx+18],0
; Line 517
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 518
	push	OFFSET DGROUP:_BonusList
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 519
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 520
$FC1530:
	mov	bx,WORD PTR [bp-8]	;npShot
	mov	ax,WORD PTR [bx]
$L20044:
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$JCC2926
	jmp	$FB1531
$JCC2926:
; Line 513
; Line 514
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1530
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1530
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1530
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$I1532
	jmp	SHORT $FC1530
$FB1538:
; Line 536
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+8],ax
; Line 537
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	sub	ax,WORD PTR [bx+6]
$L20046:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 538
	cmp	ax,-16
	jl	$FB1543
	cmp	ax,16
	jle	$FB1542
$FB1543:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20046
	nop	
$FB1542:
; Line 539
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+10],ax
; Line 540
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	DRAWOBJECT
; Line 541
	mov	ax,WORD PTR [bp-4]	;npNext
$L20042:
	mov	WORD PTR [bp-2],ax	;npBonus
	or	ax,ax
	jne	$JCC3067
	jmp	$FB1507
$JCC3067:
; Line 468
;	npShot = -8
;	nDelta = -6
;	rect = -16
; Line 473
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 475
	mov	ax,WORD PTR [bx+4]
	sub	ax,150
	mov	WORD PTR [bp-16],ax	;rect
	mov	ax,WORD PTR [bx+4]
	add	ax,150
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bx+6]
	sub	ax,150
	mov	WORD PTR [bp-14],ax
	mov	ax,WORD PTR [bx+6]
	add	ax,150
	mov	WORD PTR [bp-10],ax
; Line 477
	mov	ax,WORD PTR [bp-16]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jge	$JCC3125
	jmp	$I1511
$JCC3125:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [si+4],ax
	jl	$JCC3136
	jmp	$I1511
$JCC3136:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [si+6],ax
	jge	$JCC3147
	jmp	$I1511
$JCC3147:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+6],ax
	jl	$JCC3158
	jmp	$I1511
$JCC3158:
; Line 478
; Line 479
	cmp	WORD PTR [si+18],0
	jg	$JCC3167
	jmp	$SB1514
$JCC3167:
	mov	ax,WORD PTR [bx+18]
	dec	ax
	jne	$JCC3176
	jmp	$SC1517
$JCC3176:
	dec	ax
	jne	$JCC3182
	jmp	$SC1522
$JCC3182:
	dec	ax
	jne	$JCC3188
	jmp	$SC1524
$JCC3188:
	dec	ax
	jne	$JCC3194
	jmp	$SC1526
$JCC3194:
	jmp	$SB1514
$FB1507:
; Line 542
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWBONUSES	ENDP
; Line 549
	PUBLIC	DRAWHUNTERSHOTS
DRAWHUNTERSHOTS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	FAR PTR __aFchkstk
	push	si
;	npShot = -2
;	npNext = -4
;	hDC = 4
; Line 552
	mov	ax,WORD PTR _HunterShotList
	jmp	SHORT $L20047
; Line 566
	nop	
; Line 567
$SC1557:
; Line 568
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],6
; Line 569
$SB1554:
; Line 575
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	DRAWOBJECT
; Line 576
	mov	ax,WORD PTR [bp-4]	;npNext
$L20047:
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC3252
	jmp	$FB1550
$JCC3252:
; Line 553
;	rect = -12
; Line 556
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 558
	mov	ax,WORD PTR [bx+4]
	sub	ax,200
	mov	WORD PTR [bp-12],ax	;rect
	mov	ax,WORD PTR [bx+4]
	add	ax,200
	mov	WORD PTR [bp-8],ax
	mov	ax,WORD PTR [bx+6]
	sub	ax,200
	mov	WORD PTR [bp-10],ax
	mov	ax,WORD PTR [bx+6]
	add	ax,200
	mov	WORD PTR [bp-6],ax
; Line 560
	mov	ax,WORD PTR [bp-12]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jl	$I1552
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [si+4],ax
	jge	$I1552
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+6],ax
	jl	$I1552
	mov	ax,WORD PTR [bp-6]
	cmp	WORD PTR [si+6],ax
	jge	$I1552
; Line 561
; Line 562
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	HITPLAYER
; Line 563
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+18],1
; Line 564
; Line 565
$I1552:
	mov	bx,WORD PTR [bp-2]	;npShot
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
	or	ax,ax
	je	$SC1558
	sub	ax,7
	jne	$JCC3367
	jmp	$SC1557
$JCC3367:
	jmp	$SB1554
	nop	
; Line 570
$SC1558:
; Line 571
	push	OFFSET DGROUP:_HunterShotList
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 572
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 573
	jmp	$SB1554
	nop	
$FB1550:
; Line 577
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWHUNTERSHOTS	ENDP
; Line 584
	PUBLIC	FIREHUNTERSHOT
FIREHUNTERSHOT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
	push	si
;	npShot = -2
;	npHunt = 4
; Line 587
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC3429
	jmp	$I1562
$JCC3429:
; Line 588
; Line 589
	mov	bx,ax
	mov	si,WORD PTR [bp+4]	;npHunt
	mov	cx,WORD PTR [si+4]
	mov	WORD PTR [bx+4],cx
; Line 590
	mov	cx,WORD PTR [si+6]
	mov	WORD PTR [bx+6],cx
; Line 591
	mov	cx,WORD PTR [si+8]
	mov	WORD PTR [bx+8],cx
; Line 592
	mov	cx,WORD PTR [si+10]
	mov	WORD PTR [bx+10],cx
; Line 593
	mov	WORD PTR [bx+12],8
; Line 594
	push	5
	call	ARAND
	add	ax,WORD PTR [si+14]
	dec	ax
	dec	ax
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+14],ax
; Line 595
	push	2
	call	ARAND
	cmp	ax,1
	sbb	ax,ax
	and	al,236
	add	ax,10
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+16],ax
; Line 596
	push	8
	call	ARAND
	add	ax,16
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+18],ax
; Line 597
	mov	BYTE PTR [bx+22],7
; Line 598
	mov	BYTE PTR [bx+23],2
; Line 599
	mov	WORD PTR [bx+24],128
; Line 600
	mov	WORD PTR [bx+26],50
; Line 601
	mov	WORD PTR [bx+28],0
; Line 602
	mov	WORD PTR [bx+30],50
; Line 603
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	cx,WORD PTR [bx+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	cx,WORD PTR [bx+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+10],ax
; Line 604
	push	OFFSET DGROUP:_HunterShotList
	push	bx
	call	ADDHEAD
; Line 605
; Line 606
$I1562:
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

FIREHUNTERSHOT	ENDP
; Line 613
	PUBLIC	CREATEHUNTER
CREATEHUNTER	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
	push	si
;	npHunt = -4
;	nCnt = -2
; Line 617
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	jne	$JCC3667
	jmp	$I1566
$JCC3667:
; Line 618
; Line 619
	push	16984
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+4],ax
; Line 620
	mov	WORD PTR [bx+6],-8492
; Line 621
	mov	WORD PTR [bx+10],0
	mov	WORD PTR [bx+8],0
; Line 622
	mov	WORD PTR [bx+12],256
; Line 623
	push	256
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+14],ax
; Line 624
	mov	WORD PTR [bx+16],0
; Line 625
	push	WORD PTR _nLevel
	call	ARAND
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+18],ax
; Line 626
	push	10
	call	ARAND
	inc	ax
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+20],ax
; Line 627
	mov	BYTE PTR [bx+22],13
; Line 628
	mov	BYTE PTR [bx+23],8
; Line 629
	mov	WORD PTR [bp-2],0	;nCnt
$FC1568:
; Line 630
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,WORD PTR $S1354_Hunter[bx]
	mov	dx,WORD PTR $S1354_Hunter[bx+2]
	mov	cx,bx
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	si,cx
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],8	;nCnt
	jl	$FC1568
; Line 631
	push	0
	push	16384
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+10],ax
; Line 632
	push	OFFSET DGROUP:_HunterList
	push	bx
	call	ADDHEAD
; Line 633
	inc	WORD PTR _nBadGuys
; Line 634
; Line 635
$I1566:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

CREATEHUNTER	ENDP
; Line 642
	PUBLIC	DRAWHUNTERS
DRAWHUNTERS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	FAR PTR __aFchkstk
	push	si
;	npHunt = -4
;	npNext = -2
;	hDC = 4
; Line 646
	cmp	WORD PTR _nBadGuys,0
	je	$I1575
	dec	WORD PTR $S1574_nNextHunter
	jns	$I1575
; Line 647
; Line 648
	call	CREATEHUNTER
; Line 649
	push	1000
	call	ARAND
	mov	cx,125
	sub	cx,WORD PTR _nLevel
	shl	cx,3
	add	cx,ax
	mov	WORD PTR $S1574_nNextHunter,cx
; Line 650
; Line 652
$I1575:
	mov	ax,WORD PTR _HunterList
	jmp	$L20049
$I1582:
	mov	bx,WORD PTR [bp-4]	;npHunt
	cmp	WORD PTR [bx+18],1
	je	$JCC3963
	jmp	$FB1589
$JCC3963:
	mov	BYTE PTR [bx+22],12
; Line 674
; Line 675
	jmp	$FB1589
	nop	
$I1581:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jle	$JCC3983
	jmp	$FB1589
$JCC3983:
	mov	ax,WORD PTR [bp-14]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jg	$JCC3995
	jmp	$FB1589
$JCC3995:
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jle	$JCC4007
	jmp	$FB1589
$JCC4007:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jg	$JCC4019
	jmp	$FB1589
$JCC4019:
; Line 676
; Line 677
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20050
	nop	
$FC1588:
	mov	ax,WORD PTR [bx]
$L20050:
	mov	WORD PTR [bp-6],ax	;npShot
	or	ax,ax
	jne	$JCC4037
	jmp	$FB1589
$JCC4037:
; Line 678
; Line 679
	mov	ax,WORD PTR [bp-14]	;rect
	mov	bx,WORD PTR [bp-6]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1588
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1588
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1588
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+6],ax
	jge	$FC1588
; Line 680
	mov	WORD PTR [bx+18],1
; Line 681
	mov	bx,WORD PTR [bp-4]	;npHunt
	imul	ax,WORD PTR [bx+18],1000
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 682
	dec	WORD PTR [bx+18]
	cmp	WORD PTR [bx+18],1
	jge	$I1592
; Line 683
; Line 684
$L20052:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20011
	push	2
	call	SETRESTART
$L20011:
; Line 685
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	BYTE PTR [bx+22],13
; Line 686
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 687
	push	OFFSET DGROUP:_HunterList
	push	WORD PTR [bp-4]	;npHunt
	call	REMOVE
; Line 688
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-4]	;npHunt
	call	ADDHEAD
; Line 689
; Line 690
	jmp	SHORT $FB1589
$I1592:
; Line 691
; Line 692
	mov	bx,WORD PTR [bp-4]	;npHunt
	cmp	WORD PTR [bx+18],1
	jne	$I1594
	mov	BYTE PTR [bx+22],12
; Line 693
$I1594:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	HIT
; Line 694
; Line 695
$FB1589:
; Line 697
; Line 698
	push	0
	push	16384
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+10],ax
; Line 699
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bx+8],ax
; Line 700
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bx+10],ax
; Line 701
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1595
; Line 702
; Line 703
	push	10
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+20],ax
; Line 704
	push	11
	call	ARAND
	sub	ax,5
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+16],ax
; Line 705
	push	bx
	call	FIREHUNTERSHOT
; Line 706
; Line 707
$I1595:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	DRAWOBJECT
; Line 708
	mov	ax,WORD PTR [bp-2]	;npNext
$L20049:
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	je	$FB1578
; Line 653
;	npShot = -6
;	rect = -14
; Line 657
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npNext
; Line 659
	mov	ax,WORD PTR [bx+4]
	sub	ax,200
	mov	WORD PTR [bp-14],ax	;rect
	mov	ax,WORD PTR [bx+4]
	add	ax,200
	mov	WORD PTR [bp-10],ax
	mov	ax,WORD PTR [bx+6]
	sub	ax,200
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bx+6]
	add	ax,200
	mov	WORD PTR [bp-8],ax
; Line 661
	mov	ax,WORD PTR [bp-14]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jge	$JCC4413
	jmp	$I1581
$JCC4413:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+4],ax
	jl	$JCC4424
	jmp	$I1581
$JCC4424:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [si+6],ax
	jge	$JCC4435
	jmp	$I1581
$JCC4435:
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [si+6],ax
	jl	$JCC4446
	jmp	$I1581
$JCC4446:
; Line 662
; Line 663
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	HITPLAYER
; Line 665
	mov	bx,WORD PTR [bp-4]	;npHunt
	dec	WORD PTR [bx+18]
	cmp	WORD PTR [bx+18],1
	jl	$JCC4468
	jmp	$I1582
$JCC4468:
	jmp	$L20052
$FB1578:
; Line 709
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWHUNTERS	ENDP
; Line 716
	PUBLIC	CREATESWARMER
CREATESWARMER	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
;	npSwarm = -4
;	nCnt = -2
;	Pos = 8
;	nDir = 6
;	nCount = 4
; Line 720
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSwarm
	or	ax,ax
	jne	$JCC4506
	jmp	$I1603
$JCC4506:
; Line 721
; Line 722
	mov	bx,ax
	mov	cx,WORD PTR [bp+8]	;Pos
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR [bx+4],cx
	mov	WORD PTR [bx+6],dx
; Line 723
	mov	WORD PTR [bx+10],0
	mov	WORD PTR [bx+8],0
; Line 724
	mov	cx,WORD PTR [bp+6]	;nDir
	mov	WORD PTR [bx+14],cx
; Line 725
	push	31
	call	ARAND
	sub	ax,15
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	WORD PTR [bx+16],ax
; Line 726
	mov	ax,WORD PTR [bp+4]	;nCount
	mov	WORD PTR [bx+18],ax
; Line 727
	push	64
	call	ARAND
	add	ax,64
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	WORD PTR [bx+20],ax
; Line 728
	mov	WORD PTR [bx+12],32
; Line 729
	mov	BYTE PTR [bx+22],6
; Line 730
	mov	BYTE PTR [bx+23],5
; Line 731
	mov	WORD PTR [bp-2],0	;nCnt
$FC1605:
; Line 732
; Line 733
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,WORD PTR $S1353_Swarmer[bx]
	mov	dx,WORD PTR $S1353_Swarmer[bx+2]
	add	bx,WORD PTR [bp-4]	;npSwarm
	mov	WORD PTR [bx+24],ax
	mov	WORD PTR [bx+26],dx
; Line 734
	mov	ax,WORD PTR [bp+4]	;nCount
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	WORD PTR [bx+26],ax
; Line 735
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],5	;nCnt
	jl	$FC1605
; Line 736
	push	0
	push	16384
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSwarm
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSwarm
	add	WORD PTR [bx+10],ax
; Line 737
	push	OFFSET DGROUP:_SwarmerList
	push	bx
	call	ADDHEAD
; Line 738
	inc	WORD PTR _nBadGuys
; Line 739
; Line 740
$I1603:
	mov	sp,bp
	pop	bp
	ret	8

CREATESWARMER	ENDP
; Line 747
	PUBLIC	DRAWSWARMERS
DRAWSWARMERS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	FAR PTR __aFchkstk
	push	si
;	npSwarm = -2
;	npNext = -4
;	hDC = 4
; Line 751
	cmp	WORD PTR _nBadGuys,0
	je	$I1613
	dec	WORD PTR $S1612_nNextSwarmer
	jns	$I1613
; Line 752
;	Pos = -8
; Line 754
	push	16984
	call	ARAND
	sub	ax,8492
	mov	WORD PTR [bp-8],ax	;Pos
; Line 755
	mov	WORD PTR [bp-6],-8492
; Line 756
	push	WORD PTR [bp-6]
	push	ax
	push	256
	call	ARAND
	push	ax
	mov	ax,WORD PTR _nLevel
	add	ax,4
	shl	ax,1
	push	ax
	call	CREATESWARMER
; Line 757
	push	500
	call	ARAND
	mov	cx,250
	sub	cx,WORD PTR _nLevel
	shl	cx,2
	add	cx,ax
	mov	WORD PTR $S1612_nNextSwarmer,cx
; Line 758
; Line 760
$I1613:
	mov	ax,WORD PTR _SwarmerList
	jmp	$L20054
	nop	
$I1620:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jg	$FB1625
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jle	$FB1625
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$FB1625
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$FB1625
; Line 775
; Line 776
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20055
	nop	
$FC1624:
	mov	ax,WORD PTR [bx]
$L20055:
	mov	WORD PTR [bp-8],ax	;Pos
	or	ax,ax
	je	$FB1625
; Line 777
; Line 778
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;Pos
	cmp	WORD PTR [bx+4],ax
	jl	$FC1624
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1624
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1624
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$FC1624
; Line 779
	mov	WORD PTR [bx+18],1
; Line 780
	mov	bx,WORD PTR [bp-2]	;npSwarm
	imul	ax,WORD PTR [bx+18],25
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 781
$L20056:
	mov	WORD PTR [bx+18],0
; Line 782
$FB1625:
; Line 784
; Line 785
	mov	bx,WORD PTR [bp-2]	;npSwarm
	cmp	WORD PTR [bx+18],0
	jg	$I1628
; Line 786
; Line 787
	mov	BYTE PTR [bx+22],7
; Line 788
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20013
	push	2
	call	SETRESTART
$L20013:
; Line 789
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	EXPLODE
; Line 790
	push	OFFSET DGROUP:_SwarmerList
	push	WORD PTR [bp-2]	;npSwarm
	call	REMOVE
; Line 791
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npSwarm
	call	ADDHEAD
; Line 792
; Line 793
	jmp	SHORT $FC1616
$I1628:
; Line 794
; Line 795
	cmp	WORD PTR [bx+18],1
	jle	$I1630
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1630
; Line 796
;	nDir = -20
;	nCount = -18
; Line 797
	push	256
	call	ARAND
	mov	WORD PTR [bp-20],ax	;nDir
; Line 798
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	ax,WORD PTR [bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-18],ax	;nCount
; Line 799
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bp-20]	;nDir
	push	ax
	call	CREATESWARMER
; Line 800
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	ax,WORD PTR [bx+18]
	sub	ax,WORD PTR [bp-18]	;nCount
	mov	WORD PTR [bp-18],ax	;nCount
; Line 801
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	mov	ax,WORD PTR [bp-20]	;nDir
	add	ax,128
	push	ax
	push	WORD PTR [bp-18]	;nCount
	call	CREATESWARMER
; Line 802
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	WORD PTR [bx+18],0
; Line 803
; Line 804
$I1630:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	DRAWOBJECT
; Line 805
; Line 806
$FC1616:
	mov	ax,WORD PTR [bp-4]	;npNext
$L20054:
	mov	WORD PTR [bp-2],ax	;npSwarm
	or	ax,ax
	jne	$JCC5111
	jmp	$FB1617
$JCC5111:
; Line 761
;	npShot = -8
;	rect = -16
; Line 765
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 767
	mov	ax,-15
	sub	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-16],ax	;rect
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-12],ax
	mov	ax,-15
	sub	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-14],ax
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-10],ax
; Line 769
	mov	ax,WORD PTR [bp-16]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jge	$JCC5217
	jmp	$I1620
$JCC5217:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [si+4],ax
	jl	$JCC5228
	jmp	$I1620
$JCC5228:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [si+6],ax
	jge	$JCC5239
	jmp	$I1620
$JCC5239:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+6],ax
	jl	$JCC5250
	jmp	$I1620
$JCC5250:
; Line 770
; Line 771
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	HITPLAYER
; Line 772
	mov	bx,WORD PTR [bp-2]	;npSwarm
	jmp	$L20056
$FB1617:
; Line 807
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWSWARMERS	ENDP
; Line 814
	PUBLIC	CREATESPINNER
CREATESPINNER	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
	push	si
;	npSpin = -4
;	nCnt = -2
; Line 818
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSpin
	or	ax,ax
	jne	$JCC5299
	jmp	$I1636
$JCC5299:
; Line 819
; Line 820
	push	16984
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	WORD PTR [bx+4],ax
; Line 821
	mov	WORD PTR [bx+6],-8492
; Line 822
	mov	WORD PTR [bx+10],0
	mov	WORD PTR [bx+8],0
; Line 823
	push	256
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	WORD PTR [bx+14],ax
; Line 824
	mov	WORD PTR [bx+16],-12
; Line 825
	push	WORD PTR _nLevel
	call	ARAND
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	WORD PTR [bx+18],ax
; Line 826
	inc	ax
	inc	ax
	shl	ax,5
	mov	WORD PTR [bx+12],ax
; Line 827
	mov	al,15
	sub	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 828
	mov	BYTE PTR [bx+23],5
; Line 829
	mov	WORD PTR [bp-2],0	;nCnt
$FC1638:
; Line 830
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,WORD PTR $S1352_Spinner[bx]
	mov	dx,WORD PTR $S1352_Spinner[bx+2]
	mov	cx,bx
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	si,cx
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],5	;nCnt
	jl	$FC1638
; Line 831
	push	0
	push	16384
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSpin
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,WORD PTR _nLevel
	add	cx,15
	shl	cx,1
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSpin
	add	WORD PTR [bx+10],ax
; Line 832
	push	OFFSET DGROUP:_SpinnerList
	push	bx
	call	ADDHEAD
; Line 833
	inc	WORD PTR _nBadGuys
; Line 834
; Line 835
$I1636:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

CREATESPINNER	ENDP
; Line 842
	PUBLIC	DRAWSPINNERS
DRAWSPINNERS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	FAR PTR __aFchkstk
	push	si
;	npSpin = -2
;	npNext = -4
;	hDC = 4
; Line 846
	cmp	WORD PTR _nBadGuys,0
	je	$I1645
	dec	WORD PTR $S1644_nNextSpinner
	jns	$I1645
; Line 847
; Line 848
	call	CREATESPINNER
; Line 849
	push	900
	call	ARAND
	mov	cx,50
	sub	cx,WORD PTR _nLevel
	shl	cx,1
	add	ax,cx
	mov	WORD PTR $S1644_nNextSpinner,ax
; Line 850
; Line 852
$I1645:
	mov	ax,WORD PTR _SpinnerList
	jmp	$L20058
$I1652:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jle	$JCC5587
	jmp	$FB1658
$JCC5587:
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jg	$JCC5599
	jmp	$FB1658
$JCC5599:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jle	$JCC5611
	jmp	$FB1658
$JCC5611:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jg	$JCC5623
	jmp	$FB1658
$JCC5623:
; Line 876
; Line 877
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20059
	nop	
$FC1657:
	mov	ax,WORD PTR [bx]
$L20059:
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$JCC5641
	jmp	$FB1658
$JCC5641:
; Line 878
; Line 879
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1657
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1657
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1657
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$FC1657
; Line 880
	mov	WORD PTR [bx+18],1
; Line 881
	mov	bx,WORD PTR [bp-2]	;npSpin
	imul	ax,WORD PTR [bx+18],500
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 882
	mov	al,15
	dec	WORD PTR [bx+18]
	sub	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 883
	cmp	WORD PTR [bx+18],1
	jge	$I1661
; Line 884
; Line 885
$L20063:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20017
	push	2
	call	SETRESTART
$L20017:
; Line 886
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	EXPLODE
; Line 887
	push	OFFSET DGROUP:_SpinnerList
	push	WORD PTR [bp-2]	;npSpin
	call	REMOVE
; Line 888
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npSpin
	call	ADDHEAD
; Line 889
; Line 890
	jmp	SHORT $FB1658
	nop	
$I1661:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	HIT
; Line 891
$FB1658:
; Line 893
; Line 894
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npSpin
	sub	ax,WORD PTR [bx+4]
$L20060:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 895
	cmp	ax,-16
	jl	$FB1666
	cmp	ax,16
	jle	$FB1665
$FB1666:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20060
	nop	
$FB1665:
; Line 896
	mov	bx,WORD PTR [bp-2]	;npSpin
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+8],ax
; Line 897
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	sub	ax,WORD PTR [bx+6]
$L20061:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 898
	cmp	ax,-16
	jl	$FB1670
	cmp	ax,16
	jle	$FB1669
$FB1670:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20061
	nop	
$FB1669:
; Line 899
	mov	bx,WORD PTR [bp-2]	;npSpin
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+10],ax
; Line 900
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	DRAWOBJECT
; Line 901
	mov	ax,WORD PTR [bp-4]	;npNext
$L20058:
	mov	WORD PTR [bp-2],ax	;npSpin
	or	ax,ax
	je	$FB1648
; Line 853
;	npShot = -8
;	nDelta = -6
;	rect = -16
; Line 858
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 860
	mov	ax,WORD PTR [bx+4]
	sub	ax,150
	mov	WORD PTR [bp-16],ax	;rect
	mov	ax,WORD PTR [bx+4]
	add	ax,150
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bx+6]
	sub	ax,150
	mov	WORD PTR [bp-14],ax
	mov	ax,WORD PTR [bx+6]
	add	ax,150
	mov	WORD PTR [bp-10],ax
; Line 862
	mov	ax,WORD PTR [bp-16]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jge	$JCC5964
	jmp	$I1652
$JCC5964:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [si+4],ax
	jl	$JCC5975
	jmp	$I1652
$JCC5975:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [si+6],ax
	jge	$JCC5986
	jmp	$I1652
$JCC5986:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+6],ax
	jl	$JCC5997
	jmp	$I1652
$JCC5997:
; Line 863
; Line 864
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	HITPLAYER
; Line 866
	mov	al,15
	mov	bx,WORD PTR [bp-2]	;npSpin
	dec	WORD PTR [bx+18]
	sub	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 867
	cmp	WORD PTR [bx+18],1
	jl	$JCC6027
	jmp	$FB1658
$JCC6027:
	jmp	$L20063
	nop	
$FB1648:
; Line 902
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWSPINNERS	ENDP
; Line 910
	PUBLIC	CREATEROID
CREATEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	npRoid = -4
;	nCnt = -2
;	Pos = 18
;	Vel = 14
;	nSides = 12
;	byColor = 10
;	nDir = 8
;	nSpeed = 6
;	nSpin = 4
; Line 914
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npRoid
	or	ax,ax
	jne	$JCC6068
	jmp	$I1681
$JCC6068:
; Line 915
; Line 916
	mov	bx,ax
	mov	cx,WORD PTR [bp+18]	;Pos
	mov	dx,WORD PTR [bp+20]
	mov	WORD PTR [bx+4],cx
	mov	WORD PTR [bx+6],dx
; Line 917
	mov	cx,WORD PTR [bp+14]	;Vel
	mov	dx,WORD PTR [bp+16]
	mov	WORD PTR [bx+8],cx
	mov	WORD PTR [bx+10],dx
; Line 918
	mov	cx,WORD PTR [bp+12]	;nSides
	shl	cx,7
	mov	WORD PTR [bx+12],cx
; Line 919
	mov	cx,WORD PTR [bp+8]	;nDir
	mov	WORD PTR [bx+14],cx
; Line 920
	push	11
	call	ARAND
	add	ax,WORD PTR [bp+4]	;nSpin
	sub	ax,5
	mov	bx,WORD PTR [bp-4]	;npRoid
	mov	WORD PTR [bx+16],ax
; Line 921
	imul	ax,WORD PTR [bp+12],100	;nSides
	mov	WORD PTR [bx+18],ax
; Line 922
	mov	al,BYTE PTR [bp+10]	;byColor
	mov	BYTE PTR [bx+22],al
; Line 923
	mov	al,BYTE PTR [bp+12]	;nSides
	inc	al
	mov	BYTE PTR [bx+23],al
; Line 924
	mov	WORD PTR [bp-2],0	;nCnt
	jmp	SHORT $F1682
	nop	
$FC1683:
; Line 925
; Line 926
	push	30
	call	ARAND
	mov	cx,ax
	mov	ah,BYTE PTR [bp-2]	;nCnt
	sub	al,al
	cwd	
	idiv	WORD PTR [bp+12]	;nSides
	add	cx,ax
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	add	bx,WORD PTR [bp-4]	;npRoid
	mov	WORD PTR [bx+24],cx
; Line 927
	push	80
	mov	si,bx
	call	ARAND
	imul	cx,WORD PTR [bp+12],100	;nSides
	add	ax,cx
	sub	ax,80
	mov	WORD PTR [si+26],ax
; Line 928
	inc	WORD PTR [bp-2]	;nCnt
$F1682:
	mov	ax,WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp+12],ax	;nSides
	jg	$FC1683
; Line 929
	mov	bx,WORD PTR [bp-4]	;npRoid
	mov	ax,WORD PTR [bx+24]
	mov	dx,WORD PTR [bx+26]
	mov	si,WORD PTR [bp+12]	;nSides
	shl	si,2
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
; Line 930
	push	0
	push	16384
	mov	ax,WORD PTR [bp+6]	;nSpeed
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [bp+8]	;nDir
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-6],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npRoid
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-6]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npRoid
	add	WORD PTR [bx+10],ax
; Line 931
	push	OFFSET DGROUP:_RoidList
	push	bx
	call	ADDHEAD
; Line 932
	inc	WORD PTR _nBadGuys
; Line 933
; Line 934
$I1681:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	18
	nop	

CREATEROID	ENDP
; Line 941
	PUBLIC	BREAKROID
BREAKROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	FAR PTR __aFchkstk
	push	si
;	nCnt = -2
;	nNew = -4
;	hDC = 8
;	npRoid = 6
;	npShot = 4
; Line 944
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+18]
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 945
	cmp	WORD PTR [bp+4],0	;npShot
	je	$I1691
	mov	bx,WORD PTR [bp+4]	;npShot
	mov	WORD PTR [bx+18],1
; Line 946
$I1691:
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	sub	ax,5
	jne	$JCC6400
	jmp	$SC1699
$JCC6400:
	dec	ax
	je	$SC1698
	dec	ax
	je	$SC1697
	dec	ax
	je	$SC1696
; Line 961
	mov	WORD PTR [bp-4],0	;nNew
; Line 962
	jmp	SHORT $SB1693
; Line 947
	nop	
; Line 948
$SC1696:
; Line 949
	push	3
	call	ARAND
	inc	ax
	inc	ax
$L20065:
	mov	WORD PTR [bp-4],ax	;nNew
; Line 950
$SB1693:
; Line 964
	cmp	WORD PTR [bp-4],1	;nNew
	jne	$I1701
; Line 965
;	Pt = -8
; Line 966
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-8],ax	;Pt
	mov	WORD PTR [bp-6],dx
; Line 967
	push	301
	call	ARAND
	sub	ax,150
	add	WORD PTR [bp-8],ax	;Pt
	push	301
	call	ARAND
	sub	ax,150
	add	WORD PTR [bp-6],ax
; Line 969
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;Pt
	mov	bx,WORD PTR [bp+6]	;npRoid
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	sub	ax,WORD PTR [bp-4]	;nNew
	dec	ax
	push	ax
	mov	al,BYTE PTR [bx+22]
	push	ax
	mov	si,WORD PTR [bp+4]	;npShot
	push	WORD PTR [si+14]
	push	8
	push	WORD PTR [bx+16]
	call	CREATEROID
; Line 970
; Line 971
	jmp	$I1704
	nop	
; Line 951
$SC1697:
; Line 952
	push	3
	jmp	SHORT $L20066
; Line 954
$SC1698:
; Line 955
	push	2
$L20066:
	call	ARAND
	inc	ax
	jmp	SHORT $L20065
; Line 957
$SC1699:
; Line 958
	push	2
	call	ARAND
	jmp	SHORT $L20065
; Line 960
	nop	
$I1701:
	cmp	WORD PTR [bp-4],0	;nNew
	jg	$JCC6548
	jmp	$I1704
$JCC6548:
; Line 972
;	nSpeed = -8
; Line 973
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+16]
	mov	cx,ax
	imul	cx
	imul	WORD PTR [bp-4]	;nNew
	add	ax,16
	mov	WORD PTR [bp-8],ax	;Pt
; Line 974
	mov	WORD PTR [bp-2],0	;nCnt
	jmp	SHORT $F1706
	nop	
$FC1707:
; Line 975
;	Pt = -12
; Line 976
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	cx,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-12],cx	;Pt
	mov	WORD PTR [bp-10],dx
; Line 977
	push	601
	call	ARAND
	sub	ax,300
	add	WORD PTR [bp-12],ax	;Pt
	push	601
	call	ARAND
	sub	ax,300
	add	WORD PTR [bp-10],ax
; Line 982
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;Pt
	mov	bx,WORD PTR [bp+6]	;npRoid
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	sub	ax,WORD PTR [bp-4]	;nNew
	dec	ax
	push	ax
	mov	al,BYTE PTR [bx+22]
	push	ax
	push	32
	call	ARAND
	mov	cx,ax
	mov	ah,BYTE PTR [bp-2]	;nCnt
	sub	al,al
	cwd	
	idiv	WORD PTR [bp-4]	;nNew
	add	cx,ax
	mov	bx,WORD PTR [bp+6]	;npRoid
	add	cx,WORD PTR [bx+14]
	push	cx
	mov	ax,WORD PTR _nLevel
	shl	ax,2
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp-8]	;Pt
	push	ax
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	CREATEROID
; Line 983
	inc	WORD PTR [bp-2]	;nCnt
$F1706:
	mov	ax,WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-4],ax	;nNew
	jle	$JCC6711
	jmp	$FC1707
$JCC6711:
; Line 984
; Line 985
$I1704:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20019
	push	2
	call	SETRESTART
$L20019:
; Line 986
	mov	bx,WORD PTR [bp+6]	;npRoid
	inc	BYTE PTR [bx+22]
; Line 987
	mov	WORD PTR [bx+18],0
; Line 988
	cmp	WORD PTR [bp-4],0	;nNew
	je	$I1710
; Line 989
; Line 990
	push	WORD PTR [bp+8]	;hDC
	push	bx
	call	HIT
; Line 991
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	DRAWOBJECT
; Line 992
; Line 993
	jmp	SHORT $I1711
	nop	
$I1710:
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	EXPLODE
$I1711:
; Line 994
	push	OFFSET DGROUP:_RoidList
	push	WORD PTR [bp+6]	;npRoid
	call	REMOVE
; Line 995
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp+6]	;npRoid
	call	ADDHEAD
; Line 996
	pop	si
	mov	sp,bp
	pop	bp
	ret	6

BREAKROID	ENDP
; Line 1003
	PUBLIC	DRAWROIDS
DRAWROIDS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	FAR PTR __aFchkstk
	push	si
;	npRoid = -2
;	npNext = -4
;	hDC = 4
; Line 1006
	mov	ax,WORD PTR _RoidList
	jmp	SHORT $L20068
	nop	
$I1723:
	push	2
$L20070:
	call	SETRESTART
; Line 1026
; Line 1027
	jmp	SHORT $FB1729
	nop	
$I1722:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jg	$FB1729
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jle	$FB1729
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$FB1729
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$FB1729
; Line 1028
; Line 1029
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20069
	nop	
$FC1728:
	mov	ax,WORD PTR [bx]
$L20069:
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$FB1729
; Line 1030
; Line 1031
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1728
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1728
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1728
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$FC1728
; Line 1032
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	push	bx
	call	BREAKROID
; Line 1033
$FB1729:
; Line 1035
; Line 1036
	mov	ax,WORD PTR [bp-4]	;npNext
$L20068:
	mov	WORD PTR [bp-2],ax	;npRoid
	or	ax,ax
	jne	$JCC6932
	jmp	$FB1718
$JCC6932:
; Line 1007
;	nSize = -6
;	npShot = -8
;	rect = -16
; Line 1008
	mov	bx,ax
	mov	ax,WORD PTR [bx+18]
	mov	WORD PTR [bp-6],ax	;nSize
; Line 1012
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1014
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	DRAWOBJECT
; Line 1016
	mov	bx,WORD PTR [bp-2]	;npRoid
	mov	ax,WORD PTR [bx+4]
	sub	ax,WORD PTR [bp-6]	;nSize
	mov	WORD PTR [bp-16],ax	;rect
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bp-6]	;nSize
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bx+6]
	sub	ax,WORD PTR [bp-6]	;nSize
	mov	WORD PTR [bp-14],ax
	mov	ax,WORD PTR [bx+6]
	add	ax,WORD PTR [bp-6]	;nSize
	mov	WORD PTR [bp-10],ax
; Line 1018
	mov	ax,WORD PTR [bp-16]	;rect
	mov	si,WORD PTR _npPlayer
	cmp	WORD PTR [si+4],ax
	jge	$JCC7006
	jmp	$I1722
$JCC7006:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [si+4],ax
	jl	$JCC7017
	jmp	$I1722
$JCC7017:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [si+6],ax
	jge	$JCC7028
	jmp	$I1722
$JCC7028:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [si+6],ax
	jl	$JCC7039
	jmp	$I1722
$JCC7039:
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	HITPLAYER
	or	ax,ax
	jne	$JCC7053
	jmp	$I1722
$JCC7053:
; Line 1019
; Line 1020
	mov	bx,WORD PTR _npPlayer
	neg	WORD PTR [bx+18]
; Line 1021
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 1022
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR _npPlayer
	call	EXPLODE
; Line 1023
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	push	0
	call	BREAKROID
; Line 1024
	cmp	WORD PTR _nBadGuys,0
	jne	$JCC7099
	jmp	$I1723
$JCC7099:
	push	1
	jmp	$L20070
	nop	
$FB1718:
; Line 1037
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWROIDS	ENDP
; Line 1044
	PUBLIC	DRAWSHOTS
DRAWSHOTS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
;	npShot = -2
;	npNext = -4
;	hDC = 4
; Line 1047
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC7137
	jmp	$I1736
$JCC7137:
; Line 1048
; Line 1049
	mov	bx,ax
	mov	cx,WORD PTR [bx+4]
	mov	WORD PTR $S1350_rectShotClip+4,cx
	mov	WORD PTR $S1350_rectShotClip,cx
; Line 1050
	mov	cx,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+6,cx
	mov	WORD PTR $S1350_rectShotClip+2,cx
; Line 1051
$FC1738:
	cmp	WORD PTR [bp-2],0	;npShot
	jne	$JCC7170
	jmp	$I1753
$JCC7170:
; Line 1052
; Line 1053
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1054
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
	cmp	ax,10
	je	$SC1744
	ja	$SB1741
	or	al,al
	je	$SC1746
	sub	al,5
	je	$SC1745
	jmp	SHORT $SB1741
; Line 1055
; Line 1056
$SC1744:
; Line 1057
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],12
; Line 1058
$SB1741:
; Line 1067
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	DRAWOBJECT
; Line 1068
	mov	ax,WORD PTR $S1350_rectShotClip
	mov	bx,WORD PTR [bp-2]	;npShot
	cmp	WORD PTR [bx+4],ax
	jge	$I1747
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1350_rectShotClip,ax
; Line 1069
	jmp	SHORT $I1749
	nop	
; Line 1059
$SC1745:
; Line 1060
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],8
; Line 1061
	jmp	SHORT $SB1741
	nop	
; Line 1062
$SC1746:
; Line 1063
	push	OFFSET DGROUP:_ShotList
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 1064
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 1065
	jmp	SHORT $SB1741
$I1747:
	mov	ax,WORD PTR $S1350_rectShotClip+4
	cmp	WORD PTR [bx+4],ax
	jle	$I1749
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1350_rectShotClip+4,ax
; Line 1070
$I1749:
	mov	ax,WORD PTR $S1350_rectShotClip+2
	cmp	WORD PTR [bx+6],ax
	jge	$I1750
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+2,ax
; Line 1071
	jmp	SHORT $I1752
$I1750:
	mov	ax,WORD PTR $S1350_rectShotClip+6
	cmp	WORD PTR [bx+6],ax
	jle	$I1752
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+6,ax
; Line 1072
$I1752:
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npShot
; Line 1073
	jmp	$FC1738
	nop	
$I1736:
	mov	ax,32767
	mov	WORD PTR $S1350_rectShotClip+6,ax
	mov	WORD PTR $S1350_rectShotClip+2,ax
	mov	WORD PTR $S1350_rectShotClip+4,ax
	mov	WORD PTR $S1350_rectShotClip,ax
$I1753:
; Line 1076
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWSHOTS	ENDP
; Line 1083
	PUBLIC	DRAWFLAMES
DRAWFLAMES	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
;	npFlame = -2
;	npNext = -4
;	hDC = 4
; Line 1086
	mov	ax,WORD PTR _FlameList
	jmp	SHORT $L20071
; Line 1090
; Line 1091
$SC1765:
; Line 1092
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],5
; Line 1093
$SB1762:
; Line 1102
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npFlame
	call	DRAWOBJECT
; Line 1103
	mov	ax,WORD PTR [bp-4]	;npNext
$L20071:
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	je	$FB1760
; Line 1087
; Line 1088
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1089
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
	cmp	ax,7
	je	$SC1765
	ja	$SB1762
	or	al,al
	je	$SC1767
	sub	al,3
	jne	$SB1762
; Line 1095
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],4
; Line 1096
	jmp	SHORT $SB1762
	nop	
; Line 1097
$SC1767:
; Line 1098
	push	OFFSET DGROUP:_FlameList
	push	WORD PTR [bp-2]	;npFlame
	call	REMOVE
; Line 1099
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npFlame
	call	ADDHEAD
; Line 1100
	jmp	SHORT $SB1762
$FB1760:
; Line 1104
	mov	sp,bp
	pop	bp
	ret	2

DRAWFLAMES	ENDP
; Line 1111
	PUBLIC	FIRESHOT
FIRESHOT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
	push	si
;	npShot = -2
; Line 1114
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC7477
	jmp	$I1770
$JCC7477:
; Line 1115
; Line 1116
	mov	bx,ax
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+4]
	mov	WORD PTR [bx+4],cx
; Line 1117
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+6]
	mov	WORD PTR [bx+6],cx
; Line 1118
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+8]
	mov	WORD PTR [bx+8],cx
; Line 1119
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+10]
	mov	WORD PTR [bx+10],cx
; Line 1120
	mov	WORD PTR [bx+12],8
; Line 1121
	push	5
	call	ARAND
	mov	bx,WORD PTR _npPlayer
	add	ax,WORD PTR [bx+14]
	dec	ax
	dec	ax
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+14],ax
; Line 1122
	mov	WORD PTR [bx+16],0
; Line 1123
	push	8
	call	ARAND
	add	ax,16
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+18],ax
; Line 1124
	mov	BYTE PTR [bx+22],13
; Line 1125
	mov	BYTE PTR [bx+23],2
; Line 1126
	mov	WORD PTR [bx+24],128
; Line 1127
	mov	WORD PTR [bx+26],50
; Line 1128
	mov	WORD PTR [bx+28],0
; Line 1129
	mov	WORD PTR [bx+30],50
; Line 1130
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	cx,WORD PTR [bx+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	cx,WORD PTR [bx+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+10],ax
; Line 1131
	push	OFFSET DGROUP:_ShotList
	push	bx
	call	ADDHEAD
; Line 1132
; Line 1133
$I1770:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

FIRESHOT	ENDP
; Line 1140
	PUBLIC	ACCELPLAYER
ACCELPLAYER	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	npFlame = -2
;	nDir = 6
;	nAccel = 4
; Line 1143
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+14]
	add	WORD PTR [bp+6],ax	;nDir
; Line 1144
	cmp	WORD PTR [bp+4],0	;nAccel
	je	$I1775
	push	0
	push	16384
	mov	ax,WORD PTR [bp+4]	;nAccel
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [bp+6]	;nDir
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-4],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR _npPlayer
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	bx,WORD PTR [bp-4]
	mov	ax,WORD PTR _nSin[bx]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR _npPlayer
	add	WORD PTR [bx+10],ax
; Line 1145
$I1775:
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	jne	$JCC7819
	jmp	$I1776
$JCC7819:
; Line 1146
; Line 1147
	mov	bx,ax
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+4]
	mov	WORD PTR [bx+4],cx
; Line 1148
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+6]
	mov	WORD PTR [bx+6],cx
; Line 1149
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+8]
	mov	WORD PTR [bx+8],cx
; Line 1150
	mov	si,WORD PTR _npPlayer
	mov	cx,WORD PTR [si+10]
	mov	WORD PTR [bx+10],cx
; Line 1151
	push	57
	call	ARAND
	add	ax,WORD PTR [bp+6]	;nDir
	add	ax,100
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [bx+14],ax
; Line 1152
	mov	WORD PTR [bx+16],0
; Line 1153
	push	7
	call	ARAND
	add	ax,WORD PTR [bp+4]	;nAccel
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [bx+18],ax
; Line 1154
	mov	BYTE PTR [bx+22],11
; Line 1155
	mov	BYTE PTR [bx+23],1
; Line 1156
	mov	WORD PTR [bx+26],0
	mov	WORD PTR [bx+24],0
; Line 1157
	push	0
	push	16384
	push	10
	call	ARAND
	mov	cx,ax
	add	cx,50
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npFlame
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	10
	call	ARAND
	mov	cx,ax
	add	cx,50
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npFlame
	add	WORD PTR [bx+10],ax
; Line 1158
	push	OFFSET DGROUP:_FlameList
	push	bx
	call	ADDHEAD
; Line 1159
; Line 1160
$I1776:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4
	nop	

ACCELPLAYER	ENDP
; Line 1167
	PUBLIC	DRAWPLAYER
DRAWPLAYER	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
;	hDC = 4
; Line 1171
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jg	$JCC8042
	jmp	$EX1778
$JCC8042:
; Line 1173
	cmp	WORD PTR _nSafe,0
	jle	$I1782
; Line 1174
; Line 1175
	dec	WORD PTR _nSafe
	jne	$I1788
; Line 1176
; Line 1177
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 1178
	mov	bx,WORD PTR _npPlayer
	cmp	BYTE PTR [bx+22],3
	jbe	$I1788
	mov	BYTE PTR [bx+22],3
; Line 1179
; Line 1180
; Line 1181
	jmp	SHORT $I1788
$I1782:
	push	WORD PTR _vkShld
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1788
	cmp	WORD PTR _nShield,0
	jle	$I1788
; Line 1182
; Line 1183
	mov	WORD PTR _nSafe,15
; Line 1184
	dec	WORD PTR _nShield
	cmp	WORD PTR _nShield,0
	jle	$I1787
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],7
; Line 1185
	jmp	SHORT $I1788
	nop	
$I1787:
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],6
$I1788:
; Line 1186
; Line 1188
	cmp	WORD PTR $S1779_nBombing,0
	jle	$I1789
; Line 1189
; Line 1190
	dec	WORD PTR $S1779_nBombing
	jne	$I1790
; Line 1191
; Line 1192
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_SpinnerList
	call	EXPLODEBADGUYS
; Line 1193
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_SwarmerList
	call	EXPLODEBADGUYS
; Line 1194
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_HunterList
	call	EXPLODEBADGUYS
; Line 1195
; Line 1196
	jmp	SHORT $I1793
$I1790:
; Line 1197
; Line 1198
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_SpinnerList
	call	HITLIST
; Line 1199
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_SwarmerList
	call	HITLIST
; Line 1200
	push	WORD PTR [bp+4]	;hDC
	push	OFFSET DGROUP:_HunterList
	call	HITLIST
; Line 1201
; Line 1202
; Line 1203
	jmp	SHORT $I1793
	nop	
$I1789:
	cmp	WORD PTR _nBomb,0
	je	$I1793
	push	WORD PTR _vkBomb
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1793
	dec	WORD PTR _nBomb
	mov	WORD PTR $S1779_nBombing,5
; Line 1205
$I1793:
	push	WORD PTR _vkClkw
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1794
	mov	bx,WORD PTR _npPlayer
	add	WORD PTR [bx+16],8
; Line 1206
$I1794:
	push	WORD PTR _vkCtrClkw
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1795
	mov	bx,WORD PTR _npPlayer
	sub	WORD PTR [bx+16],8
; Line 1207
$I1795:
	push	WORD PTR _vkThrst
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1796
	push	0
	push	12
	call	ACCELPLAYER
; Line 1208
$I1796:
	push	WORD PTR _vkRvThrst
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1797
	push	128
	push	12
	call	ACCELPLAYER
; Line 1209
$I1797:
	cmp	WORD PTR $S1780_nShotDelay,0
	je	$I1798
	dec	WORD PTR $S1780_nShotDelay
; Line 1210
	jmp	SHORT $I1800
$I1798:
	push	WORD PTR _vkFire
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1800
	call	FIRESHOT
	mov	WORD PTR $S1780_nShotDelay,2
; Line 1211
$I1800:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR _npPlayer
	call	DRAWOBJECT
; Line 1212
	mov	cx,2
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+16]
	cwd	
	idiv	cx
	mov	WORD PTR [bx+16],ax
; Line 1213
$EX1778:
	mov	sp,bp
	pop	bp
	ret	2

DRAWPLAYER	ENDP
; Line 1220
	PUBLIC	GETHYPEROIDDC
GETHYPEROIDDC	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	hDC = -14
;	cx = -2
;	cy = -4
;	rect = -12
;	hWnd = 4
; Line 1225
	push	WORD PTR [bp+4]	;hWnd
	lea	ax,WORD PTR [bp-12]	;rect
	push	ss
	push	ax
	call	FAR PTR GETCLIENTRECT
; Line 1226
	mov	ax,WORD PTR [bp-8]
	sub	ax,WORD PTR [bp-12]	;rect
	mov	WORD PTR [bp-2],ax	;cx
; Line 1227
	mov	ax,WORD PTR [bp-6]
	sub	ax,WORD PTR [bp-10]
	mov	WORD PTR [bp-4],ax	;cy
; Line 1232
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR GETDC
	mov	WORD PTR [bp-14],ax	;hDC
	push	ax
	push	7
	call	FAR PTR SETMAPMODE
; Line 1233
	push	WORD PTR [bp-14]	;hDC
	push	8192
	push	8192
	call	FAR PTR SETWINDOWEXT
; Line 1234
	push	WORD PTR [bp-14]	;hDC
	mov	ax,WORD PTR [bp-2]	;cx
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	cx,ax
	mov	ax,WORD PTR [bp-4]	;cy
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,ax
	neg	ax
	push	ax
	mov	si,cx
	mov	di,dx
	call	FAR PTR SETVIEWPORTEXT
; Line 1235
	push	WORD PTR [bp-14]	;hDC
	push	si
	push	di
	call	FAR PTR SETVIEWPORTORG
; Line 1238
	push	WORD PTR [bp-14]	;hDC
	push	WORD PTR _hAppPalette
	push	0
	call	FAR PTR SELECTPALETTE
; Line 1239
	push	WORD PTR [bp-14]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1241
	mov	ax,WORD PTR [bp-14]	;hDC
; Line 1242
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	2

GETHYPEROIDDC	ENDP
; Line 1249
	PUBLIC	DRAWOBJECTS
DRAWOBJECTS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
;	hDC = -2
;	hWnd = 4
; Line 1253
	push	WORD PTR [bp+4]	;hWnd
	call	GETHYPEROIDDC
	mov	WORD PTR [bp-2],ax	;hDC
	push	ax
	call	DRAWPLAYER
; Line 1254
	push	WORD PTR [bp-2]	;hDC
	call	DRAWFLAMES
; Line 1255
	push	WORD PTR [bp-2]	;hDC
	call	DRAWSHOTS
; Line 1256
	push	WORD PTR [bp-2]	;hDC
	call	DRAWROIDS
; Line 1257
	push	WORD PTR [bp-2]	;hDC
	call	DRAWSPINNERS
; Line 1258
	push	WORD PTR [bp-2]	;hDC
	call	DRAWSWARMERS
; Line 1259
	push	WORD PTR [bp-2]	;hDC
	call	DRAWHUNTERS
; Line 1260
	push	WORD PTR [bp-2]	;hDC
	call	DRAWHUNTERSHOTS
; Line 1261
	push	WORD PTR [bp-2]	;hDC
	call	DRAWLETTERS
; Line 1262
	push	WORD PTR [bp-2]	;hDC
	call	DRAWBONUSES
; Line 1265
	push	WORD PTR [bp+4]	;hWnd
	push	WORD PTR [bp-2]	;hDC
	call	FAR PTR RELEASEDC
; Line 1266
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWOBJECTS	ENDP
; Line 1273
	PUBLIC	SETINDICATOR
SETINDICATOR	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __aFchkstk
;	npBuff = 8
;	IDBitmap = 6
;	nQuant = 4
; Line 1274
	cmp	WORD PTR [bp+4],5	;nQuant
	jle	$I1816
; Line 1275
; Line 1276
	mov	al,BYTE PTR [bp+6]	;IDBitmap
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
; Line 1277
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
; Line 1278
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],64
; Line 1279
; Line 1280
	jmp	SHORT $I1817
	nop	
$I1816:
; Line 1281
;	nBlank = -2
; Line 1282
	mov	ax,5
	sub	ax,WORD PTR [bp+4]	;nQuant
	mov	WORD PTR [bp-2],ax	;nBlank
; Line 1283
	jmp	SHORT $L20072
	nop	
$FC1820:
	mov	al,BYTE PTR [bp+6]	;IDBitmap
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
$L20072:
	mov	ax,WORD PTR [bp+4]	;nQuant
	dec	WORD PTR [bp+4]	;nQuant
	or	ax,ax
	jne	$FC1820
; Line 1284
	jmp	SHORT $L20073
	nop	
$FC1823:
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],50
$L20073:
	mov	ax,WORD PTR [bp-2]	;nBlank
	dec	WORD PTR [bp-2]	;nBlank
	or	ax,ax
	jne	$FC1823
; Line 1285
$I1817:
; Line 1286
	mov	ax,5
; Line 1287
	mov	sp,bp
	pop	bp
	ret	6

SETINDICATOR	ENDP
; Line 1294
	PUBLIC	CHECKSCORE
CHECKSCORE	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	FAR PTR __aFchkstk
	push	si
;	szBuff = -40
;	npBuff = -44
;	nLives = -42
;	nLen = -54
;	nCnt = -46
;	x = -50
;	y = -52
;	hbmOld = -48
;	hDC = -58
;	hDCMem = -56
;	hWnd = 4
; Line 1296
	lea	ax,WORD PTR [bp-40]	;szBuff
	mov	WORD PTR [bp-44],ax	;npBuff
; Line 1301
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC8798
	jmp	$EX1826
$JCC8798:
; Line 1302
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	sub	ax,WORD PTR _lLastLife
	sbb	dx,WORD PTR _lLastLife+2
	cmp	dx,1
	jl	$I1838
	jg	$L20020
	cmp	ax,-31072
	jbe	$I1838
$L20020:
; Line 1303
; Line 1304
	call	ADDEXTRALIFE
; Line 1305
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	mov	WORD PTR _lLastLife,ax
	mov	WORD PTR _lLastLife+2,dx
; Line 1306
; Line 1307
$I1838:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+18]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR [bp-42],ax	;nLives
; Line 1309
	mov	bx,WORD PTR [bp-44]	;npBuff
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],52
; Line 1310
	push	WORD PTR _nLevel
	push	ds
	push	OFFSET DGROUP:$SG1839
	push	ds
	push	WORD PTR [bp-44]	;npBuff
	call	FAR PTR _wsprintf
	add	sp,10
; Line 1311
	jmp	SHORT $L20074
	nop	
$FC1841:
; Line 1312
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
$L20074:
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	si,ax
	test	BYTE PTR __ctype[si+1],4
	jne	$FC1841
; Line 1313
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],50
	mov	bx,WORD PTR [bp-44]	;npBuff
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],65
; Line 1314
	push	WORD PTR _lScore+2
	push	WORD PTR _lScore
	push	ds
	push	OFFSET DGROUP:$SG1843
	push	ds
	push	WORD PTR [bp-44]	;npBuff
	call	FAR PTR _wsprintf
	add	sp,12
; Line 1315
	jmp	SHORT $L20075
$FC1845:
; Line 1316
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
$L20075:
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	si,ax
	test	BYTE PTR __ctype[si+1],4
	jne	$FC1845
; Line 1317
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],50
; Line 1318
	push	WORD PTR [bp-44]	;npBuff
	push	53
	push	WORD PTR [bp-42]	;nLives
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
; Line 1319
	push	WORD PTR [bp-44]	;npBuff
	push	66
	push	WORD PTR _nShield
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
; Line 1321
	push	WORD PTR [bp-44]	;npBuff
	push	51
	push	WORD PTR _nBomb
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
	mov	ax,WORD PTR [bp-44]	;npBuff
	lea	cx,WORD PTR [bp-40]	;szBuff
	sub	ax,cx
	mov	WORD PTR [bp-54],ax	;nLen
; Line 1323
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR GETWINDOWDC
	mov	WORD PTR [bp-58],ax	;hDC
; Line 1325
	push	ax
	push	WORD PTR $S1349_rectScoreClip
	push	WORD PTR $S1349_rectScoreClip+2
	push	WORD PTR $S1349_rectScoreClip+4
	push	WORD PTR $S1349_rectScoreClip+6
	call	FAR PTR INTERSECTCLIPRECT
; Line 1326
	push	WORD PTR [bp-58]	;hDC
	call	FAR PTR CREATECOMPATIBLEDC
	mov	WORD PTR [bp-56],ax	;hDCMem
; Line 1327
	push	ax
	push	WORD PTR _hBitmap
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-48],ax	;hbmOld
; Line 1328
	mov	ax,WORD PTR $S1349_rectScoreClip
	mov	WORD PTR [bp-50],ax	;x
; Line 1329
	mov	ax,WORD PTR $S1349_rectScoreClip+2
	mov	WORD PTR [bp-52],ax	;y
; Line 1331
	mov	WORD PTR [bp-46],0	;nCnt
	jmp	SHORT $F1847
$FC1848:
; Line 1332
; Line 1333
	mov	si,WORD PTR [bp-46]	;nCnt
	mov	al,BYTE PTR [bp-40][si]
	cmp	BYTE PTR $S1348_szScore[si],al
	je	$I1850
; Line 1334
; Line 1335
	push	WORD PTR [bp-56]	;hDCMem
	mov	cx,ax
	cbw	
	mov	bx,ax
	shl	bx,1
	push	WORD PTR _hBitmap[bx-100]
	mov	WORD PTR [bp-60],cx
	call	FAR PTR SELECTOBJECT
; Line 1336
	push	WORD PTR [bp-58]	;hDC
	push	WORD PTR [bp-50]	;x
	push	WORD PTR [bp-52]	;y
	push	16
	push	16
	push	WORD PTR [bp-56]	;hDCMem
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1337
	mov	al,BYTE PTR [bp-60]
	mov	BYTE PTR $S1348_szScore[si],al
; Line 1338
; Line 1339
$I1850:
	add	WORD PTR [bp-50],16	;x
; Line 1340
	inc	WORD PTR [bp-46]	;nCnt
$F1847:
	mov	ax,WORD PTR [bp-54]	;nLen
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$FC1848
; Line 1341
	mov	ax,WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR $S1347_nScoreLen,ax
	jle	$I1851
; Line 1342
; Line 1343
	push	WORD PTR [bp-56]	;hDCMem
	push	WORD PTR _hBitmap
	call	FAR PTR SELECTOBJECT
; Line 1344
$D1852:
; Line 1345
	mov	bx,WORD PTR [bp-46]	;nCnt
	cmp	BYTE PTR $S1348_szScore[bx],50
	je	$I1855
; Line 1346
; Line 1347
	push	WORD PTR [bp-58]	;hDC
	push	WORD PTR [bp-50]	;x
	push	WORD PTR [bp-52]	;y
	push	16
	push	16
	push	WORD PTR [bp-56]	;hDCMem
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1348
	mov	bx,WORD PTR [bp-46]	;nCnt
	mov	BYTE PTR $S1348_szScore[bx],50
; Line 1349
; Line 1350
$I1855:
	add	WORD PTR [bp-50],16	;x
; Line 1351
	mov	ax,WORD PTR $S1347_nScoreLen
	inc	WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$D1852
; Line 1352
; Line 1353
$I1851:
	mov	ax,WORD PTR [bp-54]	;nLen
	mov	WORD PTR $S1347_nScoreLen,ax
; Line 1355
	push	WORD PTR [bp-56]	;hDCMem
	push	WORD PTR [bp-48]	;hbmOld
	call	FAR PTR SELECTOBJECT
; Line 1356
	push	WORD PTR [bp-56]	;hDCMem
	call	FAR PTR DELETEDC
; Line 1357
	push	WORD PTR [bp+4]	;hWnd
	push	WORD PTR [bp-58]	;hDC
	call	FAR PTR RELEASEDC
; Line 1358
$EX1826:
	pop	si
	mov	sp,bp
	pop	bp
	ret	2
	nop	

CHECKSCORE	ENDP
; Line 1365
	PUBLIC	HITLIST
HITLIST	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
;	npObj = -2
;	hDC = 6
;	npList = 4
; Line 1368
	mov	bx,WORD PTR [bp+4]	;npList
	jmp	SHORT $L20077
$FC1861:
; Line 1369
	mov	bx,ax
	cmp	WORD PTR [bx+18],0
	je	$L20078
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	HIT
; Line 1370
$L20078:
	mov	bx,WORD PTR [bp-2]	;npObj
$L20077:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$FC1861
	mov	sp,bp
	pop	bp
	ret	4
	nop	

HITLIST	ENDP
; Line 1377
	PUBLIC	EXPLODEBADGUYS
EXPLODEBADGUYS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
;	npObj = -2
;	hDC = 6
;	npList = 4
; Line 1380
	jmp	SHORT $L20079
	nop	
$FC1869:
; Line 1381
; Line 1382
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20022
	push	2
	call	SETRESTART
$L20022:
; Line 1383
	mov	bx,WORD PTR [bp-2]	;npObj
	mov	WORD PTR [bx+18],0
; Line 1384
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	EXPLODE
; Line 1385
	push	WORD PTR [bp+4]	;npList
	push	WORD PTR [bp-2]	;npObj
	call	REMOVE
; Line 1386
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npObj
	call	ADDHEAD
; Line 1387
$L20079:
	mov	bx,WORD PTR [bp+4]	;npList
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$FC1869
; Line 1388
	mov	sp,bp
	pop	bp
	ret	4
	nop	

EXPLODEBADGUYS	ENDP
; Line 1395
	PUBLIC	NEWGAME
NEWGAME	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
;	hDC = -2
;	hWnd = 4
; Line 1396
	push	WORD PTR [bp+4]	;hWnd
	call	GETHYPEROIDDC
	mov	WORD PTR [bp-2],ax	;hDC
; Line 1398
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+18],0
; Line 1399
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 1400
	push	WORD PTR [bp-2]	;hDC
	push	WORD PTR _npPlayer
	call	EXPLODE
; Line 1401
	push	0
	call	SETRESTART
; Line 1402
	push	WORD PTR [bp-2]	;hDC
	push	OFFSET DGROUP:_RoidList
	call	EXPLODEBADGUYS
; Line 1403
	push	WORD PTR [bp-2]	;hDC
	push	OFFSET DGROUP:_SpinnerList
	call	EXPLODEBADGUYS
; Line 1404
	push	WORD PTR [bp-2]	;hDC
	push	OFFSET DGROUP:_SwarmerList
	call	EXPLODEBADGUYS
; Line 1405
	push	WORD PTR [bp-2]	;hDC
	push	OFFSET DGROUP:_HunterList
	call	EXPLODEBADGUYS
; Line 1407
	push	WORD PTR [bp+4]	;hWnd
	push	WORD PTR [bp-2]	;hDC
	call	FAR PTR RELEASEDC
; Line 1408
	mov	sp,bp
	pop	bp
	ret	2
	nop	

NEWGAME	ENDP
; Line 1415
	PUBLIC	RESTARTHYPEROID
RESTARTHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	FAR PTR __aFchkstk
; Line 1416
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jne	$I1875
; Line 1417
;	Pos = -4
;	Vel = -8
; Line 1420
	mov	WORD PTR [bp-2],-4246
; Line 1421
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;Pos
	mov	WORD PTR [bp-8],ax	;Vel
; Line 1422
	mov	WORD PTR [bp-6],150
; Line 1423
	push	OFFSET DGROUP:_szAppName
	push	WORD PTR [bp-2]
	push	ax
	push	WORD PTR [bp-6]
	push	ax
	push	11
	push	800
	call	FAR PTR PRINTLETTERS
; Line 1424
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+18],3
; Line 1425
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	cmp	WORD PTR _lHighScore+2,dx
	jg	$I1878
	jl	$L20023
	cmp	WORD PTR _lHighScore,ax
	jae	$I1878
$L20023:
	mov	WORD PTR _lHighScore,ax
	mov	WORD PTR _lHighScore+2,dx
; Line 1426
$I1878:
	sub	ax,ax
	mov	WORD PTR _lScore+2,ax
	mov	WORD PTR _lScore,ax
	mov	WORD PTR _lLastLife+2,ax
	mov	WORD PTR _lLastLife,ax
; Line 1427
	mov	WORD PTR _nLevel,ax
	jmp	SHORT $L20082
$I1875:
	cmp	WORD PTR [bx+18],0
	jge	$I1880
; Line 1431
; Line 1433
	neg	WORD PTR [bx+18]
; Line 1434
$L20082:
	mov	ax,3
	mov	WORD PTR _nBomb,ax
	mov	WORD PTR _nShield,ax
; Line 1435
; Line 1437
$I1880:
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+6],0
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bx+4],ax
; Line 1438
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+10],0
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [bx+8],ax
; Line 1439
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+14],64
; Line 1440
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+16],0
; Line 1441
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],7
; Line 1442
	mov	WORD PTR _nSafe,30
; Line 1444
	cmp	WORD PTR _ShotList,0
	je	$FB1885
; Line 1445
;	npShot = -8
; Line 1447
	mov	ax,WORD PTR _ShotList
	jmp	SHORT $L20080
$FC1884:
	mov	bx,WORD PTR [bp-8]	;Vel
	mov	ax,WORD PTR [bx]
$L20080:
	mov	WORD PTR [bp-8],ax	;Vel
	or	ax,ax
	je	$FB1885
; Line 1448
	mov	bx,ax
	mov	WORD PTR [bx+18],1
	jmp	SHORT $FC1884
	nop	
$FB1885:
; Line 1449
; Line 1452
	cmp	WORD PTR _nBadGuys,0
	jne	$I1886
; Line 1453
;	nCnt = -8
; Line 1456
	inc	WORD PTR _nLevel
	mov	ax,WORD PTR _nLevel
	add	ax,5
	mov	WORD PTR [bp-8],ax	;Vel
	jmp	SHORT $F1888
$FC1889:
; Line 1457
;	Pos = -4
;	Vel = -12
; Line 1459
	push	16384
	call	ARAND
	sub	ax,8192
	mov	WORD PTR [bp-4],ax	;Pos
; Line 1460
	push	16384
	call	ARAND
	sub	ax,8192
	mov	WORD PTR [bp-2],ax
; Line 1461
	sub	ax,ax
; Line 1464
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;Pos
	push	ax
	push	ax
	push	2
	call	ARAND
	add	ax,6
	push	ax
	push	2
	call	ARAND
	cmp	ax,1
	sbb	al,al
	and	al,247
	add	al,10
	push	ax
	push	16384
	call	ARAND
	push	ax
	mov	ax,WORD PTR _nLevel
	shl	ax,3
	push	ax
	call	ARAND
	add	ax,30
	push	ax
	push	0
	call	CREATEROID
; Line 1465
	dec	WORD PTR [bp-8]	;Vel
$F1888:
	cmp	WORD PTR [bp-8],0	;Vel
	jne	$FC1889
; Line 1466
; Line 1467
$I1886:
	mov	sp,bp
	pop	bp
	ret	
	nop	

RESTARTHYPEROID	ENDP
; Line 1474
	PUBLIC	PANIC
PANIC	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
;	bPanic = 4
; Line 1475
	cmp	WORD PTR [bp+4],0	;bPanic
	je	$I1895
	cmp	WORD PTR _bPaused,0
	jne	$I1895
; Line 1476
; Line 1478
	push	WORD PTR _hAppWnd
	mov	ax,1
	mov	WORD PTR _bPaused,ax
	push	ax
	call	FAR PTR KILLTIMER
; Line 1479
	push	WORD PTR _hAppWnd
	push	ds
	push	OFFSET DGROUP:$SG1896
	call	FAR PTR SETWINDOWTEXT
; Line 1480
	push	WORD PTR _hAppWnd
	push	7
	call	FAR PTR SHOWWINDOW
; Line 1481
	push	WORD PTR _hAppWnd
	push	0
	push	0
	push	1
	call	FAR PTR INVALIDATERECT
; Line 1482
; Line 1483
	mov	sp,bp
	pop	bp
	ret	2
$I1895:
	cmp	WORD PTR _bPaused,0
	je	$I1898
; Line 1484
; Line 1485
	mov	WORD PTR _bPaused,0
; Line 1486
	push	WORD PTR _hAppWnd
	push	ds
	push	OFFSET DGROUP:_szAppName
	call	FAR PTR SETWINDOWTEXT
; Line 1487
	cmp	WORD PTR [bp+4],0	;bPanic
	je	$I1899
	push	WORD PTR _hAppWnd
	push	9
	call	FAR PTR SHOWWINDOW
; Line 1488
$I1899:
	push	WORD PTR _hAppWnd
	push	1
	push	WORD PTR _nDrawDelay
	push	0
	push	0
	call	FAR PTR SETTIMER
; Line 1489
; Line 1490
$I1898:
	mov	sp,bp
	pop	bp
	ret	2

PANIC	ENDP
; Line 1497
	PUBLIC	PAINTHYPEROID
PAINTHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	FAR PTR __aFchkstk
;	ps = -32
;	hWnd = 4
; Line 1500
	push	WORD PTR [bp+4]	;hWnd
	lea	ax,WORD PTR [bp-32]	;ps
	push	ss
	push	ax
	call	FAR PTR BEGINPAINT
; Line 1501
	cmp	WORD PTR _bPaused,0
	je	$I1903
	push	WORD PTR [bp-32]	;ps
	push	2
	push	2
	push	WORD PTR _hAppInst
	push	0
	push	20
	call	FAR PTR LOADICON
	push	ax
	call	FAR PTR DRAWICON
; Line 1502
$I1903:
	push	WORD PTR [bp+4]	;hWnd
	lea	ax,WORD PTR [bp-32]	;ps
	push	ss
	push	ax
	call	FAR PTR ENDPAINT
; Line 1503
	mov	sp,bp
	pop	bp
	ret	2

PAINTHYPEROID	ENDP
; Line 1510
	PUBLIC	ERASEHYPEROIDBKGND
ERASEHYPEROIDBKGND	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	FAR PTR __aFchkstk
;	hbr = -2
;	rect = -10
;	hWnd = 6
;	hDC = 4
; Line 1514
	push	WORD PTR [bp+6]	;hWnd
	lea	ax,WORD PTR [bp-10]	;rect
	push	ss
	push	ax
	call	FAR PTR GETCLIENTRECT
; Line 1516
	cmp	WORD PTR _bPaused,0
	je	$I1910
; Line 1517
; Line 1518
	push	WORD PTR [bp+4]	;hDC
	push	0
	push	0
	call	FAR PTR SETBRUSHORG
; Line 1519
	push	1
	call	FAR PTR GETSYSCOLOR
	push	dx
	push	ax
	jmp	SHORT $L20083
$I1910:
; Line 1522
; Line 1523
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR _hAppPalette
	push	0
	call	FAR PTR SELECTPALETTE
; Line 1524
	push	WORD PTR [bp+4]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1525
	push	256
	push	0
$L20083:
	call	FAR PTR CREATESOLIDBRUSH
	mov	WORD PTR [bp-2],ax	;hbr
; Line 1526
; Line 1528
	push	WORD PTR [bp+4]	;hDC
	lea	ax,WORD PTR [bp-10]	;rect
	push	ss
	push	ax
	push	WORD PTR [bp-2]	;hbr
	call	FAR PTR FILLRECT
; Line 1529
	push	WORD PTR [bp-2]	;hbr
	call	FAR PTR DELETEOBJECT
; Line 1530
	mov	ax,1
; Line 1531
	mov	sp,bp
	pop	bp
	ret	4

ERASEHYPEROIDBKGND	ENDP
; Line 1538
	PUBLIC	DRAWSHADOWRECT
DRAWSHADOWRECT	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	FAR PTR __aFchkstk
;	hDC = 10
;	npRect = 8
;	hHi = 6
;	hLo = 4
; Line 1539
	push	WORD PTR [bp+10]	;hDC
	push	WORD PTR [bp+6]	;hHi
	call	FAR PTR SELECTOBJECT
; Line 1540
	push	WORD PTR [bp+10]	;hDC
	mov	bx,WORD PTR [bp+8]	;npRect
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	call	FAR PTR MOVETO
; Line 1541
	push	WORD PTR [bp+10]	;hDC
	mov	bx,WORD PTR [bp+8]	;npRect
	push	WORD PTR [bx]
	push	WORD PTR [bx+2]
	call	FAR PTR LINETO
; Line 1542
	push	WORD PTR [bp+10]	;hDC
	mov	bx,WORD PTR [bp+8]	;npRect
	push	WORD PTR [bx]
	push	WORD PTR [bx+6]
	call	FAR PTR LINETO
; Line 1543
	push	WORD PTR [bp+10]	;hDC
	push	WORD PTR [bp+4]	;hLo
	call	FAR PTR SELECTOBJECT
; Line 1544
	push	WORD PTR [bp+10]	;hDC
	mov	bx,WORD PTR [bp+8]	;npRect
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+6]
	call	FAR PTR LINETO
; Line 1545
	push	WORD PTR [bp+10]	;hDC
	mov	bx,WORD PTR [bp+8]	;npRect
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	call	FAR PTR LINETO
; Line 1546
	mov	sp,bp
	pop	bp
	ret	8
	nop	

DRAWSHADOWRECT	ENDP
; Line 1553
	PUBLIC	NCPAINTHYPEROID
NCPAINTHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	FAR PTR __aFchkstk
	push	di
	push	si
;	hDC = -44
;	hDCMem = -28
;	cx = -12
;	cy = -18
;	cyCap = -2
;	h = -10
;	hpenHi = -16
;	hpenLo = -6
;	hbr = -14
;	hbm = -8
;	hbmOld = -4
;	bm = -42
;	rect = -26
;	hWnd = 4
; Line 1562
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC10419
	jmp	$EX1920
$JCC10419:
; Line 1563
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR GETWINDOWDC
	mov	WORD PTR [bp-44],ax	;hDC
; Line 1564
	push	WORD PTR [bp+4]	;hWnd
	lea	ax,WORD PTR [bp-26]	;rect
	push	ss
	push	ax
	call	FAR PTR GETWINDOWRECT
; Line 1565
	mov	ax,WORD PTR [bp-26]	;rect
	sub	WORD PTR [bp-22],ax
; Line 1566
	mov	ax,WORD PTR [bp-24]
	sub	WORD PTR [bp-20],ax
	sub	ax,ax
	mov	WORD PTR [bp-26],ax	;rect
	mov	WORD PTR [bp-24],ax
; Line 1567
	push	32
	call	FAR PTR GETSYSTEMMETRICS
	mov	WORD PTR [bp-12],ax	;cx
; Line 1568
	push	33
	call	FAR PTR GETSYSTEMMETRICS
	mov	WORD PTR [bp-18],ax	;cy
; Line 1569
	push	4
	call	FAR PTR GETSYSTEMMETRICS
	add	ax,WORD PTR [bp-18]	;cy
	dec	ax
	mov	WORD PTR [bp-2],ax	;cyCap
; Line 1570
	mov	ax,WORD PTR [bp-20]
	sub	ax,WORD PTR [bp-2]	;cyCap
	sub	ax,WORD PTR [bp-18]	;cy
	mov	WORD PTR [bp-10],ax	;h
; Line 1572
	push	WORD PTR [bp-44]	;hDC
	push	WORD PTR _hAppPalette
	push	0
	call	FAR PTR SELECTPALETTE
; Line 1573
	push	WORD PTR [bp-44]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1574
	cmp	WORD PTR _bBW,0
	je	$I1935
; Line 1575
; Line 1576
	push	WORD PTR [bp-44]	;hDC
	push	256
	push	3
	call	FAR PTR CREATESOLIDBRUSH
	push	ax
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-14],ax	;hbr
; Line 1577
	mov	ax,WORD PTR _hPen
	mov	WORD PTR [bp-16],ax	;hpenHi
	jmp	SHORT $L20084
	nop	
$I1935:
; Line 1581
; Line 1582
	push	WORD PTR [bp-44]	;hDC
	push	256
	push	2
	call	FAR PTR CREATESOLIDBRUSH
	push	ax
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-14],ax	;hbr
; Line 1583
	mov	ax,WORD PTR _hPen+6
	mov	WORD PTR [bp-16],ax	;hpenHi
; Line 1584
	mov	ax,WORD PTR _hPen+2
$L20084:
	mov	WORD PTR [bp-6],ax	;hpenLo
; Line 1585
; Line 1587
	push	WORD PTR [bp-44]	;hDC
	push	0
	push	0
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-2]	;cyCap
	push	240
	push	33
	call	FAR PTR PATBLT
; Line 1588
	push	WORD PTR [bp-44]	;hDC
	push	0
	mov	ax,WORD PTR [bp-20]
	sub	ax,WORD PTR [bp-18]	;cy
	push	ax
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-20]
	push	240
	push	33
	call	FAR PTR PATBLT
; Line 1589
	push	WORD PTR [bp-44]	;hDC
	push	0
	push	WORD PTR [bp-2]	;cyCap
	push	WORD PTR [bp-12]	;cx
	push	WORD PTR [bp-10]	;h
	push	240
	push	33
	call	FAR PTR PATBLT
; Line 1590
	push	WORD PTR [bp-44]	;hDC
	mov	ax,WORD PTR [bp-22]
	sub	ax,WORD PTR [bp-12]	;cx
	push	ax
	push	WORD PTR [bp-2]	;cyCap
	push	WORD PTR [bp-12]	;cx
	push	WORD PTR [bp-10]	;h
	push	240
	push	33
	call	FAR PTR PATBLT
; Line 1592
	dec	WORD PTR [bp-20]
	dec	WORD PTR [bp-22]
; Line 1593
	push	WORD PTR [bp-44]	;hDC
	lea	ax,WORD PTR [bp-26]	;rect
	push	ax
	push	WORD PTR [bp-16]	;hpenHi
	push	WORD PTR [bp-6]	;hpenLo
	call	DRAWSHADOWRECT
; Line 1595
	dec	WORD PTR [bp-12]	;cx
	mov	ax,WORD PTR [bp-12]	;cx
	add	WORD PTR [bp-26],ax	;rect
	dec	WORD PTR [bp-18]	;cy
	mov	cx,WORD PTR [bp-18]	;cy
	add	WORD PTR [bp-24],cx
; Line 1596
	sub	WORD PTR [bp-22],ax
	sub	WORD PTR [bp-20],cx
; Line 1597
	cmp	WORD PTR _bBW,0
	jne	$I1937
	push	WORD PTR [bp-44]	;hDC
	lea	ax,WORD PTR [bp-26]	;rect
	push	ax
	push	WORD PTR [bp-6]	;hpenLo
	push	WORD PTR [bp-16]	;hpenHi
	call	DRAWSHADOWRECT
; Line 1600
$I1937:
	inc	WORD PTR [bp-26]	;rect
	dec	WORD PTR [bp-22]
; Line 1601
	inc	WORD PTR [bp-24]
	mov	ax,WORD PTR [bp-24]
	sub	ax,WORD PTR [bp-18]	;cy
	add	ax,WORD PTR [bp-2]	;cyCap
	dec	ax
	dec	ax
	mov	WORD PTR [bp-20],ax
; Line 1602
	push	WORD PTR [bp-44]	;hDC
	lea	ax,WORD PTR [bp-26]	;rect
	push	ax
	push	WORD PTR [bp-16]	;hpenHi
	push	WORD PTR [bp-6]	;hpenLo
	call	DRAWSHADOWRECT
; Line 1603
	inc	WORD PTR [bp-22]
; Line 1605
	push	WORD PTR [bp-44]	;hDC
	call	FAR PTR CREATECOMPATIBLEDC
	mov	WORD PTR [bp-28],ax	;hDCMem
; Line 1608
	push	0
	push	0
	push	32754
	call	FAR PTR LOADBITMAP
	mov	WORD PTR [bp-8],ax	;hbm
	push	ax
	push	14
	lea	cx,WORD PTR [bp-42]	;bm
	push	ss
	push	cx
	call	FAR PTR GETOBJECT
; Line 1609
	mov	cx,2
	mov	ax,WORD PTR [bp-40]
	cwd	
	idiv	cx
	mov	WORD PTR [bp-40],ax
; Line 1610
	push	WORD PTR [bp-28]	;hDCMem
	push	WORD PTR [bp-8]	;hbm
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-4],ax	;hbmOld
; Line 1611
	push	WORD PTR [bp-44]	;hDC
	push	WORD PTR [bp-26]	;rect
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-28]	;hDCMem
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1612
	mov	ax,WORD PTR [bp-40]
	add	WORD PTR [bp-26],ax	;rect
; Line 1614
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISZOOMED
	or	ax,ax
	je	$I1938
	push	0
	push	0
	push	32747
	jmp	SHORT $L20085
	nop	
$I1938:
	push	0
	push	0
	push	32748
$L20085:
	call	FAR PTR LOADBITMAP
	mov	WORD PTR [bp-8],ax	;hbm
; Line 1616
	push	ax
	push	14
	lea	ax,WORD PTR [bp-42]	;bm
	push	ss
	push	ax
	call	FAR PTR GETOBJECT
; Line 1617
	push	WORD PTR [bp-28]	;hDCMem
	push	WORD PTR [bp-8]	;hbm
	call	FAR PTR SELECTOBJECT
; Line 1619
	push	WORD PTR [bp-44]	;hDC
	mov	ax,WORD PTR [bp-40]
	sub	WORD PTR [bp-22],ax
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]
	push	ax
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-28]	;hDCMem
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1622
	push	0
	push	0
	push	32749
	call	FAR PTR LOADBITMAP
	mov	WORD PTR [bp-8],ax	;hbm
	push	ax
	push	14
	lea	cx,WORD PTR [bp-42]	;bm
	push	ss
	push	cx
	call	FAR PTR GETOBJECT
; Line 1623
	push	WORD PTR [bp-28]	;hDCMem
	push	WORD PTR [bp-8]	;hbm
	call	FAR PTR SELECTOBJECT
; Line 1625
	push	WORD PTR [bp-44]	;hDC
	mov	ax,WORD PTR [bp-40]
	sub	WORD PTR [bp-22],ax
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]
	push	ax
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-28]	;hDCMem
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1627
	dec	WORD PTR [bp-22]
; Line 1628
	push	WORD PTR [bp-44]	;hDC
	lea	ax,WORD PTR [bp-26]	;rect
	push	ax
	push	WORD PTR [bp-16]	;hpenHi
	push	WORD PTR [bp-6]	;hpenLo
	call	DRAWSHADOWRECT
; Line 1631
	inc	WORD PTR [bp-26]	;rect
	inc	WORD PTR [bp-24]
; Line 1632
	mov	ax,OFFSET DGROUP:$S1349_rectScoreClip
	mov	di,ax
	lea	si,WORD PTR [bp-26]	;rect
	push	ds
	pop	es
	movsw
	movsw
	movsw
	movsw
; Line 1634
	push	WORD PTR [bp-28]	;hDCMem
	push	WORD PTR [bp-4]	;hbmOld
	call	FAR PTR SELECTOBJECT
	push	ax
	call	FAR PTR DELETEOBJECT
; Line 1635
	push	WORD PTR [bp-44]	;hDC
	push	WORD PTR [bp-14]	;hbr
	call	FAR PTR SELECTOBJECT
	push	ax
	call	FAR PTR DELETEOBJECT
; Line 1636
	push	WORD PTR [bp-28]	;hDCMem
	call	FAR PTR DELETEDC
; Line 1637
	push	WORD PTR [bp+4]	;hWnd
	push	WORD PTR [bp-44]	;hDC
	call	FAR PTR RELEASEDC
; Line 1640
	mov	WORD PTR [bp-12],0	;cx
	jmp	SHORT $F1940
	nop	
$FC1941:
	mov	bx,ax
	mov	BYTE PTR $S1348_szScore[bx],0
	inc	WORD PTR [bp-12]	;cx
$F1940:
	mov	ax,WORD PTR [bp-12]	;cx
	cmp	WORD PTR $S1347_nScoreLen,ax
	jg	$FC1941
; Line 1641
$EX1920:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	2
	nop	

NCPAINTHYPEROID	ENDP
; Line 1649
	PUBLIC	HYPEROIDWNDPROC
HYPEROIDWNDPROC	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	mov	ax,4
	call	FAR PTR __aFchkstk
;	hWnd = 14
;	message = 12
;	wParam = 10
;	lParam = 6
; Line 1650
	mov	ax,WORD PTR [bp+12]	;message
	cmp	ax,134
	jbe	$JCC11250
	jmp	$L20026
$JCC11250:
	cmp	ax,133
	jb	$JCC11258
	jmp	$SC1982
$JCC11258:
	cmp	ax,20
	jne	$JCC11266
	jmp	$SC1981
$JCC11266:
	ja	$SD1967
	dec	al
	je	$SC1952
	dec	al
	jne	$JCC11279
	jmp	$SC1986
$JCC11279:
	sub	al,13
	jne	$JCC11286
	jmp	$SC1983
$JCC11286:
	sub	al,4
	jne	$JCC11293
	jmp	$SC1968
$JCC11293:
	jmp	SHORT $SD1967
; Line 1651
	nop	
	nop	
; Line 1652
$SC1952:
; Line 1653
	call	RESTARTHYPEROID
; Line 1654
	push	WORD PTR [bp+14]	;hWnd
	push	1
	push	WORD PTR _nDrawDelay
	push	0
	push	0
	call	FAR PTR SETTIMER
; Line 1655
	push	WORD PTR [bp+14]	;hWnd
	call	NCPAINTHYPEROID
; Line 1656
	jmp	SHORT $L20087
	nop	
; Line 1658
$SC1953:
; Line 1659
	mov	ax,WORD PTR [bp+10]	;wParam
	dec	ax
	je	$SC1958
	dec	ax
	je	$SC1959
; Line 1672
	jmp	SHORT $L20087
; Line 1660
	nop	
; Line 1661
$SC1958:
; Line 1662
	push	WORD PTR [bp+14]	;hWnd
	call	CHECKSCORE
; Line 1663
	push	WORD PTR [bp+14]	;hWnd
	call	DRAWOBJECTS
; Line 1664
$L20087:
	sub	ax,ax
$L20088:
	sub	dx,dx
	jmp	$EX1947
	nop	
; Line 1666
$SC1959:
; Line 1667
	push	WORD PTR [bp+14]	;hWnd
	push	2
	call	FAR PTR KILLTIMER
; Line 1668
	mov	WORD PTR _bRestart,0
; Line 1669
	call	RESTARTHYPEROID
	jmp	SHORT $L20087
	nop	
; Line 1674
$SC1960:
; Line 1675
	mov	ax,WORD PTR [bp+10]	;wParam
	sub	ax,200
	je	$SC1965
	dec	ax
	je	$SC1966
$SD1967:
; Line 1686
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+12]	;message
	push	WORD PTR [bp+10]	;wParam
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;lParam
	call	FAR PTR DEFWINDOWPROC
	jmp	$EX1947
; Line 1676
; Line 1677
$SC1965:
; Line 1678
	push	WORD PTR [bp+14]	;hWnd
	call	NEWGAME
; Line 1688
	jmp	SHORT $L20087
; Line 1681
$SC1966:
; Line 1682
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR ABOUTHYPEROID
; Line 1683
	jmp	SHORT $L20087
; Line 1685
$SC1968:
; Line 1691
	push	0
	call	PANIC
	jmp	SHORT $SD1967
	nop	
; Line 1694
$SC1969:
; Line 1695
	cmp	WORD PTR [bp+10],27	;wParam
$L20091:
	jne	$L20087
	push	1
	call	PANIC
; Line 1696
	jmp	SHORT $L20087
	nop	
; Line 1698
$SC1971:
; Line 1701
	test	WORD PTR [bp+8],8192
	jne	$SD1967
; Line 1704
; Line 1705
	mov	ax,WORD PTR [bp+10]	;wParam
	cmp	ax,32
	je	$L20087
	ja	$SD1967
	sub	al,9
	je	$L20087
	sub	al,18
	jne	$SD1967
; Line 1706
; Line 1708
	cmp	WORD PTR [bp+12],260	;message
	jmp	SHORT $L20091
$SC1981:
; Line 1719
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+10]	;wParam
	call	ERASEHYPEROIDBKGND
	cwd	
	jmp	$EX1947
	nop	
; Line 1721
$SC1982:
; Line 1723
	push	WORD PTR [bp+14]	;hWnd
	call	NCPAINTHYPEROID
; Line 1724
$L20090:
	mov	ax,1
	jmp	$L20088
; Line 1726
$SC1983:
; Line 1727
	push	WORD PTR [bp+14]	;hWnd
	call	PAINTHYPEROID
; Line 1728
	jmp	$L20087
	nop	
; Line 1730
$SC1984:
; Line 1731
;	hDC = -4
; Line 1732
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR GETDC
	mov	WORD PTR [bp-4],ax	;hDC
; Line 1733
	push	ax
	push	WORD PTR _hAppPalette
	push	0
	call	FAR PTR SELECTPALETTE
; Line 1734
	push	WORD PTR [bp-4]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1735
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp-4]	;hDC
	call	FAR PTR RELEASEDC
	jmp	SHORT $L20090
; Line 1739
$SC1986:
; Line 1740
	push	WORD PTR [bp+14]	;hWnd
	push	1
	call	FAR PTR KILLTIMER
; Line 1741
	push	WORD PTR [bp+14]	;hWnd
	push	2
	call	FAR PTR KILLTIMER
; Line 1742
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR SAVEHYPEROIDWINDOWPOS
; Line 1743
	push	0
	call	FAR PTR POSTQUITMESSAGE
; Line 1744
	jmp	$L20087
; Line 1746
$L20026:
	cmp	ax,274
	jne	$JCC11613
	jmp	$SC1960
$JCC11613:
	ja	$L20027
	sub	ax,258
	jne	$JCC11623
	jmp	$SC1969
$JCC11623:
	sub	ax,2
	jae	$JCC11631
	jmp	$SD1967
$JCC11631:
	sub	ax,2
	ja	$JCC11639
	jmp	$SC1971
$JCC11639:
	jmp	$SD1967
	nop	
$L20027:
	sub	ax,275
	jne	$JCC11651
	jmp	$SC1953
$JCC11651:
	sub	ax,508
	jne	$JCC11659
	jmp	$SC1984
$JCC11659:
	jmp	$SD1967
; Line 1750
	nop	
$EX1947:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10

HYPEROIDWNDPROC	ENDP
; Line 1757
HYPEROID_TEXT      ENDS
CONST      SEGMENT
$T20028	DQ	03f9921fb6134ce3er    ;	2.454369335937500E-02
$T20029	DQ	040d0000000000000r    ;	16384.00000000000
CONST      ENDS
HYPEROID_TEXT      SEGMENT
	ASSUME	CS: HYPEROID_TEXT
	PUBLIC	INITHYPEROID
INITHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	FAR PTR __aFchkstk
	push	si
;	dRad = -10
;	nCnt = -2
; Line 1762
	call	FAR PTR CREATEHYPEROIDPALETTE
	mov	WORD PTR _hAppPalette,ax
; Line 1763
	or	ax,ax
	jne	$I1991
$L20092:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
; Line 1764
$I1991:
	mov	WORD PTR [bp-2],0	;nCnt
	jmp	SHORT $F1992
; Line 1768
	nop	
$FC1993:
	inc	WORD PTR [bp-2]	;nCnt
$F1992:
	cmp	WORD PTR [bp-2],16	;nCnt
	jge	$FB1994
; Line 1765
; Line 1766
	push	0
	push	1
	push	256
	push	WORD PTR [bp-2]	;nCnt
	call	FAR PTR CREATEPEN
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,1
	mov	WORD PTR _hPen[bx],ax
; Line 1767
	or	ax,ax
	jne	$FC1993
	jmp	SHORT $L20092
	nop	
$FB1994:
; Line 1769
	mov	WORD PTR [bp-2],0	;nCnt
	jmp	SHORT $F1996
; Line 1773
	nop	
$FC1997:
	inc	WORD PTR [bp-2]	;nCnt
$F1996:
	cmp	WORD PTR [bp-2],17	;nCnt
	jge	$FB1998
; Line 1770
; Line 1771
	push	WORD PTR _hAppInst
	mov	ax,WORD PTR [bp-2]	;nCnt
	add	ax,50
	sub	dx,dx
	push	dx
	push	ax
	call	FAR PTR LOADBITMAP
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,1
	mov	WORD PTR _hBitmap[bx],ax
; Line 1772
	cmp	WORD PTR _hPen[bx],0
	jne	$FC1997
	jmp	SHORT $L20092
$FB1998:
; Line 1776
	call	FAR PTR GETCURRENTTIME
	mov	WORD PTR $S1346_dwSeed,ax
	mov	WORD PTR $S1346_dwSeed+2,dx
; Line 1779
	mov	WORD PTR [bp-2],0	;nCnt
$FC2001:
; Line 1780
; Line 1782
	fild	WORD PTR [bp-2]	;nCnt
	fmul	QWORD PTR $T20028
	fst	QWORD PTR [bp-10]	;dRad
	fwait	
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	FAR PTR _cos
	add	sp,8
	mov	bx,ax
	fld	QWORD PTR [bx]
	fmul	QWORD PTR $T20029
	call	FAR PTR __aFftol
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,1
	mov	WORD PTR _nCos[bx],ax
; Line 1783
	fld	QWORD PTR [bp-10]	;dRad
	mov	ax,bx
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	mov	si,ax
	call	FAR PTR _sin
	add	sp,8
	mov	bx,ax
	fld	QWORD PTR [bx]
	fmul	QWORD PTR $T20029
	call	FAR PTR __aFftol
	mov	WORD PTR _nSin[si],ax
; Line 1784
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],256	;nCnt
	jl	$FC2001
; Line 1787
	call	FAR PTR GETHYPEROIDINI
; Line 1790
	mov	WORD PTR [bp-2],0	;nCnt
$FC2004:
; Line 1791
	push	OFFSET DGROUP:_FreeList
	imul	ax,WORD PTR [bp-2],88	;nCnt
	add	ax,OFFSET DGROUP:_Obj
	push	ax
	call	ADDHEAD
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],100	;nCnt
	jl	$FC2004
; Line 1794
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR _npPlayer,ax
; Line 1795
	mov	bx,ax
	mov	BYTE PTR [bx+23],5
; Line 1796
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+12],256
; Line 1797
	mov	WORD PTR [bp-2],0	;nCnt
$FC2007:
; Line 1798
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,2
	mov	ax,WORD PTR $S1351_Player[bx]
	mov	dx,WORD PTR $S1351_Player[bx+2]
	mov	cx,bx
	mov	bx,WORD PTR _npPlayer
	mov	si,cx
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],5	;nCnt
	jl	$FC2007
; Line 1800
	mov	ax,1
; Line 1801
	pop	si
	mov	sp,bp
	pop	bp
	ret	

INITHYPEROID	ENDP
; Line 1808
	PUBLIC	EXITHYPEROID
EXITHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	FAR PTR __aFchkstk
;	nCnt = -2
; Line 1811
	cmp	WORD PTR _hAppPalette,0
	je	$I2011
	push	WORD PTR _hAppPalette
	call	FAR PTR DELETEOBJECT
; Line 1812
$I2011:
	mov	WORD PTR [bp-2],0	;nCnt
$FC2013:
; Line 1813
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,1
	cmp	WORD PTR _hPen[bx],0
	je	$I2015
	push	WORD PTR _hPen[bx]
	call	FAR PTR DELETEOBJECT
; Line 1814
$I2015:
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],16	;nCnt
	jl	$FC2013
	mov	WORD PTR [bp-2],0	;nCnt
$FC2017:
; Line 1815
	mov	bx,WORD PTR [bp-2]	;nCnt
	shl	bx,1
	cmp	WORD PTR _hBitmap[bx],0
	je	$I2019
	push	WORD PTR _hBitmap[bx]
	call	FAR PTR DELETEOBJECT
; Line 1816
$I2019:
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],17	;nCnt
	jl	$FC2017
	mov	sp,bp
	pop	bp
	ret	
	nop	

EXITHYPEROID	ENDP
; Line 1824
	PUBLIC	WINMAIN
WINMAIN	PROC FAR
	push	ds
	pop	ax
	nop	
	inc	bp
	push	bp
	mov	bp,sp
	push	ds
	mov	ds,ax
	mov	ax,20
	call	FAR PTR __aFchkstk
;	msg = -20
;	hInstance = 14
;	hPrevInstance = 12
;	lpszCmdLine = 8
;	nCmdShow = 6
; Line 1827
	mov	ax,WORD PTR [bp+14]	;hInstance
	mov	WORD PTR _hAppInst,ax
; Line 1828
	cmp	WORD PTR [bp+12],0	;hPrevInstance
	jne	$I2026
; Line 1829
; Line 1831
	call	FAR PTR CREATEHYPEROIDCLASS
	or	ax,ax
	jne	$I2028
$L20096:
	sub	ax,ax
	jmp	SHORT $EX2024
	nop	
$I2026:
; Line 1834
; Line 1836
	push	WORD PTR [bp+12]	;hPrevInstance
	push	OFFSET DGROUP:_szAppName
	push	32
	call	FAR PTR GETINSTANCEDATA
; Line 1837
$I2028:
; Line 1838
	call	INITHYPEROID
	or	ax,ax
	je	$Abort2030
; Line 1839
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;lpszCmdLine
	push	WORD PTR [bp+6]	;nCmdShow
	call	FAR PTR CREATEHYPEROIDWINDOW
	mov	WORD PTR _hAppWnd,ax
; Line 1840
	or	ax,ax
	je	$L20096
; Line 1842
	jmp	SHORT $L20097
	nop	
$FC2033:
; Line 1843
; Line 1844
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	call	FAR PTR TRANSLATEMESSAGE
; Line 1845
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	call	FAR PTR DISPATCHMESSAGE
; Line 1846
$L20097:
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	push	0
	push	0
	push	0
	call	FAR PTR GETMESSAGE
	or	ax,ax
	jne	$FC2033
; Line 1848
$Abort2030:
; Line 1849
	call	EXITHYPEROID
; Line 1850
	mov	ax,WORD PTR [bp-16]
; Line 1851
$EX2024:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10

WINMAIN	ENDP
HYPEROID_TEXT	ENDS
END
