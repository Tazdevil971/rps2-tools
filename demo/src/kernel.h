#include "ints.h"

#define EE_SYNC() asm volatile("sync")
#define EE_SYNCP() asm volatile("sync.p")
#define EE_SYNCL() asm volatile("sync.l")

static inline void ee_di(void) {
    int eie;
    asm volatile("mfc0 %0, $12" : "=r"(eie));
    eie &= 0x10000;

    while (eie) {
        asm volatile(
            "di;"
            "sync.p;"
            "mfc0 %0, $12;"
            : "=r"(eie)
        );
        eie &= 0x10000;
    }
}

static inline void ee_ei(void) {
    asm volatile(
        "sync.l;"
        "ei;"
    );
}

// These are defined in syscalls.S
void ResetEE(u32 reset_flag);
void SetGsCrt(i16 interlaced, i16 pal_ntsc, u16 field);
void Exit(i32 exit_code) __attribute__((noreturn));
void ExitThread(void);
void *InitHeap(void *heap, i32 heap_size);
void FlushCache(i32 operation);
u64 GsGetIMR(void);
u64 GsPutIMR(u64 imr);