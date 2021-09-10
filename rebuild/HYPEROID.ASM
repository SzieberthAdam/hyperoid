;	Static Name Aliases
;
;	$S1352_dwSeed	EQU	dwSeed
;	$S1353_nScoreLen	EQU	nScoreLen
;	$S1354_szScore	EQU	szScore
;	$S1355_rectScoreClip	EQU	rectScoreClip
;	$S1356_rectShotClip	EQU	rectShotClip
;	$S1357_Player	EQU	Player
;	$S1358_Spinner	EQU	Spinner
;	$S1359_Swarmer	EQU	Swarmer
;	$S1360_Hunter	EQU	Hunter
;	$S1361_Bonus	EQU	Bonus
;	$S1509_nNextBonus	EQU	nNextBonus
;	$S1580_nNextHunter	EQU	nNextHunter
;	$S1618_nNextSwarmer	EQU	nNextSwarmer
;	$S1650_nNextSpinner	EQU	nNextSpinner
;	$S1785_nBombing	EQU	nBombing
;	$S1786_nShotDelay	EQU	nShotDelay
	TITLE   HYPEROID.C
	.186
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
EXTRN	SETWINDOWTEXT:FAR
EXTRN	GETASYNCKEYSTATE:FAR
EXTRN	PRINTLETTERS:FAR
EXTRN	GETCLIENTRECT:FAR
EXTRN	GETWINDOWRECT:FAR
EXTRN	SPINLETTERS:FAR
EXTRN	SETTIMER:FAR
EXTRN	CREATEHYPEROIDPALETTE:FAR
EXTRN	KILLTIMER:FAR
EXTRN	CREATEHYPEROIDCLASS:FAR
EXTRN	__aFCIcos:FAR
EXTRN	__aFCIsin:FAR
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
EXTRN	MOVETO:FAR
EXTRN	GETSYSCOLOR:FAR
EXTRN	__aFftol:FAR
EXTRN	LINETO:FAR
EXTRN	SELECTPALETTE:FAR
EXTRN	ABOUTHYPEROID:FAR
EXTRN	REALIZEPALETTE:FAR
EXTRN	MULDIV:FAR
EXTRN	POLYLINE:FAR
EXTRN	__aFulmul:FAR
EXTRN	FILLRECT:FAR
EXTRN	SETMAPMODE:FAR
EXTRN	__aFldiv:FAR
EXTRN	__aFlmul:FAR
EXTRN	_wsprintf:FAR
EXTRN	PATBLT:FAR
EXTRN	SETWINDOWEXT:FAR
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
EXTRN	GETINSTANCEDATA:FAR
_BSS      SEGMENT
COMM NEAR	_SwarmerList:	BYTE:	 4
COMM NEAR	_LetterList:	BYTE:	 4
COMM NEAR	_BonusList:	BYTE:	 4
COMM NEAR	_nCos:	 2:	 256
COMM NEAR	_nSin:	 2:	 256
COMM NEAR	_hPen:	 2:	 16
COMM NEAR	_Obj:	 88:	 100
COMM NEAR	_hBitmap:	 2:	 17
_BSS      ENDS
EXTRN	__ctype:BYTE
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
EXTRN	__fltused:NEAR
_BSS      ENDS
_DATA      SEGMENT
	ORG	$+116
$SG1419	DB	'GAME OVER',  00H
$SG1421	DB	'GET READY',  00H
$SG1423	DB	'LEVEL %u',  00H
$SG1430	DB	'EXTRA LIFE',  00H
$SG1477	DB	'l',  00H
$SG1527	DB	'%ld',  00H
$SG1529	DB	'EXTRA SHIELD',  00H
$SG1531	DB	'EXTRA BOMB',  00H
	ORG	$+12
$SG1845	DB	'%2.2u',  00H
$SG1849	DB	'%7.7lu',  00H
$SG1902	DB	'Program Manager Help - PROGMAN.HLP',  00H
	ORG	$-246
$S1357_Player	DW	00H
	DW	00H
	DW	0a0H
	DW	096H
	DW	00H
	DW	0faH
	DW	060H
	DW	096H
	DW	00H
	DW	00H
$S1358_Spinner	DW	0a0H
	DW	096H
	DW	0e0H
	DW	064H
	DW	060H
	DW	064H
	DW	020H
	DW	096H
	DW	0a0H
	DW	096H
$S1359_Swarmer	DW	00H
	DW	064H
	DW	040H
	DW	064H
	DW	080H
	DW	064H
	DW	0c0H
	DW	064H
	DW	00H
	DW	064H
$S1360_Hunter	DW	0a0H
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
$S1361_Bonus	DW	00H
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
$S1509_nNextBonus	DW	03e8H
$S1580_nNextHunter	DW	0c8H
$S1618_nNextSwarmer	DW	03e8H
$S1650_nNextSpinner	DW	03e8H
$S1785_nBombing	DW	00H
$S1786_nShotDelay	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+50
$S1352_dwSeed	DW 02H DUP (?)
	ORG	$-6
$S1353_nScoreLen	DW 01H DUP (?)
	ORG	$-50
$S1354_szScore	DW 014H DUP (?)
	ORG	$+14
$S1355_rectScoreClip	DW 04H DUP (?)
	ORG	$-22
$S1356_rectShotClip	DW 04H DUP (?)
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
	push	3
	push	17405
	push	WORD PTR $S1352_dwSeed+2
	push	WORD PTR $S1352_dwSeed
	call	FAR PTR __aFulmul
	add	ax,-24893
	adc	dx,38
	mov	WORD PTR $S1352_dwSeed,ax
	mov	WORD PTR $S1352_dwSeed+2,dx
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
	je	$I1367
; Line 120
	mov	bx,WORD PTR [bp+4]	;npNode
	mov	WORD PTR [bx+2],0
; Line 121
	mov	si,WORD PTR [bp+6]	;npList
	mov	di,WORD PTR [si]
	mov	WORD PTR [bx],di
	mov	WORD PTR [di+2],bx
	mov	WORD PTR [si],bx
; Line 123
	jmp	SHORT $EX1366
	nop	
$I1367:
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
$EX1366:
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
	je	$I1371
; Line 139
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npNode
	cmp	ax,WORD PTR [bx+2]
	je	$I1373
; Line 142
	mov	bx,ax
	mov	bx,WORD PTR [bx]
	mov	si,WORD PTR [bp+4]	;npList
	mov	WORD PTR [si],bx
	mov	WORD PTR [bx+2],0
; Line 144
	jmp	SHORT $I1374
	nop	
$I1373:
	sub	ax,ax
	mov	WORD PTR [bx+2],ax
	mov	WORD PTR [bx],ax
$I1374:
; Line 145
	mov	ax,WORD PTR [bp-2]	;npNode
	jmp	SHORT $EX1370
; Line 147
$I1371:
	sub	ax,ax
; Line 148
$EX1370:
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
	je	$I1379
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bx+2]
	jmp	SHORT $L20131
	nop	
$I1379:
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR [bp+6]	;npList
$L20131:
	mov	WORD PTR [bx],ax
; Line 158
	mov	bx,WORD PTR [bp+4]	;npNode
	cmp	WORD PTR [bx],0
	je	$I1381
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bx]
	jmp	SHORT $L20132
$I1381:
	mov	ax,WORD PTR [bx+2]
	mov	bx,WORD PTR [bp+6]	;npList
$L20132:
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
	mov	cx,WORD PTR [bx+10]
	add	WORD PTR [bx+6],cx
	mov	cx,WORD PTR [bx+6]
	mov	WORD PTR [bp-38],cx	;y
; Line 174
	cmp	ax,-8492
	jge	$I1391
	mov	ax,8492
	jmp	SHORT $L20133
$I1391:
	cmp	WORD PTR [bp-36],8492	;x
	jle	$I1392
	mov	ax,-8492
$L20133:
	mov	WORD PTR [bp-36],ax	;x
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+4],ax
; Line 176
$I1392:
	cmp	WORD PTR [bp-38],-8492	;y
	jge	$I1394
	mov	ax,8492
	jmp	SHORT $L20134
	nop	
$I1394:
	cmp	WORD PTR [bp-38],8492	;y
	jle	$I1395
	mov	ax,-8492
$L20134:
	mov	WORD PTR [bp-38],ax	;y
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	WORD PTR [bx+6],ax
; Line 179
$I1395:
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
	dec	ax
	mov	WORD PTR [bp-2],ax	;nCnt
	or	ax,ax
	jl	$FB1399
	mov	si,ax
	shl	si,2
	lea	ax,WORD PTR [bp-34][si]
	mov	WORD PTR [bp-46],ax
	add	si,WORD PTR [bp+4]	;npObj
	add	si,24
	mov	WORD PTR [bp-48],si
$F1397:
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
	push	0
	push	16384
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	ax,WORD PTR [bp-36]	;x
	mov	bx,WORD PTR [bp-46]
	mov	WORD PTR [bx],ax
; Line 184
	push	0
	push	16384
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
	jns	$F1397
; Line 185
$FB1399:
; Line 187
	mov	bx,WORD PTR [bp+4]	;npObj
	cmp	BYTE PTR [bx+23],1
	ja	$JCC521
	jmp	$I1402
$JCC521:
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
	jg	$JCC570
	jmp	$EX1385
$JCC570:
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
	jl	$EX1385
	mov	si,ax
	shl	si,2
	lea	ax,WORD PTR [bp-34][si]
	mov	WORD PTR [bp-50],ax
	add	si,WORD PTR [bp+4]	;npObj
	add	si,56
	mov	WORD PTR [bp-52],si
$F1404:
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
	jns	$F1404
	jmp	SHORT $EX1385
	nop	
; Line 199
$I1402:
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
	jle	$EX1385
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
; Line 208
$EX1385:
	pop	si
	mov	sp,bp
	pop	bp
	ret	4
	nop	

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
	je	$JCC769
	jmp	$EX1410
$JCC769:
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
; Line 236
	or	ax,ax
	je	$SC1418
	dec	ax
	je	$SC1420
	dec	ax
	je	$SC1422
	mov	sp,bp
	pop	bp
	ret	2
	nop	
; Line 226
$SC1418:
; Line 227
	push	OFFSET DGROUP:$SG1419
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
$SC1420:
; Line 230
	push	OFFSET DGROUP:$SG1421
	jmp	SHORT $L20135
	nop	
; Line 232
$SC1422:
; Line 233
	mov	ax,WORD PTR _nLevel
	inc	ax
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1423
	lea	ax,WORD PTR [bp-32]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,10
; Line 234
	lea	ax,WORD PTR [bp-32]	;szBuff
	push	ax
