	.intel_syntax noprefix
	.arch i386
#=======================================
.text
	.global obrada

	.type obrada, @function
.func obrada

obrada:
	enter 0, 0
	push ebx
	push esi
	
	mov ebx, [ebp + 8]
	cmp ebx, 0
	je 2f
	mov eax, 0

1:	cmp eax, ebx
	je 3f
	push [ecx + 4*eax]
	inc eax
	jmp 1b

3:	mov ebx, 0
4:	cmp eax, edx
	jge 5f
	mov esi, [ecx + 4*eax]
	mov [ecx + 4*ebx], esi
	inc ebx
	inc eax
	jmp 4b

5:	dec edx
	dec ebx
6:	cmp ebx, edx
	je 2f
	pop [ecx + 4*edx]
	dec edx
	jmp 6b

2:	pop esi
	pop ebx
	leave
	ret 4

.endfunc
.end
