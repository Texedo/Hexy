threadBase.

threadTracker. ;somewhat undefined, it will reside unerneath the interpreter and expand downwards

threadCount.
0000000000000001

currentThread.
0000000000000000

terminatedThread.
0000000000000000
Setup.start
	mov threadCount,0000000000000001 ;INS 1
	mov currentThread,0000000000000000 ;INS 2
	mov terminatedThread,0000000000000000 ;INS 3
Start.
	mov rax,$currentThread ;INS 4
	mov rbx,$threadCount
	test rax,rbx
	jne HCINS6.
	mov currentThread,0000000000000000 ;INS 5
HCINS6.
	;INS 6