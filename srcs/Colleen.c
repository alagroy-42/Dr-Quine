#include <stdio.h>
/*
	First Comment
*/
void display(char *s, char *disp, char *main)
{
	printf(s, 10, 10, 9, 10, 10);
	printf(disp, 10, 10, 9, 10, 9, 10, 9, 10, 10);
	printf(main, 10, 10, 9, 34, s, 34, 10, 9, 34, disp, 34, 10, 9, 34, main, 34, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10);
}
int main()
{
	char *s="#include <stdio.h>%c/*%c%cFirst Comment%c*/%c";
	char *disp="void display(char *s, char *disp, char *main)%c{%c%cprintf(s, 10, 10, 9, 10, 10);%c%cprintf(disp, 10, 10, 9, 10, 9, 10, 9, 10, 10);%c%cprintf(main, 10, 10, 9, 34, s, 34, 10, 9, 34, disp, 34, 10, 9, 34, main, 34, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10);%c}%c";
	char *main="int main()%c{%c%cchar *s=%c%s%c;%c%cchar *disp=%c%s%c;%c%cchar *main=%c%s%c;%c%c/*%c%c%cSecond Comment%c%c*/%c%cdisplay(s, disp, main);%c}%c";
	/*
		Second Comment
	*/
	display(s, disp, main);
}
