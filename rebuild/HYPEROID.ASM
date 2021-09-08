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
	.8087
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
EXTRN	__aFftol:FAR
EXTRN	POLYLINE:FAR
EXTRN	FILLRECT:FAR
EXTRN	SETMAPMODE:FAR
EXTRN	__aFulmul:FAR
EXTRN	__aFlmul:FAR
EXTRN	_wsprintf:FAR
EXTRN	PATBLT:FAR
EXTRN	SETWINDOWEXT:FAR
EXTRN	BITBLT:FAR
EXTRN	SETVIEWPORTORG:FAR
EXTRN	__aFldiv:FAR
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
;	x = 4
; Line 108
	mov	ax,WORD PTR [bp+4]	;x
	cwd	
	push	dx
	push	ax
	mov	ax,17405
	mov	dx,3
	push	dx
	push	ax
	push	WORD PTR $S1346_dwSeed+2
	push	WORD PTR $S1346_dwSeed
	call	FAR PTR __aFulmul
	add	ax,-24893
	adc	dx,38
	mov	WORD PTR $S1346_dwSeed,ax
	mov	WORD PTR $S1346_dwSeed+2,dx
	and	dh,127
	sub	cx,cx
	push	cx
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
	nop	

ARAND	ENDP
; Line 116
	PUBLIC	ADDHEAD
ADDHEAD	PROC NEAR
	push	bp
	mov	bp,sp
	push	di
	push	si
;	npList = 6
;	npNode = 4
; Line 117
	mov	bx,WORD PTR [bp+6]	;npList
	cmp	WORD PTR [bx],0
	je	$I1361
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
; Line 123
	jmp	SHORT $EX1360
	nop	
$I1361:
; Line 125
	mov	ax,WORD PTR [bp+4]	;npNode
	mov	WORD PTR [bx+2],ax
	mov	WORD PTR [bx],ax
; Line 126
	mov	bx,ax
	sub	cx,cx
	mov	WORD PTR [bx+2],cx
	mov	WORD PTR [bx],cx
; Line 128
$EX1360:
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
	sub	sp,2
	push	si
;	npList = 4
;	npNode = -2
; Line 136
	mov	bx,WORD PTR [bp+4]	;npList
	cmp	WORD PTR [bx],0
	je	$I1365
; Line 138
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npNode
; Line 139
	cmp	WORD PTR [bx+2],ax
	je	$I1367
; Line 141
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	si,WORD PTR [bp+4]	;npList
	mov	WORD PTR [si],ax
; Line 142
	mov	bx,WORD PTR [bx]
	mov	WORD PTR [bx+2],0
; Line 144
	jmp	SHORT $I1368
	nop	
$I1367:
	sub	ax,ax
	mov	WORD PTR [bx+2],ax
	mov	WORD PTR [bx],ax
$I1368:
; Line 145
	mov	ax,WORD PTR [bp-2]	;npNode
	jmp	SHORT $EX1364
; Line 147
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
;	npList = 6
;	npNode = 4
; Line 156
	mov	bx,WORD PTR [bp+4]	;npNode
	cmp	WORD PTR [bx+2],0
	je	$I1373
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bx+2]
	jmp	SHORT $L20128
	nop	
$I1373:
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bp+6]	;npList
$L20128:
	mov	WORD PTR [bx],ax
; Line 158
	mov	bx,WORD PTR [bp+4]	;npNode
	cmp	WORD PTR [bx],0
	je	$I1375
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bx]
	jmp	SHORT $L20129
$I1375:
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp+6]	;npList
$L20129:
	mov	WORD PTR [bx+2],ax
; Line 160
	pop	bp
	ret	4
	nop	

REMOVE	ENDP
; Line 167
	PUBLIC	DRAWOBJECT
DRAWOBJECT	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,52
	push	si
;	hDC = 6
;	npObj = 4
;	nCnt = -2
;	nDir = -40
;	x = -36
;	y = -38
;	Pts = -34
;	wDeg = -42
;	nLen = -44
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
	jmp	SHORT $L20130
$I1385:
	cmp	WORD PTR [bp-36],8492	;x
	jle	$I1386
	mov	ax,-8492
$L20130:
	mov	WORD PTR [bp-36],ax	;x
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+4],ax
; Line 176
$I1386:
	cmp	WORD PTR [bp-38],-8492	;y
	jge	$I1388
	mov	ax,8492
	jmp	SHORT $L20131
	nop	
$I1388:
	cmp	WORD PTR [bp-38],8492	;y
	jle	$I1389
	mov	ax,-8492
$L20131:
	mov	WORD PTR [bp-38],ax	;y
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+6],ax
; Line 179
$I1389:
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	dec	ax
	mov	WORD PTR [bp-2],ax	;nCnt
	or	ax,ax
	jl	$FB1393
	mov	si,ax
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-34][si]
	mov	WORD PTR [bp-46],ax
	add	si,WORD PTR [bp+4]	;npObj
	add	si,24
	mov	WORD PTR [bp-48],si
$F1391:
; Line 181
	mov	bx,WORD PTR [bp-48]
	mov	al,BYTE PTR [bx]
	add	al,BYTE PTR [bp-40]	;nDir
	sub	ah,ah
	mov	WORD PTR [bp-42],ax	;wDeg
; Line 182
	mov	cx,WORD PTR [bx+2]
	mov	WORD PTR [bp-44],cx	;nLen
; Line 183
	mov	dx,16384
	sub	bx,bx
	push	bx
	push	dx
	mov	si,ax
	shl	si,1
	mov	ax,WORD PTR _nCos[si]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	ax,WORD PTR [bp-36]	;x
	mov	bx,WORD PTR [bp-46]
	mov	WORD PTR [bx],ax
; Line 184
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-42]	;wDeg
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	imul	WORD PTR [bp-44]	;nLen
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	ax,WORD PTR [bp-38]	;y
	mov	bx,WORD PTR [bp-46]
	mov	WORD PTR [bx+2],ax
	sub	WORD PTR [bp-46],4
	sub	WORD PTR [bp-48],4
	dec	WORD PTR [bp-2]	;nCnt
	jns	$F1391
; Line 185
$FB1393:
; Line 187
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	BYTE PTR [bx+23],1
	ja	$JCC537
	jmp	$I1396
$JCC537:
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
	jg	$JCC586
	jmp	$EX1379
$JCC586:
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
	or	ax,ax
	jl	$EX1379
	mov	si,ax
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-34][si]
	mov	WORD PTR [bp-50],ax
	add	si,WORD PTR [bp+4]	;npObj
	add	si,56
	mov	WORD PTR [bp-52],si
$F1398:
; Line 196
	mov	bx,WORD PTR [bp-50]
	sub	WORD PTR [bp-50],4
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp-52]
	sub	WORD PTR [bp-52],4
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	dec	WORD PTR [bp-2]	;nCnt
	jns	$F1398
	jmp	SHORT $EX1379
; Line 199
$I1396:
; Line 201
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bx+56]
	push	WORD PTR [bx+58]
	sub	ax,ax
	mov	dx,256
	push	dx
	push	ax
	call	FAR PTR SETPIXEL
; Line 202
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	WORD PTR [bx+18],0
	jle	$EX1379
; Line 204
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bp-34]	;Pts
	push	WORD PTR [bp-32]
	mov	al,BYTE PTR [bx+22]
	sub	ah,ah
	mov	cx,256
	push	cx
	push	ax
	call	FAR PTR SETPIXEL
; Line 205
	mov	ax,WORD PTR [bp-34]	;Pts
	mov	dx,WORD PTR [bp-32]
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+56],ax
	mov	WORD PTR [bx+58],dx
; Line 208
$EX1379:
	pop	si
	mov	sp,bp
	pop	bp
	ret	4

DRAWOBJECT	ENDP
; Line 215
	PUBLIC	SETRESTART
SETRESTART	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,36
;	Restart = 4
;	Pt = -36
;	szBuff = -32
; Line 219
	cmp	WORD PTR _bRestart,0
	je	$JCC787
	jmp	$EX1404
$JCC787:
; Line 220
	push	WORD PTR _hAppWnd
	mov	ax,2
	push	ax
	mov	ax,5000
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR SETTIMER
; Line 221
	mov	WORD PTR _bRestart,1
; Line 223
	sub	ax,ax
	mov	WORD PTR [bp-34],ax
	mov	WORD PTR [bp-36],ax	;Pt
; Line 224
	mov	ax,WORD PTR [bp+4]	;Restart
; Line 236
	or	ax,ax
	je	$SC1412
	dec	ax
	je	$SC1414
	dec	ax
	je	$SC1416
	mov	sp,bp
	pop	bp
	ret	2
; Line 226
$SC1412:
; Line 227
	mov	ax,OFFSET DGROUP:$SG1413
	push	ax
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	mov	al,5
	push	ax
	mov	ax,400
	push	ax
	call	FAR PTR SPINLETTERS
; Line 228
	mov	sp,bp
	pop	bp
	ret	2
; Line 229
$SC1414:
; Line 230
	mov	ax,OFFSET DGROUP:$SG1415
	jmp	SHORT $L20132
	nop	
; Line 232
$SC1416:
; Line 233
	mov	ax,WORD PTR _nLevel
	inc	ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1417
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-32]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 234
	lea	ax,WORD PTR [bp-32]	;szBuff
$L20132:
	push	ax
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	mov	al,9
	push	ax
	mov	ax,300
	push	ax
	call	FAR PTR PRINTLETTERS
; Line 237
$EX1404:
	mov	sp,bp
	pop	bp
	ret	2
	nop	

SETRESTART	ENDP
; Line 244
	PUBLIC	PRINTPLAYERMESSAGE
PRINTPLAYERMESSAGE	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,8
;	npszText = 4
;	Pos = -4
;	Vel = -8
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
	mov	al,7
	push	ax
	mov	ax,150
	push	ax
	call	FAR PTR PRINTLETTERS
; Line 252
	mov	sp,bp
	pop	bp
	ret	2
	nop	

PRINTPLAYERMESSAGE	ENDP
; Line 259
	PUBLIC	ADDEXTRALIFE
ADDEXTRALIFE	PROC NEAR
	push	bp
	mov	bp,sp
; Line 260
	mov	ax,OFFSET DGROUP:$SG1424
	push	ax
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
	jbe	$EX1423
	mov	BYTE PTR [bx+22],3
; Line 264
$EX1423:
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
	sub	sp,6
	push	si
;	hDC = 6
;	npObj = 4
;	nCnt = -2
;	npFlame = -4
	mov	WORD PTR [bp-6],0
; Line 274
$F1430:
; Line 277
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npFlame
	or	ax,ax
	jne	$JCC1080
	jmp	$EX1428
$JCC1080:
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
	mov	ax,WORD PTR [bp-6]
	mov	cx,6
	cwd	
	idiv	cx
	add	ax,WORD PTR [bx+14]
	mov	WORD PTR [si+14],ax
; Line 283
	mov	WORD PTR [si+16],0
; Line 284
	mov	ax,8
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_FlameList
	push	ax
	push	si
	call	ADDHEAD
	add	BYTE PTR [bp-5],1
	cmp	WORD PTR [bp-6],1536
	jge	$JCC1251
	jmp	$F1430
$JCC1251:
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
	sub	sp,10
	push	si
;	hDC = 6
;	npObj = 4
;	nCnt = -2
;	nSize = -4
;	npFlame = -6
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
	cmp	WORD PTR [bp-4],0	;nSize
	jg	$JCC1298
	jmp	$FB1442
$JCC1298:
	mov	ax,WORD PTR [bp+4]	;npObj
	add	ax,24
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-10],0
$F1440:
; Line 305
	mov	ax,2
	push	ax
	call	ARAND
	or	ax,ax
	je	$JCC1326
	jmp	$FC1441
$JCC1326:
; Line 306
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-6],ax	;npFlame
	or	ax,ax
	jne	$JCC1343
	jmp	$EX1437
$JCC1343:
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
	mov	ax,32
	push	ax
	call	ARAND
	mov	cx,ax
	mov	ax,WORD PTR [bp-10]
	cwd	
	idiv	WORD PTR [bp-4]	;nSize
	add	cx,ax
	mov	bx,WORD PTR [bp+4]	;npObj
	add	cx,WORD PTR [bx+14]
	mov	WORD PTR [si+14],cx
