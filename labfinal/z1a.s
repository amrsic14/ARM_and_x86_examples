	.intel_syntax noprefix
	.arch i386
#============================================
.text
	.global obrada
	.type obrada, @function

.func obrada
# void obrada(int niz[], int n);
obrada:
	enter 0, 0

	push ebx
	push esi

	mov eax, [ebp + 8]		# eax = &niz
	mov ebx, [ebp + 12]		# ebx = n
	mov ecx, 0			# ecx = i = 0 iterator

	#selection sort
	#spoljna petlja, iterira do i < n-1
	dec ebx
1:	cmp ecx, ebx
	jge 2f				# if i >= n return

	#unutrasnja petlja
	mov edx, ecx
	inc edx				# edx = j = i+1 iterator
3:	cmp edx, ebx
	jg 4f

	mov esi, [eax + 4*edx]		# esi = niz[j]
	cmp [eax + 4*ecx], esi
	jg 5f				# if niz[i] > niz[j] skip; else swap

	#swap
	push ebx
	mov ebx, [eax + 4*ecx]
	mov [eax + 4*ecx], esi
	mov [eax + 4*edx], ebx
	pop ebx

5:	inc edx
	jmp 3b

	#kraj unutrasnje petlje
4:	inc ecx
	jmp 1b
	#kraj spoljasnje petlje

2:	pop esi
	pop ebx
	leave
	ret 8

.endfunc
.end
