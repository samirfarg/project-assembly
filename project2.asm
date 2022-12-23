.MODEL SMALL        
.DATA
var1 db  21  DUP ('$')
msg1 db 'hello my dear''$'
msg2 DB 'telL me how we can help you choices number of servise''$'
msg3 DB 'i am fine''$'
msg4 db 'Father to son after exam: let me see your report card. Son: My friend just borrowed it. He wants to scare his parents''$'
msg5 db 'study hard today to be the person you wish to be tomorrow''$'
msg6 DB 'No thanks for duty see you again''$'

msg7 DB '[1] How are you?''$'
msg8 DB '[2] give me advice''$'
msg9 DB '[3] tell me ajoke''$'
msg10 DB'[4]thank you''$'

.CODE

MAIN PROC FAR

.STARTUP

 lea  dx,msg1
 mov ah,09h
 int 21h
 CALL NEWLINE 
 CALL DRH
  
 lea dx,msg2
 mov ah,09h
 int 21h
 CALL NEWLINE

 lea  dx,msg7
 mov ah,09h
 int 21h
 CALL NEWLINE
 
 lea  dx,msg8
 mov ah,09h
 int 21h
 CALL NEWLINE
 
 lea  dx,msg9
 mov ah,09h
 int 21h
 CALL NEWLINE
 
  lea  dx,msg10
 mov ah,09h
 int 21h
 CALL GETCHAR
 
lable1:
call NEWLINE
lea dx,msg3
mov ah,09h
int 21h

call NEWLINE
CALL GETCHAR

lable2:
call NEWLINE
lea dx,msg4
mov ah,09h
int 21h

call NEWLINE
CALL GETCHAR

lable3:
call NEWLINE
lea dx,msg5
mov ah,09h
int 21h

call NEWLINE
CALL GETCHAR

lable4:
call NEWLINE
lea dx,msg6
mov ah,09h
int 21h

call NEWLINE
CALL GETCHAR

STOP:
.EXIT

DRH PROC NEAR
    LEA si, var1
    L1:
    MOV AH,01H
    INT 21H
    CMP AL,13
    JE PROGRAMENT
    MOV [SI],AL
    INC SI
    JMP L1
PROGRAMENT:
     MOV DX,OFFSET VAR1 
     lea dx,msg2
     mov ah,01h
     int 16h
     MOV dl, 10h
     RET
     ENDP DRH

  NEWLINE PROC NEAR
MOV dl, 10
MOV ah, 02h
INT 21h

RET
ENDP NEWLINE 
 
GETCHAR PROC NEAR
call  NEWLINE
 mov ah,01h
 int 21h

 mov dl,'1'
 cmp al,dl
JE lable1
 
mov dl,'2'
cmp aL,dl
JE lable3

mov dl,'3'
cmp aL,dl
JE lable2

mov dl,'4'
cmp aL,dl
JE lable4

JMP STOP
RET
ENDP GETCHAR
MAIN ENDP
END MAIN