; Line 312
	mov	ax,31
	push	ax
	call	ARAND
	sub	ax,15
	mov	WORD PTR [si+16],ax
; Line 313
	mov	ax,16
	push	ax
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
	mov	bx,WORD PTR [bp-8]
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	WORD PTR [si+24],ax
	mov	WORD PTR [si+26],dx
; Line 317
	mov	ax,WORD PTR [bp-4]	;nSize
	sub	ax,WORD PTR [bp-2]	;nCnt
	dec	ax
	jne	$I1446
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+24]
	mov	dx,WORD PTR [bx+26]
	jmp	SHORT $I1447
$I1446:
	mov	bx,WORD PTR [bp-8]
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
$I1447:
	mov	bx,WORD PTR [bp-6]	;npFlame
	mov	WORD PTR [bx+28],ax
	mov	WORD PTR [bx+30],dx
; Line 319
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_FlameList
	push	ax
	push	bx
	call	ADDHEAD
; Line 302
$FC1441:
	add	WORD PTR [bp-8],4
	add	BYTE PTR [bp-9],1
	mov	ax,WORD PTR [bp-4]	;nSize
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],ax	;nCnt
	jge	$JCC1606
	jmp	$F1440
$JCC1606:
; Line 321
$FB1442:
; Line 322
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bp+4]	;npObj
	call	HIT
; Line 323
$EX1437:
	pop	si
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
	sub	sp,8
	push	si
;	hDC = 6
;	npObj = 4
;	Vel = -6
;	nMass = -2
;	nSpin = -8
; Line 334
	cmp	WORD PTR _nSafe,0
	je	$JCC1640
	jmp	$I1455
$JCC1640:
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jg	$JCC1653
	jmp	$I1455
$JCC1653:
; Line 337
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
	nop	
; Line 359
$I1456:
	mov	BYTE PTR [bx+22],3
; Line 360
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR _npPlayer
	call	EXPLODE
; Line 361
	sub	ax,ax
	push	ax
	call	SETRESTART
; Line 334
$I1455:
	sub	ax,ax
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
	sub	sp,12
	push	si
;	cLetter = 8
;	nSize = 6
;	npLtr = -4
;	nCnt = -6
;	npDesc = -8
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
$L20133:
	mov	WORD PTR [bp-8],ax	;npDesc
; Line 376
	jmp	SHORT $I1465
	nop	
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
	jmp	SHORT $L20133
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
	jmp	SHORT $L20133
$I1468:
	cmp	BYTE PTR [bp+8],46	;cLetter
	je	$JCC1996
	jmp	$I1470
$JCC1996:
	mov	WORD PTR [bp-8],OFFSET DGROUP:$SG1471	;npDesc
; Line 379
$I1465:
; Line 381
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npLtr
	or	ax,ax
	jne	$JCC2018
	jmp	$I1473
$JCC2018:
; Line 383
	mov	bx,ax
	mov	WORD PTR [bx+12],1
; Line 385
	sub	ax,ax
	mov	WORD PTR [bx+14],ax
	mov	WORD PTR [bx+16],ax
; Line 386
	mov	WORD PTR [bx+18],40
; Line 387
	mov	BYTE PTR [bx+22],3
; Line 388
	push	WORD PTR [bp-8]	;npDesc
	call	FAR PTR _strlen
	add	sp,2
	mov	WORD PTR [bp-6],ax	;nCnt
	mov	bx,WORD PTR [bp-4]	;npLtr
	mov	BYTE PTR [bx+23],al
	mov	ax,WORD PTR [bp-6]	;nCnt
	shl	ax,1
	shl	ax,1
	add	bx,ax
	add	bx,26
	mov	WORD PTR [bp-12],bx
; Line 389
	jmp	SHORT $L20134
$FC1475:
; Line 391
	mov	bx,WORD PTR [bp-8]	;npDesc
	mov	si,WORD PTR [bp-6]	;nCnt
	mov	al,BYTE PTR [bx][si]
	cbw	
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _LetterPart[bx-388]
	mov	dx,WORD PTR _LetterPart[bx-386]
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx-2],ax
	mov	WORD PTR [bx],dx
; Line 392
	mov	bx,WORD PTR [bp-12]
	push	WORD PTR [bx]
	push	WORD PTR [bp+6]	;nSize
	mov	ax,256
	push	ax
	call	FAR PTR MULDIV
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx],ax
; Line 393
$L20134:
	sub	WORD PTR [bp-12],4
	mov	ax,WORD PTR [bp-6]	;nCnt
	dec	WORD PTR [bp-6]	;nCnt
	or	ax,ax
	jne	$FC1475
; Line 394
	mov	ax,OFFSET DGROUP:_LetterList
	push	ax
	push	WORD PTR [bp-4]	;npLtr
	call	ADDHEAD
; Line 396
$I1473:
	mov	ax,WORD PTR [bp-4]	;npLtr
	jmp	SHORT $EX1460
; Line 379
$I1470:
	sub	ax,ax
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
	sub	sp,4
;	hDC = 4
;	npLtr = -2
;	npNext = -4
; Line 407
	mov	ax,WORD PTR _LetterList
	mov	WORD PTR [bp-2],ax	;npLtr
	or	ax,ax
	je	$EX1478
$F1481:
; Line 409
	mov	bx,WORD PTR [bp-2]	;npLtr
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 410
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 419
	or	ax,ax
	je	$SC1489
	sub	ax,3
	je	$SC1488
	jmp	SHORT $SB1485
	nop	
; Line 415
$SC1489:
; Line 416
	mov	ax,OFFSET DGROUP:_LetterList
	push	ax
	push	WORD PTR [bp-2]	;npLtr
	call	REMOVE
; Line 417
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npLtr
	call	ADDHEAD
; Line 418
	jmp	SHORT $SB1485
; Line 412
$SC1488:
; Line 413
	mov	bx,WORD PTR [bp-2]	;npLtr
	dec	BYTE PTR [bx+22]
; Line 419
$SB1485:
; Line 420
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npLtr
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npLtr
	or	ax,ax
	jne	$F1481
; Line 422
$EX1478:
	mov	sp,bp
	pop	bp
	ret	2
	nop	

DRAWLETTERS	ENDP
; Line 429
	PUBLIC	CREATEBONUS
CREATEBONUS	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,8
;	npBonus = -4
;	nCnt = -2
; Line 433
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npBonus
	or	ax,ax
	jne	$JCC2294
	jmp	$EX1491
$JCC2294:
; Line 435
	mov	ax,16984
	push	ax
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+4],ax
; Line 436
	mov	WORD PTR [bx+6],-8492
; Line 437
	sub	ax,ax
	mov	WORD PTR [bx+10],ax
	mov	WORD PTR [bx+8],ax
; Line 438
	mov	ax,256
	push	ax
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+14],ax
; Line 439
	mov	ax,2
	push	ax
	call	ARAND
	cmp	ax,1
	sbb	ax,ax
	and	al,232
	add	ax,12
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+16],ax
; Line 440
	mov	ax,4
	push	ax
	call	ARAND
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	WORD PTR [bx+18],ax
; Line 441
	mov	ax,128
	push	ax
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
	mov	WORD PTR [bp-6],OFFSET DGROUP:$S1355_Bonus
	lea	ax,WORD PTR [bx+24]
	mov	WORD PTR [bp-8],ax
; Line 445
$F1495:
; Line 446
	mov	bx,WORD PTR [bp-6]
	add	WORD PTR [bp-6],4
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp-8]
	add	WORD PTR [bp-8],4
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	cmp	WORD PTR [bp-6],OFFSET DGROUP:$S1355_Bonus+24
	jb	$F1495
; Line 447
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_BonusList
	push	ax
	push	bx
	call	ADDHEAD
; Line 450
$EX1491:
	mov	sp,bp
	pop	bp
	ret	

CREATEBONUS	ENDP
; Line 457
	PUBLIC	DRAWBONUSES
DRAWBONUSES	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,52
	push	si
;	hDC = 4
;	npBonus = -2
;	npNext = -4
;	npShot = -8
;	nDelta = -6
;	rect = -16
;	szBuff = -48
;	lBonus = -52
; Line 461
	cmp	WORD PTR _nBadGuys,0
	je	$I1504
	dec	WORD PTR $S1503_nNextBonus
	jns	$I1504
; Line 463
	call	CREATEBONUS
; Line 464
	mov	WORD PTR $S1503_nNextBonus,1000
; Line 467
$I1504:
	mov	ax,WORD PTR _BonusList
	mov	WORD PTR [bp-2],ax	;npBonus
	or	ax,ax
	jne	$JCC2589
	jmp	$EX1500
$JCC2589:
$F1505:
; Line 473
	mov	bx,WORD PTR [bp-2]	;npBonus
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
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jge	$JCC2648
	jmp	$I1511
$JCC2648:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jl	$JCC2659
	jmp	$I1511
$JCC2659:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jge	$JCC2670
	jmp	$I1511
$JCC2670:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$JCC2681
	jmp	$I1511
$JCC2681:
; Line 479
	cmp	WORD PTR [bx+18],0
	jg	$JCC2690
	jmp	$I1512
$JCC2690:
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+18]
; Line 504
	dec	ax
	je	$SC1517
	dec	ax
	je	$SC1522
	dec	ax
	je	$SC1524
	dec	ax
	je	$SC1526
	jmp	SHORT $I1512
	nop	
; Line 481
$SC1517:
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
	mov	ax,OFFSET DGROUP:$SG1521
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-48]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 488
	lea	ax,WORD PTR [bp-48]	;szBuff
$L20135:
	push	ax
	call	PRINTPLAYERMESSAGE
; Line 490
	jmp	SHORT $I1512
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
	mov	ax,OFFSET DGROUP:$SG1523
	jmp	SHORT $L20135
	nop	
; Line 497
$SC1524:
; Line 498
	inc	WORD PTR _nBomb
; Line 499
	mov	ax,OFFSET DGROUP:$SG1525
	jmp	SHORT $L20135
	nop	
; Line 501
$SC1526:
; Line 502
	call	ADDEXTRALIFE
; Line 505
$I1512:
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	WORD PTR [bx+18],0
; Line 506
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 507
	mov	ax,OFFSET DGROUP:_BonusList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 508
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 510
	jmp	$I1527
	nop	
$I1511:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jg	$I1527
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jle	$I1527
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$I1527
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$I1527
; Line 512
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$I1527
$F1529:
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
	jge	$FC1530
; Line 515
	mov	WORD PTR [bx+18],1
; Line 516
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	WORD PTR [bx+18],0
; Line 517
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 518
	mov	ax,OFFSET DGROUP:_BonusList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 519
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 512
$FC1530:
	mov	bx,WORD PTR [bp-8]	;npShot
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1529
; Line 522
$I1527:
	mov	bx,WORD PTR [bp-2]	;npBonus
	cmp	WORD PTR [bx+18],0
	je	$I1534
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1534
; Line 524
	mov	bx,WORD PTR [bp-2]	;npBonus
	dec	WORD PTR [bx+18]
; Line 525
	mov	ax,128
	push	ax
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
	jne	$I1534
; Line 529
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npBonus
	call	EXPLODE
; Line 530
	mov	ax,OFFSET DGROUP:_BonusList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 531
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 534
$I1534:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npBonus
	sub	ax,WORD PTR [bx+4]
$L20136:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 535
	cmp	ax,-16
	jl	$FB1539
	cmp	ax,16
	jle	$L20021
$FB1539:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20136
$L20021:
; Line 536
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+8],ax
; Line 537
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	sub	ax,WORD PTR [bx+6]
$L20137:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 538
	cmp	ax,-16
	jl	$FB1543
	cmp	ax,16
	jle	$L20022
$FB1543:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20137
	nop	
$L20022:
; Line 539
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+10],ax
; Line 540
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npBonus
	or	ax,ax
	je	$JCC3217
	jmp	$F1505
$JCC3217:
; Line 542
$EX1500:
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
	sub	sp,12
;	hDC = 4
;	npShot = -2
;	npNext = -4
;	rect = -12
; Line 552
	mov	ax,WORD PTR _HunterShotList
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC3244
	jmp	$EX1545
