	.intel_syntax noprefix
	.arch i386
#=========================================================
.data

in_num_of_elements:
	.asciz "Input nuber of elements: \n"
in_elem_to_find:
	.asciz "Which element you want to find? \n"
in_format:
	.asciz "%i"
out_format:
	.asciz "Element is at position: %i\n"

#=========================================================
.text

	.extern printf
	.extern scanf
	.extern malloc
	.extern free
	.extern find_x
	.extern exit

	.global _start

_start:
	call main
	push 0
	call exit

	.type main, @function
.func main
main:
	enter 12, 0
	push ebx

	push offset in_num_of_elements
	call printf
	add esp, 4
	
	lea ebx, [ebp - 4]
	push ebx
	push offset in_format
	call scanf
	add esp, 8

	mov eax, [ebp - 4]
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov [ebp - 8], eax

	push [ebp - 4]
	push eax
	call init
	add esp, 8

	push offset in_elem_to_find
        call printf
        add esp, 4

	lea ebx, [ebp - 12]
	push ebx
	push offset in_format
        call scanf
        add esp, 8

	push [ebp - 12]
	push [ebp - 4]
	push [ebp - 8]
	call find_x
	add esp, 12

	push eax
	push offset out_format
	call printf
	add esp, 8
	
	push [ebp - 8]
	call free
	add esp, 4

	pop ebx
	leave
	ret

.endfunc

	.type init, @function
.func init
init:
	enter 0,0
	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	mov edx, 1
5:	mov [eax], edx
	inc edx
	add eax, 4
	loop 5b
	leave
	ret
.endfunc

.end
