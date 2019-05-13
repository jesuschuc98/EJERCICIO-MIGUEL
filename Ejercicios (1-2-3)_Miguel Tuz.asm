
; LENGUAJES Y AUTOMATAS II
; ELABORADO POR:MIGUEL TUZ CAHUM
; FECHA:13/05/2019
; EJERCICIOS

.MODEL SMALL 

 
name: " PROTOTIPO FINAL"
org 100h ; inicio de programa
 
include 'emu8086.inc' ;Incluye funciones de libreria emu8086  

    
    
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS 

jmp inicio 
 

      db 13,10, '******MENU******',13,10,
      db 13,10,'1 Suma de dos numeros ',13,10,
      db 13,10,'2 Resta de dos numeros ' ,13,10,
      db 13,10,'3 Multiplicacion de dos numeros ',13,10,
      db 13,10,'4 Division de dos numero',13,10,                         
      db 13,10,'5 Validar numeros negativos y positivos',13,10,
      db 13,10,'6 Salir ' ,13,10,  
      
 
 
 
texto1 db 'Escribe el Num# 1: $' 
texto2 db 'Escribe el Num# 2: $'
texto3 db 'La Suma Es: $' 
texto4 db 'La Resta Es: $' 
texto5 db 'La Multiplicacion Es: $' 
texto6 db 'La Divison es: $'  
                                  
C1 DB 'OPERACIONES ARITMETICAS','$'
num1 dw ? ;defino variables de 2 bytes
num2 dw ? ; el simbolo ? es para indicar q no se inicilizan con valor algunp
 
R1 DB 'REGRESAR CON LA TECLA <--' ,'$'
.DATA 



    mj1 db "MENU DE EJERCICIO","$"
    mj2 db "[1] OPERACIONES ARITMETICAS","$"
    mj3 db "[2] NUMERO> MAYOR","$"
    mj6 db "SELECCIONE UNA OPCION:","$" 
    
    
    msj1 db 'Ingrese Tres digito del 0 al 9 : ', '$'
    msj2 db 'Ingrese el Num # 1: ', '$'
    msj3 db 'Ingrese el Num # 2: ','$'
    msj4 db 'Ingrese el Num # 3: ', '$'
    Mayor db 'El Numero Mayor Es: ', '$'

    Digito1 db 100 dup('$')
    Digito2 db 100 dup('$')
    Digito3 db 100 dup('$')

    salto db 13,10,'',13,10,'$' ;salto de linea 

.CODE 
     
     MOV AX,@DATA
     MOV DS,AX  
      
     inicio:
     
     
     MOV AX,0600H   
     MOV BH,04FH   
     MOV CX,0000H                                   
     MOV DX,184FH
     INT 10H
     

;    ------------

   

;    ------------   ( FONDO NEGRO )
     
     MOV AX,0600H   
     MOV BH,0FH   
     MOV CX,040AH                                   
     MOV DX,0446H
     INT 10H  
;    ------------   ( FONDO AZUL )     
     
     MOV AX,0600H   
     MOV BH,06FH   
     MOV CX,060AH                                   
     MOV DX,0F46H
     INT 10H
     
     

;    ------------  CURSOR MJ1
     
     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,04H
     MOV DL,20H
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj1
     INT 21H 
     
;    ------------  CURSOR MJ2
     
     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,07H
     MOV DL,0DH
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj2
     INT 21H 

;    ------------  CURSOR MJ3 

     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,0AH
     MOV DL,0DH
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj3
     INT 21H
     
;    ------------  CURSOR MJ6  

     MOV AH,02H
     MOV BH,0   ;   
     MOV DH,11H
     MOV DL,30H
     INT 10H 
  
     
     MOV AH,09H
     LEA DX,mj6
     INT 21H 
     

     
     
;----------------------------


     MOV AH,0H
     INT 16H   
     
     CMP AL,49
     JE SUMA
     
     CMP AL,50
     JE RESTA 

     
     fin:
     mov ax,4c00h       ;funcion que termina el programa
     int 21h
     
     SUMA:
     
     MOV AH,05H
     MOV AL,0
     INT 10H
     
        MOV AX,0600H
     MOV BH,04FH
     MOV CX,0000H
     MOV DX,1950H
     INT 10H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,050AH
     MOV DX,0546H
     INT 10H 
     
     MOV AH,02H
     MOV BH,0
     MOV DX,051EH
     INT 10H 
     
     MOV AH,09H
     LEA DX,C1
     INT 21H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,070AH
     MOV DX,0728H
     INT 10H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,090AH
     MOV DX,0928H
     INT 10H
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,0C0AH
     MOV DX,1246H
     INT 10H

     mov ah,02h
     mov bh,0
     mov dx,070bh
     int 10h
     mov ah,09 ;interrupcion para imprimir en pantalla
     lea dx,texto1 ;carga cadena de texto 2 en dx 
     int 21h
 
     call SCAN_NUM ;Llama Funcion SCAN_NUM que toma numero de teclado; el valor se guarda en ax 
     mov num1,cx ;mueve numero a variable num1 
     
     mov ah,02h
     mov bh,0
     mov dx,090bh
     int 10h
 
     mov ah,09 ;interrupcion para imprimir en pantalla
     lea dx,texto2 ;carga cadena de texto 2 en dx 
     int 21h 
 
     call SCAN_NUM ;Llama Funcion SCAN_NUM que toma numero de teclado; el valor se guarda en ax 
     mov num2,cx ;mueve numero a variable num2 
 
     mov ah,02h
     mov bh,0
     mov dx,0c0ch
     int 10h
    
     mov ah,09 
     lea dx,texto3
     int 21h 
 
     mov ax,num1 ;mueve primer numero digitado a ax
     add ax,num2 ;suma los numeros digitado, queda almacenaddo en ax 
     call PRINT_NUM
     
     mov ah,02h
     mov bh,0
     mov dx,0e0ch
     int 10h 
 
     mov ah,09 
     lea dx,texto4
     int 21h 
     mov ax,num1 ;mueve primer numero digitado a ax
     sub ax,num2 ;resta el 2do del 1er numero, queda almacenaddo en ax 
     call PRINT_NUM 
 
     mov ah,02h
     mov bh,0
     mov dx,100ch
     int 10h 
 
     mov ah,09 
     lea dx,texto5
     int 21h 
     mov ax,num1 ;mueve primer numero digitado a ax 
     mov bx,num2 ;mueve segundo numero digitado a bx
     mul bx ;ax = ax*bx
     call PRINT_NUM
     
     mov ah,02h
     mov bh,0
     mov dx,120ch
     int 10h  
 
