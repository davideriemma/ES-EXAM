MEMORY {
  dram_space (rwx) : ORIGIN = 0x80000000, LENGTH = 0x8000000
}

SECTIONS {
  .text : {
    bootrom.o(.text.bios)
  } > dram_space
}

__stack_head = 0x88000000;
opensbi_fw_size = 0x0012;
