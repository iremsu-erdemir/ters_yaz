;Girilen bir diziyi tersten yazdırma.
islem segment
ana proc far
assume cs:islem,ds:islem
mov ax,0
push ds ax
mov ax,islem
mov ds,ax
jmp basla
m1 db 10,13,'Bir dizi giriniz     :$'
m2 db 10,13,'Girilen dizinin tersi:$'
dizi db 100 dup('$')
sayac dw 0

basla: 	mov ah,09h
	lea dx,m1
	int 21h

	lea bx,dizi  
		
dizi_al:mov ah,01h
	int 21h
	cmp al,13
	je ters
	mov [bx],al
	inc sayac
	inc bx
	jmp dizi_al

ters:	mov ah,09h
	lea dx,m2
	int 21h

	mov cx,sayac
	
	lea bx,dizi
	dec sayac
	add bx,sayac 
	
ters_goster: 
	mov ah,02h
	mov dl,[bx]
	int 21h
	dec bx
	loop ters_goster

ret 
ana endp
islem ends
end

	
	
	




	
