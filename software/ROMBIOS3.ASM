.MODEL SMALL

CODIGO SEGMENT 'Code'
   ASSUME CS:CODIGO, DS:CODIGO, ES:NOTHING, SS:NOTHING

   ORG 0F0100h

PROG PROC NEAR
   MOV DX,3C7h    ; Direccion del pto. de control del 8255 (A0=A1=1)
   MOV AL,0C2h    ; Grupo B = Modo 0, Puerto B = Input, PC2,0 = Salida
   OUT DX,AL      ; Programar 8255 

 WRITE:
   MOV DX,3C4h    ; Data Bus -> Port A
   MOV AL,41h     ; 'A'
   OUT DX,AL
   JMP WRITE
   
   ORG 0FFFF0h

 START:
   MOV AX,0F000h
   MOV CS,AX
   JMP PROG
PROG ENDP
CODIGO ENDS
   END PROG

