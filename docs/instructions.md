# Instructions
Here is a list of MIPS instructions for the R5900. 
It also includes instructions that _should_ be supported by the R5900, but aren't, documenting why.

|mnemonic |from        |supported|notes
|---------|------------|:-------:|-----
|`add`       |MIPS1       |✅|
|`addi`      |MIPS1       |✅|
|`addiu`     |MIPS1       |✅|
|`addu`      |MIPS1       |✅|
|`and`       |MIPS1       |✅|
|`andi`      |MIPS1       |✅|
|`div`       |MIPS1       |✅|
|`divu`      |MIPS1       |✅|
|`beq`       |MIPS1       |✅|
|`bgez`      |MIPS1       |✅|
|`bgezal`    |MIPS1       |✅|
|`bgtz`      |MIPS1       |✅|
|`blez`      |MIPS1       |✅|
|`bltz`      |MIPS1       |✅|
|`bltzal`    |MIPS1       |✅|
|`bne`       |MIPS1       |✅|
|`break`     |MIPS1       |✅|
|`j`         |MIPS1       |✅|
|`jal`       |MIPS1       |✅|
|`jalr`      |MIPS1       |✅|
|`jr`        |MIPS1       |✅|
|`lb`        |MIPS1       |✅|
|`lbu`       |MIPS1       |✅|
|`lh`        |MIPS1       |✅|
|`lhu`       |MIPS1       |✅|
|`lui`       |MIPS1       |✅|
|`lw`        |MIPS1       |✅|
|`lwl`       |MIPS1       |✅|
|`lwr`       |MIPS1       |✅|
|`lwu`       |MIPS1       |✅|
|`mfhi`      |MIPS1       |✅|
|`mflo`      |MIPS1       |✅|
|`mthi`      |MIPS1       |✅|
|`mtlo`      |MIPS1       |✅|
|`nor`       |MIPS1       |✅|
|`or`        |MIPS1       |✅|
|`ori`       |MIPS1       |✅|
|`sb`        |MIPS1       |✅|
|`sh`        |MIPS1       |✅|
|`sll`       |MIPS1       |✅|
|`sllv`      |MIPS1       |✅|
|`slt`       |MIPS1       |✅|
|`slti`      |MIPS1       |✅|
|`sltiu`     |MIPS1       |✅|
|`sltu`      |MIPS1       |✅|
|`srav`      |MIPS1       |✅|
|`sra`       |MIPS1       |✅|
|`srlv`      |MIPS1       |✅|
|`srl`       |MIPS1       |✅|
|`sub`       |MIPS1       |✅|
|`subu`      |MIPS1       |✅|
|`sw`        |MIPS1       |✅|
|`swl`       |MIPS1       |✅|
|`swr`       |MIPS1       |✅|
|`syscall`   |MIPS1       |✅|
|`xor`       |MIPS1       |✅|
|`xori`      |MIPS1       |✅|
|`bc0f`      |MIPS1       |✅|
|`bc0t`      |MIPS1       |✅|
|`mfc0`      |MIPS1       |✅|
|`mtc0`      |MIPS1       |✅|
|`mfc2`      |MIPS1       |❌|COP2 has quadword sized registers
|`mtc2`      |MIPS1       |❌|COP2 has quadword sized registers
|`mfc3`      |MIPS1       |❌|EE doesn't have a COP3
|`mtc3`      |MIPS1       |❌|EE doesn't have a COP3
|`tlbp`      |MIPS1       |✅|
|`tlbr`      |MIPS1       |✅|
|`tlbwi`     |MIPS1       |✅|
|`tlbwr`     |MIPS1       |✅|
|`lwc2`      |MIPS1       |❌|COP2 has quadword sized registers
|`swc2`      |MIPS1       |❌|COP2 has quadword sized registers
|`lwc3`      |MIPS1       |❌|EE doesn't have a COP3
|`swc3`      |MIPS1       |❌|EE doesn't have a COP3
|`beql`      |MIPS2       |✅|
|`bgezl`     |MIPS2       |✅|
|`bgezall`   |MIPS2       |✅|
|`bgtzl`     |MIPS2       |✅|
|`blezl`     |MIPS2       |✅|
|`bltzl`     |MIPS2       |✅|
|`bltzall`   |MIPS2       |✅|
|`bnel`      |MIPS2       |✅|
|`sync`      |MIPS2       |✅|
|`sync.l`    |MIPS2       |✅|
|`sync.p`    |MIPS2       |✅|
|`teq`       |MIPS2       |✅|
|`teqi`      |MIPS2       |✅|
|`tge`       |MIPS2       |✅|
|`tgei`      |MIPS2       |✅|
|`tgeiu`     |MIPS2       |✅|
|`tgeu`      |MIPS2       |✅|
|`tlt`       |MIPS2       |✅|
|`tlti`      |MIPS2       |✅|
|`tltiu`     |MIPS2       |✅|
|`tltu`      |MIPS2       |✅|
|`tne`       |MIPS2       |✅|
|`tnei`      |MIPS2       |✅|
|`bc0fl`     |MIPS2       |✅|
|`bc0tl`     |MIPS2       |✅|
|`ldc2`      |MIPS2       |❌|COP2 has quadword sized registers
|`sdc2`      |MIPS2       |❌|COP2 has quadword sized registers
|`ldc3`      |MIPS2       |❌|EE doesn't have a COP3
|`sdc3`      |MIPS2       |❌|EE doesn't have a COP3
|`ll`        |MIPS2       |❌|EE is single core
|`lld`       |MIPS2       |❌|EE is single core
|`sc`        |MIPS2       |❌|EE is single core
|`scd`       |MIPS2       |❌|EE is single core
|`dadd`      |MIPS3       |✅|
|`daddi`     |MIPS3       |✅|
|`daddiu`    |MIPS3       |✅|
|`daddu`     |MIPS3       |✅|
|`dsub`      |MIPS3       |✅|
|`dsubu`     |MIPS3       |✅|
|`dsll`      |MIPS3       |✅|
|`dsll32`    |MIPS3       |✅|
|`dsllv`     |MIPS3       |✅|
|`dsra`      |MIPS3       |✅|
|`dsra32`    |MIPS3       |✅|
|`dsrav`     |MIPS3       |✅|
|`dsrl`      |MIPS3       |✅|
|`dsrl32`    |MIPS3       |✅|
|`dsrlv`     |MIPS3       |✅|
|`cache`     |MIPS3       |✅|
|`eret`      |MIPS3       |✅|
|`ld`        |MIPS3       |✅|
|`ldl`       |MIPS3       |✅|
|`ldr`       |MIPS3       |✅|
|`sd`        |MIPS3       |✅|
|`sdl`       |MIPS3       |✅|
|`sdr`       |MIPS3       |✅|
|`ddiv`      |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`ddivu`     |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmul`      |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmulo`     |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmulou`    |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmult`     |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmultu`    |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`drem`      |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dremu`     |MIPS3       |❌|EE doesn't have 64bit mul/div hardware
|`dmfc0`     |MIPS3       |❌|COP0 has word sized registers
|`dmtc0`     |MIPS3       |❌|COP0 has word sized registers
|`dmfc2`     |MIPS3       |❌|COP2 has quadword sized registers
|`dmtc2`     |MIPS3       |❌|COP2 has quadword sized registers
|`dmfc3`     |MIPS3       |❌|EE doesn't have a COP3
|`dmtc3`     |MIPS3       |❌|EE doesn't have a COP3
|`pref`      |MIPS4       |✅|Backported from MIPS4
|`movn`      |MIPS4       |✅|EE has conditional move instructions from MIPS4
|`movz`      |MIPS4       |✅|EE has conditional move instructions from MIPS4
|`madd`      |EE Core     |✅|Actually the same as in MIPS32 (to be checked though)
|`maddu`     |EE Core     |✅|Actually the same as in MIPS32 (to be checked though)
|`mult`      |EE Core     |✅|Actually from MIPS1, but EE supports an extra argument
|`multu`     |EE Core     |✅|Actually from MIPS1, but EE supports an extra argument
|`di`        |EE Core     |✅|These weren't actually standardized until MIPS32, so the encoding is different
|`ei`        |EE Core     |✅|These weren't actually standardized until MIPS32, so the encoding is different
|`mfbpc`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfdab`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfdabm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfdvb`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfdvbm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfiab`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfiabm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfpc`      |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mfps`      |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtbpc`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtdab`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtdabm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtdvb`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtdvbm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtiab`     |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtiabm`    |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtpc`      |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`mtps`      |EE Core     |✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only
|`div1`      |EE Core     |✅|EE has an extra MUL/DIV unit
|`divu1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`mfhi1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`mflo1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`mthi1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`mtlo1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`madd1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`maddu1`    |EE Core     |✅|EE has an extra MUL/DIV unit
|`mult1`     |EE Core     |✅|EE has an extra MUL/DIV unit
|`multu1`    |EE Core     |✅|EE has an extra MUL/DIV unit
|`mfsa`      |MMI         |✅|EE has an extra register only used in MMI (but considered part of EE Core)
|`mtsa`      |MMI         |✅|EE has an extra register only used in MMI (but considered part of EE Core)
|`mtsab`     |MMI         |✅|EE has an extra register only used in MMI (but considered part of EE Core)
|`mtsah`     |MMI         |✅|EE has an extra register only used in MMI (but considered part of EE Core)
|`abs.s`     |MIPS1/COP1  |✅|
|`add.s`     |MIPS1/COP1  |✅|
|`c.eq.s`    |MIPS1/COP1  |✅|
|`c.f.s`     |MIPS1/COP1  |✅|
|`c.le.s`    |MIPS1/COP1  |✅|Actually is encoded as `c.ole.s`, but it doesn't make any difference (no NaN support)
|`c.lt.s`    |MIPS1/COP1  |✅|Actually is encoded as `c.olt.s`, but it doesn't make any difference (no NaN support)
|`cfc1`      |MIPS1/COP1  |✅|
|`ctc1`      |MIPS1/COP1  |✅|
|`cvt.s.w`   |MIPS1/COP1  |✅|
|`cvt.w.s`   |MIPS1/COP1  |✅|Actually behaves like `trunc.w.s`, rounding down the number
|`div.s`     |MIPS1/COP1  |✅|
|`lwc1`      |MIPS1/COP1  |✅|
|`mfc1`      |MIPS1/COP1  |✅|
|`mov.s`     |MIPS1/COP1  |✅|
|`mtc1`      |MIPS1/COP1  |✅|
|`mul.s`     |MIPS1/COP1  |✅|
|`neg.s`     |MIPS1/COP1  |✅|
|`sub.s`     |MIPS1/COP1  |✅|
|`swc1`      |MIPS1/COP1  |✅|
|`bc1f`      |MIPS1/COP1  |✅|
|`bc1t`      |MIPS1/COP1  |✅|
|`sqrt.s`    |MIPS2/COP1  |✅|
|`bc1fl`     |MIPS2/COP1  |✅|
|`bc1tl`     |MIPS2/COP1  |✅|
|`adda.s`    |EE Core/COP1|✅|
|`madd.s`    |EE Core/COP1|✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only, different from MIPS4 madd.s
|`madda.s`   |EE Core/COP1|✅|
|`max.s`     |EE Core/COP1|✅|
|`min.s`     |EE Core/COP1|✅|
|`msub.s`    |EE Core/COP1|✅|Incorrectly marked as MIPS1 in EE manual, they are actually EE only, different from MIPS4 msub.s
|`msuba.s`   |EE Core/COP1|✅|
|`mula.s`    |EE Core/COP1|✅|
|`rsqrt.s`   |EE Core/COP1|✅|Incorrectly marked as MIPS4 in EE manual, EE supports an extra argument, making it incompatible
|`suba.s`    |EE Core/COP1|✅|
|`c.un.s`    |MIPS1/COP1  |❌|
|`c.ueq.s`   |MIPS1/COP1  |❌|
|`c.olt.s`   |MIPS1/COP1  |❌|
|`c.ult.s`   |MIPS1/COP1  |❌|
|`c.ole.s`   |MIPS1/COP1  |❌|
|`c.ule.s`   |MIPS1/COP1  |❌|
|`c.sf.s`    |MIPS1/COP1  |❌|
|`c.ngle.s`  |MIPS1/COP1  |❌|
|`c.seq.s`   |MIPS1/COP1  |❌|
|`c.ngl.s`   |MIPS1/COP1  |❌|
|`c.nge.s`   |MIPS1/COP1  |❌|
|`c.ngt.s`   |MIPS1/COP1  |❌|
|`ceil.w.s`  |MIPS2/COP1  |❌|
|`floor.w.s` |MIPS2/COP1  |❔|The EE manual doesn't mention it, but GCC does supports it, assume it not supported
|`round.w.s` |MIPS2/COP1  |❔|The EE manual doesn't mention it, but GCC does supports it, assume it not supported
|`trunc.w.s` |MIPS2/COP1  |❌|
|`abs.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`add.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`c.f.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`c.un.d`    |MIPS1/COP1  |❌|COP1 is single precision
|`c.eq.d`    |MIPS1/COP1  |❌|COP1 is single precision
|`c.ueq.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.olt.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.ult.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.ole.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.ule.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.sf.d`    |MIPS1/COP1  |❌|COP1 is single precision
|`c.ngle.d`  |MIPS1/COP1  |❌|COP1 is single precision
|`c.seq.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.ngl.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.lt.d`    |MIPS1/COP1  |❌|COP1 is single precision
|`c.nge.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`c.le.d`    |MIPS1/COP1  |❌|COP1 is single precision
|`c.ngt.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`cvt.d.s`   |MIPS1/COP1  |❌|COP1 is single precision
|`cvt.d.w`   |MIPS1/COP1  |❌|COP1 is single precision
|`cvt.s.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`cvt.w.d`   |MIPS1/COP1  |❌|COP1 is single precision
|`div.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`mov.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`mul.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`neg.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`sub.d`     |MIPS1/COP1  |❌|COP1 is single precision
|`ceil.w.d`  |MIPS2/COP1  |❌|COP1 is single precision
|`floor.w.d` |MIPS2/COP1  |❌|COP1 is single precision
|`round.w.d` |MIPS2/COP1  |❌|COP1 is single precision
|`sqrt.d`    |MIPS2/COP1  |❌|COP1 is single precision
|`trunc.w.d` |MIPS2/COP1  |❌|COP1 is single precision
|`ldc1`      |MIPS2/COP1  |❌|COP1 is single precision
|`sdc1`      |MIPS2/COP1  |❌|COP1 is single precision
|`dmfc1`     |MIPS3/COP1  |❌|COP1 is single precision
|`dmtc1`     |MIPS3/COP1  |❌|COP1 is single precision