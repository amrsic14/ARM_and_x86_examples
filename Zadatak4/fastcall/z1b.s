	.intel_syntax noprefix
	.arch i386
#==================================================
.data
	.global START
	.global END
START:
	.rept 1000
		.int 1, 2, 3, 4, 5
	.endr
END:
.end