$L20135:
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;Pt
	push	9
	push	300
	call	FAR PTR PRINTLETTERS
; Line 237
$EX1410:
	mov	sp,bp
	pop	bp
	ret	2

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
	push	7
	push	150
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
	push	OFFSET DGROUP:$SG1430
	call	PRINTPLAYERMESSAGE
; Line 262
	mov	bx,WORD PTR _npPlayer
	inc	WORD PTR [bx+18]
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
; Line 263
	cmp	al,3
	jbe	$EX1429
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 264
$EX1429:
	mov	sp,bp
	pop	bp
	ret	

ADDEXTRALIFE	ENDP
; Line 271
	PUBLIC	HIT
HIT	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,8
	push	di
	push	si
;	hDC = 6
;	npObj = 4
;	nCnt = -2
;	npFlame = -4
	mov	WORD PTR [bp-6],0
; Line 274
$F1436:
; Line 277
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npFlame
	or	ax,ax
	jne	$JCC1044
	jmp	$EX1434
$JCC1044:
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
	mov	ax,50
	sub	ax,WORD PTR [si+18]
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	di,dx
	cwd	
	push	dx
	push	ax
	mov	si,cx
	mov	WORD PTR [bp-8],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npFlame
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	di
	push	si
	mov	si,WORD PTR [bp-8]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npFlame
	add	WORD PTR [bx+10],ax
; Line 289
	push	OFFSET DGROUP:_FlameList
	push	bx
	call	ADDHEAD
	add	BYTE PTR [bp-5],1
	cmp	WORD PTR [bp-6],1536
	jge	$JCC1231
	jmp	$F1436
$JCC1231:
; Line 291
$EX1434:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4

HIT	ENDP
; Line 298
	PUBLIC	EXPLODE
EXPLODE	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,12
	push	di
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
	jg	$JCC1279
	jmp	$FB1448
$JCC1279:
	mov	ax,WORD PTR [bp+4]	;npObj
	add	ax,24
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-10],0
$F1446:
; Line 305
	push	2
	call	ARAND
	or	ax,ax
	je	$JCC1305
	jmp	$FC1447
$JCC1305:
; Line 306
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-6],ax	;npFlame
	or	ax,ax
	jne	$JCC1321
	jmp	$EX1443
$JCC1321:
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
	mov	ax,WORD PTR [bp-10]
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
	mov	bx,WORD PTR [bp-8]
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	WORD PTR [si+24],ax
	mov	WORD PTR [si+26],dx
; Line 317
	mov	ax,WORD PTR [bp-4]	;nSize
	sub	ax,WORD PTR [bp-2]	;nCnt
	dec	ax
	jne	$I1452
	mov	bx,WORD PTR [bp+4]	;npObj
	mov	ax,WORD PTR [bx+24]
	mov	dx,WORD PTR [bx+26]
	jmp	SHORT $I1453
$I1452:
	mov	bx,WORD PTR [bp-8]
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
$I1453:
	mov	bx,WORD PTR [bp-6]	;npFlame
	mov	WORD PTR [bx+28],ax
	mov	WORD PTR [bx+30],dx
; Line 319
	push	0
	push	16384
	mov	ax,60
	mov	bx,WORD PTR [bp-6]	;npFlame
	sub	ax,WORD PTR [bx+18]
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-12],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-6]	;npFlame
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-12]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-6]	;npFlame
	add	WORD PTR [bx+10],ax
; Line 320
	push	OFFSET DGROUP:_FlameList
	push	bx
	call	ADDHEAD
; Line 302
$FC1447:
	add	WORD PTR [bp-8],4
	add	BYTE PTR [bp-9],1
	mov	ax,WORD PTR [bp-4]	;nSize
	inc	WORD PTR [bp-2]	;nCnt
	cmp	WORD PTR [bp-2],ax	;nCnt
	jge	$JCC1585
	jmp	$F1446
$JCC1585:
; Line 321
$FB1448:
; Line 322
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR [bp+4]	;npObj
	call	HIT
; Line 323
$EX1443:
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
	sub	sp,8
	push	si
;	hDC = 6
;	npObj = 4
;	Vel = -6
;	nMass = -2
;	nSpin = -8
; Line 334
	cmp	WORD PTR _nSafe,0
	je	$JCC1620
	jmp	$I1461
$JCC1620:
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+18],0
	jg	$JCC1633
	jmp	$I1461
$JCC1633:
; Line 339
	mov	ax,WORD PTR [bx+16]
	mov	si,WORD PTR [bp+4]	;npObj
	add	ax,WORD PTR [si+16]
	mov	WORD PTR [bp-8],ax	;nSpin
; Line 340
	push	ax
	push	WORD PTR [bx+12]
	mov	ax,WORD PTR [bx+12]
	add	ax,WORD PTR [si+12]
	mov	WORD PTR [bp-2],ax	;nMass
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
; Line 344
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+10]
	sub	ax,WORD PTR [si+10]
	mov	WORD PTR [bp-4],ax
; Line 345
	mov	ax,WORD PTR [bx+8]
	sub	ax,WORD PTR [si+8]
	mov	WORD PTR [bp-6],ax	;Vel
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
	je	$I1462
; Line 353
	mov	bx,WORD PTR _npPlayer
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
	cmp	al,3
	jbe	$I1463
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 354
$I1463:
	push	WORD PTR [bp+6]	;hDC
	push	WORD PTR _npPlayer
	call	HIT
; Line 355
	mov	ax,1
	jmp	SHORT $EX1456
	nop	
; Line 359
$I1462:
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 360
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	EXPLODE
; Line 361
	push	0
	call	SETRESTART
; Line 334
$I1461:
	sub	ax,ax
; Line 363
$EX1456:
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
	push	di
	push	si
;	cLetter = 8
;	nSize = 6
;	npLtr = -4
;	nCnt = -6
;	npDesc = -8
; Line 375
	cmp	BYTE PTR [bp+8],48	;cLetter
	jl	$I1470
	cmp	BYTE PTR [bp+8],57	;cLetter
	jg	$I1470
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szNumberDesc[bx-96]
$L20136:
	mov	WORD PTR [bp-8],ax	;npDesc
; Line 376
	jmp	SHORT $I1471
$I1470:
	cmp	BYTE PTR [bp+8],65	;cLetter
	jl	$I1472
	cmp	BYTE PTR [bp+8],90	;cLetter
	jg	$I1472
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szLetterDesc[bx-130]
	jmp	SHORT $L20136
$I1472:
	cmp	BYTE PTR [bp+8],97	;cLetter
	jl	$I1474
	cmp	BYTE PTR [bp+8],122	;cLetter
	jg	$I1474
	mov	al,BYTE PTR [bp+8]	;cLetter
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _szLetterDesc[bx-194]
	jmp	SHORT $L20136
$I1474:
	cmp	BYTE PTR [bp+8],46	;cLetter
	je	$JCC1970
	jmp	$I1476
$JCC1970:
	mov	WORD PTR [bp-8],OFFSET DGROUP:$SG1477	;npDesc
; Line 379
$I1471:
; Line 381
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npLtr
	or	ax,ax
	jne	$JCC1991
	jmp	$I1479
$JCC1991:
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
	push	ds
	pop	es
	mov	di,WORD PTR [bp-8]	;npDesc
	mov	cx,-1
	repnz	scasb
	not	cx
	dec	cx
	mov	WORD PTR [bp-6],cx	;nCnt
	mov	BYTE PTR [bx+23],cl
	mov	ax,WORD PTR [bp-6]	;nCnt
	shl	ax,2
	add	bx,ax
	add	bx,26
	mov	WORD PTR [bp-12],bx
; Line 389
	jmp	SHORT $L20137
	nop	
$FC1481:
; Line 391
	mov	bx,WORD PTR [bp-8]	;npDesc
	mov	si,WORD PTR [bp-6]	;nCnt
	mov	al,BYTE PTR [bx][si]
	cbw	
	mov	bx,ax
	shl	bx,2
	mov	ax,WORD PTR _LetterPart[bx-388]
	mov	dx,WORD PTR _LetterPart[bx-386]
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx-2],ax
	mov	WORD PTR [bx],dx
; Line 392
	mov	bx,WORD PTR [bp-12]
	push	WORD PTR [bx]
	push	WORD PTR [bp+6]	;nSize
	push	256
	call	FAR PTR MULDIV
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx],ax
; Line 393
$L20137:
	sub	WORD PTR [bp-12],4
	mov	ax,WORD PTR [bp-6]	;nCnt
	dec	WORD PTR [bp-6]	;nCnt
	or	ax,ax
	jne	$FC1481
; Line 394
	push	OFFSET DGROUP:_LetterList
	push	WORD PTR [bp-4]	;npLtr
	call	ADDHEAD
; Line 396
$I1479:
	mov	ax,WORD PTR [bp-4]	;npLtr
	jmp	SHORT $EX1466
	nop	
; Line 379
$I1476:
	sub	ax,ax
; Line 397
$EX1466:
	pop	si
	pop	di
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	4

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
	je	$EX1484
$F1487:
; Line 409
	mov	bx,WORD PTR [bp-2]	;npLtr
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 410
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 419
	or	ax,ax
	je	$SC1495
	sub	ax,3
	je	$SC1494
	jmp	SHORT $SB1491
	nop	
; Line 415
$SC1495:
; Line 416
	push	OFFSET DGROUP:_LetterList
	push	WORD PTR [bp-2]	;npLtr
	call	REMOVE
; Line 417
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npLtr
	call	ADDHEAD
; Line 418
	jmp	SHORT $SB1491
; Line 412
$SC1494:
; Line 413
	mov	bx,WORD PTR [bp-2]	;npLtr
	dec	BYTE PTR [bx+22]
; Line 419
$SB1491:
; Line 420
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npLtr
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npLtr
	or	ax,ax
	jne	$F1487
; Line 422
$EX1484:
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
	sub	sp,12
	push	di
	push	si
;	npBonus = -4
;	nCnt = -2
; Line 433
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npBonus
	or	ax,ax
	jne	$JCC2263
	jmp	$EX1497
$JCC2263:
; Line 435
	push	16984
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
	mov	cx,12
	lea	di,WORD PTR [bx+24]
	mov	si,OFFSET DGROUP:$S1361_Bonus
	push	ds
	pop	es
	rep	movsw
; Line 447
	push	0
	push	16384
	mov	ax,WORD PTR _nLevel
	add	ax,15
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-4]	;npBonus
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-12],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npBonus
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-12]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npBonus
	add	WORD PTR [bx+10],ax
; Line 448
	push	OFFSET DGROUP:_BonusList
	push	bx
	call	ADDHEAD
