.section .data
out:
	.asciz "%ld"

.section .text
.extern printf
.global reverse
	@ void reverse(int array[], int n)
.func reverse
reverse:
	push {lr}
	sub r1, r1, #1

	cmp r1, #0
	blt 2f
	pushne {r0, r1}
	beq 3f
	add r0, r0, #4
	bl reverse
	pop {r0, r1}


3:	ldr r1, [r0]
	ldr r0, =out
	bl printf
2:	pop {pc}


.endfunc
.end
0 2
1 1

3
1 1
2
