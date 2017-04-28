loc_TA:
0x0000 0000 0000 0000: 00 00 00 00 00 00 00 00	 00 00 00 00 00 00 00 00 
0x0010: 00 00 00 00 00 00 00 f0	 00 00 00 00 00 00 00 00

(repeat to 00f0)

loc_CT:
0x0100: 00 ;Current thread, 1 byte for anything below 16 threads, doubles for higher value

H2_Holder: 0x0101
0000 0000 0000 0000

loc_start: 0x0109
mov rax,0000000000000000
mov rcx,0000000000000000 ;interpgreter offset
mov rdx,0000000000000000 ;sets used registers to zero

0x0131
mov rbx,0000 0000 0000 0100 ;loc_CT
mov bl,[rbx] ;#loc_CT
mov bh,00 ;rbx = #loc_CT |loc_TA Delete this command if 2 bytes woth of thread bytes
mov cl,[rbx] ;rcx = #loc_TA |loc_INS
;in other words, b points to the thread and c points to the instruction

0x0141
mov al,[rcx]
test al,f0
jae loc_mul
test al,e0
jae loc_target
test al,d0
jae loc_div
test al,c0
jae loc_skip
test al,b0
jae loc_ifwithin
test al,a0
jae loc_ifequals
test al,90
jae loc_mov
test al,80
jae loc_mov ;undecided
test al,70
jae loc_add
test al,60
jae loc_x86 ;virtual hex only
test al,50
jae loc_sub
test al,40
jae loc_sub ;undecided
test al,30
jae loc_run
test al,20
jae loc_out
test al,10
jae loc_cpy
test al,00
jae loc_esc ;trm = 00h