; Line 450
$EX1497:
	pop	si
	pop	di
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
	je	$I1510
	dec	WORD PTR $S1509_nNextBonus
	jns	$I1510
; Line 463
	call	CREATEBONUS
; Line 464
	mov	WORD PTR $S1509_nNextBonus,1000
; Line 467
$I1510:
	mov	ax,WORD PTR _BonusList
	mov	WORD PTR [bp-2],ax	;npBonus
	or	ax,ax
	jne	$JCC2533
	jmp	$EX1506
$JCC2533:
$F1511:
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
	jge	$JCC2592
	jmp	$I1517
$JCC2592:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jl	$JCC2603
	jmp	$I1517
$JCC2603:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jge	$JCC2614
	jmp	$I1517
$JCC2614:
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$JCC2625
	jmp	$I1517
$JCC2625:
; Line 479
	cmp	WORD PTR [bx+18],0
	jg	$JCC2634
	jmp	$I1518
$JCC2634:
	mov	bx,WORD PTR [bp-2]	;npBonus
	mov	ax,WORD PTR [bx+18]
; Line 504
	dec	ax
	je	$SC1523
	dec	ax
	je	$SC1528
	dec	ax
	je	$SC1530
	dec	ax
	je	$SC1532
	jmp	SHORT $I1518
	nop	
; Line 481
$SC1523:
; Line 485
	mov	ax,1000
	imul	WORD PTR _nLevel
	mov	WORD PTR [bp-52],ax	;lBonus
	mov	WORD PTR [bp-50],dx
	or	dx,ax
	jne	$I1526
	mov	WORD PTR [bp-52],500	;lBonus
	mov	WORD PTR [bp-50],0
; Line 486
$I1526:
	mov	ax,WORD PTR [bp-52]	;lBonus
	mov	dx,WORD PTR [bp-50]
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 487
	push	dx
	push	ax
	push	ds
	push	OFFSET DGROUP:$SG1527
	lea	ax,WORD PTR [bp-48]	;szBuff
	push	ss
	push	ax
	call	FAR PTR _wsprintf
	add	sp,12
; Line 488
	lea	ax,WORD PTR [bp-48]	;szBuff
	push	ax
$L20138:
	call	PRINTPLAYERMESSAGE
; Line 490
	jmp	SHORT $I1518
	nop	
; Line 491
$SC1528:
; Line 492
	mov	WORD PTR _nSafe,15
; Line 493
	inc	WORD PTR _nShield
; Line 494
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],7
; Line 495
	push	OFFSET DGROUP:$SG1529
	jmp	SHORT $L20138
	nop	
; Line 497
$SC1530:
; Line 498
	inc	WORD PTR _nBomb
; Line 499
	push	OFFSET DGROUP:$SG1531
	jmp	SHORT $L20138
	nop	
; Line 501
$SC1532:
; Line 502
	call	ADDEXTRALIFE
; Line 505
$I1518:
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
; Line 510
	jmp	$I1533
	nop	
$I1517:
	mov	ax,WORD PTR $S1356_rectShotClip
	cmp	WORD PTR [bp-12],ax
	jl	$I1533
	mov	ax,WORD PTR $S1356_rectShotClip+4
	cmp	WORD PTR [bp-16],ax	;rect
	jge	$I1533
	mov	ax,WORD PTR $S1356_rectShotClip+2
	cmp	WORD PTR [bp-10],ax
	jl	$I1533
	mov	ax,WORD PTR $S1356_rectShotClip+6
	cmp	WORD PTR [bp-14],ax
	jge	$I1533
; Line 512
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$I1533
$F1535:
; Line 514
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1536
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1536
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1536
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$FC1536
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
	push	OFFSET DGROUP:_BonusList
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 519
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 512
$FC1536:
	mov	bx,WORD PTR [bp-8]	;npShot
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1535
; Line 522
$I1533:
	mov	bx,WORD PTR [bp-2]	;npBonus
	cmp	WORD PTR [bx+18],0
	je	$I1540
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1540
; Line 524
	mov	bx,WORD PTR [bp-2]	;npBonus
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
	jne	$I1540
; Line 529
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npBonus
	call	EXPLODE
; Line 530
	push	OFFSET DGROUP:_BonusList
	push	WORD PTR [bp-2]	;npBonus
	call	REMOVE
; Line 531
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npBonus
	call	ADDHEAD
; Line 534
$I1540:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npBonus
	sub	ax,WORD PTR [bx+4]
$L20139:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 535
	cmp	ax,-16
	jl	$FB1545
	cmp	ax,16
	jle	$L20022
$FB1545:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20139
	nop	
$L20022:
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
$L20140:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 538
	cmp	ax,-16
	jl	$FB1549
	cmp	ax,16
	jle	$L20023
$FB1549:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20140
	nop	
$L20023:
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
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npBonus
	or	ax,ax
	je	$JCC3147
	jmp	$F1511
$JCC3147:
; Line 542
$EX1506:
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
	jne	$JCC3174
	jmp	$EX1551
$JCC3174:
$F1554:
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
	jl	$I1558
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+4],ax
	jge	$I1558
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$I1558
	mov	ax,WORD PTR [bp-6]
	cmp	WORD PTR [bx+6],ax
	jge	$I1558
; Line 562
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	HITPLAYER
; Line 563
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [bx+18],1
; Line 565
$I1558:
	mov	bx,WORD PTR [bp-2]	;npShot
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 574
	or	ax,ax
	je	$SC1564
	sub	ax,7
	je	$SC1563
	jmp	SHORT $SB1560
; Line 570
$SC1564:
; Line 571
	push	OFFSET DGROUP:_HunterShotList
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 572
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 573
	jmp	SHORT $SB1560
; Line 567
$SC1563:
; Line 568
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],6
; Line 574
$SB1560:
; Line 575
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	je	$JCC3340
	jmp	$F1554
$JCC3340:
; Line 577
$EX1551:
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
	sub	sp,4
	push	di
	push	si
;	npHunt = 4
;	npShot = -2
; Line 587
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC3371
	jmp	$EX1566
$JCC3371:
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
	push	5
	call	ARAND
	mov	bx,WORD PTR [bp+4]	;npHunt
	add	ax,WORD PTR [bx+14]
	dec	ax
	dec	ax
	mov	WORD PTR [si+14],ax
; Line 595
	push	2
	call	ARAND
	cmp	ax,1
	sbb	ax,ax
	and	al,236
	add	ax,10
	mov	WORD PTR [si+16],ax
; Line 596
	push	8
	call	ARAND
	add	ax,16
	mov	WORD PTR [si+18],ax
; Line 597
	mov	BYTE PTR [si+22],7
; Line 598
	mov	BYTE PTR [si+23],2
; Line 599
	mov	WORD PTR [si+24],128
; Line 601
	mov	WORD PTR [si+28],0
; Line 602
	mov	ax,50
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+30],ax
; Line 603
	push	0
	push	16384
	mov	ax,WORD PTR [si+18]
	add	ax,200
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	di,dx
	cwd	
	push	dx
	push	ax
	mov	si,cx
	mov	WORD PTR [bp-4],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	di
	push	si
	mov	si,WORD PTR [bp-4]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+10],ax
; Line 604
	push	OFFSET DGROUP:_HunterShotList
	push	bx
	call	ADDHEAD
; Line 606
$EX1566:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	2

FIREHUNTERSHOT	ENDP
; Line 613
	PUBLIC	CREATEHUNTER
CREATEHUNTER	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,12
	push	di
	push	si
;	npHunt = -4
;	nCnt = -2
; Line 617
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	jne	$JCC3607
	jmp	$EX1569
$JCC3607:
; Line 619
	push	16984
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
	mov	cx,16
	lea	di,WORD PTR [bx+24]
	mov	si,OFFSET DGROUP:$S1360_Hunter
	push	ds
	pop	es
	rep	movsw
; Line 631
	push	0
	push	16384
	mov	ax,WORD PTR _nLevel
	add	ax,15
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-12],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-12]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
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
; Line 635
$EX1569:
	pop	si
	pop	di
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
	push	si
;	hDC = 4
;	npHunt = -4
;	npNext = -2
;	npShot = -6
;	rect = -14
; Line 646
	cmp	WORD PTR _nBadGuys,0
	je	$I1581
	dec	WORD PTR $S1580_nNextHunter
	jns	$I1581
; Line 648
	call	CREATEHUNTER
; Line 649
	push	1000
	call	ARAND
	mov	cx,125
	sub	cx,WORD PTR _nLevel
	shl	cx,3
	add	ax,cx
	mov	WORD PTR $S1580_nNextHunter,ax
; Line 652
$I1581:
	mov	ax,WORD PTR _HunterList
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	jne	$JCC3874
	jmp	$EX1577
$JCC3874:
$F1582:
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
	jl	$I1587
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+4],ax
	jge	$I1587
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$I1587
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+6],ax
	jge	$I1587
; Line 663
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	HITPLAYER
; Line 665
	mov	bx,WORD PTR [bp-4]	;npHunt
	dec	WORD PTR [bx+18]
	cmp	WORD PTR [bx+18],1
	jge	$I1588
; Line 667
$L20142:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20033
	push	2
	call	SETRESTART
$L20033:
; Line 668
	mov	bx,WORD PTR [bp-4]	;npHunt
	mov	BYTE PTR [bx+22],13
; Line 669
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 670
	push	OFFSET DGROUP:_HunterList
	push	WORD PTR [bp-4]	;npHunt
	call	REMOVE
; Line 671
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-4]	;npHunt
	call	ADDHEAD
; Line 673
	jmp	$I1591
	nop	
$I1588:
	mov	bx,WORD PTR [bp-4]	;npHunt
	cmp	WORD PTR [bx+18],1
	je	$JCC4039
	jmp	$I1591
$JCC4039:
	mov	BYTE PTR [bx+22],12
; Line 675
	jmp	$I1591
	nop	
$I1587:
	mov	ax,WORD PTR $S1356_rectShotClip
	cmp	WORD PTR [bp-10],ax
	jge	$JCC4058
	jmp	$I1591
$JCC4058:
	mov	ax,WORD PTR $S1356_rectShotClip+4
	cmp	WORD PTR [bp-14],ax	;rect
	jl	$JCC4069
	jmp	$I1591
$JCC4069:
	mov	ax,WORD PTR $S1356_rectShotClip+2
	cmp	WORD PTR [bp-8],ax
	jl	$I1591
	mov	ax,WORD PTR $S1356_rectShotClip+6
	cmp	WORD PTR [bp-12],ax
	jge	$I1591
; Line 677
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-6],ax	;npShot
	or	ax,ax
	je	$I1591
