	.intel_syntax noprefix
	.arch i386
#===================================================
.text
	.global	find_x

.type find_x, @function
.func find_x
# int find_x(int array[], int n, int x);
find_x:
	enter 0, 0
	push ebx

	mov ecx, [ebp + 12]		# ecx = n
	dec ecx				# ecx--
	mov edx, [ebp + 16]		# edx = x
	mov eax, [ebp + 8]		# eax = &array

	cmp ecx, 0			# if n <= 0 goto exit
	jl 2f

1:	mov ebx, [eax + 4*ecx]
	cmp edx, ebx
	je 2f
	loop 1b

2:	mov eax, ecx
	pop ebx	
	leave
	ret

.endfunc
.end

