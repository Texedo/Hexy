op_add:

;requires:
;rbx loc_TA target base
;rcx loc_INS last h2 byte or byte before operand

inc rcx ;loc_operand
mov dh,00
mov dl,[rcx] ;dx = operand = 00<opB>
mov rbx,[rbx] ;targeted byte/word’s address to rbx
inc rbx
mov al,[rbx] ;[targeted byte+1]
dec rbx ;[targeted byte]
test al,01 ; if not 0, switch to carry_test
jae carry_test
; otherwise, continue
mov ax,[rbx] ;ax = target word
add ax,dx
mov [rbx],ax
jmp inc_target



carry_test:
mov ax,[rbx] ;ax = target word
add ax,dx
mov [rbx],ax
inc rbx ;target byte+1
mov al,[rbx] ;if 00h, carry 01
inc rbx ;next word
test al,00
je carry_add ;jump to carry loop if 00
jmp inc_target ;otherwise, inc target

carry_add:
mov ax,[rbx] ;ax = target word
add ax,01 ;carry 01
mov [rbx],ax
inc rbx ;target byte+1
mov al,[rbx] ;if 00h, carry 01
inc rbx ;next word
test al,00
je carry_add ;jump to carry loop if 00
jmp inc_target ;otherwise, inc target
