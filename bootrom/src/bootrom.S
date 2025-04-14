.section .text.bootrom

.global _start
.global __stack_head
_start:
  ## 1. init the stack pointer, so that i can call the memmove function
  la sp, __stack_head # sp = __stack_head
  #j bootrom_init      # jump to target
