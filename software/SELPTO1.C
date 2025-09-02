#include <stdio.h>
#include <dos.h>
#include <conio.h>

int data;
char c = '\0';

void main(void)
{
   clrscr();

   c = getch();
   while (c != 'T') {
      outportb(0x301,'T');

      do {
         data = inportb(0x300);
      } while (data != 'R');

      outportb(0x301,c);
      delay(1);
      data = inportb(0x300);

      printf("%c",data);
      c = getch();
   }
}
