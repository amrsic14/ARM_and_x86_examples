	.intel_syntax noprefix
	.arch i386
#================================================================
.text
	.global remove_x

	.macro INCREMENT
		push eax
		mov eax, [ebp + 12]
		dec eax
		mov [ebp + 12], eax
		pop eax
	.endm

.type remove_x, @function
.func remove_x
remove_x:
	enter 0, 0

	push ebx		# saving non-scratch registers
	push esi
 
	mov ecx, 0		# iterator
	mov edx, 0		# input iterator
	mov ebx, [ebp + 8]	# &array
	mov eax, [ebp + 16]	# X
	
1:	cmp ecx, [ebp + 12]	# compare iterator and N
	jge 2f			# if i >= n goto exit (label 2) 
	cmp eax, [ebx + 4*ecx] 	# compare X and array[i]
	jne 3f

	mov edx, ecx
	inc edx
	push ecx
4:	cmp edx, [ebp + 12] 	# compare j and N
	jge 5f
	mov esi, [ebx + 4*edx]
	mov [ebx + 4*ecx], esi
	inc edx
	inc ecx
	jmp 4b
	
5:	pop ecx
	dec ecx
	INCREMENT
3:	inc ecx
	jmp 1b

2:	mov eax, [ebp + 12]
	pop esi
	pop ebx
	leave
	ret 12
.endfunc
.end
