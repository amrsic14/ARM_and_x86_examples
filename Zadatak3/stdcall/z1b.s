	.intel_syntax noprefix
	.arch i386
#=============================================
.data
	.global START
	.global END
START:
	#.rept 5
	#	.int 1, 2, 3, 4, 5
	#.endr
	.int 1, 2, 3, 3, 3, 3, 4, 5, 3, 6, 3
END:
.end