$JCC3244:
$F1548:
; Line 556
	mov	bx,WORD PTR [bp-2]	;npShot
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
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1552
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+4],ax
	jge	$I1552
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$I1552
	mov	ax,WORD PTR [bp-6]
	cmp	WORD PTR [bx+6],ax
	jge	$I1552
; Line 562
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	HITPLAYER
; Line 563
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+18],1
; Line 565
$I1552:
	mov	bx,WORD PTR [bp-2]	;npShot
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 574
	or	ax,ax
	je	$SC1558
	sub	ax,7
	je	$SC1557
	jmp	SHORT $SB1554
; Line 570
$SC1558:
; Line 571
	mov	ax,OFFSET DGROUP:_HunterShotList
	push	ax
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 572
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 573
	jmp	SHORT $SB1554
; Line 567
$SC1557:
; Line 568
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],6
; Line 574
$SB1554:
; Line 575
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	je	$JCC3412
	jmp	$F1548
$JCC3412:
; Line 577
$EX1545:
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
	sub	sp,2
	push	si
;	npHunt = 4
;	npShot = -2
; Line 587
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC3443
	jmp	$EX1560
$JCC3443:
; Line 589
	mov	bx,WORD PTR [bp+4]	;npHunt
	mov	ax,WORD PTR [bx+4]
	mov	si,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [si+4],ax
; Line 590
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 591
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 592
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [si+10],ax
; Line 593
	mov	WORD PTR [si+12],8
; Line 594
	mov	ax,5
	push	ax
	call	ARAND
	mov	bx,WORD PTR [bp+4]	;npHunt
	add	ax,WORD PTR [bx+14]
	dec	ax
	dec	ax
	mov	WORD PTR [si+14],ax
; Line 595
	mov	ax,2
	push	ax
	call	ARAND
	cmp	ax,1
	sbb	ax,ax
	and	al,236
	add	ax,10
	mov	WORD PTR [si+16],ax
; Line 596
	mov	ax,8
	push	ax
	call	ARAND
	add	ax,16
	mov	WORD PTR [si+18],ax
; Line 597
	mov	BYTE PTR [si+22],7
; Line 598
	mov	BYTE PTR [si+23],2
; Line 599
	mov	WORD PTR [si+24],128
; Line 600
	mov	WORD PTR [si+26],50
; Line 601
	mov	WORD PTR [si+28],0
; Line 602
	mov	WORD PTR [si+30],50
; Line 603
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	mov	cx,WORD PTR [si+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+8],ax
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	mov	cx,WORD PTR [si+18]
	add	cx,200
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+10],ax
; Line 604
	mov	ax,OFFSET DGROUP:_HunterShotList
	push	ax
	push	si
	call	ADDHEAD
; Line 606
$EX1560:
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
	sub	sp,8
;	npHunt = -4
;	nCnt = -2
; Line 617
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	jne	$JCC3668
	jmp	$EX1563
$JCC3668:
; Line 619
	mov	ax,16984
	push	ax
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+4],ax
; Line 620
	mov	WORD PTR [bx+6],-8492
; Line 621
	sub	ax,ax
	mov	WORD PTR [bx+10],ax
	mov	WORD PTR [bx+8],ax
; Line 623
	mov	ax,256
	mov	WORD PTR [bx+12],ax
	push	ax
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
	mov	ax,10
	push	ax
	call	ARAND
	inc	ax
	inc	ax
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+20],ax
; Line 627
	mov	BYTE PTR [bx+22],13
; Line 628
	mov	BYTE PTR [bx+23],8
	mov	WORD PTR [bp-6],OFFSET DGROUP:$S1354_Hunter
	lea	ax,WORD PTR [bx+24]
	mov	WORD PTR [bp-8],ax
; Line 629
$F1567:
; Line 630
	mov	bx,WORD PTR [bp-6]
	add	WORD PTR [bp-6],4
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp-8]
	add	WORD PTR [bp-8],4
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	cmp	WORD PTR [bp-6],OFFSET DGROUP:$S1354_Hunter+32
	jb	$F1567
; Line 631
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_HunterList
	push	ax
	push	bx
	call	ADDHEAD
; Line 633
	inc	WORD PTR _nBadGuys
; Line 635
$EX1563:
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
	sub	sp,14
;	hDC = 4
;	npHunt = -4
;	npNext = -2
;	npShot = -6
;	rect = -14
; Line 646
	cmp	WORD PTR _nBadGuys,0
	je	$I1575
	dec	WORD PTR $S1574_nNextHunter
	jns	$I1575
; Line 648
	call	CREATEHUNTER
; Line 649
	mov	ax,1000
	push	ax
	call	ARAND
	mov	cl,3
	mov	dx,125
	sub	dx,WORD PTR _nLevel
	shl	dx,cl
	add	dx,ax
	mov	WORD PTR $S1574_nNextHunter,dx
; Line 652
$I1575:
	mov	ax,WORD PTR _HunterList
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	jne	$JCC3958
	jmp	$EX1571
$JCC3958:
$F1576:
; Line 657
	mov	bx,WORD PTR [bp-4]	;npHunt
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
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1581
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+4],ax
	jge	$I1581
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$I1581
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+6],ax
	jge	$I1581
; Line 663
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	HITPLAYER
; Line 665
	mov	bx,WORD PTR [bp-4]	;npHunt
	dec	WORD PTR [bx+18]
	cmp	WORD PTR [bx+18],1
	jge	$I1582
; Line 667
$L20139:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20032
	mov	ax,2
	push	ax
	call	SETRESTART
$L20032:
; Line 668
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	BYTE PTR [bx+22],13
; Line 669
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 670
	mov	ax,OFFSET DGROUP:_HunterList
	push	ax
	push	WORD PTR [bp-4]	;npHunt
	call	REMOVE
; Line 671
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-4]	;npHunt
	call	ADDHEAD
; Line 673
	jmp	$I1585
	nop	
$I1582:
	mov	bx,WORD PTR [bp-4]	;npHunt
	cmp	WORD PTR [bx+18],1
	je	$JCC4127
	jmp	$I1585
$JCC4127:
	mov	BYTE PTR [bx+22],12
; Line 675
	jmp	$I1585
	nop	
$I1581:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jle	$JCC4147
	jmp	$I1585
$JCC4147:
	mov	ax,WORD PTR [bp-14]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jg	$JCC4159
	jmp	$I1585
$JCC4159:
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$I1585
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$I1585
; Line 677
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-6],ax	;npShot
	or	ax,ax
	je	$I1585
$F1587:
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
	jl	$L20037
; Line 677
$FC1588:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-6],ax	;npShot
	or	ax,ax
	jne	$F1587
	jmp	SHORT $I1585
$L20037:
; Line 680
	mov	WORD PTR [bx+18],1
; Line 681
	mov	ax,1000
	mov	bx,WORD PTR [bp-4]	;npHunt
	imul	WORD PTR [bx+18]
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 682
	dec	WORD PTR [bx+18]
	cmp	WORD PTR [bx+18],1
	jge	$JCC4268
	jmp	$L20139
$JCC4268:
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
; Line 698
$I1585:
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bx+8],ax
; Line 700
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bx+10],ax
; Line 701
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1595
; Line 703
	mov	ax,10
	push	ax
	call	ARAND
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+20],ax
; Line 704
	mov	ax,11
	push	ax
	call	ARAND
	sub	ax,5
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	WORD PTR [bx+16],ax
; Line 705
	push	bx
	call	FIREHUNTERSHOT
; Line 707
$I1595:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-2]	;npNext
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	je	$JCC4480
	jmp	$F1576
$JCC4480:
; Line 709
$EX1571:
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
	sub	sp,10
;	npSwarm = -4
;	nCnt = -2
;	Pos = 8
;	nDir = 6
;	nCount = 4
; Line 720
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSwarm
	or	ax,ax
	jne	$JCC4510
	jmp	$EX1600
$JCC4510:
; Line 722
	mov	ax,WORD PTR [bp+8]	;Pos
	mov	dx,WORD PTR [bp+10]
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	WORD PTR [bx+4],ax
	mov	WORD PTR [bx+6],dx
; Line 723
	sub	ax,ax
	mov	WORD PTR [bx+10],ax
	mov	WORD PTR [bx+8],ax
; Line 724
	mov	ax,WORD PTR [bp+6]	;nDir
	mov	WORD PTR [bx+14],ax
; Line 725
	mov	ax,31
	push	ax
	call	ARAND
	sub	ax,15
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	WORD PTR [bx+16],ax
; Line 726
	mov	ax,WORD PTR [bp+4]	;nCount
	mov	WORD PTR [bx+18],ax
; Line 727
	mov	cx,64
	push	cx
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
	lea	ax,WORD PTR [bx+26]
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],OFFSET DGROUP:$S1353_Swarmer
	mov	ax,WORD PTR [bp+4]	;nCount
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	WORD PTR [bp-10],ax
; Line 731
$F1604:
; Line 733
	mov	bx,WORD PTR [bp-8]
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx-2],ax
	mov	WORD PTR [bx],dx
; Line 734
	mov	ax,WORD PTR [bp-10]
	mov	bx,WORD PTR [bp-6]
	add	WORD PTR [bx],ax
	add	WORD PTR [bp-6],4
	add	WORD PTR [bp-8],4
	cmp	WORD PTR [bp-8],OFFSET DGROUP:$S1353_Swarmer+20
	jb	$F1604
; Line 736
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_SwarmerList
	push	ax
	push	bx
	call	ADDHEAD
; Line 738
	inc	WORD PTR _nBadGuys
; Line 740
$EX1600:
	mov	sp,bp
	pop	bp
	ret	8

CREATESWARMER	ENDP
; Line 747
	PUBLIC	DRAWSWARMERS
DRAWSWARMERS	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,22
;	hDC = 4
;	npSwarm = -2
;	npNext = -4
;	Pos = -8
;	npShot = -10
;	rect = -18
;	nDir = -22
;	nCount = -20
; Line 751
	cmp	WORD PTR _nBadGuys,0
	je	$I1613
	dec	WORD PTR $S1612_nNextSwarmer
	jns	$I1613
; Line 754
	mov	ax,16984
	push	ax
	call	ARAND
	sub	ax,8492
; Line 755
	mov	WORD PTR [bp-6],-8492
; Line 756
	push	WORD PTR [bp-6]
	push	ax
	mov	ax,256
	push	ax
	call	ARAND
	push	ax
	mov	ax,WORD PTR _nLevel
	add	ax,4
	shl	ax,1
	push	ax
	call	CREATESWARMER
; Line 757
	mov	ax,500
	push	ax
	call	ARAND
	mov	cx,250
	sub	cx,WORD PTR _nLevel
	shl	cx,1
	shl	cx,1
	add	cx,ax
	mov	WORD PTR $S1612_nNextSwarmer,cx
; Line 760
$I1613:
	mov	ax,WORD PTR _SwarmerList
	mov	WORD PTR [bp-2],ax	;npSwarm
	or	ax,ax
	jne	$JCC4854
	jmp	$EX1609
$JCC4854:
$F1615:
; Line 765
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 767
	mov	ax,-15
	sub	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-18],ax	;rect
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-14],ax
	mov	ax,-15
	sub	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-16],ax
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-12],ax
; Line 769
	mov	ax,WORD PTR [bp-18]	;rect
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1620
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+4],ax
	jge	$I1620
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR [bx+6],ax
	jl	$I1620
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jge	$I1620
; Line 771
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	HITPLAYER
; Line 772
	mov	bx,WORD PTR [bp-2]	;npSwarm
	jmp	SHORT $L20140
	nop	
$I1620:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jg	$I1621
	mov	ax,WORD PTR [bp-18]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jle	$I1621
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$I1621
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$I1621
; Line 776
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-10],ax	;npShot
	or	ax,ax
	je	$I1621
$F1623:
; Line 778
	mov	ax,WORD PTR [bp-18]	;rect
	mov	bx,WORD PTR [bp-10]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1624
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1624
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1624
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$L20046
; Line 776
$FC1624:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-10],ax	;npShot
	or	ax,ax
	jne	$F1623
	jmp	SHORT $I1621
	nop	
	nop	
