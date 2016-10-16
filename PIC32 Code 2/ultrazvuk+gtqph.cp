#line 1 "C:/Users/acer/Desktop/Nouveau dossier/ultrazvuk+gtqph.c"
#line 13 "C:/Users/acer/Desktop/Nouveau dossier/ultrazvuk+gtqph.c"
unsigned int Measurements[ 16000 ];
unsigned int current;
volatile char ADC_Done;


void InitTimer1(){
 T1CON = 0x8000;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 1000;
 TMR1 = 0;
}
void InitTimer3(){
 T3CON = 0x8000;
 PR3 = 320;
 TMR3 = 0;
}


void InitADC(){
 AD1CON1.B15 = 0;

 TRISB0_bit = 1;
 TRISB1_bit = 1;
 TRISB4_bit = 1;
 AD1PCFG = ~( 1 | 2 | 4 | 8 );

 FORM0_bit = 0;
 FORM1_bit = 0;
 FORM2_bit = 0;

 SSRC0_bit = 0;
 SSRC1_bit = 1;
 SSRC2_bit = 0;

 CLRASAM_bit = 0;

 ASAM_bit = 1;

 CSCNA_bit = 1;

 VCFG0_bit = 0;
 VCFG1_bit = 0;
 VCFG2_bit = 0;

 CH0NA_bit = 0;

 ALTS_bit = 0;

 ADRC_bit = 1;

 SMPI0_bit = 1;
 SMPI1_bit = 1;
 SMPI2_bit = 1;
 SMPI3_bit = 1;

 BUFM_bit = 0;

 ALTS_bit = 0;

 AD1CSSL =  1 | 2 | 4 | 8 ;

 InitTimer3();

 AD1IP0_bit = 1;
 AD1IP1_bit = 1;
 AD1IP2_bit = 1;

 AD1IF_bit = 0;
 AD1IE_bit = 1;


}

void SampleADC(){
 current = 0;
 ADC_Done = 0;
 AD1CON1.B15 = 1;
 while(!ADC_done);
}
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
 T1IF_bit = 0;
 LATA2_bit = ~LATA2_bit;
 LATA3_bit = ~LATA3_bit;
}
void ADC_complete() iv IVT_ADC ilevel 7 ics ICS_SRS {
 AD1IF_bit=0;
 if(current+15< 16000 ){
 Measurements[current] = ADC1BUF0;
 current++;
 Measurements[current] = ADC1BUF1;
 current++;
 Measurements[current] = ADC1BUF2;
 current++;
 Measurements[current] = ADC1BUF3;
 current++;
 Measurements[current] = ADC1BUF4;
 current++;
 Measurements[current] = ADC1BUF5;
 current++;
 Measurements[current] = ADC1BUF6;
 current++;
 Measurements[current] = ADC1BUF7;
 current++;
 Measurements[current] = ADC1BUF8;
 current++;
 Measurements[current] = ADC1BUF9;
 current++;
 Measurements[current] = ADC1BUFA;
 current++;
 Measurements[current] = ADC1BUFB;
 current++;
 Measurements[current] = ADC1BUFC;
 current++;
 Measurements[current] = ADC1BUFD;
 current++;
 Measurements[current] = ADC1BUFE;
 current++;
 Measurements[current] = ADC1BUFF;
 current++;
 } else {
 AD1CON1.B15=0;
 ADC_done=1;
 }
}
void InitDataSend(){
 UART2_Init(256000);
}
void SendData(){
 char txt[7];
 int i,j;
 for(i=0; i< 16000 ;){
#line 153 "C:/Users/acer/Desktop/Nouveau dossier/ultrazvuk+gtqph.c"
 inttostr(measurements[i+1], txt);
 i+=4;
 UART2_Write_Text(txt);
 UART2_Write(' ');
 UART2_Write(13);
 UART2_Write(10);
 }
}
void main() {
 TRISA2_bit = 0;
 LATA2_bit = -1;
 TRISA3_bit = 0;
 LATA3_bit = 0;
 InitTimer1();
 InitTimer3();
 EnableInterrupts();
 InitADC();
 InitDataSend();
 SampleADC();
 SendData();
}
