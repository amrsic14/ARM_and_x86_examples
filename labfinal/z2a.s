	.extern printf

.section .data
out:
	.asciz "%i "

.section .text
	.global obrada
	@ elem_t obrada(elem_t *glava, int x);

.func obrada
obrada:
	push {r0-r9, lr}

	mov r4, r0		@save scratch registers
	mov r5, r1
	mov r6, r2

	cmp r5, #0		@if head == NULL return 0
	beq error

	ldr r7, [r5, #0x04]
	cmp r7, #0		@ if next == NULL print and return
	beq last

	push {r4-r9}		@ call obrada
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl obrada

	pop {r4-r9}

	ldr r0, =out            @ print element
        ldr r1, [r5]
        bl printf

	ldr r8, [r4]		@ previous iteration calculation
	cmp r8, r6
	subgt r8, r8, r6
	suble r8, r6, r8
	ldr r9, [r5]		@ curr itereation calculation
	cmp r9, r6
	subgt r9, r9, r6
	suble r9, r6, r9

	cmp r8, r9
	ble end

	ldr r1, [r5]
        str r1, [r4]
        str r7, [r4, #0x04]
	b end


last:	ldr r0, =out		@ print element
	ldr r1, [r5]
	bl printf

	ldr r1, [r5]
	str r1, [r4]
	str r7, [r4, #0x04]
	b end

error:	mov r1, #0
	str r1, [r4]
	str r1, [r4, #4]

end:	pop {r0-r9, pc}

.endfunc
.end
