.MODEL SMALL

DATOS SEGMENT AT 0000 'Data'
   Var1 DB 'L'
   Var2 DB 'V'
DATOS ENDS

CODIGO SEGMENT 'Code'
   ASSUME CS:CODIGO, DS:DATOS, ES:NOTHING, SS:NOTHING

   ORG 0F0100h

PROG PROC NEAR
   XOR AX,AX
   XOR BX,BX
   MOV DS,AX


   MOV DX,3C7h    ; Direccion del pto. de control del 8255 (A0=A1=1)
   MOV AL,8Ah     ; Modo 0, Pto. A = Salida, Pto. B = Entrada, PC03 = Salida, PC47 = Entrada
   OUT DX,AL      ; Programar 8255

 CICLO:
   MOV DX,3C5h    ; Port B -> Data Bus

 LEE1:
   IN  AL,DX
   CMP AL,'T'
   JNE LEE1

   MOV AL,'R'
   MOV DX,3C4h
   OUT DX,AL

   MOV DX,3C5h

 LEE2:
   IN  AL,DX
   CMP AL,'T'
   JE LEE2
   
   MOV Var1,AL

   MOV DX,3C4h
   MOV AL,Var1
   OUT DX,AL

   JMP CICLO

   ORG 0FFFF0h

 START:
   MOV AX,0F000h
   MOV CS,AX
   JMP PROG
PROG ENDP
CODIGO ENDS
   END PROG

