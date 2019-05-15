	.extern obrada
	.extern scanf
	.extern printf
	.extern ucitajListu
	.extern oslobodi

.section .data
x:
	.long 0
n:
	.long 0
list:
	.long 0
in:
	.asciz "%i%i"
out:
	.asciz "\n%i\n"

.section .text
	.global main

.func main
main:
	push {r4, lr}

	ldr r0, =in		@ input X and N
	ldr r1, =x
	ldr r2, =n
	bl scanf

	ldr r0, =n		@ input list
	ldr r0, [r0]
	bl ucitajListu

	ldr r1, =list		@ save head of list
	str r0, [r1]

	sub sp, sp, #0x08	@ make space for hidden argument for obradi function

	mov r0, sp		@ call obrada
	ldr r1, =list
	ldr r1, [r1]
	ldr r2, =x
	ldr r2, [r2]
	bl obrada

	ldr r1, [r0]		@ print element
	ldr r0, =out
	bl printf

	add sp, sp, #0x08	@ remove hidden parameter

	ldr r0, =list		@ free list
	bl oslobodi

	pop {r4, pc}

.endfunc
.end
