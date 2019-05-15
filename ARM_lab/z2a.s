.section .data
out:
	.asciz "%i "

.section .text
.extern test
.extern printf
.global obrada
.func obrada
obrada:
	push {r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl test

	@ r4 list
	@ r5 X


	cmp r4, #0		@ if list = 0 exit
	mov r0, #0x7fffffff
	beq 1f

	ldr r1, [r4]
	cmp r1, r5
	bge 2f			@ if podatak >= x skip printing

	ldr r0, =out
	bl printf

2:	mov r0, r4
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r5
	push {r4}
	bl obrada
	pop {r4}
	ldr r2, [r4]
	cmp r2, r0
	bge 1f
	mov r0, r2

1:	pop {r4, r5, pc}

.endfunc
.end
