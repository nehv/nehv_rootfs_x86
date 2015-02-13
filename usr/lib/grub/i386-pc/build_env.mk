TARGET_CC=gcc-4.4
TARGET_CFLAGS=-ffreestanding  -Os -DGRUB_MACHINE_PCBIOS=1 -DMACHINE=I386_PC -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes                -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -DUSE_ASCII_FAILBACK=1 -DHAVE_UNIFONT_WIDTHSPEC=1
TARGET_ASFLAGS=-nostdinc -fno-builtin  -Os -DGRUB_MACHINE_PCBIOS=1 -DMACHINE=I386_PC -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes                -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -m32
TARGET_CPPFLAGS=-nostdinc -isystem /usr/lib/gcc/i486-linux-gnu/4.4.5/include -I../../include -I. -I./include -Wall -W -I/usr/lib/grub/i386-pc -I/usr/include
STRIP=strip
OBJCONV=
TARGET_MODULE_FORMAT=elf32
TARGET_APPLE_CC=0
COMMON_ASFLAGS=
COMMON_CFLAGS=-mrtd -mregparm=3 -I/home/jenkins/workspace/vyatta-grub/build/squeeze32devel/debian/grub-extras/zfs/include
COMMON_LDFLAGS=
