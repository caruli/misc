#include <stdio.h>
#include "tc.h"

int main() {

  
  // printf("%s",TC_BG_WHT); //CYN, MAG 
  // one prompt default still visible to terminal for running programs.
  tc_clear_screen(); // clear screen before printf function previous prompt(s) cleared still one prompt for running program visible !! 
  tc_move_cursor(25,16); // x,y														    
  //printf("%s%sHello World!\n%s",TC_YEL,TC_BG_GRN,TC_NRM);
  // equivalent Unix standard input 1
  fprintf(stdout, "%s%sHello World\n%s",TC_WHT,TC_BG_CYN,TC_NRM);
  












  return 0;

}