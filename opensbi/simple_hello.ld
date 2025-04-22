MEMORY{
    kernel_space (xwr) : ORIGIN = 0x80200000, LENGTH = 0x800
}

SECTIONS {
    .text : {
        simple_hello.o(.text.kernel)
    } > kernel_space
    .rodata : {
        simple_hello.o (.rodata)
    } > kernel_space
}