.section .rodata
message: .string "hello opensbi! This will soon be uninasoc"
message_length = (. - message)
.section .text.kernel
.global _start

_start:

li a7, 0x4442434E # a7 = 0x4442434E Debug Console Extension (EID #0x4442434E "DBCN")
li a6, 0x0 # a6 = 0x0 Function: Console Write (FID #0)
li a0, message_length # a0 = $message_length get the length of the string
la a1, message # 
li a2, 0 # a2 = 0
ecall

loop: j loop  # jump to loop