$L20046:
; Line 779
	mov	WORD PTR [bx+18],1
; Line 780
	mov	ax,25
	mov	bx,WORD PTR [bp-2]	;npSwarm
	imul	WORD PTR [bx+18]
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 781
$L20140:
	mov	WORD PTR [bx+18],0
; Line 785
$I1621:
	mov	bx,WORD PTR [bp-2]	;npSwarm
	cmp	WORD PTR [bx+18],0
	jg	$I1628
; Line 787
	mov	BYTE PTR [bx+22],7
; Line 788
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20043
	mov	ax,2
	push	ax
	call	SETRESTART
$L20043:
; Line 789
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	EXPLODE
; Line 790
	mov	ax,OFFSET DGROUP:_SwarmerList
	push	ax
	push	WORD PTR [bp-2]	;npSwarm
	call	REMOVE
; Line 791
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npSwarm
	call	ADDHEAD
; Line 793
	jmp	SHORT $FC1616
$I1628:
; Line 795
	cmp	WORD PTR [bx+18],1
	jle	$I1630
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1630
; Line 797
	mov	ax,256
	push	ax
	call	ARAND
	mov	WORD PTR [bp-22],ax	;nDir
; Line 798
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	ax,WORD PTR [bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-20],ax	;nCount
; Line 799
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bp-22]	;nDir
	push	ax
	call	CREATESWARMER
; Line 800
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	ax,WORD PTR [bx+18]
	sub	ax,WORD PTR [bp-20]	;nCount
	mov	WORD PTR [bp-20],ax	;nCount
; Line 801
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	mov	ax,WORD PTR [bp-22]	;nDir
	add	ax,128
	push	ax
	push	WORD PTR [bp-20]	;nCount
	call	CREATESWARMER
; Line 802
	mov	bx,WORD PTR [bp-2]	;npSwarm
	mov	WORD PTR [bx+18],0
; Line 804
$I1630:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	DRAWOBJECT
; Line 760
$FC1616:
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npSwarm
	or	ax,ax
	je	$JCC5298
	jmp	$F1615
$JCC5298:
; Line 807
$EX1609:
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
	sub	sp,8
;	npSpin = -4
;	nCnt = -2
; Line 818
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSpin
	or	ax,ax
	jne	$JCC5328
	jmp	$EX1633
$JCC5328:
; Line 820
	mov	ax,16984
	push	ax
	call	ARAND
	sub	ax,8492
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	WORD PTR [bx+4],ax
; Line 821
	mov	WORD PTR [bx+6],-8492
; Line 822
	sub	ax,ax
	mov	WORD PTR [bx+10],ax
	mov	WORD PTR [bx+8],ax
; Line 823
	mov	ax,256
	push	ax
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
	mov	cl,5
	inc	ax
	inc	ax
	shl	ax,cl
	mov	WORD PTR [bx+12],ax
; Line 827
	mov	al,15
	sub	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 828
	mov	BYTE PTR [bx+23],cl
	mov	WORD PTR [bp-6],OFFSET DGROUP:$S1352_Spinner
	lea	ax,WORD PTR [bx+24]
	mov	WORD PTR [bp-8],ax
; Line 829
$F1637:
; Line 830
	mov	bx,WORD PTR [bp-6]
	add	WORD PTR [bp-6],4
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp-8]
	add	WORD PTR [bp-8],4
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	cmp	WORD PTR [bp-6],OFFSET DGROUP:$S1352_Spinner+20
	jb	$F1637
; Line 831
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_SpinnerList
	push	ax
	push	bx
	call	ADDHEAD
; Line 833
	inc	WORD PTR _nBadGuys
; Line 835
$EX1633:
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
	sub	sp,16
	push	si
;	hDC = 4
;	npSpin = -2
;	npNext = -4
;	npShot = -8
;	nDelta = -6
;	rect = -16
; Line 846
	cmp	WORD PTR _nBadGuys,0
	je	$I1645
	dec	WORD PTR $S1644_nNextSpinner
	jns	$I1645
; Line 848
	call	CREATESPINNER
; Line 849
	mov	ax,900
	push	ax
	call	ARAND
	mov	cx,50
	sub	cx,WORD PTR _nLevel
	shl	cx,1
	add	ax,cx
	mov	WORD PTR $S1644_nNextSpinner,ax
; Line 852
$I1645:
	mov	ax,WORD PTR _SpinnerList
	mov	WORD PTR [bp-2],ax	;npSpin
	or	ax,ax
	jne	$JCC5610
	jmp	$EX1641
$JCC5610:
$F1646:
; Line 858
	mov	bx,WORD PTR [bp-2]	;npSpin
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
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1652
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$I1652
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$I1652
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$I1652
; Line 864
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	HITPLAYER
; Line 866
	mov	al,15
	mov	bx,WORD PTR [bp-2]	;npSpin
	dec	WORD PTR [bx+18]
	sub	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 867
	cmp	WORD PTR [bx+18],1
	jl	$JCC5722
	jmp	$I1654
$JCC5722:
; Line 869
$L20144:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20052
	mov	ax,2
	push	ax
	call	SETRESTART
$L20052:
; Line 870
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	EXPLODE
; Line 871
	mov	ax,OFFSET DGROUP:_SpinnerList
	push	ax
	push	WORD PTR [bp-2]	;npSpin
	call	REMOVE
; Line 872
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npSpin
	call	ADDHEAD
; Line 875
	jmp	$I1654
	nop	
$I1652:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jle	$JCC5785
	jmp	$I1654
$JCC5785:
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jg	$JCC5797
	jmp	$I1654
$JCC5797:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$I1654
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$I1654
; Line 877
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$I1654
$F1656:
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
	jl	$L20059
; Line 877
$FC1657:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1656
	jmp	SHORT $I1654
	nop	
	nop	
$L20059:
; Line 880
	mov	WORD PTR [bx+18],1
; Line 881
	mov	ax,500
	mov	bx,WORD PTR [bp-2]	;npSpin
	imul	WORD PTR [bx+18]
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
	jge	$JCC5916
	jmp	$L20144
$JCC5916:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	HIT
; Line 894
$I1654:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npSpin
	sub	ax,WORD PTR [bx+4]
$L20142:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 895
	cmp	ax,-16
	jl	$FB1666
	cmp	ax,16
	jle	$L20060
$FB1666:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20142
$L20060:
; Line 896
	mov	bx,WORD PTR [bp-2]	;npSpin
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+8],ax
; Line 897
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	sub	ax,WORD PTR [bx+6]
$L20143:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 898
	cmp	ax,-16
	jl	$FB1670
	cmp	ax,16
	jle	$L20061
$FB1670:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20143
	nop	
$L20061:
; Line 899
	mov	bx,WORD PTR [bp-2]	;npSpin
	mov	ax,WORD PTR [bx+10]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-6]	;nDelta
	neg	ax
	add	WORD PTR [bx+10],ax
; Line 900
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npSpin
	or	ax,ax
	je	$JCC6067
	jmp	$F1646
$JCC6067:
; Line 902
$EX1641:
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
	sub	sp,14
	push	di
	push	si
;	Pos = 18
;	Vel = 14
;	nSides = 12
;	byColor = 10
;	nDir = 8
;	nSpeed = 6
;	nSpin = 4
;	npRoid = -4
;	nCnt = -2
; Line 914
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npRoid
	or	ax,ax
	jne	$JCC6100
	jmp	$EX1678
$JCC6100:
; Line 916
	mov	ax,WORD PTR [bp+18]	;Pos
	mov	dx,WORD PTR [bp+20]
	mov	bx,WORD PTR [bp-4]	;npRoid
	mov	WORD PTR [bx+4],ax
	mov	WORD PTR [bx+6],dx
; Line 917
	mov	ax,WORD PTR [bp+14]	;Vel
	mov	dx,WORD PTR [bp+16]
	mov	WORD PTR [bx+8],ax
	mov	WORD PTR [bx+10],dx
; Line 918
	mov	cl,7
	mov	ax,WORD PTR [bp+12]	;nSides
	shl	ax,cl
	mov	WORD PTR [bx+12],ax
; Line 919
	mov	ax,WORD PTR [bp+8]	;nDir
	mov	WORD PTR [bx+14],ax
; Line 920
	mov	ax,11
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp+4]	;nSpin
	sub	ax,5
	mov	bx,WORD PTR [bp-4]	;npRoid
	mov	WORD PTR [bx+16],ax
; Line 921
	mov	ax,100
	imul	WORD PTR [bp+12]	;nSides
	mov	WORD PTR [bx+18],ax
; Line 922
	mov	al,BYTE PTR [bp+10]	;byColor
	mov	BYTE PTR [bx+22],al
; Line 923
	mov	al,BYTE PTR [bp+12]	;nSides
	inc	al
	mov	BYTE PTR [bx+23],al
; Line 924
	cmp	WORD PTR [bp+12],0	;nSides
	jle	$FB1684
	mov	ax,WORD PTR [bp-4]	;npRoid
	add	ax,24
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],0
	mov	ax,100
	imul	WORD PTR [bp+12]	;nSides
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bp+12]	;nSides
	mov	WORD PTR [bp-10],ax
$F1682:
; Line 926
	mov	ax,30
	push	ax
	call	ARAND
	mov	cx,ax
	mov	ax,WORD PTR [bp-8]
	cwd	
	idiv	WORD PTR [bp+12]	;nSides
	add	cx,ax
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx],cx
; Line 927
	mov	ax,80
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp-12]
	sub	ax,80
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx+2],ax
	add	WORD PTR [bp-6],4
	add	BYTE PTR [bp-7],1
	dec	WORD PTR [bp-10]
	jne	$F1682
; Line 928
$FB1684:
; Line 929
	mov	bx,WORD PTR [bp-4]	;npRoid
	mov	ax,WORD PTR [bx+24]
	mov	dx,WORD PTR [bx+26]
	mov	si,WORD PTR [bp+12]	;nSides
	shl	si,1
	shl	si,1
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
; Line 930
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	WORD PTR [bp-14],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npRoid
	add	WORD PTR [bx+8],ax
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	push	si
	push	di
	mov	si,WORD PTR [bp-14]
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
	mov	ax,OFFSET DGROUP:_RoidList
	push	ax
	push	bx
	call	ADDHEAD
; Line 932
	inc	WORD PTR _nBadGuys
; Line 934
$EX1678:
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
	sub	sp,18
	push	si
;	hDC = 8
;	npRoid = 6
;	npShot = 4
;	nCnt = -2
;	nNew = -4
;	Pt = -8
;	nSpeed = -10
;	Pt = -14
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
; Line 963
	sub	ax,5
	je	$SC1699
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
	nop	
; Line 957
$SC1699:
; Line 958
	mov	ax,2
	push	ax
	call	ARAND
	jmp	SHORT $L20145
	nop	
; Line 954
$SC1698:
; Line 955
	mov	ax,2
	jmp	SHORT $L20146
	nop	
; Line 951
$SC1697:
; Line 952
	mov	ax,3
$L20146:
	push	ax
	call	ARAND
	inc	ax
	jmp	SHORT $L20145
; Line 948
$SC1696:
; Line 949
	mov	ax,3
	push	ax
	call	ARAND
	inc	ax
	inc	ax
$L20145:
	mov	WORD PTR [bp-4],ax	;nNew
; Line 963
$SB1693:
; Line 964
	cmp	WORD PTR [bp-4],1	;nNew
	jne	$I1701
; Line 966
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-8],ax	;Pt
	mov	WORD PTR [bp-6],dx
; Line 967
	mov	ax,301
	push	ax
	call	ARAND
	sub	ax,150
	add	WORD PTR [bp-8],ax	;Pt
	mov	ax,301
	push	ax
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
	mov	ax,8
	push	ax
	push	WORD PTR [bx+16]
	call	CREATEROID
; Line 971
	jmp	$I1703
	nop	
$I1701:
	cmp	WORD PTR [bp-4],0	;nNew
	jg	$JCC6616
	jmp	$I1703
$JCC6616:
; Line 973
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+16]
	mov	cx,ax
	imul	cx
	imul	WORD PTR [bp-4]	;nNew
	add	ax,16
	mov	WORD PTR [bp-10],ax	;nSpeed
