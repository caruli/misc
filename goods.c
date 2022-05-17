#include <stdio.h>
#include "tc.h"

float sum(float mbank, float tipsport, float bank_notes, float coins, float care_benefit,float debt);
float mbank = 3287.26, tipsport = 900.00,bank_notes = 65.23, coins=0.00, care_benefit= 00.00, debt=0.00;
int main() {
  //int x,y;
  //int row,col;
 
 float addition = 0.00;
 addition = sum(mbank,tipsport,bank_notes,coins,care_benefit,debt);  
 
  tc_echo_off();
  tc_enter_alt_screen();
  tc_clear_screen();
  tc_move_cursor(0,0);
  
  //fprintf(stdout, "%s%sEnter the number: %s ",TC_WHT,TC_BG_CYN,TC_NRM);

  printf("%13s %s%8.2f %s\n","Mbank:",TC_GRN, mbank,TC_NRM);
  printf("%13s %s%8.2f %s\n","Tipsport:",TC_GRN, tipsport,TC_NRM);
  printf("%13s %s%8.2f %s\n","Bank notes:",TC_GRN, bank_notes,TC_NRM);
  printf("%13s %s%8.2f %s\n","Coins:",TC_GRN, coins,TC_NRM);
  printf("%13s %s%8.2f %s\n","Care benefit:",TC_GRN, care_benefit,TC_NRM);
  printf("%13s %s%8.2f %s\n","Debt:",TC_RED, debt,TC_NRM);
  puts("");
  printf("%13s %s%8.2f %s\n","Sum:",TC_GRN,addition,TC_NRM);
  puts("");
  
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

float sum(float tipsport,float mbank, float bank_notes, float coins, float care_benefit,float debt) {
  float sum = 0.0;
  sum = mbank + tipsport + bank_notes + coins + care_benefit + debt;  
  return sum;
}
