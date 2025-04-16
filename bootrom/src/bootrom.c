#include "ns16550a.h"

void bootrom_init()
{
    ns16550a_init();
    ns16550a_print("==========================\r\n");
    ns16550a_print("UninaSoC BootRom v0.1\r\n");
    ns16550a_print("==========================\r\n");

    //while(1) is in place to the call to opensbi
    while(1);
}