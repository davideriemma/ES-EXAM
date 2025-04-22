#include "ns16550a.h"
#include "sbi/sbi_scratch.h"
#include "sbi/sbi_init.h"

/*Scratch structure needed for sbi initialization*/
struct sbi_scratch myconf;

void bootrom_init()
{
    ns16550a_init();
    ns16550a_print("==========================\r\n");
    ns16550a_print("UninaSoC BootRom v0.1\r\n");
    ns16550a_print("==========================\r\n");

    //while(1) is in place to the call to opensbi
    //while(1);
    sbi_init(&myconf);

    while(1);
}