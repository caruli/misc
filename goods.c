#include <stdio.h>
#include "tc.h"

float sum(float tipsport,float mbank, float bank_notes, float coins, float care_benefit);

const  float mbank = 47.11, tipsport = 0.80, bank_notes = 115.00, coins=10.30, care_benefit=508.44;

int main() {

  //int x,y;
  //int row,col;

 float addition = 0.00;
 addition = sum(mbank,tipsport,bank_notes,coins,care_benefit);  
 
  tc_echo_off();
  tc_enter_alt_screen();
  tc_clear_screen();
  tc_move_cursor(0,0);
  
  //fprintf(stdout, "%s%sEnter the number: %s ",TC_WHT,TC_BG_CYN,TC_NRM);
  printf("       Mbank: %s   %2.2f %s\n",TC_GRN,mbank,TC_NRM); 
  printf("    Tipsport: %s    %2.2f %s\n",TC_GRN,tipsport,TC_NRM);
  printf("  Bank notes: %s   %7.2f %s\n",  TC_GRN,bank_notes,TC_NRM);
  printf("       Coins: %s   %7.2f %s\n",  TC_GRN,coins,TC_NRM);
  printf("Care benefit: %s   %7.2f %s\n",  TC_GRN,care_benefit,TC_NRM);
  puts("");
  printf("         Sum: %s   %7.2f %s",  TC_GRN,addition,TC_NRM);
  /* printf("%s%sMbank:%s %035.2f\n",TC_WHT,TC_BG_CYN,TC_NRM,1662.53); */
  /* printf("%s%sTipsport:%s %035.2f\n",TC_WHT,TC_BG_CYN,TC_NRM,1502.36); */
  /* printf("%s%sBank notes:%s %035.2f",TC_WHT,TC_BG_CYN,TC_NRM,40.36); */
  
  /* fprintf(stdout, "%sHello World!\n%s",TC_GRN,TC_NRM); */
  // outer for loop x for rows, lines
  //tc_echo_on();
  
  /* for ( row = 0; row < 26; row++) { */
 /*    // inner for loop y for columns */
 /*    for ( col = 0; col < 104 */
 /* 	    ; col++) */
 /*      printf(":"); */
 /*    // new line character    */
 /*  printf("\n"); */
 /* } */

  //puts("");
  
  /* for ( x = 0; x  < 8; x++,printf("\n"))  // printf("\n")) */
  /*   // inner for loop */
  /*   for ( y = 0; y < 3; y++) */
  /*     printf("X"); */


  
  char c = getchar();
  tc_exit_alt_screen();
  tc_echo_on();
  
  





 
  return 0; 
}

float sum(float tipsport,float mbank, float bank_notes, float coins, float care_benefit) {
  float sum = 0.00;
  sum = mbank + tipsport + bank_notes + coins + care_benefit;  
  return sum;
}
