inc_target:
mov rax,0000000000000100 ;loc_CT
mov rbx,rax
mov al,[rax]
mov ah,00 ;loc_CT
add al,08
mov rcx,[rax]
inc rcx ;thread value
mov [rax],rcx
;rax = loc_CT
;rbx = #loc_CT
;rcx = target value
jmp inc_thread

