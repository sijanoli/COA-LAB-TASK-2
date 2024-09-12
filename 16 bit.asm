org 100h 
num1 dw 1892h 
num2 dw 4562h 
start: 
mov ax, [num1] 
add ax, [num2] 
mov bx, ax 
mov ah, 0 
mov al, ah 
call print_hex 
mov al, bl 
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
mov al, ah 
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