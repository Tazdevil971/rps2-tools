typedef unsigned char u8;
typedef signed char i8;
typedef unsigned short u16;
typedef signed short i16;
typedef unsigned long u32;
typedef signed long i32;
typedef unsigned long long u64;
typedef signed long long i64;

#define SYNCP() asm volatile("sync.p")

static inline void di() {
    int eie;
    asm volatile("mfc0 %0, $12" : "=r"(eie));

    while((eie & 0x10000) != 0) {
        asm volatile(
            ".p2align 3;"
            "di;"
            "sync.p;"
            "mfc0 %0, $12;" : "=r"(eie)
        );
    }
}

static inline void ei() {
    asm volatile(
        "sync.l;"
        "ei;"
    );
}

#define GS_PMODE ((volatile u64*)0x12000000)
#define GS_DISPFB1 ((volatile u64*)0x12000070)
#define GS_DISPLAY1 ((volatile u64*)0x12000080)
#define GS_DISPFB2 ((volatile u64*)0x12000090)
#define GS_DISPLAY2 ((volatile u64*)0x120000a0)
#define GS_BGCOLOR ((volatile u64*)0x120000e0)
#define GS_CSR ((volatile u64*)0x12001000)

#define SYSCALL_TRAMPOLINE(name, num) \
    asm( \
        ".set push;" \
        ".set noreorder;" \
        ".text;" \
        ".globl " #name ";" \
        #name ":" \
        "li $v1, " #num ";" \
        "syscall;" \
        "jr $ra;" \
        "nop;" \
        ".set pop;" \
    )

SYSCALL_TRAMPOLINE(set_gs_crt, 0x02);
void set_gs_crt(i16 interlace, i16 mode, i16 field);

SYSCALL_TRAMPOLINE(gs_put_imr, 0x71);
u64 gs_put_imr(u64 imr);

#undef SYSCALL_TRAMPOLINE

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

void __start() {
    /*
    Simple program to flash the screen with different colors
    For some reason this only runs in software render mode under PCSX2?

    Acronyms:
    - GS: Graphics Synthesizer (GPU)
    - PCRTC: Programmable CRT Controller (video signal DAC)

    This program does the following:
    - Boots up GS (emulators use this to setup graphics, real HW does not need this step)
    - Configures PCRTC to bypass GS output and only output a solid color
    - Writes to the PCRTC configuration to display different colors
    */

    // TODO: Should we initialize main stack and heap correctly? Yes
    // TODO: De-hardcode most of these register configurations

    // Step 1: Reset the GS by writing to the system status register
    *GS_CSR = 1 << 9;
    SYNCP();
    *GS_CSR = 0;

    // Step 2: Boot up GS by calling into the OS (this enables graphics on emulators)
    gs_put_imr(0x00007f00);
    set_gs_crt(0x00, 0x03, 0x00);

    // Step 3: Disable all color outputs from the GS
    di();

    *GS_PMODE = 0x000000a5;
    *GS_DISPFB1 = 0x00009400;
    *GS_DISPFB2 = 0x00009400;
    *GS_DISPLAY1 = 0xfff9ff38014338;
    *GS_DISPLAY2 = 0xfff9ff38014338;

    ei();

    // Step 4: Show different colors on the screen
    for(int i = 0;; i++) {
        u32 h = i >> 16;
        u32 r = slope(h + 240);
        u32 g = slope(h + 120);
        u32 b = slope(h);

        *GS_BGCOLOR = r | (g << 8) | (b << 16);
    }
}