$F1593:
; Line 679
	mov	ax,WORD PTR [bp-14]	;rect
	mov	bx,WORD PTR [bp-6]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1594
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1594
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1594
	mov	ax,WORD PTR [bp-8]
	cmp	WORD PTR [bx+6],ax
	jl	$L20038
; Line 677
$FC1594:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-6],ax	;npShot
	or	ax,ax
	jne	$F1593
	jmp	SHORT $I1591
$L20038:
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
	jge	$JCC4175
	jmp	$L20142
$JCC4175:
; Line 692
	mov	bx,WORD PTR [bp-4]	;npHunt
	cmp	WORD PTR [bx+18],1
	jne	$I1600
	mov	BYTE PTR [bx+22],12
; Line 693
$I1600:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	HIT
; Line 698
$I1591:
; Line 699
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
	mov	si,bx
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npHunt
	add	WORD PTR [bx+8],ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,4
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bx+8],ax
; Line 700
	push	0
	push	16384
	mov	ax,WORD PTR _nSin[si]
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
	jg	$I1601
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
; Line 707
$I1601:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-4]	;npHunt
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-2]	;npNext
	mov	WORD PTR [bp-4],ax	;npHunt
	or	ax,ax
	je	$JCC4375
	jmp	$F1582
$JCC4375:
; Line 709
$EX1577:
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
	sub	sp,12
	push	di
	push	si
;	Pos = 8
;	nDir = 6
;	nCount = 4
;	npSwarm = -4
;	nCnt = -2
; Line 720
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSwarm
	or	ax,ax
	jne	$JCC4407
	jmp	$EX1606
$JCC4407:
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
	lea	ax,WORD PTR [bx+26]
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],OFFSET DGROUP:$S1359_Swarmer
	mov	ax,WORD PTR [bp+4]	;nCount
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	mov	WORD PTR [bp-10],ax
; Line 731
$F1610:
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
	cmp	WORD PTR [bp-8],OFFSET DGROUP:$S1359_Swarmer+20
	jb	$F1610
; Line 736
	push	0
	push	16384
	mov	ax,WORD PTR _nLevel
	add	ax,15
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-4]	;npSwarm
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-12],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSwarm
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-12]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
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
; Line 740
$EX1606:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	8
	nop	

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
	je	$I1619
	dec	WORD PTR $S1618_nNextSwarmer
	jns	$I1619
; Line 754
	push	16984
	call	ARAND
	sub	ax,8492
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
	mov	WORD PTR $S1618_nNextSwarmer,cx
; Line 760
$I1619:
	mov	ax,WORD PTR _SwarmerList
	mov	WORD PTR [bp-2],ax	;npSwarm
	or	ax,ax
	jne	$JCC4754
	jmp	$EX1615
$JCC4754:
$F1621:
; Line 765
	mov	bx,WORD PTR [bp-2]	;npSwarm
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
	mov	WORD PTR [bp-18],ax	;rect
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-14],ax
	mov	ax,-15
	sub	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-16],ax
	mov	ax,WORD PTR [bx+18]
	add	ax,15
	mov	cx,ax
	shl	ax,2
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-12],ax
; Line 769
	mov	ax,WORD PTR [bp-18]	;rect
	mov	bx,WORD PTR _npPlayer
	cmp	WORD PTR [bx+4],ax
	jl	$I1626
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+4],ax
	jge	$I1626
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR [bx+6],ax
	jl	$I1626
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jge	$I1626
; Line 771
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	HITPLAYER
; Line 772
	mov	bx,WORD PTR [bp-2]	;npSwarm
	jmp	SHORT $L20143
	nop	
$I1626:
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1356_rectShotClip,ax
	jg	$I1627
	mov	ax,WORD PTR [bp-18]	;rect
	cmp	WORD PTR $S1356_rectShotClip+4,ax
	jle	$I1627
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1356_rectShotClip+2,ax
	jg	$I1627
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR $S1356_rectShotClip+6,ax
	jle	$I1627
; Line 776
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-10],ax	;npShot
	or	ax,ax
	je	$I1627
$F1629:
; Line 778
	mov	ax,WORD PTR [bp-18]	;rect
	mov	bx,WORD PTR [bp-10]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1630
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1630
	mov	ax,WORD PTR [bp-16]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1630
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+6],ax
	jl	$L20047
; Line 776
$FC1630:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-10],ax	;npShot
	or	ax,ax
	jne	$F1629
	jmp	SHORT $I1627
	nop	
	nop	
$L20047:
; Line 779
	mov	WORD PTR [bx+18],1
; Line 780
	mov	bx,WORD PTR [bp-2]	;npSwarm
	imul	ax,WORD PTR [bx+18],25
	cwd	
	add	WORD PTR _lScore,ax
	adc	WORD PTR _lScore+2,dx
; Line 781
$L20143:
	mov	WORD PTR [bx+18],0
; Line 785
$I1627:
	mov	bx,WORD PTR [bp-2]	;npSwarm
	cmp	WORD PTR [bx+18],0
	jg	$I1634
; Line 787
	mov	BYTE PTR [bx+22],7
; Line 788
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20044
	push	2
	call	SETRESTART
$L20044:
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
; Line 793
	jmp	SHORT $FC1622
$I1634:
; Line 795
	cmp	WORD PTR [bx+18],1
	jle	$I1636
	dec	WORD PTR [bx+20]
	cmp	WORD PTR [bx+20],0
	jg	$I1636
; Line 797
	push	256
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
$I1636:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSwarm
	call	DRAWOBJECT
; Line 760
$FC1622:
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npSwarm
	or	ax,ax
	je	$JCC5187
	jmp	$F1621
$JCC5187:
; Line 807
$EX1615:
	mov	sp,bp
	pop	bp
	ret	2

DRAWSWARMERS	ENDP
; Line 814
	PUBLIC	CREATESPINNER
CREATESPINNER	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,12
	push	di
	push	si
;	npSpin = -4
;	nCnt = -2
; Line 818
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npSpin
	or	ax,ax
	jne	$JCC5217
	jmp	$EX1639
$JCC5217:
; Line 820
	push	16984
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
	mov	cx,ax
	inc	ax
	inc	ax
	shl	ax,5
	mov	WORD PTR [bx+12],ax
; Line 827
	sub	cl,15
	neg	cl
	mov	BYTE PTR [bx+22],cl
; Line 828
	mov	BYTE PTR [bx+23],5
	mov	cx,10
	lea	di,WORD PTR [bx+24]
	mov	si,OFFSET DGROUP:$S1358_Spinner
	push	ds
	pop	es
	rep	movsw
; Line 831
	push	0
	push	16384
	mov	ax,WORD PTR _nLevel
	add	ax,15
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-4]	;npSpin
	mov	bl,BYTE PTR [bx+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	si,dx
	cwd	
	push	dx
	push	ax
	mov	di,cx
	mov	WORD PTR [bp-12],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-4]	;npSpin
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	si
	push	di
	mov	si,WORD PTR [bp-12]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
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
; Line 835
$EX1639:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

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
	je	$I1651
	dec	WORD PTR $S1650_nNextSpinner
	jns	$I1651
; Line 848
	call	CREATESPINNER
; Line 849
	push	900
	call	ARAND
	mov	cx,50
	sub	cx,WORD PTR _nLevel
	shl	cx,1
	add	ax,cx
	mov	WORD PTR $S1650_nNextSpinner,ax
; Line 852
$I1651:
	mov	ax,WORD PTR _SpinnerList
	mov	WORD PTR [bp-2],ax	;npSpin
	or	ax,ax
	jne	$JCC5479
	jmp	$EX1647
$JCC5479:
$F1652:
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
	jl	$I1658
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$I1658
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$I1658
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$I1658
; Line 864
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	HITPLAYER
; Line 866
	mov	al,15
	mov	bx,WORD PTR [bp-2]	;npSpin
	dec	WORD PTR [bx+18]
	mov	cx,WORD PTR [bx+18]
	mov	dx,cx
	sub	al,cl
	mov	BYTE PTR [bx+22],al
; Line 867
	cmp	dx,1
	jl	$JCC5594
	jmp	$I1660
$JCC5594:
; Line 869
$L20147:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20053
	push	2
	call	SETRESTART
$L20053:
; Line 870
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	EXPLODE
; Line 871
	push	OFFSET DGROUP:_SpinnerList
	push	WORD PTR [bp-2]	;npSpin
	call	REMOVE
; Line 872
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npSpin
	call	ADDHEAD
; Line 875
	jmp	$I1660
	nop	
$I1658:
	mov	ax,WORD PTR $S1356_rectShotClip
	cmp	WORD PTR [bp-12],ax
	jge	$JCC5652
	jmp	$I1660
$JCC5652:
	mov	ax,WORD PTR $S1356_rectShotClip+4
	cmp	WORD PTR [bp-16],ax	;rect
	jge	$I1660
	mov	ax,WORD PTR $S1356_rectShotClip+2
	cmp	WORD PTR [bp-10],ax
	jl	$I1660
	mov	ax,WORD PTR $S1356_rectShotClip+6
	cmp	WORD PTR [bp-14],ax
	jge	$I1660
; Line 877
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$I1660
$F1662:
; Line 879
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1663
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1663
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1663
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$L20060
; Line 877
$FC1663:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1662
	jmp	SHORT $I1660
	nop	
$L20060:
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
	mov	cx,WORD PTR [bx+18]
	mov	dx,cx
	sub	al,cl
	mov	BYTE PTR [bx+22],al
; Line 883
	cmp	dx,1
	jge	$JCC5778
	jmp	$L20147
$JCC5778:
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npSpin
	call	HIT
; Line 894
$I1660:
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;npSpin
	sub	ax,WORD PTR [bx+4]
$L20145:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 895
	cmp	ax,-16
	jl	$FB1672
	cmp	ax,16
	jle	$L20061
$FB1672:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20145
$L20061:
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
$L20146:
	mov	WORD PTR [bp-6],ax	;nDelta
; Line 898
	cmp	ax,-16
	jl	$FB1676
	cmp	ax,16
	jle	$L20062
$FB1676:
	mov	cx,2
	cwd	
	idiv	cx
	jmp	SHORT $L20146
	nop	
$L20062:
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
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npSpin
	or	ax,ax
	je	$JCC5925
	jmp	$F1652
$JCC5925:
; Line 902
$EX1647:
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
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-4],ax	;npRoid
	or	ax,ax
	jne	$JCC5957
	jmp	$EX1684
$JCC5957:
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
	mov	ax,WORD PTR [bp+12]	;nSides
	shl	ax,7
	mov	WORD PTR [bx+12],ax
