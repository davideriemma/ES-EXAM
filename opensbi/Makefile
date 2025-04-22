CC_PREFIX := riscv32-unknown-linux-gnu-
AS := $(CC_PREFIX)as
LD := $(CC_PREFIX)ld 
OBJC := $(CC_PREFIX)objcopy

all: compile link

compile:
	$(AS) -o simple_hello.o simple_hello.S 

link:
	$(LD) -T simple_hello.ld -o simple_hello.elf simple_hello.o

pload:
	$(OBJC) -O binary simple_hello.elf simple_hello.bin

