# TODO LLVM
Documentation on what is required to be implemented on LLVM in order for this to be functional, the list is divided in goals.

- Running on emulators (bare minimum in order to access the full PS2 hardware)
  - Disable unsupported COP0/COP1/COP2/COP3 instructions
  - Disable `ll`/`sc`
  - Disable 64-bit `mul`/`div`
  - Disable hard-float (for now keep it soft-float)
  - Add `lq`/`sq` (quadword accesses are required due to some wacko peripheral registers)
  - Add `di`/`ei` (of course they add to add their own way of enabling/disabling interrupts)
  
- Running on real hardware (bare minimum in order to access the full PS2 hardware)
  - Add pass to deal with short-loop errata

- Finishing up support
  - Add backported MIPS4 instructions (`pref`/`movn`/`movz`)
  - Add extra mul/div instructions and registers
  - Add remaining EE Core instructions
  - Add MMI
  - Add COP2 support

- Getting FPU to work
  - ???