; Line 919
	mov	ax,WORD PTR [bp+8]	;nDir
	mov	WORD PTR [bx+14],ax
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
	cmp	WORD PTR [bp+12],0	;nSides
	jle	$FB1690
	mov	ax,WORD PTR [bp-4]	;npRoid
	add	ax,24
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],0
	imul	ax,WORD PTR [bp+12],100	;nSides
	mov	WORD PTR [bp-12],ax
	mov	ax,WORD PTR [bp+12]	;nSides
	mov	WORD PTR [bp-10],ax
$F1688:
; Line 926
	push	30
	call	ARAND
	mov	cx,ax
	mov	ax,WORD PTR [bp-8]
	cwd	
	idiv	WORD PTR [bp+12]	;nSides
	add	cx,ax
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx],cx
; Line 927
	push	80
	call	ARAND
	add	ax,WORD PTR [bp-12]
	sub	ax,80
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx+2],ax
	add	WORD PTR [bp-6],4
	add	BYTE PTR [bp-7],1
	dec	WORD PTR [bp-10]
	jne	$F1688
; Line 928
$FB1690:
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
	mov	WORD PTR [bp-14],bx
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
	push	OFFSET DGROUP:_RoidList
	push	bx
	call	ADDHEAD
; Line 932
	inc	WORD PTR _nBadGuys
; Line 934
$EX1684:
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
	je	$I1697
	mov	bx,WORD PTR [bp+4]	;npShot
	mov	WORD PTR [bx+18],1
; Line 946
$I1697:
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	al,BYTE PTR [bx+23]
	sub	ah,ah
; Line 963
	sub	ax,5
	je	$SC1705
	dec	ax
	je	$SC1704
	dec	ax
	je	$SC1703
	dec	ax
	je	$SC1702
; Line 961
	mov	WORD PTR [bp-4],0	;nNew
; Line 962
	jmp	SHORT $SB1699
	nop	
; Line 957
$SC1705:
; Line 958
	push	2
	call	ARAND
	jmp	SHORT $L20148
	nop	
; Line 954
$SC1704:
; Line 955
	push	2
	jmp	SHORT $L20149
; Line 951
$SC1703:
; Line 952
	push	3
$L20149:
	call	ARAND
	inc	ax
	jmp	SHORT $L20148
; Line 948
$SC1702:
; Line 949
	push	3
	call	ARAND
	inc	ax
	inc	ax
$L20148:
	mov	WORD PTR [bp-4],ax	;nNew
; Line 963
$SB1699:
; Line 964
	cmp	WORD PTR [bp-4],1	;nNew
	jne	$I1707
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
; Line 971
	jmp	$I1709
	nop	
$I1707:
	cmp	WORD PTR [bp-4],0	;nNew
	jg	$JCC6446
	jmp	$I1709
$JCC6446:
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
	jg	$JCC6474
	jmp	$I1709
$JCC6474:
	mov	WORD PTR [bp-16],0
	mov	ax,WORD PTR [bp-4]	;nNew
	mov	WORD PTR [bp-18],ax
$F1712:
; Line 976
	mov	bx,WORD PTR [bp+6]	;npRoid
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	mov	WORD PTR [bp-14],ax	;Pt
	mov	WORD PTR [bp-12],dx
; Line 977
	push	601
	call	ARAND
	sub	ax,300
	add	WORD PTR [bp-14],ax	;Pt
	push	601
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
	push	32
	call	ARAND
	mov	cx,ax
	mov	ax,WORD PTR [bp-16]
	cwd	
	idiv	WORD PTR [bp-4]	;nNew
	mov	bx,WORD PTR [bp+6]	;npRoid
	add	cx,WORD PTR [bx+14]
	add	ax,cx
	push	ax
	mov	ax,WORD PTR _nLevel
	shl	ax,2
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
	je	$JCC6617
	jmp	$F1712
$JCC6617:
; Line 985
$I1709:
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20068
	push	2
	call	SETRESTART
$L20068:
; Line 986
	mov	bx,WORD PTR [bp+6]	;npRoid
	inc	BYTE PTR [bx+22]
; Line 987
	mov	WORD PTR [bx+18],0
; Line 988
	cmp	WORD PTR [bp-4],0	;nNew
	je	$I1716
; Line 990
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	HIT
; Line 991
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	DRAWOBJECT
; Line 993
	jmp	SHORT $I1717
	nop	
$I1716:
	push	WORD PTR [bp+8]	;hDC
	push	WORD PTR [bp+6]	;npRoid
	call	EXPLODE
$I1717:
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
	jne	$JCC6724
	jmp	$EX1719
$JCC6724:
$F1722:
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
	jl	$I1728
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$I1728
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$I1728
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jge	$I1728
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	call	HITPLAYER
	or	ax,ax
	je	$I1728
; Line 1020
	mov	bx,WORD PTR _npPlayer
	neg	WORD PTR [bx+18]
; Line 1021
	mov	BYTE PTR [bx+22],3
; Line 1022
	push	WORD PTR [bp+4]	;hDC
	push	bx
	call	EXPLODE
; Line 1023
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	push	0
	call	BREAKROID
; Line 1024
	cmp	WORD PTR _nBadGuys,0
	je	$I1729
	push	1
$L20150:
	call	SETRESTART
; Line 1025
	jmp	SHORT $FC1723
	nop	
$I1729:
	push	2
	jmp	SHORT $L20150
$I1728:
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR $S1356_rectShotClip,ax
	jg	$FC1723
	mov	ax,WORD PTR [bp-16]	;rect
	cmp	WORD PTR $S1356_rectShotClip+4,ax
	jle	$FC1723
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR $S1356_rectShotClip+2,ax
	jg	$FC1723
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR $S1356_rectShotClip+6,ax
	jle	$FC1723
; Line 1029
	mov	ax,WORD PTR _ShotList
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	je	$FC1723
$F1733:
; Line 1031
	mov	ax,WORD PTR [bp-16]	;rect
	mov	bx,WORD PTR [bp-8]	;npShot
	cmp	WORD PTR [bx+4],ax
	jl	$FC1734
	mov	ax,WORD PTR [bp-12]
	cmp	WORD PTR [bx+4],ax
	jge	$FC1734
	mov	ax,WORD PTR [bp-14]
	cmp	WORD PTR [bx+6],ax
	jl	$FC1734
	mov	ax,WORD PTR [bp-10]
	cmp	WORD PTR [bx+6],ax
	jl	$L20073
; Line 1029
$FC1734:
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-8],ax	;npShot
	or	ax,ax
	jne	$F1733
	jmp	SHORT $FC1723
$L20073:
; Line 1032
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npRoid
	push	bx
	call	BREAKROID
; Line 1006
$FC1723:
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npRoid
	or	ax,ax
	je	$JCC6996
	jmp	$F1722
$JCC6996:
; Line 1037
$EX1719:
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
	jne	$JCC7022
	jmp	$I1742
$JCC7022:
; Line 1049
	mov	bx,ax
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1356_rectShotClip+4,ax
	mov	WORD PTR $S1356_rectShotClip,ax
; Line 1050
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1356_rectShotClip+6,ax
	mov	WORD PTR $S1356_rectShotClip+2,ax
; Line 1051
	or	bx,bx
	jne	$JCC7049
	jmp	$EX1739
$JCC7049:
$FC1744:
; Line 1053
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1054
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 1066
	cmp	ax,10
	je	$SC1750
	ja	$SB1747
	or	al,al
	je	$SC1752
	sub	al,5
	je	$SC1751
	jmp	SHORT $SB1747
	nop	
; Line 1062
$SC1752:
; Line 1063
	push	OFFSET DGROUP:_ShotList
	push	WORD PTR [bp-2]	;npShot
	call	REMOVE
; Line 1064
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npShot
	call	ADDHEAD
; Line 1065
	jmp	SHORT $SB1747
; Line 1059
$SC1751:
; Line 1060
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],8
; Line 1061
	jmp	SHORT $SB1747
	nop	
; Line 1056
$SC1750:
; Line 1057
	mov	bx,WORD PTR [bp-2]	;npShot
	mov	BYTE PTR [bx+22],12
; Line 1066
$SB1747:
; Line 1067
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npShot
	call	DRAWOBJECT
; Line 1068
	mov	ax,WORD PTR $S1356_rectShotClip
	mov	bx,WORD PTR [bp-2]	;npShot
	cmp	WORD PTR [bx+4],ax
	jge	$I1753
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1356_rectShotClip,ax
; Line 1069
	jmp	SHORT $I1754
	nop	
$I1753:
	mov	ax,WORD PTR $S1356_rectShotClip+4
	cmp	WORD PTR [bx+4],ax
	jle	$I1754
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR $S1356_rectShotClip+4,ax
; Line 1070
$I1754:
	mov	ax,WORD PTR $S1356_rectShotClip+2
	cmp	WORD PTR [bx+6],ax
	jge	$I1756
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1356_rectShotClip+2,ax
; Line 1071
	jmp	SHORT $I1757
$I1756:
	mov	ax,WORD PTR $S1356_rectShotClip+6
	cmp	WORD PTR [bx+6],ax
	jle	$I1757
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR $S1356_rectShotClip+6,ax
; Line 1072
$I1757:
; Line 1073
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	je	$JCC7204
	jmp	$FC1744
$JCC7204:
	mov	sp,bp
	pop	bp
	ret	2
	nop	
; Line 1075
$I1742:
	mov	ax,32767
	mov	WORD PTR $S1356_rectShotClip+6,ax
	mov	WORD PTR $S1356_rectShotClip+2,ax
	mov	WORD PTR $S1356_rectShotClip+4,ax
	mov	WORD PTR $S1356_rectShotClip,ax
; Line 1076
$EX1739:
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
	je	$EX1761
$F1764:
; Line 1088
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;npNext
; Line 1089
	dec	WORD PTR [bx+18]
	mov	ax,WORD PTR [bx+18]
; Line 1101
	cmp	ax,7
	je	$SC1771
	ja	$SB1768
	or	al,al
	je	$SC1773
	sub	al,3
	je	$SC1772
	jmp	SHORT $SB1768
	nop	
; Line 1097
$SC1773:
; Line 1098
	push	OFFSET DGROUP:_FlameList
	push	WORD PTR [bp-2]	;npFlame
	call	REMOVE
; Line 1099
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npFlame
	call	ADDHEAD
; Line 1100
	jmp	SHORT $SB1768
; Line 1094
$SC1772:
; Line 1095
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],4
; Line 1096
	jmp	SHORT $SB1768
	nop	
; Line 1091
$SC1771:
; Line 1092
	mov	bx,WORD PTR [bp-2]	;npFlame
	mov	BYTE PTR [bx+22],5
