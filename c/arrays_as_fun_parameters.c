#include <stdio.h>
#include <stdlib.h>
// arrays are treated in function parameters like pointers  int* arrParam               
void printSize(int arrParam[345]) {
  
  printf("size of arr in function = %lu\n",sizeof(arrParam));
  
  }
  
int  main(int argc, char* argv[]) {

  //int *num ;
  int arr[5] = {1,2,3,4,5};    // sizeof operator in bytes 4 * 5
  printf("size of arr = %lu\n",sizeof(arr));
  
  printSize(arr); // arr -> int* 
  //printf("%d\n",arr[0]);
  


























  return 0;
  
}
