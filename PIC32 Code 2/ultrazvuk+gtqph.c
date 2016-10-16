#define SAMPLE_COUNT 16000
#define CHANNELS 1 | 2 | 4 | 8
// 1 | 2 | 4 | 8 means channel 1or 2 or 4 or 8 because
// 1 = 0b0000 0000 0000 0001 (also tells A0 which is RB0); 2 = 0b0000 0000 0000 0010 (also tells A1 RB1); 
// 4 = 0b0000 0000 0000 0100(also tells A2 RB2); 8 = 0b0000 0000 0000 1000 (also tells A1=3 RB3);
// There have to be a multiple of 16 number of channels, for examle 4
// However, we wont be using the fourth channel because we only have 3 inputs
// Together, 0b0000 0000 0000 1111; or 0b000F
#define CHANNEL_CNT 4
#if 16 % CHANNEL_CNT
      #error "16 should be a multiple of channel count"
#endif
unsigned int Measurements[SAMPLE_COUNT];
unsigned int current;
volatile char ADC_Done;

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON         = 0x8000;
  T1IP0_bit         = 1;
  T1IP1_bit         = 1;
  T1IP2_bit         = 1;
  T1IF_bit         = 0;
  T1IE_bit         = 1;
  PR1             = 1000;
  TMR1                 = 0;
}
void InitTimer3(){
  T3CON                 = 0x8000;
  PR3                 = 320;
  TMR3                 = 0;
}


void InitADC(){
   AD1CON1.B15 = 0;  //Turn ADC off

   TRISB0_bit = 1;
   TRISB1_bit = 1;
   TRISB4_bit = 1;
   AD1PCFG = ~(CHANNELS);

   FORM0_bit = 0;
   FORM1_bit = 0;
   FORM2_bit = 0;   //16-bit integer format

   SSRC0_bit = 0;
   SSRC1_bit = 1;
   SSRC2_bit = 0;   //Conversion trigger source Timer3

   CLRASAM_bit = 0; //Don't stop converting

   ASAM_bit = 1;    //Start sampling immediately

   CSCNA_bit = 1;   //Scan inputs

   VCFG0_bit = 0;
   VCFG1_bit = 0;
   VCFG2_bit = 0;     //AVdd and AVss voltage reference pins

   CH0NA_bit = 0;     //Mux negative input is Vr-

   ALTS_bit = 0;      //Always use MUXA settings

   ADRC_bit = 1;      //Use ADC Internal RC oscillator

   SMPI0_bit = 1;
   SMPI1_bit = 1;
   SMPI2_bit = 1;
   SMPI3_bit = 1;   //Interrupts at completion of 16th convert

   BUFM_bit = 0;    //16-word buffer

   ALTS_bit = 0;    //Use MUX A

   AD1CSSL = CHANNELS;  //Scan inputs 0,1,2,4

   InitTimer3();    //Initialize timer

   AD1IP0_bit = 1;
   AD1IP1_bit = 1;
   AD1IP2_bit = 1;

   AD1IF_bit = 0;
   AD1IE_bit = 1;   //Configure interrupts


}

void SampleADC(){
   current = 0;
   ADC_Done = 0;
   AD1CON1.B15 = 1;
   while(!ADC_done);
}
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
      T1IF_bit         = 0;
      LATA2_bit = ~LATA2_bit;
      LATA3_bit = ~LATA3_bit;
}
void ADC_complete() iv IVT_ADC ilevel 7 ics ICS_SRS {
   AD1IF_bit=0;                    //Reset interrupt flag
   if(current+15<SAMPLE_COUNT){    //Copy data
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
     AD1CON1.B15=0;         //Turn A/D converter OFF
     ADC_done=1;
   }
}
void InitDataSend(){
     UART2_Init(256000);
}
void SendData(){
     char txt[7];
     int i,j;
     for(i=0; i<SAMPLE_COUNT;){ //Send all channels in single row
      /*for(j=0; j<CHANNEL_CNT; j++){
        inttostr(measurements[i++], txt);
        UART2_Write_Text(txt);
        UART2_Write(' ');
      }*/
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