; Line 974
	cmp	WORD PTR [bp-4],0	;nNew
	jg	$JCC6644
	jmp	$I1703
$JCC6644:
	mov	WORD PTR [bp-16],0
	mov	ax,WORD PTR [bp-4]	;nNew
	mov	WORD PTR [bp-18],ax
$F1706:
; Line 976
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-14],ax	;Pt
	mov	WORD PTR [bp-12],dx
; Line 977
	mov	ax,601
	push	ax
	call	ARAND
	sub	ax,300
	add	WORD PTR [bp-14],ax	;Pt
	mov	ax,601
	push	ax
	call	ARAND
	sub	ax,300
	add	WORD PTR [bp-12],ax
; Line 982
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;Pt
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
	mov	ax,32
	push	ax
	call	ARAND
	mov	cx,ax
	mov	ax,WORD PTR [bp-16]
	cwd	
	idiv	WORD PTR [bp-4]	;nNew
	add	cx,ax
	mov	bx,WORD PTR [bp+6]	;npRoid
	add	cx,WORD PTR [bx+14]
	push	cx
	mov	ax,WORD PTR _nLevel
	shl	ax,1
	shl	ax,1
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp-10]	;nSpeed
	push	ax
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	CREATEROID
	add	BYTE PTR [bp-15],1
	dec	WORD PTR [bp-18]
	je	$JCC6792
	jmp	$F1706
$JCC6792:
; Line 985
$I1703:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20068
	mov	ax,2
	push	ax
	call	SETRESTART
$L20068:
; Line 986
	mov	bx,WORD PTR [bp+6]	;npRoid
	inc	BYTE PTR [bx+22]
; Line 987
	mov	WORD PTR [bx+18],0
; Line 988
	cmp	WORD PTR [bp-4],0	;nNew
	je	$I1710
; Line 990
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	HIT
; Line 991
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	DRAWOBJECT
; Line 993
	jmp	SHORT $I1711
$I1710:
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	EXPLODE
$I1711:
; Line 994
	mov	ax,OFFSET DGROUP:_RoidList
	push	ax
	push	WORD PTR [bp+6]	;npRoid
	call	REMOVE
; Line 995
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
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
	sub	sp,16
;	hDC = 4
;	npRoid = -2
;	npNext = -4
;	nSize = -6
;	npShot = -8
;	rect = -16
; Line 1006
	mov	ax,WORD PTR _RoidList
	mov	WORD PTR [bp-2],ax	;npRoid
	or	ax,ax
	jne	$JCC6902
	jmp	$EX1713
$JCC6902:
$F1716:
; Line 1008
	mov	bx,WORD PTR [bp-2]	;npRoid
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
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1722
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$I1722
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$I1722
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$I1722
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	call	HITPLAYER
	or	ax,ax
	je	$I1722
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
	sub	ax,ax
	push	ax
	call	BREAKROID
; Line 1024
	cmp	WORD PTR _nBadGuys,0
	je	$I1723
	mov	ax,1
$L20147:
	push	ax
	call	SETRESTART
; Line 1025
	jmp	SHORT $FC1717
	nop	
$I1723:
	mov	ax,2
	jmp	SHORT $L20147
	nop	
$I1722:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1350_rectShotClip,ax
	jg	$FC1717
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1350_rectShotClip+4,ax
	jle	$FC1717
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1350_rectShotClip+2,ax
	jg	$FC1717
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1350_rectShotClip+6,ax
	jle	$FC1717
; Line 1029
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$FC1717
$F1727:
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
	jl	$L20073
; Line 1029
$FC1728:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1727
	jmp	SHORT $FC1717
$L20073:
; Line 1032
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	push	bx
	call	BREAKROID
; Line 1006
$FC1717:
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npRoid
	or	ax,ax
	je	$JCC7186
	jmp	$F1716
$JCC7186:
; Line 1037
$EX1713:
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
	sub	sp,4
;	hDC = 4
;	npShot = -2
;	npNext = -4
; Line 1047
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC7212
	jmp	$I1736
$JCC7212:
; Line 1049
	mov	bx,ax
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1350_rectShotClip+4,ax
	mov	WORD PTR $S1350_rectShotClip,ax
; Line 1050
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+6,ax
	mov	WORD PTR $S1350_rectShotClip+2,ax
; Line 1051
	or	bx,bx
	jne	$JCC7239
	jmp	$EX1733
$JCC7239:
$FC1738:
; Line 1053
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1054
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 1066
	cmp	ax,10
	je	$SC1744
	ja	$SB1741
	or	al,al
	je	$SC1746
	sub	al,5
	je	$SC1745
	jmp	SHORT $SB1741
	nop	
; Line 1062
$SC1746:
; Line 1063
	mov	ax,OFFSET DGROUP:_ShotList
	push	ax
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 1064
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 1065
	jmp	SHORT $SB1741
; Line 1059
$SC1745:
; Line 1060
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],8
; Line 1061
	jmp	SHORT $SB1741
	nop	
; Line 1056
$SC1744:
; Line 1057
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],12
; Line 1066
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
	jmp	SHORT $I1748
	nop	
$I1747:
	mov	ax,WORD PTR $S1350_rectShotClip+4
	cmp	WORD PTR [bx+4],ax
	jle	$I1748
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1350_rectShotClip+4,ax
; Line 1070
$I1748:
	mov	ax,WORD PTR $S1350_rectShotClip+2
	cmp	WORD PTR [bx+6],ax
	jge	$I1750
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+2,ax
; Line 1071
	jmp	SHORT $I1751
$I1750:
	mov	ax,WORD PTR $S1350_rectShotClip+6
	cmp	WORD PTR [bx+6],ax
	jle	$I1751
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1350_rectShotClip+6,ax
; Line 1072
$I1751:
; Line 1073
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	je	$JCC7396
	jmp	$FC1738
$JCC7396:
	mov	sp,bp
	pop	bp
	ret	2
	nop	
; Line 1075
$I1736:
	mov	ax,32767
	mov	WORD PTR $S1350_rectShotClip+6,ax
	mov	WORD PTR $S1350_rectShotClip+2,ax
	mov	WORD PTR $S1350_rectShotClip+4,ax
	mov	WORD PTR $S1350_rectShotClip,ax
; Line 1076
$EX1733:
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
	sub	sp,4
;	hDC = 4
;	npFlame = -2
;	npNext = -4
; Line 1086
	mov	ax,WORD PTR _FlameList
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	je	$EX1755
$F1758:
; Line 1088
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1089
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 1101
	cmp	ax,7
	je	$SC1765
	ja	$SB1762
	or	al,al
	je	$SC1767
	sub	al,3
	je	$SC1766
	jmp	SHORT $SB1762
	nop	
; Line 1097
$SC1767:
; Line 1098
	mov	ax,OFFSET DGROUP:_FlameList
	push	ax
	push	WORD PTR [bp-2]	;npFlame
	call	REMOVE
; Line 1099
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npFlame
	call	ADDHEAD
; Line 1100
	jmp	SHORT $SB1762
; Line 1094
$SC1766:
; Line 1095
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],4
; Line 1096
	jmp	SHORT $SB1762
	nop	
; Line 1091
$SC1765:
; Line 1092
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],5
; Line 1101
$SB1762:
; Line 1102
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npFlame
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	jne	$F1758
; Line 1104
$EX1755:
	mov	sp,bp
	pop	bp
	ret	2

DRAWFLAMES	ENDP
; Line 1111
	PUBLIC	FIRESHOT
FIRESHOT	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
;	npShot = -2
; Line 1114
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC7561
	jmp	$EX1768
$JCC7561:
; Line 1116
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+4],ax
; Line 1117
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	mov	WORD PTR [bx+6],ax
; Line 1118
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+8]
	mov	WORD PTR [bx+8],ax
; Line 1119
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+10]
	mov	WORD PTR [bx+10],ax
; Line 1120
	mov	WORD PTR [bx+12],8
; Line 1121
	mov	ax,5
	push	ax
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
	mov	ax,8
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_ShotList
	push	ax
	push	bx
	call	ADDHEAD
; Line 1133
$EX1768:
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
	sub	sp,4
	push	di
	push	si
;	nDir = 6
;	nAccel = 4
;	npFlame = -2
; Line 1143
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+14]
	add	WORD PTR [bp+6],ax	;nDir
; Line 1144
	cmp	WORD PTR [bp+4],0	;nAccel
	je	$I1775
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
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
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	jne	$JCC7909
	jmp	$EX1773
$JCC7909:
; Line 1147
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [bx+4],ax
; Line 1148
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+6]
	mov	WORD PTR [bx+6],ax
; Line 1149
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+8]
	mov	WORD PTR [bx+8],ax
; Line 1150
	mov	si,WORD PTR _npPlayer
	mov	ax,WORD PTR [si+10]
	mov	WORD PTR [bx+10],ax
; Line 1151
	mov	ax,57
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp+6]	;nDir
	add	ax,100
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [bx+14],ax
; Line 1152
	mov	WORD PTR [bx+16],0
; Line 1153
	mov	ax,7
	push	ax
	call	ARAND
	add	ax,WORD PTR [bp+4]	;nAccel
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [bx+18],ax
; Line 1154
	mov	BYTE PTR [bx+22],11
; Line 1155
	mov	BYTE PTR [bx+23],1
; Line 1156
	sub	ax,ax
	mov	WORD PTR [bx+26],ax
	mov	WORD PTR [bx+24],ax
; Line 1157
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	cx,10
	push	cx
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
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	ax,10
	push	ax
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
	mov	ax,OFFSET DGROUP:_FlameList
	push	ax
	push	bx
	call	ADDHEAD
; Line 1160
$EX1773:
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
;	hDC = 4
; Line 1171
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jg	$JCC8135
	jmp	$EX1778
$JCC8135:
; Line 1173
	cmp	WORD PTR _nSafe,0
	jle	$I1782
; Line 1175
	dec	WORD PTR _nSafe
	jne	$I1785
; Line 1177
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 1178
	mov	bx,WORD PTR _npPlayer
	cmp	BYTE PTR [bx+22],3
	jbe	$I1785
	mov	BYTE PTR [bx+22],3
; Line 1181
	jmp	SHORT $I1785
	nop	
$I1782:
	push	WORD PTR _vkShld
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1785
	cmp	WORD PTR _nShield,0
	jle	$I1785
; Line 1183
	mov	WORD PTR _nSafe,15
; Line 1184
	dec	WORD PTR _nShield
	cmp	WORD PTR _nShield,0
	jle	$I1787
	mov	al,7
	jmp	SHORT $L20080
	nop	
$I1787:
	mov	al,6
$L20080:
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],al
; Line 1188
$I1785:
	cmp	WORD PTR $S1779_nBombing,0
	jle	$I1789
; Line 1190
	dec	WORD PTR $S1779_nBombing
	jne	$I1790
; Line 1192
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_SpinnerList
	push	ax
	call	EXPLODEBADGUYS
; Line 1193
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_SwarmerList
	push	ax
	call	EXPLODEBADGUYS
; Line 1194
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_HunterList
	push	ax
	call	EXPLODEBADGUYS
; Line 1196
	jmp	SHORT $I1792
$I1790:
; Line 1198
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_SpinnerList
	push	ax
	call	HITLIST
; Line 1199
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_SwarmerList
	push	ax
	call	HITLIST
; Line 1200
	push	WORD PTR [bp+4]	;hDC
	mov	ax,OFFSET DGROUP:_HunterList
	push	ax
	call	HITLIST
; Line 1203
	jmp	SHORT $I1792
$I1789:
	cmp	WORD PTR _nBomb,0
	je	$I1792
	push	WORD PTR _vkBomb
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1792
	dec	WORD PTR _nBomb
	mov	WORD PTR $S1779_nBombing,5
; Line 1205
$I1792:
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
	sub	ax,ax
	push	ax
	mov	ax,12
	push	ax
	call	ACCELPLAYER
; Line 1208
$I1796:
	push	WORD PTR _vkRvThrst
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1797
	mov	ax,128
	push	ax
	mov	ax,12
	push	ax
	call	ACCELPLAYER
