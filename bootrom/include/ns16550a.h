#ifndef NS16550a_H_
#define NS16550a_H_

#include <stdint.h>

#define NS16550A_BASE_ADDRESS ((uint8_t* )(0x10000000))
#define NS16550A_TX_REG       ((uint8_t* )(NS16550A_BASE_ADDRESS + 0x0))

void ns16550a_init();
void ns16550a_tx(uint8_t);
void ns16550a_print(const char *);
/*rx is not needed*/

#endif