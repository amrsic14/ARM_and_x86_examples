.section .data
START:
	.rept 33
		.int 1, 2, 3
	.endr
	.int 1
END:

.section .text
.extern reverse
.global main

main:
	push {lr}

	ldr r0, =START
	ldr r1, =END
	sub r1, r1, r0
	lsr r1, #2
	bl reverse

	pop {pc}

.end

