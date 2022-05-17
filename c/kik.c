#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <dirent.h>

int main (int argc, char **argv) {
    DIR *dirp;
    struct dirent *dp;

    dirp = opendir(".");
    if (!dirp) {
        perror("opendir()");
        exit(1);
    }

    while ((dp = readdir(dirp))) {
        puts(dp->d_name);
    }

    if (errno) {
        perror("readdir()");
        exit(1);
    }

    return 0;
}