; Line 1209
$I1797:
	cmp	WORD PTR $S1780_nShotDelay,0
	je	$I1798
	dec	WORD PTR $S1780_nShotDelay
; Line 1210
	jmp	SHORT $I1799
$I1798:
	push	WORD PTR _vkFire
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1799
	call	FIRESHOT
	mov	WORD PTR $S1780_nShotDelay,2
; Line 1211
$I1799:
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
	sub	sp,16
	push	di
	push	si
;	hWnd = 4
;	hDC = -14
;	cx = -2
;	cy = -4
;	rect = -12
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
	push	ax
	mov	cx,7
	push	cx
	mov	si,ax
	call	FAR PTR SETMAPMODE
; Line 1233
	push	si
	mov	ax,8192
	push	ax
	push	ax
	call	FAR PTR SETWINDOWEXT
; Line 1234
	push	si
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
	mov	di,cx
	mov	WORD PTR [bp-16],dx
	call	FAR PTR SETVIEWPORTEXT
; Line 1235
	push	si
	push	di
	push	WORD PTR [bp-16]
	call	FAR PTR SETVIEWPORTORG
; Line 1238
	push	si
	push	WORD PTR _hAppPalette
	sub	ax,ax
	push	ax
	call	FAR PTR SELECTPALETTE
; Line 1239
	push	si
	call	FAR PTR REALIZEPALETTE
; Line 1241
	mov	ax,si
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
	sub	sp,2
	push	si
;	hWnd = 4
;	hDC = -2
; Line 1253
	push	WORD PTR [bp+4]	;hWnd
	call	GETHYPEROIDDC
	push	ax
	mov	si,ax
	call	DRAWPLAYER
; Line 1254
	push	si
	call	DRAWFLAMES
; Line 1255
	push	si
	call	DRAWSHOTS
; Line 1256
	push	si
	call	DRAWROIDS
; Line 1257
	push	si
	call	DRAWSPINNERS
; Line 1258
	push	si
	call	DRAWSWARMERS
; Line 1259
	push	si
	call	DRAWHUNTERS
; Line 1260
	push	si
	call	DRAWHUNTERSHOTS
; Line 1261
	push	si
	call	DRAWLETTERS
; Line 1262
	push	si
	call	DRAWBONUSES
; Line 1265
	push	WORD PTR [bp+4]	;hWnd
	push	si
	call	FAR PTR RELEASEDC
; Line 1266
	pop	si
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
	sub	sp,6
;	npBuff = 8
;	IDBitmap = 6
;	nQuant = 4
;	nBlank = -2
; Line 1274
	cmp	WORD PTR [bp+4],5	;nQuant
	jle	$I1816
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
	mov	BYTE PTR [bx],64
; Line 1280
	jmp	SHORT $I1817
	nop	
$I1816:
; Line 1282
	mov	ax,5
	sub	ax,WORD PTR [bp+4]	;nQuant
	mov	WORD PTR [bp-2],ax	;nBlank
; Line 1283
	jmp	SHORT $L20148
	nop	
$FC1820:
	mov	al,BYTE PTR [bp+6]	;IDBitmap
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
$L20148:
	mov	ax,WORD PTR [bp+4]	;nQuant
	dec	WORD PTR [bp+4]	;nQuant
	or	ax,ax
	jne	$FC1820
; Line 1284
$FC1823:
	mov	ax,WORD PTR [bp-2]	;nBlank
	dec	WORD PTR [bp-2]	;nBlank
	or	ax,ax
	je	$I1817
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],50
	jmp	SHORT $FC1823
; Line 1285
$I1817:
; Line 1286
	mov	ax,5
; Line 1287
	mov	sp,bp
	pop	bp
	ret	6
	nop	

SETINDICATOR	ENDP
; Line 1294
	PUBLIC	CHECKSCORE
CHECKSCORE	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,58
	push	si
;	hWnd = 4
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
; Line 1296
	lea	ax,WORD PTR [bp-40]	;szBuff
	mov	WORD PTR [bp-44],ax	;npBuff
; Line 1301
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC8849
	jmp	$EX1826
$JCC8849:
; Line 1302
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	sub	ax,WORD PTR _lLastLife
	sbb	dx,WORD PTR _lLastLife+2
	cmp	dx,1
	jl	$I1838
	jg	$L20090
	cmp	ax,-31072
	jbe	$I1838
$L20090:
; Line 1304
	call	ADDEXTRALIFE
; Line 1305
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	mov	WORD PTR _lLastLife,ax
	mov	WORD PTR _lLastLife+2,dx
; Line 1307
$I1838:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+18]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR [bp-42],ax	;nLives
; Line 1309
	mov	BYTE PTR [bp-40],52	;szBuff
; Line 1310
	push	WORD PTR _nLevel
	mov	ax,OFFSET DGROUP:$SG1839
	push	ds
	push	ax
	lea	ax,WORD PTR [bp-39]
	mov	WORD PTR [bp-44],ax	;npBuff
	push	ds
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 1311
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	je	$FB1842
$FC1841:
; Line 1312
	mov	bx,WORD PTR [bp-44]	;npBuff
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	jne	$FC1841
$FB1842:
; Line 1313
	mov	bx,WORD PTR [bp-44]	;npBuff
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],50
	mov	bx,WORD PTR [bp-44]	;npBuff
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],65
; Line 1314
	push	WORD PTR _lScore+2
	push	WORD PTR _lScore
	mov	ax,OFFSET DGROUP:$SG1843
	push	ds
	push	ax
	push	ds
	push	WORD PTR [bp-44]	;npBuff
	call	FAR PTR _wsprintf
	add	sp,12
; Line 1315
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	je	$FB1846
$FC1845:
; Line 1316
	mov	bx,WORD PTR [bp-44]	;npBuff
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	jne	$FC1845
$FB1846:
; Line 1317
	mov	bx,WORD PTR [bp-44]	;npBuff
	inc	WORD PTR [bp-44]	;npBuff
	mov	BYTE PTR [bx],50
; Line 1318
	push	WORD PTR [bp-44]	;npBuff
	mov	al,53
	push	ax
	push	WORD PTR [bp-42]	;nLives
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
; Line 1319
	push	WORD PTR [bp-44]	;npBuff
	mov	al,66
	push	ax
	push	WORD PTR _nShield
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
; Line 1321
	push	WORD PTR [bp-44]	;npBuff
	mov	al,51
	push	ax
	push	WORD PTR _nBomb
	call	SETINDICATOR
	add	WORD PTR [bp-44],ax	;npBuff
	mov	ax,WORD PTR [bp-44]	;npBuff
	lea	cx,WORD PTR [bp-40]	;szBuff
	sub	ax,cx
	mov	WORD PTR [bp-54],ax	;nLen
; Line 1323
	push	WORD PTR [bp+4]	;hWnd
	mov	si,ax
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
	or	si,si
	jle	$FB1849
$F1847:
; Line 1333
	mov	si,WORD PTR [bp-46]	;nCnt
	mov	al,BYTE PTR [bp-40][si]
	cmp	BYTE PTR $S1348_szScore[si],al
	je	$I1850
; Line 1335
	push	WORD PTR [bp-56]	;hDCMem
	cbw	
	mov	bx,ax
	shl	bx,1
	push	WORD PTR _hBitmap[bx-100]
	call	FAR PTR SELECTOBJECT
; Line 1336
	push	WORD PTR [bp-58]	;hDC
	push	WORD PTR [bp-50]	;x
	push	WORD PTR [bp-52]	;y
	mov	ax,16
	push	ax
	push	ax
	push	WORD PTR [bp-56]	;hDCMem
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,32
	mov	dx,204
	push	dx
	push	ax
	call	FAR PTR BITBLT
; Line 1337
	mov	al,BYTE PTR [bp-40][si]
	mov	BYTE PTR $S1348_szScore[si],al
; Line 1339
$I1850:
	add	WORD PTR [bp-50],16	;x
	mov	ax,WORD PTR [bp-54]	;nLen
	inc	WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$F1847
; Line 1340
$FB1849:
; Line 1341
	mov	ax,WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR $S1347_nScoreLen,ax
	jle	$I1851
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
; Line 1347
	push	WORD PTR [bp-58]	;hDC
	push	WORD PTR [bp-50]	;x
	push	WORD PTR [bp-52]	;y
	mov	ax,16
	push	ax
	push	ax
	push	WORD PTR [bp-56]	;hDCMem
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,32
	mov	dx,204
	push	dx
	push	ax
	call	FAR PTR BITBLT
; Line 1348
	mov	bx,WORD PTR [bp-46]	;nCnt
	mov	BYTE PTR $S1348_szScore[bx],50
; Line 1350
$I1855:
	add	WORD PTR [bp-50],16	;x
; Line 1351
	mov	ax,WORD PTR $S1347_nScoreLen
	inc	WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$D1852
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

CHECKSCORE	ENDP
; Line 1365
	PUBLIC	HITLIST
HITLIST	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,2
;	hDC = 6
;	npList = 4
;	npObj = -2
; Line 1368
	mov	bx,WORD PTR [bp+4]	;npList
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	je	$EX1858
$F1860:
; Line 1369
	mov	bx,ax
	cmp	WORD PTR [bx+18],0
	je	$FC1861
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	HIT
; Line 1368
$FC1861:
	mov	bx,WORD PTR [bp-2]	;npObj
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$F1860
; Line 1370
$EX1858:
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
	sub	sp,2
;	hDC = 6
;	npList = 4
;	npObj = -2
; Line 1380
	jmp	SHORT $L20149
$FC1869:
; Line 1382
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20094
	mov	ax,2
	push	ax
	call	SETRESTART
$L20094:
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
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-2]	;npObj
	call	ADDHEAD
; Line 1387
$L20149:
	mov	bx,WORD PTR [bp+4]	;npList
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$FC1869
; Line 1388
	mov	sp,bp
	pop	bp
	ret	4

EXPLODEBADGUYS	ENDP
; Line 1395
	PUBLIC	NEWGAME
NEWGAME	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,2
;	hWnd = 4
;	hDC = -2
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
	sub	ax,ax
	push	ax
	call	SETRESTART
; Line 1402
	push	WORD PTR [bp-2]	;hDC
	mov	ax,OFFSET DGROUP:_RoidList
	push	ax
	call	EXPLODEBADGUYS
; Line 1403
	push	WORD PTR [bp-2]	;hDC
	mov	ax,OFFSET DGROUP:_SpinnerList
	push	ax
	call	EXPLODEBADGUYS
; Line 1404
	push	WORD PTR [bp-2]	;hDC
	mov	ax,OFFSET DGROUP:_SwarmerList
	push	ax
	call	EXPLODEBADGUYS
; Line 1405
	push	WORD PTR [bp-2]	;hDC
	mov	ax,OFFSET DGROUP:_HunterList
	push	ax
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
	sub	sp,20
;	Pos = -4
;	Vel = -8
;	npShot = -10
;	nCnt = -12
;	Pos = -16
;	Vel = -20
; Line 1416
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jne	$I1875
; Line 1420
	mov	WORD PTR [bp-2],-4246
; Line 1421
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;Pos
	mov	WORD PTR [bp-8],ax	;Vel
; Line 1422
	mov	WORD PTR [bp-6],150
; Line 1423
	mov	ax,OFFSET DGROUP:_szAppName
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;Pos
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;Vel
	mov	al,11
	push	ax
	mov	ax,800
	push	ax
	call	FAR PTR PRINTLETTERS
; Line 1424
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+18],3
; Line 1425
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	cmp	WORD PTR _lHighScore+2,dx
	jg	$I1878
	jl	$L20102
	cmp	WORD PTR _lHighScore,ax
	jae	$I1878
$L20102:
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
	jmp	SHORT $L20150
$I1875:
	cmp	WORD PTR [bx+18],0
	jge	$I1879
; Line 1433
	neg	WORD PTR [bx+18]
; Line 1434
$L20150:
	mov	ax,3
	mov	WORD PTR _nBomb,ax
	mov	WORD PTR _nShield,ax
; Line 1437
$I1879:
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
	je	$I1881
; Line 1447
	mov	ax,WORD PTR _ShotList
	or	ax,ax
	je	$I1881