; Line 1101
$SB1768:
; Line 1102
	push	WORD PTR [bp+4]	;hDC
	push	WORD PTR [bp-2]	;npFlame
	call	DRAWOBJECT
	mov	ax,WORD PTR [bp-4]	;npNext
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	jne	$F1764
; Line 1104
$EX1761:
	mov	sp,bp
	pop	bp
	ret	2

DRAWFLAMES	ENDP
; Line 1111
	PUBLIC	FIRESHOT
FIRESHOT	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,4
	push	di
	push	si
;	npShot = -2
; Line 1114
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npShot
	or	ax,ax
	jne	$JCC7367
	jmp	$EX1774
$JCC7367:
; Line 1116
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	si,WORD PTR [bp-2]	;npShot
	mov	WORD PTR [si+4],ax
; Line 1117
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 1118
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 1119
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [si+10],ax
; Line 1120
	mov	WORD PTR [si+12],8
; Line 1121
	push	5
	call	ARAND
	mov	bx,WORD PTR _npPlayer
	add	ax,WORD PTR [bx+14]
	dec	ax
	dec	ax
	mov	WORD PTR [si+14],ax
; Line 1122
	mov	WORD PTR [si+16],0
; Line 1123
	push	8
	call	ARAND
	add	ax,16
	mov	WORD PTR [si+18],ax
; Line 1124
	mov	BYTE PTR [si+22],13
; Line 1125
	mov	BYTE PTR [si+23],2
; Line 1126
	mov	WORD PTR [si+24],128
; Line 1128
	mov	WORD PTR [si+28],0
; Line 1129
	mov	ax,50
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+30],ax
; Line 1130
	push	0
	push	16384
	mov	ax,WORD PTR [si+18]
	add	ax,200
	cwd	
	push	dx
	push	ax
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _nCos[bx]
	mov	di,dx
	cwd	
	push	dx
	push	ax
	mov	si,cx
	mov	WORD PTR [bp-4],bx
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+8],ax
	push	0
	push	16384
	push	di
	push	si
	mov	si,WORD PTR [bp-4]
	mov	ax,WORD PTR _nSin[si]
	cwd	
	push	dx
	push	ax
	call	FAR PTR __aFlmul
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	mov	bx,WORD PTR [bp-2]	;npShot
	add	WORD PTR [bx+10],ax
; Line 1131
	push	OFFSET DGROUP:_ShotList
	push	bx
	call	ADDHEAD
; Line 1133
$EX1774:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

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
	je	$I1781
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
	mov	si,WORD PTR [bp-4]
	mov	ax,WORD PTR _nSin[si]
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
$I1781:
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR [bp-2],ax	;npFlame
	or	ax,ax
	jne	$JCC7696
	jmp	$EX1779
$JCC7696:
; Line 1147
	mov	bx,WORD PTR _npPlayer
	mov	ax,WORD PTR [bx+4]
	mov	si,WORD PTR [bp-2]	;npFlame
	mov	WORD PTR [si+4],ax
; Line 1148
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 1149
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 1150
	mov	ax,WORD PTR [bx+10]
	mov	WORD PTR [si+10],ax
; Line 1151
	push	57
	call	ARAND
	add	ax,WORD PTR [bp+6]	;nDir
	add	ax,100
	mov	WORD PTR [si+14],ax
; Line 1152
	mov	WORD PTR [si+16],0
; Line 1153
	push	7
	call	ARAND
	add	ax,WORD PTR [bp+4]	;nAccel
	mov	WORD PTR [si+18],ax
; Line 1154
	mov	BYTE PTR [si+22],11
; Line 1155
	mov	BYTE PTR [si+23],1
; Line 1156
	sub	ax,ax
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+24],ax
; Line 1157
	push	ax
	push	16384
	push	10
	call	ARAND
	mov	cx,ax
	add	cx,50
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nCos[bx]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+8],ax
	push	0
	push	16384
	push	10
	call	ARAND
	mov	cx,ax
	add	cx,50
	mov	bl,BYTE PTR [si+14]
	sub	bh,bh
	shl	bx,1
	mov	ax,WORD PTR _nSin[bx]
	imul	cx
	push	dx
	push	ax
	call	FAR PTR __aFldiv
	add	WORD PTR [si+10],ax
; Line 1158
	push	OFFSET DGROUP:_FlameList
	push	si
	call	ADDHEAD
; Line 1160
$EX1779:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	4

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
	jg	$JCC7879
	jmp	$EX1784
$JCC7879:
; Line 1173
	cmp	WORD PTR _nSafe,0
	jle	$I1788
; Line 1175
	dec	WORD PTR _nSafe
	jne	$I1791
; Line 1178
	mov	al,BYTE PTR [bx+18]
	mov	BYTE PTR [bx+22],al
	cmp	al,3
	jbe	$I1791
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],3
; Line 1181
	jmp	SHORT $I1791
	nop	
$I1788:
	push	WORD PTR _vkShld
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1791
	cmp	WORD PTR _nShield,0
	jle	$I1791
; Line 1183
	mov	WORD PTR _nSafe,15
; Line 1184
	dec	WORD PTR _nShield
	cmp	WORD PTR _nShield,0
	jle	$I1793
	mov	al,7
	jmp	SHORT $L20080
	nop	
$I1793:
	mov	al,6
$L20080:
	mov	bx,WORD PTR _npPlayer
	mov	BYTE PTR [bx+22],al
; Line 1188
$I1791:
	cmp	WORD PTR $S1785_nBombing,0
	jle	$I1795
; Line 1190
	dec	WORD PTR $S1785_nBombing
	jne	$I1796
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
; Line 1196
	jmp	SHORT $I1798
	nop	
$I1796:
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
; Line 1203
	jmp	SHORT $I1798
	nop	
$I1795:
	cmp	WORD PTR _nBomb,0
	je	$I1798
	push	WORD PTR _vkBomb
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1798
	dec	WORD PTR _nBomb
	mov	WORD PTR $S1785_nBombing,5
; Line 1205
$I1798:
	push	WORD PTR _vkClkw
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1800
	mov	bx,WORD PTR _npPlayer
	add	WORD PTR [bx+16],8
; Line 1206
$I1800:
	push	WORD PTR _vkCtrClkw
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1801
	mov	bx,WORD PTR _npPlayer
	sub	WORD PTR [bx+16],8
; Line 1207
$I1801:
	push	WORD PTR _vkThrst
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1802
	push	0
	push	12
	call	ACCELPLAYER
; Line 1208
$I1802:
	push	WORD PTR _vkRvThrst
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1803
	push	128
	push	12
	call	ACCELPLAYER
; Line 1209
$I1803:
	cmp	WORD PTR $S1786_nShotDelay,0
	je	$I1804
	dec	WORD PTR $S1786_nShotDelay
; Line 1210
	jmp	SHORT $I1805
$I1804:
	push	WORD PTR _vkFire
	call	FAR PTR GETASYNCKEYSTATE
	or	ax,ax
	jge	$I1805
	call	FIRESHOT
	mov	WORD PTR $S1786_nShotDelay,2
; Line 1211
$I1805:
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
$EX1784:
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
	push	7
	mov	si,ax
	call	FAR PTR SETMAPMODE
; Line 1233
	push	si
	push	8192
	push	8192
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
	push	0
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
	jle	$I1822
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
	jmp	SHORT $I1823
	nop	
$I1822:
; Line 1282
	mov	ax,5
	sub	ax,WORD PTR [bp+4]	;nQuant
	mov	WORD PTR [bp-2],ax	;nBlank
; Line 1283
	jmp	SHORT $L20151
	nop	
$FC1826:
	mov	al,BYTE PTR [bp+6]	;IDBitmap
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],al
$L20151:
	mov	ax,WORD PTR [bp+4]	;nQuant
	dec	WORD PTR [bp+4]	;nQuant
	or	ax,ax
	jne	$FC1826
; Line 1284
$FC1829:
	mov	ax,WORD PTR [bp-2]	;nBlank
	dec	WORD PTR [bp-2]	;nBlank
	or	ax,ax
	je	$I1823
	mov	bx,WORD PTR [bp+8]	;npBuff
	inc	WORD PTR [bp+8]	;npBuff
	mov	BYTE PTR [bx],50
	jmp	SHORT $FC1829
; Line 1285
$I1823:
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
	je	$JCC8579
	jmp	$EX1832
$JCC8579:
; Line 1302
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	sub	ax,WORD PTR _lLastLife
	sbb	dx,WORD PTR _lLastLife+2
	cmp	dx,1
	jl	$I1844
	jg	$L20090
	cmp	ax,-31072
	jbe	$I1844
$L20090:
; Line 1304
	call	ADDEXTRALIFE
; Line 1305
	mov	ax,WORD PTR _lScore
	mov	dx,WORD PTR _lScore+2
	mov	WORD PTR _lLastLife,ax
	mov	WORD PTR _lLastLife+2,dx
; Line 1307
$I1844:
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
	push	ds
	push	OFFSET DGROUP:$SG1845
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
	je	$FB1848
$FC1847:
; Line 1312
	mov	bx,WORD PTR [bp-44]	;npBuff
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	jne	$FC1847
$FB1848:
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
	push	ds
	push	OFFSET DGROUP:$SG1849
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
	je	$FB1852
$FC1851:
; Line 1316
	mov	bx,WORD PTR [bp-44]	;npBuff
	add	BYTE PTR [bx],6
	inc	WORD PTR [bp-44]	;npBuff
	mov	bx,WORD PTR [bp-44]	;npBuff
	mov	al,BYTE PTR [bx]
	cbw	
	mov	bx,ax
	test	BYTE PTR __ctype[bx+1],4
	jne	$FC1851
$FB1852:
; Line 1317
	mov	bx,WORD PTR [bp-44]	;npBuff
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
	mov	si,ax
	call	FAR PTR GETWINDOWDC
	mov	WORD PTR [bp-58],ax	;hDC
; Line 1325
	push	ax
	push	WORD PTR $S1355_rectScoreClip
	push	WORD PTR $S1355_rectScoreClip+2
	push	WORD PTR $S1355_rectScoreClip+4
	push	WORD PTR $S1355_rectScoreClip+6
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
	mov	ax,WORD PTR $S1355_rectScoreClip
	mov	WORD PTR [bp-50],ax	;x
; Line 1329
	mov	ax,WORD PTR $S1355_rectScoreClip+2
	mov	WORD PTR [bp-52],ax	;y
; Line 1331
	mov	WORD PTR [bp-46],0	;nCnt
	or	si,si
	jle	$FB1855
$F1853:
; Line 1333
	mov	bx,WORD PTR [bp-46]	;nCnt
	mov	al,BYTE PTR $S1354_szScore[bx]
	mov	si,bx
	cmp	BYTE PTR [bp-40][si],al
	je	$I1856
