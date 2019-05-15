	.section .text 	@ sekcija za kod	
.global _start		@ ulazna tačka programa treba linkeru
_start:			@ ulazna tačka	
ldr r5, value		@ u r5 ide vrednost za ispis
	bl hexout 		@ poziv potprograma hexout
	bl exit		@ kraj rada programa
value:
.word 0x12345678 		@ vrednost za ispis 

hexout:			@ potprogram za heksa ispis broja u r5
	stmdb sp!, {r0,r4,r5,r14} @ čuvaju se korišćenih reg.	
	mov r4, #8 		@ u r4 ide broj heksa cifara broja (8)
loop:	mov r0, r5, lsr #28 @ u  r0 ide najznačajnija heksa cifra broja
 	cmp r0, #9 		@ da li je cifra veća od 9?
	addgt r0, r0, #55 	@ ako je slovo, odredi mu ascii kod (65 za a…)
	addle r0, r0, #48 	@ ako je cifra, odredi joj ascii kod (48 za 0…)
	bl putchar		@ ispis tekuće cifre na konzoli
	mov r5, r5, lsl #4 	@ pomeri r5 za 4 bita ulevo (sledeća hex cifra)
	subs r4, r4, #1 	@ r4=r4-1 (broj preostalih cifara za ispis)
	bne loop 		@ ako ima još cifara, vrati se na ispis
	ldmia sp!, {r0,r4,r5,pc} @ povratak u program
.end
