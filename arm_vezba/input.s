.section .text
.extern scanf
.extern exit

.global start
start:
	bl main
	bl exit

.global input
.func input
input:
	stmdb sp!, {r5, r6, r7, lr}

	mov r5, r1			@ r5 = N
	mov r1, r0			@ r1 = &array
	ldr r0, =in_format		@ r0 = input format

	cmp r5, #0
1:	beq 2f
	mov r6, r0
        mov r7, r1
	bl scanf
	mov r0, r6
	mov r1, r7
	add r1, r1, #4
	subs r5, r5, #1
	b 1b

2:	ldmia sp!, {r5, r6, r7, pc}

.endfunc

.section .data
.global START
.global END
START:
        .int 0, 0, 0, 0, 0
END:

.align 2

in_format:
        .asciz "%i"

.end
