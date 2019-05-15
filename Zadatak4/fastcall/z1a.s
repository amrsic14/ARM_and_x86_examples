	.intel_syntax noprefix
	.arch i386
#===========================================================
.text
	.global index_of_x

.type index_of_x, @function
.func index_of_x
index_of_x:
	enter 0, 0
	push ebx

	mov ebx, [ebp + 8]		# ebx = X
	mov eax, 0			# index

1:	cmp eax, edx			# compare i and N
	jge 2f
	cmp ebx, [ecx + 4*eax]
	jz 2f
	inc eax
	jmp 1b

2:	pop ebx
	leave
	ret 4
.endfunc
.end
