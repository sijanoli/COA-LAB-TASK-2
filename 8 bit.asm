org 100h 
num1 db 50h 
num2 db 20h 
start: 
mov al, [num1] 
add al, [num2] 
mov bl, al 
call print_hex 
mov ah, 4Ch 
int 21h 
print_hex: 
mov ah, al 
and al, 0F0h 
shr al, 4 
add al, '0' 
cmp al, '9' 
jbe print_hex_low 
add al, 7 
print_hex_low: 
mov dl, al 
mov ah, 02h 
int 21h 
mov al, bl 
and al, 0Fh 
add al, '0' 
cmp al, '9' 
jbe print_hex_done 
add al, 7 
print_hex_done: 
mov dl, al 
mov ah, 02h 
int 21h 
ret 