## Part 1. Minimum Requirements (task [450](https://raspynet.ddns.net/issues/450))
Minimum requriements are expressed in the [offical opensbi documentation](https://github.com/riscv-software-src/opensbi/blob/master/docs/platform_requirements.md), which i leave here as a reference since it is constantly updated. Here's a detailed list of what is needed by the RISC-V implementation to support the opensbi implementation.
- *At least rv32ima_zicsr or rv64ima_zicsr required on all HARTs*
	- The Integer, Multiply and Atomic standard ISA extensions are required, as well as the *ZICSR* ISA extension in order to operate on control and status registers of each hard. This is for both 32 and 64-bit ISAs.
		- {(optional) why is that needed?}
- *At least one HART should have S-mode support because:*
	- *SBI calls are meant for RISC-V S-mode (Supervisor mode)*
	- *OpenSBI implements SBI calls for S-mode software*
- The MTVEC CSR on all HARTs must support direct mode
	- Accorting to the *RISC-V instruction set manual* - Privileged mode "*The `mtvec` register is an MXLEN-bit **WARL** read/write register that holds trap vector configuration, consisting of a vector base address (BASE) and a vector mode (MODE)*"
	  This register allows two modes for handling trap exceptions, depending on the value of MODE:
	  ![MODE configuration Table](/doc/OpenSBI/resources/img/MTVEC_mode_config_table.png "MODE configuration Table")
		- in Direct mode (Value = `0`) the trap exception jumps to the value at BASE. The BASE address acts like an ISR.
		- in Vectored mode (Value = `1`), the BASE address is the first element of a vector of addresses in memory, at which the trap exception jumps based on the identifier of its cause. 
- The PMP CSRs are optional. If PMP CSRs are not implemented then OpenSBI cannot protect M-mode firmware and secured memory regions
	- According to the *RISC-V instruction set manual*, *To support secure processing and contain faults, it is desirable to limit the physical addresses accessible by software running on a hart. An optional physical memory protection (PMP) unit provides per-hart machine-mode control registers to allow physical memory access privileges (read, write, execute) to be specified for each physical memory region.*
- The TIME CSR is optional. If TIME CSR is not implemented in hardware then a 64-bit MMIO counter is required to track time and emulate TIME CSR.
	- Again, to the , *Platforms provide a real-time counter, exposed as a memory-mapped machine-mode read-write register, mtime. mtime must increment at constant frequency, and the platform must provide a mechanism for determining the period of an mtime tick. The  mtime register will wrap around if the count overflows.*
- Hardware support for injecting M-mode software interrupts on a multi-HART platform

The RISC-V extensions not covered by rv32ima_zicsr or rv64ima_zicsr are optional for OpenSBI. Although, OpenSBI will detect and handle some of these optional RISC-V extensions at runtime.
The optional RISC-V extensions handled by OpenSBI at runtime are:
-  D-extension: Double precision foating point
-  F-extension: Single precision foating point
-  H-extension: Hypervisor

regarding stack size, i have found the default value in the documentation. No further specification is made about the minimum stack size
```c
/*30.106.1.2 SBI_PLATFORM_DEFAULT_HART_STACK_SIZE*/
#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE 8192
/*Platform default per-HART stack size for exception/interrupt handling*/
```
## Part 2. Artifact and Build Tools (task [451](https://raspynet.ddns.net/issues/451))
{refer to task [433](https://raspynet.ddns.net/issues/433), [434](https://raspynet.ddns.net/issues/434) and [435](https://raspynet.ddns.net/issues/435)}