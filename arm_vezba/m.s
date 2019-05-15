.section .data
out:
	.asciz "%i"

.section .text

.extern input
.extern START
.extern END
.extern printf
.extern sum
.extern prt
.global main

main:
	push {r4, r5, lr}

	@ r4 = N
	@ r5 = &array
	ldr r0, =START
	ldr r1, =END
	sub r0, r1, r0
	lsr r0, #2
	mov r4, r0

	ldr r5, =START

	mov r0, r5
	mov r1, r4
	bl input

	mov r0, r5
	mov r1, r4
	bl prt

	mov r0, r5
	mov r1, r4
	bl sum

	mov r1, r0
	ldr r0, =out
	bl printf

	pop {r4, r5, pc}
.end
