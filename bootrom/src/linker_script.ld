MEMORY {
  dram_space (rwx) : ORIGIN = 0x80000000, LENGTH = 512M
}

SECTIONS {
  .text : {
    asm.o(.text.bios)
    *(.text)
  } > dram_space
}

__estack_head = 0x80000400;