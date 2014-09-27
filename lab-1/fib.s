	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5, lr}

	cmp r0,#0
	ble .L3		@if r0 <= 0 return 0
	subs r0,r0,#1	@if r0-- == 1 return 1
	beq .L4		
			@now r0 = n-1

	mov r4,#1
	mov r5,#1
loop:
	subs r0,r0,#1	@r0 == 1 & is odd (n is even)
	beq .L5		@return r5
	add r4,r4,r5

	subs r0,r0,#1	@r0 == 1 & is even (n is odd)
	beq .L6		@return r4
	add r5,r5,r4
	b loop

.L3:
	mov r0, #0			@ R0 = 0
	pop {r4, r5, pc}		@ EPILOG
.L4:
	mov r0, #1			@ r0 = 1
	pop {r4, r5, pc}		@ EPILOG
.L5:
	mov r0,r5
	pop {r4, r5, pc}                @ EPILOG
.L6:
        mov r0,r4
        pop {r4, r5, pc}                @ EPILOG


	.size fibonacci, .-fibonacci
	.end
