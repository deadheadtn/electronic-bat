_InitTimer1:
;ultrazvuk+gtqph.c,18 :: 		void InitTimer1(){
;ultrazvuk+gtqph.c,19 :: 		T1CON         = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T1CON+0)(GP)
;ultrazvuk+gtqph.c,20 :: 		T1IP0_bit         = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;ultrazvuk+gtqph.c,21 :: 		T1IP1_bit         = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;ultrazvuk+gtqph.c,22 :: 		T1IP2_bit         = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;ultrazvuk+gtqph.c,23 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ultrazvuk+gtqph.c,24 :: 		T1IE_bit         = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;ultrazvuk+gtqph.c,25 :: 		PR1             = 1000;
ORI	R2, R0, 1000
SW	R2, Offset(PR1+0)(GP)
;ultrazvuk+gtqph.c,26 :: 		TMR1                 = 0;
SW	R0, Offset(TMR1+0)(GP)
;ultrazvuk+gtqph.c,27 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer3:
;ultrazvuk+gtqph.c,28 :: 		void InitTimer3(){
;ultrazvuk+gtqph.c,29 :: 		T3CON                 = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T3CON+0)(GP)
;ultrazvuk+gtqph.c,30 :: 		PR3                 = 320;
ORI	R2, R0, 320
SW	R2, Offset(PR3+0)(GP)
;ultrazvuk+gtqph.c,31 :: 		TMR3                 = 0;
SW	R0, Offset(TMR3+0)(GP)
;ultrazvuk+gtqph.c,32 :: 		}
L_end_InitTimer3:
JR	RA
NOP	
; end of _InitTimer3
_InitADC:
;ultrazvuk+gtqph.c,35 :: 		void InitADC(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ultrazvuk+gtqph.c,36 :: 		AD1CON1.B15 = 0;  //Turn ADC off
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+4)(GP)
;ultrazvuk+gtqph.c,38 :: 		TRISB0_bit = 1;
LUI	R2, BitMask(TRISB0_bit+0)
ORI	R2, R2, BitMask(TRISB0_bit+0)
_SX	
;ultrazvuk+gtqph.c,39 :: 		TRISB1_bit = 1;
LUI	R2, BitMask(TRISB1_bit+0)
ORI	R2, R2, BitMask(TRISB1_bit+0)
_SX	
;ultrazvuk+gtqph.c,40 :: 		TRISB4_bit = 1;
LUI	R2, BitMask(TRISB4_bit+0)
ORI	R2, R2, BitMask(TRISB4_bit+0)
_SX	
;ultrazvuk+gtqph.c,41 :: 		AD1PCFG = ~(CHANNELS);
LUI	R2, 65535
ORI	R2, R2, 65520
SW	R2, Offset(AD1PCFG+0)(GP)
;ultrazvuk+gtqph.c,43 :: 		FORM0_bit = 0;
LUI	R2, BitMask(FORM0_bit+0)
ORI	R2, R2, BitMask(FORM0_bit+0)
_SX	
;ultrazvuk+gtqph.c,44 :: 		FORM1_bit = 0;
LUI	R2, BitMask(FORM1_bit+0)
ORI	R2, R2, BitMask(FORM1_bit+0)
_SX	
;ultrazvuk+gtqph.c,45 :: 		FORM2_bit = 0;   //16-bit integer format
LUI	R2, BitMask(FORM2_bit+0)
ORI	R2, R2, BitMask(FORM2_bit+0)
_SX	
;ultrazvuk+gtqph.c,47 :: 		SSRC0_bit = 0;
LUI	R2, BitMask(SSRC0_bit+0)
ORI	R2, R2, BitMask(SSRC0_bit+0)
_SX	
;ultrazvuk+gtqph.c,48 :: 		SSRC1_bit = 1;
LUI	R2, BitMask(SSRC1_bit+0)
ORI	R2, R2, BitMask(SSRC1_bit+0)
_SX	
;ultrazvuk+gtqph.c,49 :: 		SSRC2_bit = 0;   //Conversion trigger source Timer3
LUI	R2, BitMask(SSRC2_bit+0)
ORI	R2, R2, BitMask(SSRC2_bit+0)
_SX	
;ultrazvuk+gtqph.c,51 :: 		CLRASAM_bit = 0; //Don't stop converting
LUI	R2, BitMask(CLRASAM_bit+0)
ORI	R2, R2, BitMask(CLRASAM_bit+0)
_SX	
;ultrazvuk+gtqph.c,53 :: 		ASAM_bit = 1;    //Start sampling immediately
LUI	R2, BitMask(ASAM_bit+0)
ORI	R2, R2, BitMask(ASAM_bit+0)
_SX	
;ultrazvuk+gtqph.c,55 :: 		CSCNA_bit = 1;   //Scan inputs
LUI	R2, BitMask(CSCNA_bit+0)
ORI	R2, R2, BitMask(CSCNA_bit+0)
_SX	
;ultrazvuk+gtqph.c,57 :: 		VCFG0_bit = 0;
LUI	R2, BitMask(VCFG0_bit+0)
ORI	R2, R2, BitMask(VCFG0_bit+0)
_SX	
;ultrazvuk+gtqph.c,58 :: 		VCFG1_bit = 0;
LUI	R2, BitMask(VCFG1_bit+0)
ORI	R2, R2, BitMask(VCFG1_bit+0)
_SX	
;ultrazvuk+gtqph.c,59 :: 		VCFG2_bit = 0;     //AVdd and AVss voltage reference pins
LUI	R2, BitMask(VCFG2_bit+0)
ORI	R2, R2, BitMask(VCFG2_bit+0)
_SX	
;ultrazvuk+gtqph.c,61 :: 		CH0NA_bit = 0;     //Mux negative input is Vr-
LUI	R2, BitMask(CH0NA_bit+0)
ORI	R2, R2, BitMask(CH0NA_bit+0)
_SX	
;ultrazvuk+gtqph.c,63 :: 		ALTS_bit = 0;      //Always use MUXA settings
LUI	R2, BitMask(ALTS_bit+0)
ORI	R2, R2, BitMask(ALTS_bit+0)
_SX	
;ultrazvuk+gtqph.c,65 :: 		ADRC_bit = 1;      //Use ADC Internal RC oscillator
LUI	R2, BitMask(ADRC_bit+0)
ORI	R2, R2, BitMask(ADRC_bit+0)
_SX	
;ultrazvuk+gtqph.c,67 :: 		SMPI0_bit = 1;
LUI	R2, BitMask(SMPI0_bit+0)
ORI	R2, R2, BitMask(SMPI0_bit+0)
_SX	
;ultrazvuk+gtqph.c,68 :: 		SMPI1_bit = 1;
LUI	R2, BitMask(SMPI1_bit+0)
ORI	R2, R2, BitMask(SMPI1_bit+0)
_SX	
;ultrazvuk+gtqph.c,69 :: 		SMPI2_bit = 1;
LUI	R2, BitMask(SMPI2_bit+0)
ORI	R2, R2, BitMask(SMPI2_bit+0)
_SX	
;ultrazvuk+gtqph.c,70 :: 		SMPI3_bit = 1;   //Interrupts at completion of 16th convert
LUI	R2, BitMask(SMPI3_bit+0)
ORI	R2, R2, BitMask(SMPI3_bit+0)
_SX	
;ultrazvuk+gtqph.c,72 :: 		BUFM_bit = 0;    //16-word buffer
LUI	R2, BitMask(BUFM_bit+0)
ORI	R2, R2, BitMask(BUFM_bit+0)
_SX	
;ultrazvuk+gtqph.c,74 :: 		ALTS_bit = 0;    //Use MUX A
LUI	R2, BitMask(ALTS_bit+0)
ORI	R2, R2, BitMask(ALTS_bit+0)
_SX	
;ultrazvuk+gtqph.c,76 :: 		AD1CSSL = CHANNELS;  //Scan inputs 0,1,2,4
ORI	R2, R0, 15
SW	R2, Offset(AD1CSSL+0)(GP)
;ultrazvuk+gtqph.c,78 :: 		InitTimer3();    //Initialize timer
JAL	_InitTimer3+0
NOP	
;ultrazvuk+gtqph.c,80 :: 		AD1IP0_bit = 1;
LUI	R2, BitMask(AD1IP0_bit+0)
ORI	R2, R2, BitMask(AD1IP0_bit+0)
_SX	
;ultrazvuk+gtqph.c,81 :: 		AD1IP1_bit = 1;
LUI	R2, BitMask(AD1IP1_bit+0)
ORI	R2, R2, BitMask(AD1IP1_bit+0)
_SX	
;ultrazvuk+gtqph.c,82 :: 		AD1IP2_bit = 1;
LUI	R2, BitMask(AD1IP2_bit+0)
ORI	R2, R2, BitMask(AD1IP2_bit+0)
_SX	
;ultrazvuk+gtqph.c,84 :: 		AD1IF_bit = 0;
LUI	R2, BitMask(AD1IF_bit+0)
ORI	R2, R2, BitMask(AD1IF_bit+0)
_SX	
;ultrazvuk+gtqph.c,85 :: 		AD1IE_bit = 1;   //Configure interrupts
LUI	R2, BitMask(AD1IE_bit+0)
ORI	R2, R2, BitMask(AD1IE_bit+0)
_SX	
;ultrazvuk+gtqph.c,88 :: 		}
L_end_InitADC:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _InitADC
_SampleADC:
;ultrazvuk+gtqph.c,90 :: 		void SampleADC(){
;ultrazvuk+gtqph.c,91 :: 		current = 0;
SH	R0, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,92 :: 		ADC_Done = 0;
SB	R0, Offset(_ADC_Done+0)(GP)
;ultrazvuk+gtqph.c,93 :: 		AD1CON1.B15 = 1;
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+8)(GP)
;ultrazvuk+gtqph.c,94 :: 		while(!ADC_done);
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
;ultrazvuk+gtqph.c,95 :: 		}
L_end_SampleADC:
JR	RA
NOP	
; end of _SampleADC
_Timer1Interrupt:
;ultrazvuk+gtqph.c,96 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
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
;ultrazvuk+gtqph.c,97 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ultrazvuk+gtqph.c,98 :: 		LATA2_bit = ~LATA2_bit;
_LX	
EXT	R2, R2, BitPos(LATA2_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA2_bit+0), 1
_SX	
;ultrazvuk+gtqph.c,99 :: 		LATA3_bit = ~LATA3_bit;
_LX	
EXT	R2, R2, BitPos(LATA3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA3_bit+0), 1
_SX	
;ultrazvuk+gtqph.c,100 :: 		}
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
;ultrazvuk+gtqph.c,101 :: 		void ADC_complete() iv IVT_ADC ilevel 7 ics ICS_SRS {
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
;ultrazvuk+gtqph.c,102 :: 		AD1IF_bit=0;                    //Reset interrupt flag
LUI	R2, BitMask(AD1IF_bit+0)
ORI	R2, R2, BitMask(AD1IF_bit+0)
_SX	
;ultrazvuk+gtqph.c,103 :: 		if(current+15<SAMPLE_COUNT){    //Copy data
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 15
ANDI	R2, R2, 65535
SLTIU	R2, R2, 16000
BNE	R2, R0, L__ADC_complete14
NOP	
J	L_ADC_complete2
NOP	
L__ADC_complete14:
;ultrazvuk+gtqph.c,104 :: 		Measurements[current] = ADC1BUF0;
LHU	R2, Offset(_current+0)(GP)
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF0+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,105 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,106 :: 		Measurements[current] = ADC1BUF1;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF1+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,107 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,108 :: 		Measurements[current] = ADC1BUF2;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF2+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,109 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,110 :: 		Measurements[current] = ADC1BUF3;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF3+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,111 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,112 :: 		Measurements[current] = ADC1BUF4;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF4+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,113 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,114 :: 		Measurements[current] = ADC1BUF5;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF5+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,115 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,116 :: 		Measurements[current] = ADC1BUF6;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF6+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,117 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,118 :: 		Measurements[current] = ADC1BUF7;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF7+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,119 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,120 :: 		Measurements[current] = ADC1BUF8;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF8+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,121 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,122 :: 		Measurements[current] = ADC1BUF9;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUF9+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,123 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,124 :: 		Measurements[current] = ADC1BUFA;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFA+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,125 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,126 :: 		Measurements[current] = ADC1BUFB;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFB+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,127 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,128 :: 		Measurements[current] = ADC1BUFC;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFC+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,129 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,130 :: 		Measurements[current] = ADC1BUFD;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFD+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,131 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,132 :: 		Measurements[current] = ADC1BUFE;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFE+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,133 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,134 :: 		Measurements[current] = ADC1BUFF;
ANDI	R2, R2, 65535
SLL	R3, R2, 1
LUI	R2, hi_addr(_Measurements+0)
ORI	R2, R2, lo_addr(_Measurements+0)
ADDU	R3, R2, R3
LW	R2, Offset(ADC1BUFF+0)(GP)
SH	R2, 0(R3)
;ultrazvuk+gtqph.c,135 :: 		current++;
LHU	R2, Offset(_current+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_current+0)(GP)
;ultrazvuk+gtqph.c,136 :: 		} else {
J	L_ADC_complete3
NOP	
L_ADC_complete2:
;ultrazvuk+gtqph.c,137 :: 		AD1CON1.B15=0;         //Turn A/D converter OFF
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+4)(GP)
;ultrazvuk+gtqph.c,138 :: 		ADC_done=1;
ORI	R2, R0, 1
SB	R2, Offset(_ADC_Done+0)(GP)
;ultrazvuk+gtqph.c,139 :: 		}
L_ADC_complete3:
;ultrazvuk+gtqph.c,140 :: 		}
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
;ultrazvuk+gtqph.c,141 :: 		void InitDataSend(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ultrazvuk+gtqph.c,142 :: 		UART2_Init(256000);
SW	R25, 4(SP)
LUI	R25, 3
ORI	R25, R25, 59392
JAL	_UART2_Init+0
NOP	
;ultrazvuk+gtqph.c,143 :: 		}
L_end_InitDataSend:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitDataSend
_SendData:
;ultrazvuk+gtqph.c,144 :: 		void SendData(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ultrazvuk+gtqph.c,147 :: 		for(i=0; i<SAMPLE_COUNT;){ //Send all channels in single row
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
;ultrazvuk+gtqph.c,153 :: 		inttostr(measurements[i+1], txt);
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
;ultrazvuk+gtqph.c,154 :: 		i+=4;
ADDIU	R2, R6, 4
SEH	R6, R2
;ultrazvuk+gtqph.c,155 :: 		UART2_Write_Text(txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;ultrazvuk+gtqph.c,156 :: 		UART2_Write(' ');
ORI	R25, R0, 32
JAL	_UART2_Write+0
NOP	
;ultrazvuk+gtqph.c,157 :: 		UART2_Write(13);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;ultrazvuk+gtqph.c,158 :: 		UART2_Write(10);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;ultrazvuk+gtqph.c,159 :: 		}
; i end address is: 24 (R6)
J	L_SendData4
NOP	
L_SendData5:
;ultrazvuk+gtqph.c,160 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SendData
_main:
;ultrazvuk+gtqph.c,161 :: 		void main() {
;ultrazvuk+gtqph.c,162 :: 		TRISA2_bit = 0;
LUI	R2, BitMask(TRISA2_bit+0)
ORI	R2, R2, BitMask(TRISA2_bit+0)
_SX	
;ultrazvuk+gtqph.c,163 :: 		LATA2_bit = -1;
LUI	R2, BitMask(LATA2_bit+0)
ORI	R2, R2, BitMask(LATA2_bit+0)
_SX	
;ultrazvuk+gtqph.c,164 :: 		TRISA3_bit = 0;
LUI	R2, BitMask(TRISA3_bit+0)
ORI	R2, R2, BitMask(TRISA3_bit+0)
_SX	
;ultrazvuk+gtqph.c,165 :: 		LATA3_bit = 0;
LUI	R2, BitMask(LATA3_bit+0)
ORI	R2, R2, BitMask(LATA3_bit+0)
_SX	
;ultrazvuk+gtqph.c,166 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;ultrazvuk+gtqph.c,167 :: 		InitTimer3();
JAL	_InitTimer3+0
NOP	
;ultrazvuk+gtqph.c,168 :: 		EnableInterrupts();
EI	R30
;ultrazvuk+gtqph.c,169 :: 		InitADC();
JAL	_InitADC+0
NOP	
;ultrazvuk+gtqph.c,170 :: 		InitDataSend();
JAL	_InitDataSend+0
NOP	
;ultrazvuk+gtqph.c,171 :: 		SampleADC();
JAL	_SampleADC+0
NOP	
;ultrazvuk+gtqph.c,172 :: 		SendData();
JAL	_SendData+0
NOP	
;ultrazvuk+gtqph.c,173 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
