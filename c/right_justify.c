#include <stdio.h>
#include "tc.h"

float sum(float mbank, float tipsport, float bank_notes, float coins, float care_benefit);

int main() {

 float mbank = 72.06, tipsport = 0.80,bank_notes = 185.00, coins=13.30, care_benefit=508.44; 
 float addition = 0.00;
 addition = sum(mbank,tipsport,bank_notes,coins,care_benefit);  
 
  //tc_echo_off();
  tc_enter_alt_screen();
  tc_clear_screen();
  tc_move_cursor(0,0);
  
  //fprintf(stdout, "%s%sEnter the number: %s ",TC_WHT,TC_BG_CYN,TC_NRM);

  int a = 2, b = 23, c = 100, d = 4000, e = 58763, f = 670000, choice;

    printf("Enter one of the 7 options\n\n");
    printf("1. Enter a: \n");
    printf("2. Enter b: \n");
    printf("3. Enter c: \n");
    printf("4. Enter d: \n");
    printf("5. Enter e: \n");
    printf("6. Enter f: \n");
    printf("7. Exit\n\n");
   
  do {
    printf("Choice: ");
    scanf(" %d",&choice);
    puts("");

  } while ( ! (choice == 7 || choice == 0 || choice >= 8 || choice < 0 ) );
 
  /* right justified %6d
       2
       
      23
     123
    4000
   34567
  670000 */
    
  printf("%s%6d %s\n",TC_GRN, a,TC_NRM);
  printf("%s%6d %s\n",TC_GRN, b,TC_NRM);
  printf("%s%6d %s\n",TC_GRN, c,TC_NRM);
  printf("%s%6d %s\n",TC_GRN, d,TC_NRM);
  printf("%s%6d %s\n",TC_GRN, e,TC_NRM);
  printf("%s%6d %s\n",TC_GRN, f,TC_NRM);
  
  puts("");
  /*left justified  %-6d
  2
  23
  123
  4000
  34567
  670000 */

  printf("%s%-6d %s\n",TC_GRN, a,TC_NRM);
  printf("%s%-6d %s\n",TC_GRN, b,TC_NRM);
  printf("%s%-6d %s\n",TC_GRN, c,TC_NRM);
  printf("%s%-6d %s\n",TC_GRN, d,TC_NRM);
  printf("%s%-6d %s\n",TC_GRN, e,TC_NRM);
  printf("%s%-6d %s\n",TC_GRN, f,TC_NRM);
  








  
  char c2 = getchar();
  
  tc_exit_alt_screen();
  //tc_echo_on();
  
 
 




 
  return 0; 
}

float sum(float tipsport,float mbank, float bank_notes, float coins, float care_benefit) {
  float sum = 0.0;
  sum = mbank + tipsport + bank_notes + coins + care_benefit;  
  return sum;
}
