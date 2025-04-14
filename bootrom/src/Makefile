all: compile link

CFLAGS:= -nostdlib -g3 -march=rv32i -mabi=ilp32

# domanda: il target è a 64bit?

compile:
	riscv32-unknown-linux-gnu-gcc $(CFLAGS) -c bootrom.S -o bootrom.o

link:
	riscv32-unknown-linux-gnu-ld --script linker_script.ld bootrom.o -o bootrom.elf

.PHONY: clean

clean:
	rm bootrom.elf bootrom.o