#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main() {

  int fd; char buf[14];
  fd = open("myfile.txt", O_CREAT | O_WRONLY, 0600 );
  if (fd == -1) {
    printf("failed to create connection %d\n",fd);
    exit(1);
  }

  
  write(fd,"Hello World!\n",13);
  /* read  */

  close(fd);
  
  fd = open("myfile.txt", O_CREAT | O_RDONLY);   
  if (fd == -1) {
    printf("failed to open and read the file %d\n",fd);
    exit(1);
  }

  read(fd, buf,13);
  buf[13] = '\0';
  
  close(fd);

  printf("buf: %s\n",buf);






























  return 0;
}
