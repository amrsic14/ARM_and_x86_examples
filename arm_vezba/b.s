.section .data
P:
	.rept 100
		.long 1, 2, 3, 4
	.endr
N:	.int 400

.section .text

.func aaa
aaa:
	push {r5, lr}
	ldr r0, =P
	ldr r5, =N
	ldr r5, [r5]

petlja:	ldmia r0, {r1-r4}
	add r1, r1, r1, LSL #3
	add r2, r2, r2, LSL #3
	add r3, r3, r3, LSL #3
	add r4, r4, r4, LSL #3
	stmia r0!, {r1-r4}
	subs r5, r5, #4	
	bne petlja

	pop {r5, pc}
.endfunc

.global _start
_start:
        bl aaa
        bl exit

.end
