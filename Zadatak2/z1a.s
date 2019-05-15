	.intel_syntax noprefix
	.arch i386
#=======================================================================
.data
i:
	.int 0

#=======================================================================
.text
	.global sort_array
	.type sort_array, @function
.func sort_array
sort_array:
	enter 0, 0
	push ebx
	push ecx		# &array
	push edx		# number of elements - n
	push esi

	mov esi, ecx
	lea eax, i		# eax = &i
	dec edx			# n--
	cmp edx, 0		# if one or 0 element in arrry
	jle 5f			# then exit
	mov [eax], edx		# &i = n

1:	lea ebx, i		# ebx = &i
	mov ecx, [ebx]		# ecx = n
	mov ebx, ecx		# ebx = n
	mov edx, [esi + 4*ebx]	# edx = array[i]
2:	dec ecx			# ecx--
	cmp ecx, 0		# if inner loop came to 0
	jle 3f			# then go and decrement outer loop counter
	mov eax, [esi + 4*ecx]	# eax = array[j]
	cmp eax, edx		
	jle 2b
	mov [esi + 4*ebx], eax	#veci eax je na ecx 
	mov [esi + 4*ecx], edx
	mov edx, eax
	jmp 2b
3:	dec ebx			#decrementing counter i
	cmp ebx, 1
	jle 5f
	lea edx, i
	mov [edx], ebx
	jmp 1b

5:	pop esi
	pop edx
	pop ecx
	pop ebx
	leave
	ret
.endfunc
.end
