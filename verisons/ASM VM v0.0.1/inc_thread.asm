
inc_target:
mov rbx,0000 0000 0000 0100 ;loc_CT
mov rcx,rbx ;hold loc_CT
mov rax,[rbx] ;inc thread
inc rax
mov [rbx],rax ;update loc_CT
mov bh,00
add rbx,07 ;8th byte
mov al,[rbx]
test al,ff
je dead_check
jmp loc_start ;if next thread is active, loop back to start
;loc_CT is thread after last thread

;rbx = loc_thread+7
dead_check:
;start checking for dead threads
mov cx,0007 ;loc_TA+7 count it out
mov al,[rcx]
test al,ff ;if dead(outside of memory)
je dead_thread
jmp dead_loop

dead_loop:
add al,0f ;next thread
mov al,[rcx]
test al,ff ;if dead(outside of memory)
je dead_thread
jmp dead_loop ;if not, repeat the loop

dead_thread:


