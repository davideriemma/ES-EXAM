.section .text.bios
.global _start
.global __estack_head

_start:
    la sp, __estack_head # sp = __estack_head
    jal bootrom_init  # jump to bootrom_init and save position to ra
    
    