ENTRY(__entry);

SECTIONS {
    .text 0x00100000: {
        *(.text)
        *(.text.*)
    }
    
    .reginfo ALIGN(16): { *(.reginfo) }

    .data ALIGN(128): {
        *(.data)
        *(.data.*)
    }

    .rodata ALIGN(128): {
        *(.rodata)
        *(.rodata.*)
    }

    /* Start of small data section */
    .sdata ALIGN(128): {
        *(.sdata)
        *(.sdata.*)
    }

    __bss_start = ALIGN(128);

    .sbss ALIGN(128): {
        *(.sbss)
        *(.sbss.*)
    }

    __gp = ALIGN(128);
    /* End of small data section */

    .bss ALIGN(128): {
        *(.bss)
        *(.bss.*)
    }

    __bss_end = ALIGN(128);
    __heap_start = ALIGN(128);

    /* Unwanted stuff */
    /DISCARD/ : {
        *(.MIPS.abiflags)
    }
}