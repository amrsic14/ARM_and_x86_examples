.section .data
in:
	.asciz "\n%i"
n:
	.int 0
x:
	.int 0
list:
	.int 0

.section .text
.extern ucitajListu
.extern oslobodi
.extern scanf
.extern obrada
.extern print
.global main

main:
	push {lr}
	ldr r0, =in
	ldr r1, =n
	bl scanf

	ldr r0, =in
        ldr r1, =x
        bl scanf

	ldr r0, =n
	ldr r0, [r0]
	bl ucitajListu
	ldr r1, =list
	str r0, [r1]

	ldr r1, =x
	ldr r1, [r1]
	ldr r0, =list
	ldr r0, [r0]
	bl obrada

	mov r1, r0
	ldr r0, =in
	bl printf

	ldr r0, =list
	bl oslobodi

	pop {pc}
.end
