_InitTimer1:
;ultrazvuk.c,12 :: 		void InitTimer1(){
;ultrazvuk.c,13 :: 		T1CON         = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T1CON+0)(GP)
;ultrazvuk.c,14 :: 		T1IP0_bit         = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;ultrazvuk.c,15 :: 		T1IP1_bit         = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;ultrazvuk.c,16 :: 		T1IP2_bit         = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;ultrazvuk.c,17 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ultrazvuk.c,18 :: 		T1IE_bit         = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;ultrazvuk.c,19 :: 		PR1             = 1000;
ORI	R2, R0, 1000
SW	R2, Offset(PR1+0)(GP)
;ultrazvuk.c,20 :: 		TMR1                 = 0;
SW	R0, Offset(TMR1+0)(GP)
;ultrazvuk.c,21 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer3:
;ultrazvuk.c,22 :: 		void InitTimer3(){
;ultrazvuk.c,23 :: 		T3CON                 = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T3CON+0)(GP)
;ultrazvuk.c,24 :: 		PR3                 = 320;
ORI	R2, R0, 320
SW	R2, Offset(PR3+0)(GP)
;ultrazvuk.c,25 :: 		TMR3                 = 0;
SW	R0, Offset(TMR3+0)(GP)
;ultrazvuk.c,26 :: 		}
L_end_InitTimer3:
JR	RA
NOP	
; end of _InitTimer3
_InitADC:
;ultrazvuk.c,29 :: 		void InitADC(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ultrazvuk.c,30 :: 		AD1CON1.B15 = 0;  //Turn ADC off
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+4)(GP)
;ultrazvuk.c,32 :: 		TRISB0_bit = 1;
LUI	R2, BitMask(TRISB0_bit+0)
ORI	R2, R2, BitMask(TRISB0_bit+0)
_SX	
;ultrazvuk.c,33 :: 		TRISB1_bit = 1;
LUI	R2, BitMask(TRISB1_bit+0)
ORI	R2, R2, BitMask(TRISB1_bit+0)
_SX	
;ultrazvuk.c,34 :: 		TRISB4_bit = 1;
LUI	R2, BitMask(TRISB4_bit+0)
ORI	R2, R2, BitMask(TRISB4_bit+0)
_SX	
;ultrazvuk.c,36 :: 		AD1PCFG = ~(CHANNELS);
LUI	R2, 65535
ORI	R2, R2, 65520
SW	R2, Offset(AD1PCFG+0)(GP)
;ultrazvuk.c,38 :: 		FORM0_bit = 0;
LUI	R2, BitMask(FORM0_bit+0)
ORI	R2, R2, BitMask(FORM0_bit+0)
_SX	
;ultrazvuk.c,39 :: 		FORM1_bit = 0;
LUI	R2, BitMask(FORM1_bit+0)
ORI	R2, R2, BitMask(FORM1_bit+0)
_SX	
;ultrazvuk.c,40 :: 		FORM2_bit = 0;   //16-bit integer format
LUI	R2, BitMask(FORM2_bit+0)
ORI	R2, R2, BitMask(FORM2_bit+0)
_SX	
;ultrazvuk.c,42 :: 		SSRC0_bit = 0;
LUI	R2, BitMask(SSRC0_bit+0)
ORI	R2, R2, BitMask(SSRC0_bit+0)
_SX	
;ultrazvuk.c,43 :: 		SSRC1_bit = 1;
LUI	R2, BitMask(SSRC1_bit+0)
ORI	R2, R2, BitMask(SSRC1_bit+0)
_SX	
;ultrazvuk.c,44 :: 		SSRC2_bit = 0;   //Conversion trigger source Timer3
LUI	R2, BitMask(SSRC2_bit+0)
ORI	R2, R2, BitMask(SSRC2_bit+0)
_SX	
;ultrazvuk.c,46 :: 		CLRASAM_bit = 0; //Don't stop converting
LUI	R2, BitMask(CLRASAM_bit+0)
ORI	R2, R2, BitMask(CLRASAM_bit+0)
_SX	
;ultrazvuk.c,48 :: 		ASAM_bit = 1;    //Start sampling immediately
LUI	R2, BitMask(ASAM_bit+0)
ORI	R2, R2, BitMask(ASAM_bit+0)
_SX	
;ultrazvuk.c,50 :: 		CSCNA_bit = 1;   //Scan inputs
LUI	R2, BitMask(CSCNA_bit+0)
ORI	R2, R2, BitMask(CSCNA_bit+0)
_SX	
;ultrazvuk.c,52 :: 		VCFG0_bit = 0;
LUI	R2, BitMask(VCFG0_bit+0)
ORI	R2, R2, BitMask(VCFG0_bit+0)
_SX	
;ultrazvuk.c,53 :: 		VCFG1_bit = 0;
LUI	R2, BitMask(VCFG1_bit+0)
ORI	R2, R2, BitMask(VCFG1_bit+0)
_SX	
;ultrazvuk.c,54 :: 		VCFG2_bit = 0;     //AVdd and AVss voltage reference pins
LUI	R2, BitMask(VCFG2_bit+0)
ORI	R2, R2, BitMask(VCFG2_bit+0)
_SX	
;ultrazvuk.c,56 :: 		CH0NA_bit = 0;     //Mux negative input is Vr-
LUI	R2, BitMask(CH0NA_bit+0)
ORI	R2, R2, BitMask(CH0NA_bit+0)
_SX	
;ultrazvuk.c,58 :: 		ALTS_bit = 0;      //Always use MUXA settings
LUI	R2, BitMask(ALTS_bit+0)
ORI	R2, R2, BitMask(ALTS_bit+0)
_SX	
;ultrazvuk.c,60 :: 		ADRC_bit = 1;      //Use ADC Internal RC oscillator
LUI	R2, BitMask(ADRC_bit+0)
ORI	R2, R2, BitMask(ADRC_bit+0)
_SX	
;ultrazvuk.c,62 :: 		SMPI0_bit = 1;
LUI	R2, BitMask(SMPI0_bit+0)
ORI	R2, R2, BitMask(SMPI0_bit+0)
_SX	
;ultrazvuk.c,63 :: 		SMPI1_bit = 1;
LUI	R2, BitMask(SMPI1_bit+0)
ORI	R2, R2, BitMask(SMPI1_bit+0)
_SX	
;ultrazvuk.c,64 :: 		SMPI2_bit = 1;
LUI	R2, BitMask(SMPI2_bit+0)
ORI	R2, R2, BitMask(SMPI2_bit+0)
_SX	
;ultrazvuk.c,65 :: 		SMPI3_bit = 1;   //Interrupts at completion of 16th convert
LUI	R2, BitMask(SMPI3_bit+0)
ORI	R2, R2, BitMask(SMPI3_bit+0)
_SX	
;ultrazvuk.c,67 :: 		BUFM_bit = 0;    //16-word buffer
LUI	R2, BitMask(BUFM_bit+0)
ORI	R2, R2, BitMask(BUFM_bit+0)
_SX	
;ultrazvuk.c,69 :: 		ALTS_bit = 0;    //Use MUX A
LUI	R2, BitMask(ALTS_bit+0)
ORI	R2, R2, BitMask(ALTS_bit+0)
_SX	
;ultrazvuk.c,71 :: 		AD1CSSL = CHANNELS;  //Scan inputs 0,1,2,4
ORI	R2, R0, 15
SW	R2, Offset(AD1CSSL+0)(GP)
;ultrazvuk.c,73 :: 		InitTimer3();    //Initialize timer
JAL	_InitTimer3+0
NOP	
;ultrazvuk.c,75 :: 		AD1IP0_bit = 1;
LUI	R2, BitMask(AD1IP0_bit+0)
ORI	R2, R2, BitMask(AD1IP0_bit+0)
_SX	
;ultrazvuk.c,76 :: 		AD1IP1_bit = 1;
LUI	R2, BitMask(AD1IP1_bit+0)
ORI	R2, R2, BitMask(AD1IP1_bit+0)
_SX	
;ultrazvuk.c,77 :: 		AD1IP2_bit = 1;
LUI	R2, BitMask(AD1IP2_bit+0)
ORI	R2, R2, BitMask(AD1IP2_bit+0)
_SX	
;ultrazvuk.c,79 :: 		AD1IF_bit = 0;
LUI	R2, BitMask(AD1IF_bit+0)
ORI	R2, R2, BitMask(AD1IF_bit+0)
_SX	
;ultrazvuk.c,80 :: 		AD1IE_bit = 1;   //Configure interrupts
LUI	R2, BitMask(AD1IE_bit+0)
ORI	R2, R2, BitMask(AD1IE_bit+0)
_SX	
;ultrazvuk.c,83 :: 		}
L_end_InitADC:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _InitADC
_SampleADC:
;ultrazvuk.c,85 :: 		void SampleADC(){
;ultrazvuk.c,86 :: 		current = 0;
SH	R0, Offset(_current+0)(GP)
;ultrazvuk.c,87 :: 		ADC_Done = 0;
SB	R0, Offset(_ADC_Done+0)(GP)
;ultrazvuk.c,88 :: 		AD1CON1.B15 = 1;
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+8)(GP)
;ultrazvuk.c,89 :: 		while(!ADC_done);
L_SampleADC0:
LBU	R2, Offset(_ADC_Done+0)(GP)
BEQ	R2, R0, L__SampleADC11
NOP	
J	L_SampleADC1
NOP	
L__SampleADC11:
J	L_SampleADC0
NOP	
L_SampleADC1:
;ultrazvuk.c,90 :: 		}
L_end_SampleADC:
JR	RA
NOP	
; end of _SampleADC
_Timer1Interrupt:
;ultrazvuk.c,91 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
;ultrazvuk.c,92 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ultrazvuk.c,93 :: 		LATA2_bit = ~LATA2_bit;
_LX	
EXT	R2, R2, BitPos(LATA2_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA2_bit+0), 1
_SX	
;ultrazvuk.c,94 :: 		LATA3_bit = ~LATA3_bit;
_LX	
EXT	R2, R2, BitPos(LATA3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA3_bit+0), 1
_SX	
;ultrazvuk.c,95 :: 		}
L_end_Timer1Interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer1Interrupt
_ADC_complete:
;ultrazvuk.c,96 :: 		void ADC_complete() iv IVT_ADC ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
;ultrazvuk.c,97 :: 		AD1IF_bit=0;                    //Reset interrupt flag
LUI	R2, BitMask(AD1IF_bit+0)
ORI	R2, R2, BitMask(AD1IF_bit+0)
_SX	
;ultrazvuk.c,98 :: 		if(current+15<SAMPLE_COUNT){    //Copy data
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 15
ANDI	R2, R2, 65535
SLTIU	R2, R2, 16000
BNE	R2, R0, L__ADC_complete14
NOP	
J	L_ADC_complete2
NOP	
L__ADC_complete14:
;ultrazvuk.c,99 :: 		Measurements[current] = ADC1BUF0;
LHU	R2, Offset(_current+0)(GP)
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF0+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,100 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,101 :: 		Measurements[current] = ADC1BUF1;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF1+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,102 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,103 :: 		Measurements[current] = ADC1BUF2;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF2+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,104 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,105 :: 		Measurements[current] = ADC1BUF3;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF3+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,106 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,107 :: 		Measurements[current] = ADC1BUF4;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF4+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,108 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,109 :: 		Measurements[current] = ADC1BUF5;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF5+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,110 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,111 :: 		Measurements[current] = ADC1BUF6;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF6+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,112 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,113 :: 		Measurements[current] = ADC1BUF7;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF7+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,114 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,115 :: 		Measurements[current] = ADC1BUF8;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF8+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,116 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,117 :: 		Measurements[current] = ADC1BUF9;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF9+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,118 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,119 :: 		Measurements[current] = ADC1BUFA;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFA+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,120 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,121 :: 		Measurements[current] = ADC1BUFB;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFB+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,122 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,123 :: 		Measurements[current] = ADC1BUFC;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFC+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,124 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,125 :: 		Measurements[current] = ADC1BUFD;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFD+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,126 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,127 :: 		Measurements[current] = ADC1BUFE;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFE+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,128 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,129 :: 		Measurements[current] = ADC1BUFF;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFF+0)(GP)
SH	R2, 0(R3)
;ultrazvuk.c,130 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk.c,131 :: 		} else {
J	L_ADC_complete3
NOP	
L_ADC_complete2:
;ultrazvuk.c,132 :: 		AD1CON1.B15=0;         //Turn A/D converter OFF
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+4)(GP)
;ultrazvuk.c,133 :: 		ADC_done=1;
ORI	R2, R0, 1
SB	R2, Offset(_ADC_Done+0)(GP)
;ultrazvuk.c,134 :: 		}
L_ADC_complete3:
;ultrazvuk.c,135 :: 		}
L_end_ADC_complete:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _ADC_complete
_InitDataSend:
;ultrazvuk.c,136 :: 		void InitDataSend(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ultrazvuk.c,137 :: 		UART2_Init(256000);
SW	R25, 4(SP)
LUI	R25, 3
ORI	R25, R25, 59392
JAL	_UART2_Init+0
NOP	
;ultrazvuk.c,138 :: 		}
L_end_InitDataSend:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitDataSend
_SendData:
;ultrazvuk.c,139 :: 		void SendData(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;ultrazvuk.c,142 :: 		for(i=0; i<SAMPLE_COUNT;){ //Send all channels in single row
SW	R25, 4(SP)
SW	R26, 8(SP)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_SendData4:
; i start address is: 24 (R6)
SEH	R2, R6
SLTI	R2, R2, 16000
BNE	R2, R0, L__SendData17
NOP	
J	L_SendData5
NOP	
L__SendData17:
;ultrazvuk.c,148 :: 		inttostr(measurements[i+1], txt);
ADDIU	R4, SP, 12
ADDIU	R2, R6, 1
SEH	R2, R2
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
MOVZ	R26, R4, R0
ANDI	R25, R2, 65535
JAL	_IntToStr+0
NOP	
;ultrazvuk.c,149 :: 		i=4+i;
ADDIU	R2, R6, 4
SEH	R6, R2
;ultrazvuk.c,150 :: 		UART2_Write_Text(txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;ultrazvuk.c,151 :: 		UART2_Write(' ');
ORI	R25, R0, 32
JAL	_UART2_Write+0
NOP	
;ultrazvuk.c,152 :: 		UART2_Write(13);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;ultrazvuk.c,153 :: 		UART2_Write(10);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;ultrazvuk.c,154 :: 		}
; i end address is: 24 (R6)
J	L_SendData4
NOP	
L_SendData5:
;ultrazvuk.c,155 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SendData
_main:
;ultrazvuk.c,156 :: 		void main() {
;ultrazvuk.c,157 :: 		TRISA2_bit = 0;
LUI	R2, BitMask(TRISA2_bit+0)
ORI	R2, R2, BitMask(TRISA2_bit+0)
_SX	
;ultrazvuk.c,158 :: 		LATA2_bit = 1;
LUI	R2, BitMask(LATA2_bit+0)
ORI	R2, R2, BitMask(LATA2_bit+0)
_SX	
;ultrazvuk.c,159 :: 		TRISA3_bit = 0;
LUI	R2, BitMask(TRISA3_bit+0)
ORI	R2, R2, BitMask(TRISA3_bit+0)
_SX	
;ultrazvuk.c,160 :: 		LATA3_bit = 0;
LUI	R2, BitMask(LATA3_bit+0)
ORI	R2, R2, BitMask(LATA3_bit+0)
_SX	
;ultrazvuk.c,161 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;ultrazvuk.c,162 :: 		InitTimer3();
JAL	_InitTimer3+0
NOP	
;ultrazvuk.c,163 :: 		EnableInterrupts();
EI	R30
;ultrazvuk.c,164 :: 		InitADC();
JAL	_InitADC+0
NOP	
;ultrazvuk.c,165 :: 		InitDataSend();
JAL	_InitDataSend+0
NOP	
;ultrazvuk.c,166 :: 		SampleADC();
JAL	_SampleADC+0
NOP	
;ultrazvuk.c,167 :: 		SendData();
JAL	_SendData+0
NOP	
;ultrazvuk.c,168 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
