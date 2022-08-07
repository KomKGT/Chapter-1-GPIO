;; Compile Options : /TML621367 /MS /near /SD /Od /W 1 /Fasource files\ /Zs 
;; Version Number  : Ver.3.64.5
;; File Name       : BlinkLED.c

	type (ML621367) 
	model small, near
	$$Display$BlinkLED segment code 2h #0h
	$$Init_LED$BlinkLED segment code 2h #0h
	$$LEDoff$BlinkLED segment code 2h #0h
	$$LEDon$BlinkLED segment code 2h #0h
CVERSION 3.64.5
CGLOBAL 01H 03H 0000H "Display" 08H 02H 0AH 00H 81H 02H 00H 00H 07H
CGLOBAL 01H 03H 0000H "LEDon" 08H 02H 08H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "Init_LED" 08H 02H 07H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "LEDoff" 08H 02H 09H 00H 80H 00H 00H 00H 07H
CSTRUCTTAG 0000H 0000H 0001H 0002H 00000002H "flag"
CSTRUCTMEM 52H 00000001H 00000000H "_ScanTime" 02H 00H 01H
CSTRUCTMEM 52H 00000001H 00000001H "_TimerLED" 02H 00H 01H
CSTRUCTTAG 0000H 0000H 0000H 0008H 00000001H "_Notag"
CSTRUCTMEM 52H 00000001H 00000000H "b0" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000001H "b1" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000002H "b2" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000003H "b3" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000004H "b4" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000005H "b5" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000006H "b6" 02H 00H 00H
CSTRUCTMEM 52H 00000001H 00000007H "b7" 02H 00H 00H
CTYPEDEF 0000H 0000H 43H "_BYTE_FIELD" 04H 00H 05H 00H 00H
CGLOBAL 00H 43H 0002H "Flag" 04H 00H 05H 01H 00H
CFILE 0001H 0000117DH "D:\\U8Dev\\Inc\\ml621367.h"
CFILE 0002H 0000005EH "..\\source files\\wdt.h"
CFILE 0003H 0000004BH "..\\source files\\rdwr_reg.h"
CFILE 0004H 00000009H "..\\source files\\SysDefine.h"
CFILE 0005H 00000008H "..\\source files\\SysFlag.h"
CFILE 0006H 0000000AH "..\\source files\\Timer0.h"
CFILE 0007H 0000000EH "..\\source files\\time_delay.h"
CFILE 0000H 00000042H "..\\source files\\BlinkLED.c"

	rseg $$Init_LED$BlinkLED
CFUNCTION 7

_Init_LED	:
CBLOCK 7 1 22

;;{
CLINEA 0000H 0001H 0016H 0001H 0001H
CBLOCK 7 2 22

;;	P21DO=1;	// Output = 0
CLINEA 0000H 0001H 0017H 0002H 0017H
	sb	0f221h.1

;;	P21IE=0;P21OE=1;P21OD=0;P21PU=0;	// Disable input, Enable output, CMOS output, No pull
CLINEA 0000H 0001H 0018H 0002H 0057H
	rb	0f223h.0
	sb	0f223h.1
	rb	0f223h.3
	rb	0f223h.2

;;	P21MD3=0;P21MD2=0;P21MD1=0;P21MD0=0;	// Primary function
CLINEA 0000H 0001H 0019H 0002H 0039H
	rb	0f223h.7
	rb	0f223h.6
	rb	0f223h.5
	rb	0f223h.4

;;	P20DO=1;	// Output = 0
CLINEA 0000H 0001H 001BH 0002H 0017H
	sb	0f221h.0

;;	P20IE=0;P20OE=1;P20OD=0;P20PU=0;	// Disable input, Enable output, CMOS output, No pull
CLINEA 0000H 0001H 001CH 0002H 0057H
	rb	0f222h.0
	sb	0f222h.1
	rb	0f222h.3
	rb	0f222h.2

;;	P20MD3=0;P20MD2=0;P20MD1=0;P20MD0=0;	// Primary function
CLINEA 0000H 0001H 001DH 0002H 0039H
	rb	0f222h.7
	rb	0f222h.6
	rb	0f222h.5
	rb	0f222h.4
CBLOCKEND 7 2 30

;;}
CLINEA 0000H 0001H 001EH 0001H 0001H
	rt
CBLOCKEND 7 1 30
CFUNCTIONEND 7


	rseg $$LEDon$BlinkLED
CFUNCTION 8

_LEDon	:
CBLOCK 8 1 36

;;{
CLINEA 0000H 0001H 0024H 0001H 0001H
CBLOCK 8 2 36

;;	LED_Out=0;
CLINEA 0000H 0001H 0025H 0002H 000BH
	rb	0f221h.1

;;	P20DO=0;
CLINEA 0000H 0001H 0026H 0002H 0009H
	rb	0f221h.0
CBLOCKEND 8 2 39

;;}
CLINEA 0000H 0001H 0027H 0001H 0001H
	rt
CBLOCKEND 8 1 39
CFUNCTIONEND 8


	rseg $$LEDoff$BlinkLED
CFUNCTION 9

_LEDoff	:
CBLOCK 9 1 41

;;{
CLINEA 0000H 0001H 0029H 0001H 0001H
CBLOCK 9 2 41

;;	LED_Out=1;
CLINEA 0000H 0001H 002AH 0002H 000BH
	sb	0f221h.1

;;	P20DO=1;
CLINEA 0000H 0001H 002BH 0002H 0009H
	sb	0f221h.0
CBLOCKEND 9 2 44

;;}
CLINEA 0000H 0001H 002CH 0001H 0001H
	rt
CBLOCKEND 9 1 44
CFUNCTIONEND 9


	rseg $$Display$BlinkLED
CFUNCTION 10

_Display	:
CBLOCK 10 1 48

;;{
CLINEA 0000H 0001H 0030H 0001H 0001H
	push	lr
CBLOCK 10 2 48
CRET 0000H

;;	Delay();
CLINEA 0000H 0001H 0031H 0002H 0009H
	bl	_Delay

;;	if(Flag._TimerLED==1)
CLINEA 0000H 0001H 0032H 0002H 0016H
	tb	NEAR _Flag.1
	beq	_$L4
CBLOCK 10 3 51

;;		 LEDon();
CLINEA 0000H 0001H 0034H 0004H 000BH
	bl	_LEDon

;;		 Flag._TimerLED=0;
CLINEA 0000H 0001H 0035H 0004H 0014H
	rb	NEAR _Flag.1
CBLOCKEND 10 3 55
	bal	_$L6

;;	else{LEDon();}
CLINEA 0000H 0001H 0038H 0002H 000FH
_$L4 :
CBLOCK 10 4 56
	bl	_LEDon
CBLOCKEND 10 4 56
_$L6 :
CBLOCKEND 10 2 57

;;}
CLINEA 0000H 0001H 0039H 0001H 0001H
	pop	pc
CBLOCKEND 10 1 57
CFUNCTIONEND 10

	public _Display
	public _LEDon
	public _Init_LED
	public _LEDoff
	_Flag comm data 02h #00h
	extrn code near : _Delay
	extrn code near : _main

	end
