#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
int main() {
char *prepro="#include <stdio.h>%c#include <stdlib.h>%c#include <fcntl.h>%c#include <unistd.h>%cint main() {%c";
char *decl="char *prepro=%c%s%c;%cchar *decl=%c%s%c;%cchar *code=%c%s%c;%cint i=%d;%cchar filename[]=%c%s%c;%cchar filefakename[]=%c%s%c;%cchar command[]=%c%s%c;%cchar exec[]=%c%s%c;%c";
char *code="i--;%cfilename[6]=i+48;%cint fd=open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);%cdprintf(fd, prepro, 10, 10, 10, 10, 10, 10);%cdprintf(fd, decl, 34, prepro, 34, 10, 34, decl, 34, 10, 34, code, 34, 10, i, 10, 34, filefakename, 34, 10, 34, filefakename, 34, 10, 34, command, 34, 10, 34, exec, 34, 10);%cdprintf(fd, code, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10);%cclose(fd);%cexec[8]=i+48;%ccommand[34]=i+48;%ccommand[47]=i+48;%csystem(command);%cif (!i)%c%creturn (0);%cexecvp(exec, NULL);%creturn (0);%c}%c";
int i=5;
char filename[]="Sully_X.c";
char filefakename[]="Sully_X.c";
char command[]="clang -Wall -Werror -Wextra Sully_X.c -o Sully_X";
char exec[]="./Sully_X";
i--;
filename[6]=i+48;
int fd=open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
dprintf(fd, prepro, 10, 10, 10, 10, 10, 10);
dprintf(fd, decl, 34, prepro, 34, 10, 34, decl, 34, 10, 34, code, 34, 10, i, 10, 34, filefakename, 34, 10, 34, filefakename, 34, 10, 34, command, 34, 10, 34, exec, 34, 10);
dprintf(fd, code, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10);
close(fd);
exec[8]=i+48;
command[34]=i+48;
command[47]=i+48;
system(command);
if (!i)
	return (0);
execvp(exec, NULL);
return (0);
}