$F1883:
; Line 1448
	mov	bx,ax
	mov	WORD PTR [bx+18],1
	mov	ax,WORD PTR [bx]
	or	ax,ax
	jne	$F1883
; Line 1452
$I1881:
	cmp	WORD PTR _nBadGuys,0
	jne	$EX1874
; Line 1456
	inc	WORD PTR _nLevel
	mov	ax,WORD PTR _nLevel
	add	ax,5
	mov	WORD PTR [bp-12],ax	;nCnt
	or	ax,ax
	je	$EX1874
	sub	ax,ax
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-20],ax	;Vel
$F1888:
; Line 1459
	mov	ax,16384
	push	ax
	call	ARAND
	sub	ax,8192
	mov	WORD PTR [bp-16],ax	;Pos
; Line 1460
	mov	ax,16384
	push	ax
	call	ARAND
	sub	ax,8192
; Line 1464
	push	ax
	push	WORD PTR [bp-16]	;Pos
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;Vel
	mov	ax,2
	push	ax
	call	ARAND
	add	ax,6
	push	ax
	mov	ax,2
	push	ax
	call	ARAND
	cmp	ax,1
	sbb	al,al
	and	al,247
	add	al,10
	push	ax
	mov	ax,16384
	push	ax
	call	ARAND
	push	ax
	mov	cl,3
	mov	ax,WORD PTR _nLevel
	shl	ax,cl
	push	ax
	call	ARAND
	add	ax,30
	push	ax
	sub	ax,ax
	push	ax
	call	CREATEROID
	dec	WORD PTR [bp-12]	;nCnt
	jne	$F1888
; Line 1467
$EX1874:
	mov	sp,bp
	pop	bp
	ret	

RESTARTHYPEROID	ENDP
; Line 1474
	PUBLIC	PANIC
PANIC	PROC NEAR
	push	bp
	mov	bp,sp
;	bPanic = 4
; Line 1475
	cmp	WORD PTR [bp+4],0	;bPanic
	je	$I1895
	cmp	WORD PTR _bPaused,0
	jne	$I1895
; Line 1478
	push	WORD PTR _hAppWnd
	mov	ax,1
	mov	WORD PTR _bPaused,ax
	push	ax
	call	FAR PTR KILLTIMER
; Line 1479
	push	WORD PTR _hAppWnd
	mov	ax,OFFSET DGROUP:$SG1896
	push	ds
	push	ax
	call	FAR PTR SETWINDOWTEXT
; Line 1480
	push	WORD PTR _hAppWnd
	mov	ax,7
	push	ax
	call	FAR PTR SHOWWINDOW
; Line 1481
	push	WORD PTR _hAppWnd
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR INVALIDATERECT
; Line 1483
	mov	sp,bp
	pop	bp
	ret	2
$I1895:
	cmp	WORD PTR _bPaused,0
	je	$EX1894
; Line 1485
	mov	WORD PTR _bPaused,0
; Line 1486
	push	WORD PTR _hAppWnd
	mov	ax,OFFSET DGROUP:_szAppName
	push	ds
	push	ax
	call	FAR PTR SETWINDOWTEXT
; Line 1487
	cmp	WORD PTR [bp+4],0	;bPanic
	je	$I1899
	push	WORD PTR _hAppWnd
	mov	ax,9
	push	ax
	call	FAR PTR SHOWWINDOW
; Line 1488
$I1899:
	push	WORD PTR _hAppWnd
	mov	ax,1
	push	ax
	push	WORD PTR _nDrawDelay
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR SETTIMER
; Line 1490
$EX1894:
	mov	sp,bp
	pop	bp
	ret	2
	nop	

PANIC	ENDP
; Line 1497
	PUBLIC	PAINTHYPEROID
PAINTHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,32
;	hWnd = 4
;	ps = -32
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
	mov	ax,2
	push	ax
	push	ax
	push	WORD PTR _hAppInst
	mov	ax,20
	cwd	
	push	dx
	push	ax
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
	sub	sp,10
;	hWnd = 6
;	hDC = 4
;	hbr = -2
;	rect = -10
; Line 1514
	push	WORD PTR [bp+6]	;hWnd
	lea	ax,WORD PTR [bp-10]	;rect
	push	ss
	push	ax
	call	FAR PTR GETCLIENTRECT
; Line 1516
	cmp	WORD PTR _bPaused,0
	je	$I1910
; Line 1518
	push	WORD PTR [bp+4]	;hDC
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR SETBRUSHORG
; Line 1519
	mov	ax,1
	push	ax
	call	FAR PTR GETSYSCOLOR
	jmp	SHORT $L20151
	nop	
$I1910:
; Line 1523
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR _hAppPalette
	sub	ax,ax
	push	ax
	call	FAR PTR SELECTPALETTE
; Line 1524
	push	WORD PTR [bp+4]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1525
	sub	ax,ax
	mov	dx,256
$L20151:
	push	dx
	push	ax
	call	FAR PTR CREATESOLIDBRUSH
	mov	WORD PTR [bp-2],ax	;hbr
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
	nop	

ERASEHYPEROIDBKGND	ENDP
; Line 1538
	PUBLIC	DRAWSHADOWRECT
DRAWSHADOWRECT	PROC NEAR
	push	bp
	mov	bp,sp
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

DRAWSHADOWRECT	ENDP
; Line 1553
	PUBLIC	NCPAINTHYPEROID
NCPAINTHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,44
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
	je	$JCC10510
	jmp	$EX1920
$JCC10510:
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
	mov	ax,32
	push	ax
	call	FAR PTR GETSYSTEMMETRICS
	mov	WORD PTR [bp-12],ax	;cx
; Line 1568
	mov	ax,33
	push	ax
	call	FAR PTR GETSYSTEMMETRICS
	mov	WORD PTR [bp-18],ax	;cy
; Line 1569
	mov	ax,4
	push	ax
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
	sub	ax,ax
	push	ax
	call	FAR PTR SELECTPALETTE
; Line 1573
	push	WORD PTR [bp-44]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1574
	cmp	WORD PTR _bBW,0
	je	$I1935
; Line 1576
	push	WORD PTR [bp-44]	;hDC
	mov	ax,3
	mov	dx,256
	push	dx
	push	ax
	call	FAR PTR CREATESOLIDBRUSH
	push	ax
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-14],ax	;hbr
; Line 1577
	mov	ax,WORD PTR _hPen
	mov	WORD PTR [bp-16],ax	;hpenHi
	jmp	SHORT $L20152
$I1935:
; Line 1582
	push	WORD PTR [bp-44]	;hDC
	mov	ax,2
	mov	dx,256
	push	dx
	push	ax
	call	FAR PTR CREATESOLIDBRUSH
	push	ax
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-14],ax	;hbr
; Line 1583
	mov	ax,WORD PTR _hPen+6
	mov	WORD PTR [bp-16],ax	;hpenHi
; Line 1584
	mov	ax,WORD PTR _hPen+2
$L20152:
	mov	WORD PTR [bp-6],ax	;hpenLo
; Line 1587
	push	WORD PTR [bp-44]	;hDC
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-2]	;cyCap
	mov	cx,33
	mov	dx,240
	push	dx
	push	cx
	call	FAR PTR PATBLT
; Line 1588
	push	WORD PTR [bp-44]	;hDC
	sub	ax,ax
	push	ax
	mov	cx,WORD PTR [bp-20]
	sub	cx,WORD PTR [bp-18]	;cy
	push	cx
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-20]
	mov	cx,33
	mov	dx,240
	push	dx
	push	cx
	call	FAR PTR PATBLT
; Line 1589
	push	WORD PTR [bp-44]	;hDC
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-2]	;cyCap
	push	WORD PTR [bp-12]	;cx
	push	WORD PTR [bp-10]	;h
	mov	cx,33
	mov	dx,240
	push	dx
	push	cx
	call	FAR PTR PATBLT
; Line 1590
	push	WORD PTR [bp-44]	;hDC
	mov	ax,WORD PTR [bp-22]
	sub	ax,WORD PTR [bp-12]	;cx
	push	ax
	push	WORD PTR [bp-2]	;cyCap
	push	WORD PTR [bp-12]	;cx
	push	WORD PTR [bp-10]	;h
	mov	ax,33
	mov	dx,240
	push	dx
	push	ax
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
	mov	ax,WORD PTR [bp-12]	;cx
	dec	ax
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
	sub	ax,ax
	push	ax
	mov	cx,32754
	sub	dx,dx
	push	dx
	push	cx
	call	FAR PTR LOADBITMAP
	push	ax
	mov	cx,14
	push	cx
	lea	dx,WORD PTR [bp-42]	;bm
	push	ss
	push	dx
	mov	si,ax
	call	FAR PTR GETOBJECT
; Line 1609
	mov	cx,2
	mov	ax,WORD PTR [bp-40]
	cwd	
	idiv	cx
	mov	WORD PTR [bp-40],ax
; Line 1610
	push	WORD PTR [bp-28]	;hDCMem
	push	si
	call	FAR PTR SELECTOBJECT
	mov	WORD PTR [bp-4],ax	;hbmOld
; Line 1611
	push	WORD PTR [bp-44]	;hDC
	push	WORD PTR [bp-26]	;rect
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-28]	;hDCMem
	sub	ax,ax
	push	ax
	push	ax
	mov	cx,32
	mov	dx,204
	push	dx
	push	cx
	call	FAR PTR BITBLT
; Line 1612
	mov	ax,WORD PTR [bp-40]
	add	WORD PTR [bp-26],ax	;rect
; Line 1616
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISZOOMED
	or	ax,ax
	je	$I1938
	sub	ax,ax
	push	ax
	mov	ax,32747
	jmp	SHORT $L20153
$I1938:
	sub	ax,ax
	push	ax
	mov	ax,32748
$L20153:
	sub	dx,dx
	push	dx
	push	ax
	call	FAR PTR LOADBITMAP
	mov	WORD PTR [bp-8],ax	;hbm
	push	ax
	mov	cx,14
	push	cx
	lea	dx,WORD PTR [bp-42]	;bm
	push	ss
	push	dx
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
	sub	ax,ax
	push	ax
	push	ax
	mov	cx,32
	mov	dx,204
	push	dx
	push	cx
	call	FAR PTR BITBLT
; Line 1622
	sub	ax,ax
	push	ax
	mov	ax,32749
	cwd	
	push	dx
	push	ax
	call	FAR PTR LOADBITMAP
	push	ax
	mov	cx,14
	push	cx
	lea	cx,WORD PTR [bp-42]	;bm
	push	ss
	push	cx
	mov	si,ax
	call	FAR PTR GETOBJECT
; Line 1623
	push	WORD PTR [bp-28]	;hDCMem
	push	si
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
	sub	ax,ax
	push	ax
	push	ax
	mov	cx,32
	mov	dx,204
	push	dx
	push	cx
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
	cmp	WORD PTR $S1347_nScoreLen,0
	jle	$EX1920
$F1940:
	mov	bx,WORD PTR [bp-12]	;cx
	mov	BYTE PTR $S1348_szScore[bx],0
	mov	ax,WORD PTR $S1347_nScoreLen
	inc	WORD PTR [bp-12]	;cx
	cmp	WORD PTR [bp-12],ax	;cx
	jl	$F1940
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
	sub	sp,4
;	hDC = -4
;	hWnd = 14
;	message = 12
;	wParam = 10
;	lParam = 6
; Line 1650
	mov	ax,WORD PTR [bp+12]	;message
; Line 1748
	cmp	ax,134
	ja	$L20105
	cmp	ax,133
	jb	$JCC11384
	jmp	$SC1982
$JCC11384:
	cmp	ax,20
	jne	$JCC11392
	jmp	$SC1981
$JCC11392:
	jbe	$JCC11397
	jmp	$L20154
$JCC11397:
	dec	al
	je	$SC1952
	dec	al
	je	$SC1986
	sub	al,13
	jne	$JCC11412
	jmp	$SC1983
$JCC11412:
	sub	al,4
	jne	$JCC11419
	jmp	$SC1968
$JCC11419:
	jmp	$L20154
	nop	
$L20105:
	cmp	ax,274
	jne	$JCC11431
	jmp	$SC1960
$JCC11431:
	ja	$L20106
	sub	ax,258
	jne	$JCC11441
	jmp	$SC1969
