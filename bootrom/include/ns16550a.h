#ifndef NS16550a_H_
#define NS16550a_H_

#define NS16550A_BASE_ADDRESS ((unsigned char* )(0x10000000))
#define NS16550A_TX_REG       ((unsigned char* )(NS16550A_BASE_ADDRESS + 0x0))

void ns16550a_init();
void ns16550a_tx(unsigned char ch);
void ns16550a_print(const char *);
/*rx is not needed*/

#endif