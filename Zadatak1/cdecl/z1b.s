	.intel_syntax noprefix
	.arch i386

#=========================================================================
.data
	.global NIZ_POCETAK
	.global NIZ_KRAJ

NIZ_POCETAK:
	.rept 14
		.int 9, 2, 3, 4, 5, 6, 1
	.endr
	.int 1, 2
NIZ_KRAJ:
.end
