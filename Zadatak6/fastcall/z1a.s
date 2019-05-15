	.intel_syntax noprefix
	.arch i386
#=================================================
.text
	.global reverse

	.type reverse, @function
.func reverse
reverse:
	enter 0, 0
	push ebx
	push esi

	dec edx
	mov eax, 0

1:	cmp eax, edx
	jge 2f
	mov esi, [ecx + 4*edx]
	mov ebx, [ecx + 4*eax]
	mov [ecx + 4*edx], ebx
	mov [ecx + 4*eax], esi
	inc eax
	dec edx
	jmp 1b

2:	pop esi
	pop ebx
	leave
	ret
.endfunc
.end
