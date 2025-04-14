#define OPENSBI_DRAM_ADDR 0x80000000
#define OPENSBI_ROM_ADDR  0x01000000

extern unsigned opensbi_fw_size;

void memcpy(void* src, void* dest, unsigned count)
{
    while (--count)
    {
        *((char *)(dest + count)) = *((char*)(src + count));
    }
    
}

void bootrom_init()
{
    //copy opensbi to RAM
    memcpy((void *)(OPENSBI_DRAM_ADDR), (void *)(OPENSBI_ROM_ADDR), opensbi_fw_size);
    //jump to opensbi_init address
}