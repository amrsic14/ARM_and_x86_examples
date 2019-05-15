.intel_syntax noprefix
.arch i386

.text
.global obrada

.type obrada, @function
.func obrada

obrada:
	enter 0, 0
	push ecx
	push edx
	push ebx
	
	mov ecx, [ebp - 8]
	cmp ecx, 0
	jle 1f

	mov ebx, [ebp - 4]
	mov edx, [ebx]
	mov eax, ebx

2:	cmp [eax], edx
	jl 3f
	jmp 4f

3:	mov edx, [eax]
	mov ebx, eax

4:	add eax, 4
	loop 2b

	mov eax, [ebp - 4]
	mov ecx, [eax]
	mov [ebx], ecx
	mov [eax], edx

1:	pop ebx	
	pop edx
	pop ecx
	
	leave
	ret 
.endfunc
.end
	
