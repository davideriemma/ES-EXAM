all: compile link

DT_LA := 0x80008000

ASMFLAGS := -march=rv32i -mabi=ilp32
TC_PREFIX := riscv32-unknown-linux-gnu
#how do i make this more portable?
INCLUDE := ../include -I /home/dev/Desktop/opensbi/include
LIB_PATH := ../lib
LIBS := sbi

CFLAGS:= -g3 -march=rv32i -mabi=ilp32 \
			-DDT_LOAD_ADDRESS=$(DT_LA) \
			-I $(INCLUDE) -nostdlib -nodefaultlibs
 

ns16550a.o:
	$(TC_PREFIX)-gcc $(CFLAGS) -c ns16550a.c -o ns16550a.o

bootrom.o: 
	$(TC_PREFIX)-gcc $(CFLAGS) -c bootrom.c -o bootrom.o

asm.o:
	$(TC_PREFIX)-as $(ASMFLAGS) -c bootrom.S -o asm.o

compile: ns16550a.o bootrom.o asm.o

link: compile
	$(TC_PREFIX)-ld -T linker_script.ld  --no-dynamic-linker -m elf32lriscv -static -nostdlib -s -o bootrom.elf bootrom.o ns16550a.o asm.o ../lib/libsbi.a

run: all
	qemu-system-riscv32 -machine virt -bios bootrom.elf

dump:
	$(TC_PREFIX)-objdump -d bootrom.o -d ns16550a.o

.PHONY: clean

clean:
	rm bootrom.elf *.o 