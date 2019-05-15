	.intel_syntax noprefix
	.arch i386
#===================================================
.data
	.global START
	.global END

START:
	.rept 5
		.int 1, 2, 3, 4, 5, 6, 7
	.endr
	.int 1, 2
END:
.end
