;REPLACED WITH MULTIPLY; WILL BE RESERVED AS REFERENCE

loc_metaddcont:
sub al,f0 ; f is the value of metaddcont
test al,08
jae 8B_metaddcont
test al,07
jae 7B_metaddcont
test al,06
jae 6B_metaddcont
test al,05
jae 5B_metaddcont
test al,04
jae 4B_metaddcont
test al,03
jae 3B_metaddcont
test al,02
jae 2B_metaddcont
test al,01
jae 1B_metaddcont
test al,00
jae loc_addcont

;al = HC code - F0
;rbx = loc_TA
;rcx = #loc_TA | loc_instruction

8B_metaddcont:
inc rcx ;loc_INS,  h2 1st byte
add bl,08 ;loc_TA target
mov rax,[rcx]
mov [rbx],rax ;DONE!!
add rcx,07 ;h2 8th byte
jmp op_add ;right way to do it!!

7B_metaddcont:
inc rcx :loc_INS, h2 1st byte
add bl,08 ;loc_TA target
mov eax,[rcx]
mov [rbx],eax ;first 4
add bl,04
add cl,04
mov ax,[rcx]
mov [rbx],ax ;first 6
add bl,02
add cl,02
mov al [rcx]
mov [rbx],al ;final byte
sub bl,06 ;target base
jmp op_add ;done

6B_metaddcont:
inc rcx :loc_INS, h2 1st byte
add bl,08 ;loc_TA target
mov eax,[rcx]
mov [rbx],eax ;first 4
add bl,04
add cl,04
mov ax,[rcx]
mov [rbx],ax ;first 6
inc rcx ;last h2 byte
sub bl,04
jmp op_add


5B_metaddcont:
inc rcx ; loc_INS, h2 1st byte
add bl,08 ;loc_TA
mov eax,[rcx]
mov [rbx],eax ;first 4
add bl,04
add cl,04
mov al,[rcx]
mov [rbx],al ;5th byte
sub bl,04 ;target base
jmp op_add

4B_metaddcont:
inc rcx ; loc_INS, h2 1st byte
add bl,08 ;loc_TA target base
mov eax,[rcx]
mov [rbx],eax ;first 4
add cl,03 ;loc_INS, h2 last byte
jmp op_add


3B_metaddcont:
inc rcx ;loc_INS, h2 1st byte
add bl,08 ;loc_TA
mov ax,[rcx]
mov [rbx],ax ;first 2
add cl,02
add bl,02
mov al,[rcx]
mov [rbx],al ;last byte
sub bl,02 ;target base
jmp op_add

2B_metaddcont:
inc rcx  ;loc_INS, h2 1st byte
add bl,08 ;target
mov ax,[rcx]
mov [rbx],ax first 2
inc rcx ;last h2 byte
jmp op_add

1B_metaddcont:
inc rcx ;loc_INS, h2 1st byte
add bl,08 ;target
mov al,[rcx]
mov [rbx],al
jmp op_add
