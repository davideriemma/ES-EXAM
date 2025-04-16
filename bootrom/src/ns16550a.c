#include "ns16550a.h"

/*\brief initialization function for ns16550a*/
void ns16550a_init()
{
    ;
}

/*\brief write a single char to ns16550a*/
void ns16550a_tx(uint8_t ch)
{
    *(NS16550A_TX_REG) = ch;
}

/*\brief write a string to ns16550a. The string must be null terminated*/
void ns16550a_print(const char *message)
{
    unsigned int i = 0;
    while (message[i] != '\0')
    {
        ns16550a_tx(message[i++]);
    }
    
}