; Line 1335
	push	WORD PTR [bp-56]	;hDCMem
	mov	al,BYTE PTR [bp-40][si]
	cbw	
	mov	bx,ax
	shl	bx,1
	push	WORD PTR _hBitmap[bx-100]
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
	mov	al,BYTE PTR [bp-40][si]
	mov	BYTE PTR $S1354_szScore[si],al
; Line 1339
$I1856:
	add	WORD PTR [bp-50],16	;x
	mov	ax,WORD PTR [bp-54]	;nLen
	inc	WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$F1853
; Line 1340
$FB1855:
; Line 1341
	mov	ax,WORD PTR $S1353_nScoreLen
	cmp	WORD PTR [bp-46],ax	;nCnt
	jge	$I1857
; Line 1343
	push	WORD PTR [bp-56]	;hDCMem
	push	WORD PTR _hBitmap
	call	FAR PTR SELECTOBJECT
; Line 1344
$D1858:
; Line 1345
	mov	bx,WORD PTR [bp-46]	;nCnt
	cmp	BYTE PTR $S1354_szScore[bx],50
	je	$I1861
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
	mov	BYTE PTR $S1354_szScore[bx],50
; Line 1350
$I1861:
	add	WORD PTR [bp-50],16	;x
; Line 1351
	mov	ax,WORD PTR $S1353_nScoreLen
	inc	WORD PTR [bp-46]	;nCnt
	cmp	WORD PTR [bp-46],ax	;nCnt
	jl	$D1858
; Line 1353
$I1857:
	mov	ax,WORD PTR [bp-54]	;nLen
	mov	WORD PTR $S1353_nScoreLen,ax
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
$EX1832:
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
	sub	sp,2
;	hDC = 6
;	npList = 4
;	npObj = -2
; Line 1368
	mov	bx,WORD PTR [bp+4]	;npList
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	je	$EX1864
$F1866:
; Line 1369
	mov	bx,ax
	cmp	WORD PTR [bx+18],0
	je	$FC1867
	push	WORD PTR [bp+6]	;hDC
	push	bx
	call	HIT
; Line 1368
$FC1867:
	mov	bx,WORD PTR [bp-2]	;npObj
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$F1866
; Line 1370
$EX1864:
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
	jmp	SHORT $L20152
$FC1875:
; Line 1382
	dec	WORD PTR _nBadGuys
	cmp	WORD PTR _nBadGuys,0
	jg	$L20094
	push	2
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
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-2]	;npObj
	call	ADDHEAD
; Line 1387
$L20152:
	mov	bx,WORD PTR [bp+4]	;npList
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;npObj
	or	ax,ax
	jne	$FC1875
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
	mov	BYTE PTR [bx+22],3
; Line 1400
	push	WORD PTR [bp-2]	;hDC
	push	bx
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
	jne	$I1881
; Line 1420
	mov	WORD PTR [bp-2],-4246
; Line 1421
	sub	ax,ax
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
	jg	$I1884
	jl	$L20102
	cmp	WORD PTR _lHighScore,ax
	jae	$I1884
$L20102:
	mov	WORD PTR _lHighScore,ax
	mov	WORD PTR _lHighScore+2,dx
; Line 1426
$I1884:
	sub	ax,ax
	mov	WORD PTR _lScore+2,ax
	mov	WORD PTR _lScore,ax
	mov	WORD PTR _lLastLife+2,ax
	mov	WORD PTR _lLastLife,ax
; Line 1427
	mov	WORD PTR _nLevel,ax
	jmp	SHORT $L20153
	nop	
$I1881:
	cmp	WORD PTR [bx+18],0
	jge	$I1885
; Line 1433
	neg	WORD PTR [bx+18]
; Line 1434
$L20153:
	mov	ax,3
	mov	WORD PTR _nBomb,ax
	mov	WORD PTR _nShield,ax
; Line 1437
$I1885:
; Line 1439
	mov	bx,WORD PTR _npPlayer
	mov	WORD PTR [bx+14],64
; Line 1440
	sub	ax,ax
	mov	WORD PTR [bx+6],ax
	mov	WORD PTR [bx+4],ax
	mov	WORD PTR [bx+10],ax
	mov	WORD PTR [bx+8],ax
	mov	WORD PTR [bx+16],ax
; Line 1441
	mov	BYTE PTR [bx+22],7
; Line 1442
	mov	WORD PTR _nSafe,30
; Line 1444
	cmp	WORD PTR _ShotList,ax
	je	$I1887
; Line 1447
	mov	ax,WORD PTR _ShotList
	or	ax,ax
	je	$I1887
$F1889:
; Line 1448
	mov	bx,ax
	mov	WORD PTR [bx+18],1
	mov	ax,WORD PTR [bx]
	or	ax,ax
	jne	$F1889
; Line 1452
$I1887:
	cmp	WORD PTR _nBadGuys,0
	jne	$EX1880
; Line 1456
	inc	WORD PTR _nLevel
	mov	ax,WORD PTR _nLevel
	add	ax,5
	mov	WORD PTR [bp-12],ax	;nCnt
	or	ax,ax
	je	$EX1880
	sub	ax,ax
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-20],ax	;Vel
$F1894:
; Line 1459
	push	16384
	call	ARAND
	sub	ax,8192
	mov	WORD PTR [bp-16],ax	;Pos
; Line 1460
	push	16384
	call	ARAND
	sub	ax,8192
; Line 1464
	push	ax
	push	WORD PTR [bp-16]	;Pos
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;Vel
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
	dec	WORD PTR [bp-12]	;nCnt
	jne	$F1894
; Line 1467
$EX1880:
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
	je	$I1901
	cmp	WORD PTR _bPaused,0
	jne	$I1901
; Line 1478
	push	WORD PTR _hAppWnd
	mov	ax,1
	mov	WORD PTR _bPaused,ax
	push	ax
	call	FAR PTR KILLTIMER
; Line 1479
	push	WORD PTR _hAppWnd
	push	ds
	push	OFFSET DGROUP:$SG1902
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
; Line 1483
	mov	sp,bp
	pop	bp
	ret	2
	nop	
$I1901:
	cmp	WORD PTR _bPaused,0
	je	$EX1900
; Line 1485
	mov	WORD PTR _bPaused,0
; Line 1486
	push	WORD PTR _hAppWnd
	push	ds
	push	OFFSET DGROUP:_szAppName
	call	FAR PTR SETWINDOWTEXT
; Line 1487
	cmp	WORD PTR [bp+4],0	;bPanic
	je	$I1905
	push	WORD PTR _hAppWnd
	push	9
	call	FAR PTR SHOWWINDOW
; Line 1488
$I1905:
	push	WORD PTR _hAppWnd
	push	1
	push	WORD PTR _nDrawDelay
	push	0
	push	0
	call	FAR PTR SETTIMER
; Line 1490
$EX1900:
	mov	sp,bp
	pop	bp
	ret	2

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
	je	$I1909
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
$I1909:
	push	WORD PTR [bp+4]	;hWnd
	lea	ax,WORD PTR [bp-32]	;ps
	push	ss
	push	ax
	call	FAR PTR ENDPAINT
; Line 1503
	mov	sp,bp
	pop	bp
	ret	2
	nop	

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
	je	$I1916
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
	jmp	SHORT $L20154
	nop	
$I1916:
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
$L20154:
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

ERASEHYPEROIDBKGND	ENDP
; Line 1538
	PUBLIC	DRAWSHADOWRECT
DRAWSHADOWRECT	PROC NEAR
	push	bp
	mov	bp,sp
;	hHi = 6
;	hLo = 4
;	hDC = 10
;	npRect = 8
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
	sub	sp,46
	push	di
	push	si
;	hWnd = 4
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
; Line 1562
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISICONIC
	or	ax,ax
	je	$JCC10146
	jmp	$L20105
$JCC10146:
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
	je	$I1941
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
	jmp	SHORT $L20155
$I1941:
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
$L20155:
	mov	WORD PTR [bp-6],ax	;hpenLo
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
	jne	$I1943
	push	WORD PTR [bp-44]	;hDC
	lea	ax,WORD PTR [bp-26]	;rect
	push	ax
	push	WORD PTR [bp-6]	;hpenLo
	push	WORD PTR [bp-16]	;hpenHi
	call	DRAWSHADOWRECT
; Line 1600
$I1943:
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
	push	ax
	push	14
	lea	cx,WORD PTR [bp-42]	;bm
	push	ss
	push	cx
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
	push	0
	push	0
	push	204
	push	32
	call	FAR PTR BITBLT
; Line 1612
	mov	ax,WORD PTR [bp-40]
	add	WORD PTR [bp-26],ax	;rect
; Line 1616
	push	WORD PTR [bp+4]	;hWnd
	call	FAR PTR ISZOOMED
	or	ax,ax
	je	$I1944
	push	0
	push	0
	push	32747
	jmp	SHORT $L20156
$I1944:
	push	0
	push	0
	push	32748
$L20156:
	call	FAR PTR LOADBITMAP
	mov	WORD PTR [bp-8],ax	;hbm
	push	ax
	push	14
	lea	cx,WORD PTR [bp-42]	;bm
	push	ss
	push	cx
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
	push	ax
	push	14
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
	mov	ax,OFFSET DGROUP:$S1355_rectScoreClip
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
	cmp	WORD PTR $S1353_nScoreLen,0
	jle	$L20105
	sub	ax,ax
	mov	bx,OFFSET DGROUP:$S1354_szScore
	mov	cx,WORD PTR $S1353_nScoreLen
	shr	cx,1
	mov	di,bx
	push	ds
	pop	es
	rep	stosw
	jae	$L20105
	stosb
$L20105:
; Line 1641
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	2

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
	ja	$L20106
	cmp	ax,133
	jb	$JCC10966
	jmp	$SC1988
$JCC10966:
	cmp	ax,20
	jne	$JCC10974
	jmp	$SC1987
$JCC10974:
	jbe	$JCC10979
	jmp	$L20157
$JCC10979:
	dec	al
	je	$SC1958
	dec	al
	je	$SC1992
	sub	al,13
	jne	$JCC10994
	jmp	$SC1989
$JCC10994:
	sub	al,4
	jne	$JCC11001
	jmp	$SC1974
$JCC11001:
	jmp	$L20157
	nop	
$L20106:
	cmp	ax,274
	jne	$JCC11013
	jmp	$SC1966
$JCC11013:
	ja	$L20107
	sub	ax,258
	jne	$JCC11023
	jmp	$SC1975
