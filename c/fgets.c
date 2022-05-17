#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char text[100]; 

  printf("type a line of text here: ");
  // fgets function saved into text that we typed also  enter '\n' new line character
  fgets(text,100,stdin);

  for(int i= 0; i <= strlen(text); i++) {
    printf("%d ", text[i]);
  }
  
  puts("");
  printf("You typed the line: %s %d", text,strlen(text));

  //puts("");
  printf("type a line of text here: ");
  // fgets function saved into text that we typed also  enter '\n' new line character
  fgets(text,100,stdin);

  //                                                      aaa\n             4  -  1  = 3
  // replace/remove  the backslash \n from variable text  aaa text[strlen(text) - 1] = '\0' ;
  text[strlen(text) - 1] = '\0' ;

  for(int i= 0; i <= strlen(text); i++) {
    printf("%d ", text[i]);
  }
 
  
  puts("");
  printf("You typed the line: %s %d\n", text,strlen(text));

  




























  return 0;
}
