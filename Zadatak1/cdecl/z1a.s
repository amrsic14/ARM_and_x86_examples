	.intel_syntax noprefix
	.arch i386

#==================================================================================================
.text
	.global obrada

obrada:
	enter 0, 0

	push ebx

	mov ebx, [ebp + 8]		# ebx = &niz
	mov ecx, [ebp + 12]		# ecx = n
	mov eax, [ebx]			# eax current minimum
	mov edx, ebx			# addres of minimum

	dec ecx				# n--
	jecxz 3f			# if there is only one element
	add ebx, 4			# move array pointer to next element

1:	cmp [ebx], eax			# compare curren element with minimum
	jge 2f				# jump on 2f if current element is greater or equal
	mov eax, [ebx]			# if first is lower set it as minimum 
	mov edx, ebx			# set it's addres
2:	add ebx, 4			# move pointer to next element
	loop 1b				# loop

3:	mov ecx, [ebp + 8]		# ecx = &niz
	mov ebx, [ecx]			# ebx = niz[0]
	mov [edx], ebx			# &min = ebx
	mov [ecx], eax			# niz[0] = min

	pop ebx
	leave
	ret
.end
