.section .text
.global sum
.func sum
sum:
	stmfd r13, {r4, lr}
	mov r2, #0
	mov r3, #0

1:	cmp r2, r1
	bge 2f
	ldr r4, [r0, r2, lsl #2]
	add r3, r3, r4
	add r2, r2, #1
	bal 1b

2:	mov r0, r3
	ldmfd r13, {r4, pc}

.endfunc
.end
