# CC := mips64r5900el-ps2-elf-gcc
# LD := mips64r5900el-ps2-elf-ld
CC := clang --target=mips64el-ps2-elf
LD := ld.lld
CFLAGS := -O0 -g

OBJDUMP := mips64r5900el-ps2-elf-objdump

OBJS = src/crt0.o src/syscalls.o src/main.o
EXE = src/main.elf

%.o: %.c
	$(CC) -c $(CFLAGS) $^ -o $@

%.o: %.S
	$(CC) -c $(CFLAGS) $^ -o $@

$(EXE): $(OBJS)
	$(LD) -nostdlib -T link.ld $(CFLAGS) $^ -o $(EXE)

.PHONY: clean
clean:
	rm -v src/*.o src/*.elf 2> /dev/null || true

.PHONY: run
run: $(EXE)
	${PCSX2_EXE} $(EXE)

.PHONY: dump
dump: $(EXE)
	$(OBJDUMP) -x -d $(EXE)