$JCC11023:
	sub	ax,2
	jb	$L20157
	sub	ax,2
	ja	$JCC11036
	jmp	$SC1977
$JCC11036:
	jmp	SHORT $L20157
	nop	
$L20107:
	sub	ax,275
	jne	$JCC11047
	jmp	$SC1959
$JCC11047:
	sub	ax,508
	jne	$JCC11055
	jmp	$SC1990
$JCC11055:
	jmp	SHORT $L20157
; Line 1652
$SC1958:
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
$SB1955:
; Line 1749
	sub	ax,ax
$L20162:
	cwd	
	jmp	$EX1953
	nop	
; Line 1739
$SC1992:
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
	jmp	SHORT $SB1955
	nop	
; Line 1726
$SC1989:
; Line 1727
	push	WORD PTR [bp+14]	;hWnd
	call	PAINTHYPEROID
; Line 1728
	jmp	SHORT $SB1955
; Line 1690
$SC1974:
; Line 1691
	push	0
	call	PANIC
; Line 1692
$L20157:
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+12]	;message
	push	WORD PTR [bp+10]	;wParam
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;lParam
	call	FAR PTR DEFWINDOWPROC
	jmp	$EX1953
; Line 1718
$SC1987:
; Line 1719
	push	WORD PTR [bp+14]	;hWnd
	push	WORD PTR [bp+10]	;wParam
	call	ERASEHYPEROIDBKGND
	jmp	SHORT $L20162
	nop	
; Line 1721
$SC1988:
; Line 1723
	push	WORD PTR [bp+14]	;hWnd
	call	NCPAINTHYPEROID
	jmp	$L20158
	nop	
; Line 1694
$SC1975:
; Line 1695
	cmp	WORD PTR [bp+10],27	;wParam
	jne	$SB1955
	push	1
	call	PANIC
; Line 1696
	jmp	SHORT $SB1955
	nop	
; Line 1698
$SC1977:
; Line 1701
	test	WORD PTR [bp+8],8192
	jne	$L20157
; Line 1705
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1715
	cmp	ax,32
	je	$L20161
	ja	$L20157
	sub	al,9
	je	$L20161
	sub	al,18
	jne	$L20157
; Line 1708
	cmp	WORD PTR [bp+12],260	;message
	jne	$L20161
	push	1
	call	PANIC
; Line 1709
	jmp	SHORT $L20161
	nop	
; Line 1674
$SC1966:
; Line 1675
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1687
	sub	ax,200
	je	$SC1971
	dec	ax
	je	$SC1972
; Line 1685
	jmp	SHORT $L20157
	nop	
; Line 1677
$SC1971:
; Line 1678
	push	WORD PTR [bp+14]	;hWnd
	call	NEWGAME
; Line 1679
	jmp	$SB1955
	nop	
; Line 1681
$SC1972:
; Line 1682
	push	WORD PTR [bp+14]	;hWnd
	call	FAR PTR ABOUTHYPEROID
; Line 1683
	jmp	$SB1955
	nop	
; Line 1658
$SC1959:
; Line 1659
	mov	ax,WORD PTR [bp+10]	;wParam
; Line 1671
	dec	ax
	je	$SC1964
	dec	ax
	je	$SC1965
	jmp	$SB1955
; Line 1661
$SC1964:
; Line 1662
	push	WORD PTR [bp+14]	;hWnd
	call	CHECKSCORE
; Line 1663
	push	WORD PTR [bp+14]	;hWnd
	call	DRAWOBJECTS
; Line 1664
	jmp	SHORT $L20161
; Line 1666
$SC1965:
; Line 1667
	push	WORD PTR [bp+14]	;hWnd
	push	2
	call	FAR PTR KILLTIMER
; Line 1668
	mov	WORD PTR _bRestart,0
; Line 1669
	call	RESTARTHYPEROID
; Line 1670
$L20161:
	sub	ax,ax
	jmp	SHORT $L20159
	nop	
; Line 1730
$SC1990:
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
; Line 1737
$L20158:
	mov	ax,1
$L20159:
	sub	dx,dx
; Line 1750
$EX1953:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10
	nop	

HYPEROIDWNDPROC	ENDP
HYPEROID_TEXT      ENDS
CONST      SEGMENT
$T20122	DQ	03f9921fb6134ce3er    ;	2.454369335937500E-02
$T20123	DQ	040d0000000000000r    ;	16384.00000000000
CONST      ENDS
HYPEROID_TEXT      SEGMENT
	ASSUME	CS: HYPEROID_TEXT
; Line 1757
	PUBLIC	INITHYPEROID
INITHYPEROID	PROC NEAR
	push	bp
	mov	bp,sp
	sub	sp,32
	push	di
	push	si
;	dRad = -10
;	nCnt = -2
; Line 1762
	call	FAR PTR CREATEHYPEROIDPALETTE
	mov	WORD PTR _hAppPalette,ax
; Line 1763
	or	ax,ax
	jne	$I1997
$L20163:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 1764
$I1997:
	mov	WORD PTR [bp-2],0	;nCnt
	mov	WORD PTR [bp-12],OFFSET DGROUP:_hPen
$F1998:
; Line 1766
	push	0
	push	1
	push	256
	push	WORD PTR [bp-2]	;nCnt
	call	FAR PTR CREATEPEN
	mov	bx,WORD PTR [bp-12]
	mov	WORD PTR [bx],ax
; Line 1767
	mov	bx,WORD PTR [bp-12]
	cmp	WORD PTR [bx],0
	je	$L20163
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-12],2
	cmp	WORD PTR [bp-12],OFFSET DGROUP:_hPen+32
	jb	$F1998
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;nCnt
	mov	WORD PTR [bp-14],ax
; Line 1769
$F2002:
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
	je	$L20163
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-14],2
	cmp	WORD PTR [bp-14],34
	jl	$F2002
; Line 1776
	call	FAR PTR GETCURRENTTIME
	mov	WORD PTR $S1352_dwSeed,ax
	mov	WORD PTR $S1352_dwSeed+2,dx
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;nCnt
	mov	WORD PTR [bp-16],ax
; Line 1779
$F2006:
; Line 1782
	fild	WORD PTR [bp-2]	;nCnt
	fmul	QWORD PTR $T20122
	fst	QWORD PTR [bp-32]
	call	FAR PTR __aFCIcos
	fmul	QWORD PTR $T20123
	call	FAR PTR __aFftol
	mov	bx,WORD PTR [bp-16]
	mov	WORD PTR _nCos[bx],ax
; Line 1783
	fld	QWORD PTR [bp-32]
	call	FAR PTR __aFCIsin
	fmul	QWORD PTR $T20123
	call	FAR PTR __aFftol
	mov	bx,WORD PTR [bp-16]
	mov	WORD PTR _nSin[bx],ax
; Line 1779
	inc	WORD PTR [bp-2]	;nCnt
	add	WORD PTR [bp-16],2
	cmp	WORD PTR [bp-16],512
	jl	$F2006
; Line 1787
	call	FAR PTR GETHYPEROIDINI
	mov	WORD PTR [bp-18],OFFSET DGROUP:_Obj
; Line 1790
$F2009:
; Line 1791
	push	OFFSET DGROUP:_FreeList
	push	WORD PTR [bp-18]
	call	ADDHEAD
	add	WORD PTR [bp-18],88
	cmp	WORD PTR [bp-18],OFFSET DGROUP:_Obj+8800
	jb	$F2009
; Line 1794
	push	OFFSET DGROUP:_FreeList
	call	REMHEAD
	mov	WORD PTR _npPlayer,ax
; Line 1795
	mov	bx,ax
	mov	BYTE PTR [bx+23],5
; Line 1796
	mov	WORD PTR [bx+12],256
	mov	cx,10
	lea	di,WORD PTR [bx+24]
	mov	si,OFFSET DGROUP:$S1357_Player
	push	ds
	pop	es
	rep	movsw
; Line 1800
	mov	ax,1
; Line 1801
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

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
	je	$I2017
	push	WORD PTR _hAppPalette
	call	FAR PTR DELETEOBJECT
; Line 1812
$I2017:
	mov	WORD PTR [bp-4],OFFSET DGROUP:_hPen
$F2018:
; Line 1813
	mov	bx,WORD PTR [bp-4]
	cmp	WORD PTR [bx],0
	je	$FC2019
	push	WORD PTR [bx]
	call	FAR PTR DELETEOBJECT
; Line 1812
$FC2019:
	add	WORD PTR [bp-4],2
	cmp	WORD PTR [bp-4],OFFSET DGROUP:_hPen+32
	jb	$F2018
; Line 1814
	mov	WORD PTR [bp-6],OFFSET DGROUP:_hBitmap
$F2022:
; Line 1815
	mov	bx,WORD PTR [bp-6]
	cmp	WORD PTR [bx],0
	je	$FC2023
	push	WORD PTR [bx]
	call	FAR PTR DELETEOBJECT
; Line 1814
$FC2023:
	add	WORD PTR [bp-6],2
	cmp	WORD PTR [bp-6],OFFSET DGROUP:_hBitmap+34
	jb	$F2022
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
	jne	$I2032
; Line 1831
	call	FAR PTR CREATEHYPEROIDCLASS
	or	ax,ax
	jne	$I2034
$L20164:
	sub	ax,ax
	jmp	SHORT $EX2030
; Line 1833
$I2032:
; Line 1836
	push	WORD PTR [bp+12]	;hPrevInstance
	push	OFFSET DGROUP:_szAppName
	push	32
	call	FAR PTR GETINSTANCEDATA
; Line 1837
$I2034:
; Line 1838
	call	INITHYPEROID
	or	ax,ax
	je	$Abort2036
; Line 1839
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;lpszCmdLine
	push	WORD PTR [bp+6]	;nCmdShow
	call	FAR PTR CREATEHYPEROIDWINDOW
	mov	WORD PTR _hAppWnd,ax
; Line 1840
	or	ax,ax
	je	$L20164
; Line 1842
	lea	ax,WORD PTR [bp-20]	;msg
	push	ss
	push	ax
	push	0
	push	0
	push	0
	call	FAR PTR GETMESSAGE
	or	ax,ax
	je	$Abort2036
$FC2039:
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
	push	0
	push	0
	push	0
	call	FAR PTR GETMESSAGE
	or	ax,ax
	jne	$FC2039
; Line 1848
$Abort2036:
; Line 1849
	call	EXITHYPEROID
; Line 1850
	mov	ax,WORD PTR [bp-16]
; Line 1851
$EX2030:
	dec	bp
	dec	bp
	mov	sp,bp
	pop	ds
	pop	bp
	dec	bp
	ret	10
	nop	

WINMAIN	ENDP
HYPEROID_TEXT	ENDS
END