$JCC11441:
	sub	ax,2
	jb	$L20154
	sub	ax,2
	ja	$JCC11454
	jmp	$SC1971
$JCC11454:
	jmp	SHORT $L20154
	nop	
$L20106:
	sub	ax,275
	jne	$JCC11465
	jmp	$SC1953
$JCC11465:
	sub	ax,508
	jne	$JCC11473
	jmp	$SC1984
$JCC11473:
	jmp	SHORT $L20154
; Line 1652
$SC1952:
; Line 1653
	call	RESTARTHYPEROID
; Line 1654
	push	WORD PTR [bp+14]	;hWnd
	mov	ax,1
	push	ax
	push	WORD PTR _nDrawDelay
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR SETTIMER
; Line 1655
	push	WORD PTR [bp+14]	;hWnd
	call	NCPAINTHYPEROID
; Line 1656
$SB1949:
; Line 1749
	sub	ax,ax
$L20159:
	cwd	
	jmp	$EX1947
	nop	
; Line 1739
$SC1986:
; Line 1740
	push	WORD PTR [bp+14]	;hWnd
	mov	ax,1
	push	ax
	call	FAR PTR KILLTIMER
; Line 1741
	push	WORD PTR [bp+14]	;hWnd
	mov	ax,2
	push	ax
	call	FAR PTR KILLTIMER
; Line 1742
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR SAVEHYPEROIDWINDOWPOS
; Line 1743
	sub	ax,ax
	push	ax
	call	FAR PTR POSTQUITMESSAGE
; Line 1744
	jmp	SHORT $SB1949
; Line 1726
$SC1983:
; Line 1727
	push	WORD PTR [bp+14]	;hWnd
	call	PAINTHYPEROID
; Line 1728
	jmp	SHORT $SB1949
; Line 1690
$SC1968:
; Line 1691
	sub	ax,ax
	push	ax
	call	PANIC
; Line 1692
$L20154:
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+12]	;message
	push	WORD PTR [bp+10]	;wParam
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;lParam
	call	FAR PTR DEFWINDOWPROC
	jmp	$EX1947
	nop	
; Line 1718
$SC1981:
; Line 1719
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+10]	;wParam
	call	ERASEHYPEROIDBKGND
	jmp	SHORT $L20159
	nop	
; Line 1721
$SC1982:
; Line 1723
	push	WORD PTR [bp+14]	;hWnd
	call	NCPAINTHYPEROID
	jmp	$L20155
	nop	
; Line 1694
$SC1969:
; Line 1695
	cmp	WORD PTR [bp+10],27	;wParam
	jne	$SB1949
	mov	ax,1
	push	ax
	call	PANIC
; Line 1696
	jmp	SHORT $SB1949
	nop	
; Line 1698
$SC1971:
; Line 1701
	test	WORD PTR [bp+8],8192
	jne	$L20154
; Line 1705
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1715
	cmp	ax,32
	je	$L20158
	ja	$L20154
	sub	al,9
	je	$L20158
	sub	al,18
	jne	$L20154
; Line 1708
	cmp	WORD PTR [bp+12],260	;message
	jne	$L20158
	mov	ax,1
	push	ax
	call	PANIC
; Line 1709
	jmp	SHORT $L20158
	nop	
; Line 1674
$SC1960:
; Line 1675
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1687
	sub	ax,200
	je	$SC1965
	dec	ax
	je	$SC1966
; Line 1685
	jmp	SHORT $L20154
	nop	
; Line 1677
$SC1965:
; Line 1678
	push	WORD PTR [bp+14]	;hWnd
	call	NEWGAME
; Line 1679
	jmp	$SB1949
	nop	
; Line 1681
$SC1966:
; Line 1682
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR ABOUTHYPEROID
; Line 1683
	jmp	$SB1949
	nop	
; Line 1658
$SC1953:
; Line 1659
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1671
	dec	ax
	je	$SC1958
	dec	ax
	je	$SC1959
	jmp	$SB1949
; Line 1661
$SC1958:
; Line 1662
	push	WORD PTR [bp+14]	;hWnd
	call	CHECKSCORE
; Line 1663
	push	WORD PTR [bp+14]	;hWnd
	call	DRAWOBJECTS
; Line 1664
	jmp	SHORT $L20158
; Line 1666
$SC1959:
; Line 1667
	push	WORD PTR [bp+14]	;hWnd
	mov	ax,2
	push	ax
	call	FAR PTR KILLTIMER
; Line 1668
	mov	WORD PTR _bRestart,0
; Line 1669
	call	RESTARTHYPEROID
; Line 1670
$L20158:
	sub	ax,ax
	jmp	SHORT $L20156
	nop	
; Line 1730
$SC1984:
; Line 1732
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR GETDC
	mov	WORD PTR [bp-4],ax	;hDC
; Line 1733
	push	ax
	push	WORD PTR _hAppPalette
	sub	ax,ax
	push	ax
	call	FAR PTR SELECTPALETTE
; Line 1734
	push	WORD PTR [bp-4]	;hDC
	call	FAR PTR REALIZEPALETTE
; Line 1735
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp-4]	;hDC
	call	FAR PTR RELEASEDC
; Line 1737
$L20155:
	mov	ax,1
$L20156:
	sub	dx,dx
; Line 1750
$EX1947:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10

HYPEROIDWNDPROC	ENDP
HYPEROID_TEXT      ENDS
CONST      SEGMENT
$T20119	DQ	03f9921fb6134ce3er    ;	2.454369335937500E-02
$T20120	DQ	040d0000000000000r    ;	16384.00000000000
CONST      ENDS
HYPEROID_TEXT      SEGMENT
	ASSUME	CS: HYPEROID_TEXT
; Line 1757
	PUBLIC	INITHYPEROID
INITHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
;	dRad = -10
;	nCnt = -2
; Line 1762
	call	FAR PTR CREATEHYPEROIDPALETTE
	mov	WORD PTR _hAppPalette,ax
; Line 1763
	or	ax,ax
	jne	$I1991
$L20160:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1764
$I1991:
	mov	WORD PTR [bp-2],0	;nCnt
	mov	WORD PTR [bp-12],OFFSET DGROUP:_hPen
$F1992:
; Line 1766
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,256
	push	ax
	push	WORD PTR [bp-2]	;nCnt
	call	FAR PTR CREATEPEN
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx],ax
; Line 1767
	mov	bx,WORD PTR [bp-12]
	cmp	WORD PTR [bx],0
	je	$L20160
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-12],2
	cmp	WORD PTR [bp-12],OFFSET DGROUP:_hPen+32
	jb	$F1992
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;nCnt
	mov	WORD PTR [bp-14],ax
; Line 1769
$F1996:
; Line 1771
	push	WORD PTR _hAppInst
	mov	ax,WORD PTR [bp-2]	;nCnt
	add	ax,50
	sub	dx,dx
	push	dx
	push	ax
	call	FAR PTR LOADBITMAP
	mov	bx,WORD PTR [bp-14]
	mov	WORD PTR _hBitmap[bx],ax
; Line 1772
	mov	bx,WORD PTR [bp-14]
	cmp	WORD PTR _hPen[bx],0
	je	$L20160
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-14],2
	cmp	WORD PTR [bp-14],34
	jl	$F1996
; Line 1776
	call	FAR PTR GETCURRENTTIME
	mov	WORD PTR $S1346_dwSeed,ax
	mov	WORD PTR $S1346_dwSeed+2,dx
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;nCnt
	mov	WORD PTR [bp-16],ax
; Line 1779
$F2000:
; Line 1782
	fild	WORD PTR [bp-2]	;nCnt
	fmul	QWORD PTR $T20119
	fst	QWORD PTR [bp-28]
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	FAR PTR _cos
	add	sp,8
	mov	bx,ax
	fld	QWORD PTR [bx]
	fmul	QWORD PTR $T20120
	call	FAR PTR __aFftol
	mov	bx,WORD PTR [bp-16]
	mov	WORD PTR _nCos[bx],ax
; Line 1783
	fld	QWORD PTR [bp-28]
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	FAR PTR _sin
	add	sp,8
	mov	bx,ax
	fld	QWORD PTR [bx]
	fmul	QWORD PTR $T20120
	call	FAR PTR __aFftol
	mov	bx,WORD PTR [bp-16]
	mov	WORD PTR _nSin[bx],ax
; Line 1779
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-16],2
	cmp	WORD PTR [bp-16],512
	jl	$F2000
; Line 1787
	call	FAR PTR GETHYPEROIDINI
	mov	WORD PTR [bp-18],OFFSET DGROUP:_Obj
; Line 1790
$F2003:
; Line 1791
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	push	WORD PTR [bp-18]
	call	ADDHEAD
	add	WORD PTR [bp-18],88
	cmp	WORD PTR [bp-18],OFFSET DGROUP:_Obj+8800
	jb	$F2003
; Line 1794
	mov	ax,OFFSET DGROUP:_FreeList
	push	ax
	call	REMHEAD
	mov	WORD PTR _npPlayer,ax
; Line 1795
	mov	bx,ax
	mov	BYTE PTR [bx+23],5
; Line 1796
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+12],256
	mov	WORD PTR [bp-20],0
; Line 1797
$F2006:
; Line 1798
	mov	bx,WORD PTR [bp-20]
	mov	ax,WORD PTR $S1351_Player[bx]
	mov	dx,WORD PTR $S1351_Player[bx+2]
	mov	bx,WORD PTR _npPlayer
	mov	si,WORD PTR [bp-20]
	mov	WORD PTR [bx+24][si],ax
	mov	WORD PTR [bx+26][si],dx
	add	WORD PTR [bp-20],4
	cmp	WORD PTR [bp-20],20
	jl	$F2006
; Line 1800
	mov	ax,1
; Line 1801
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

INITHYPEROID	ENDP
; Line 1808
	PUBLIC	EXITHYPEROID
EXITHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,6
;	nCnt = -2
; Line 1811
	cmp	WORD PTR _hAppPalette,0
	je	$I2011
	push	WORD PTR _hAppPalette
	call	FAR PTR DELETEOBJECT
; Line 1812
$I2011:
	mov	WORD PTR [bp-4],OFFSET DGROUP:_hPen
$F2012:
; Line 1813
	mov	bx,WORD PTR [bp-4]
	cmp	WORD PTR [bx],0
	je	$FC2013
	push	WORD PTR [bx]
	call	FAR PTR DELETEOBJECT
; Line 1812
$FC2013:
	add	WORD PTR [bp-4],2
	cmp	WORD PTR [bp-4],OFFSET DGROUP:_hPen+32
	jb	$F2012
; Line 1814
	mov	WORD PTR [bp-6],OFFSET DGROUP:_hBitmap
$F2016:
; Line 1815
	mov	bx,WORD PTR [bp-6]
	cmp	WORD PTR [bx],0
	je	$FC2017
	push	WORD PTR [bx]
	call	FAR PTR DELETEOBJECT
; Line 1814
$FC2017:
	add	WORD PTR [bp-6],2
	cmp	WORD PTR [bp-6],OFFSET DGROUP:_hBitmap+34
	jb	$F2016
; Line 1816
	mov	sp,bp
	pop	bp
	ret	

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
	sub	sp,20
;	hInstance = 14
;	hPrevInstance = 12
;	lpszCmdLine = 8
;	nCmdShow = 6
;	msg = -20
; Line 1827
	mov	ax,WORD PTR [bp+14]	;hInstance
	mov	WORD PTR _hAppInst,ax
; Line 1828
	cmp	WORD PTR [bp+12],0	;hPrevInstance
	jne	$I2026
; Line 1831
	call	FAR PTR CREATEHYPEROIDCLASS
	or	ax,ax
	jne	$I2028
$L20161:
	sub	ax,ax
	jmp	SHORT $EX2024
; Line 1833
$I2026:
; Line 1836
	push	WORD PTR [bp+12]	;hPrevInstance
	mov	ax,OFFSET DGROUP:_szAppName
	push	ax
	mov	ax,32
	push	ax
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
	je	$L20161
; Line 1842
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	call	FAR PTR GETMESSAGE
	or	ax,ax
	je	$Abort2030
$FC2033:
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
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	ax
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
