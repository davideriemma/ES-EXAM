all: compile link

# domanda: il target è a 64bit?

compile:
	riscv32-unknown-linux-gnu-gcc -g3 -c bootrom.S -o bootrom.o -march=rv32i -mabi=ilp32

link:
	riscv32-unknown-linux-gnu-ld --script linker_script.ld bootrom.o -o bootrom.elf

.PHONY: clean

clean:
	rm bootrom.elf bootrom.o