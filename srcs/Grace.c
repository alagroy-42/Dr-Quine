#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
/*
	Comment
*/
#define WRITE(PREPRO, WR, MAINMACRO, FILENAME, CODE) int fd=open(FILENAME, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);dprintf(fd, PREPRO, 10, 10, 10, 10, 9, 10, 10);dprintf(fd, WR, 10);dprintf(fd, MAINMACRO, 10);dprintf(fd, CODE, 34, PREPRO, 34, 10, 34, WR, 34, 10, 34, FILENAME, 34, 10, 34, MAINMACRO, 34, 10, 34, CODE, 34, 10, 10);close(fd);
#define MAIN(PREPRO, WR, MAINMACRO, FILENAME, CODE) int main() { WRITE(PREPRO, WR, MAINMACRO, FILENAME, CODE); return(0); }
char *prepro="#include <fcntl.h>%c#include <unistd.h>%c#include <stdio.h>%c/*%c%cComment%c*/%c";
char *wr="#define WRITE(PREPRO, WR, MAINMACRO, FILENAME, CODE) int fd=open(FILENAME, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);dprintf(fd, PREPRO, 10, 10, 10, 10, 9, 10, 10);dprintf(fd, WR, 10);dprintf(fd, MAINMACRO, 10);dprintf(fd, CODE, 34, PREPRO, 34, 10, 34, WR, 34, 10, 34, FILENAME, 34, 10, 34, MAINMACRO, 34, 10, 34, CODE, 34, 10, 10);close(fd);%c";
char *filename="Grace_kid.c";
char *mainmacro="#define MAIN(PREPRO, WR, MAINMACRO, FILENAME, CODE) int main() { WRITE(PREPRO, WR, MAINMACRO, FILENAME, CODE); return(0); }%c";
char *code="char *prepro=%c%s%c;%cchar *wr=%c%s%c;%cchar *filename=%c%s%c;%cchar *mainmacro=%c%s%c;%cchar *code=%c%s%c;%cMAIN(prepro, wr, mainmacro, filename, code);%c";
MAIN(prepro, wr, mainmacro, filename, code);