mov ah,09 
lea dx,texto6
int 21h 
xor dx,dx ;deja en cero dx; si no lo hago se desborda la division
;DX ALMACENA EL modulo de la division, por eso hay q dejarlo en cero
mov ax,num1 ;mueve primer numero digitado a ax 
mov bx,num2 ;mueve segundo numero digitado a bx
div bx ;ax = ax*bx
call PRINT_NUM  
 
cmp bl,0
     
     ;------PONER EL MENSAJE DE VOLVER 
     
     MOV AH,02H
     MOV BH,0
     MOV DX,132DH
     INT 10H
     
     MOV AH,09H
     LEA DX,R1
     INT 21H
     
     MOV AH,0H
     INT 16H
     
     CMP AL,08
     JE inicio 
     
     JMP fin
     
     
     RESTA:
     
     MOV AH,05H
     MOV AL,0
     INT 10H

mov si,0
mov ax,@data
mov ds,ax

     MOV AX,0600H
     MOV BH,04FH
     MOV CX,0000H
     MOV DX,1950H
     INT 10H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,050AH
     MOV DX,0546H
     INT 10H
     
     MOV AH,02H
     MOV BH,0
     MOV DX,0518H
     INT 10H 
     
     MOV AH,09H
     LEA DX,msj1
     INT 21H  
 
call saltodelinea;llamamos el metodo saltodelinea.

     MOV AX,0600H
     MOV BH,0FH
     MOV CX,070AH
     MOV DX,0728H
     INT 10H
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,090AH
     MOV DX,0928H
     INT 10H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,0B0AH
     MOV DX,0B28H
     INT 10H 
     
     MOV AX,0600H
     MOV BH,0FH
     MOV CX,0D0AH
     MOV DX,0F46H
     INT 10H
     
     MOV AH,02H
     MOV BH,0
     MOV DX,070CH
     INT 10H

     MOV AH,09H
     LEA DX,MSJ2
     INT 21H

call pedircaracter ;llamamos al metodo

mov Digito1,al ;lo guardado en AL a digito1

call saltodelinea

     MOV AH,02H
     MOV BH,0
     MOV DX,090CH
     INT 10H
                  
     MOV AH,09H
     LEA DX,MSJ3
     INT 21H                  
                  
call pedircaracter

mov Digito2,al

call saltodelinea

     MOV AH,02H
     MOV BH,0
     MOV DX,0B0CH
     INT 10H

     MOV AH,09H
     LEA DX,MSJ4
     INT 21H 

call pedircaracter

mov Digito3,al

call saltodelinea

;*******************************COMPARAR*****************************************

mov ah,digito1
mov al,digito2
cmp ah,al ;compara primero con el segundo
ja compara-1-3 ;si es mayor el primero, ahora lo compara con el tercero
jmp compara-2-3 ;si el primero no es mayor,ahora compara el 2 y 3 digito
compara-1-3:
mov al,digito3 ;ah=primer digito, al=tercer digito
cmp ah,al ;compara primero con tercero
ja mayor1 ;si es mayor que el tercero, entonces el primero es mayor que los 3

compara-2-3:
mov ah,digito2
mov al,digito3
cmp ah,al ;compara 2 y 3, YA NO es necesario compararlo con el 1,porque ya sabemos que el 1 no es mayor que el 2
ja mayor2 ;Si es mayor el 2,nos vamos al metodo para imprimirlo
jmp mayor3 ;Si el 2 no es mayor, obvio el 3 es el mayor

 
mayor1:

call MensajeMayor ;llama al metodo que dice: El digito mayor es:



mov dx, offset Digito1 ;Imprir El Digito 1 es mayor
mov ah, 9
int 21h
jmp exit

mayor2:
call MensajeMayor

mov dx, offset Digito2 ;Salto de linea
mov ah, 9
int 21h
jmp exit

mayor3:
call MensajeMayor

mov dx, offset Digito3 ;Salto de linea
mov ah, 9
int 21h
jmp exit

;********************************METODOS*****************************************

MensajeMayor: 

     MOV AH,02H
     MOV BH,0
     MOV DX,0E0CH
     INT 10H
     
mov dx, offset Mayor ;El digito Mayor es:
mov ah, 9
int 21h 


ret


;

pedircaracter:
mov ah,01h; pedimos primer digito
int 21h


ret

saltodelinea:
mov dx, offset salto ;Salto de linea
mov ah, 9
int 21h
ret

exit:

     
     MOV AH,02H
     MOV BH,0
     MOV DX,102DH
     INT 10H
     
     MOV AH,09H
     LEA DX,R1
     INT 21H
      
     MOV AH,0H
     INT 16H
     
     CMP AL,08
     JE inicio 

     JMP fin    
     
      
     
     ;MOV AH,4CH
     ;INT 21H        
    

END