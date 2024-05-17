#include "ints.h"
#include "kernel.h"

#define GS_PMODE ((volatile u64*)0x12000000)
#define GS_DISPFB1 ((volatile u64*)0x12000070)
#define GS_DISPLAY1 ((volatile u64*)0x12000080)
#define GS_DISPFB2 ((volatile u64*)0x12000090)
#define GS_DISPLAY2 ((volatile u64*)0x120000a0)
#define GS_BGCOLOR ((volatile u64*)0x120000e0)
#define GS_CSR ((volatile u64*)0x12001000)

u32 slope(u32 i) {
    i = i % 360;
    
    if(i < 60) {
        return (i * 255) / 60;
    } else if(i < 180) {
        return 255;
    } else if(i < 240) {
        return ((60 - (i - 240)) * 255) / 60;
    } else {
        return 0;
    }
}

extern u128* __bss_start;
extern u128* __bss_end;
extern u128* __heap_start;

// Test out .bss clearing logic
static char RANDOM_BSS[1024] = {0};

int main() {
    /*
    Simple program to flash the screen with different colors
    For some reason this only runs in software render mode under PCSX2?

    Acronyms:
    - GS: Graphics Synthesizer (GPU)
    - PCRTC: Programmable CRT Controller (video signal DAC)

    This program does the following:
    - Sets up main program stack (already done in crt0)
    - Clears .bss
    - Sets up heap
    - Boots up GS (emulators use this to setup graphics, real HW does not need this step)
    - Configures PCRTC to bypass GS output and only output a solid color
    - Writes to the PCRTC configuration to display different colors
    */

    // Step 1: Clear .bss
    for(u128 *it = __bss_start; it != __bss_end; it++)
        *it = 0;

    // Step 2: Set up heap
    InitHeap(__heap_start, -1);

    // Step 3: Reset the GS by writing to the system status register
    *GS_CSR = 1 << 9;
    EE_SYNCP();
    *GS_CSR = 0;

    // Step 4: Boot up GS by calling into the OS (this enables graphics on emulators)
    GsPutIMR(0x00007f00);
    SetGsCrt(0x00, 0x03, 0x00);

    // Step 5: Disable all color outputs from the GS
    ee_di();

    *GS_PMODE = 0x000000a5;
    *GS_DISPFB1 = 0x00009400;
    *GS_DISPFB2 = 0x00009400;
    *GS_DISPLAY1 = 0xfff9ff38014338;
    *GS_DISPLAY2 = 0xfff9ff38014338;

    ee_ei();

    // Step 6: Show different colors on the screen
    for(int i = 0;; i++) {
        u32 h = i >> 16;
        u32 r = slope(h + 240);
        u32 g = slope(h + 120);
        u32 b = slope(h);

        *GS_BGCOLOR = r | (g << 8) | (b << 16);
    }

    return 0;
}