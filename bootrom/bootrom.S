.section .rodata
message: .string "hello"
message_l = (. - message)
.align 4
s1: .word 0x10000000
#insert here the string to print

.section .text.bootrom

# step 1. Initialize the stack pointer (if qemu does not do so autonomously)
# step 2. Initialize the serial port
# step 3. Print "Bootrom done"
# step 4. Jump to Opensbi
.global _start
_start:	
#   addi a0, x0, 0x68
#	li a1, 0x10000000
#	sb a0, (a1) # 'h'
#
#	addi a0, x0, 0x65
#	sb a0, (a1) # 'e'
#
#	addi a0, x0, 0x6C
#	sb a0, (a1) # 'l'
#
#	addi a0, x0, 0x6C
#	sb a0, (a1) # 'l'
#
#	addi a0, x0, 0x6F
#	sb a0, (a1) # 'o'


mv t0, zero # initialize t0
li t3, message_l # load the stirng size
la t1, message # load address of the string
la s1, s1 # load address of the tx register of uart
for_loop:
    add t4, t1, t0 # t4 = message + t0
    lb t2, (t4) # load byte at index
    sb t2, (s1)  # transmit the byte
    addi t0, t0, 0x1 # t0 = t0 + 0x1
    beq t0, t3, loop # if t0 == t3 then loop
    j for_loop

loop:	j loop
