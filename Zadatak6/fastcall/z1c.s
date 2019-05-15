	.intel_syntax noprefix
	.arch i386
#===================================================
.data
	.global START
	.global END

START:
	.int 1, 2, 3, 4, 5, 6, 7
END:
.end
