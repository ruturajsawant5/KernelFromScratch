

Ralf Brown's BIOS Interrupt List
https://www.ctyme.com/rbrown.htm

#binary output-->why processor dont understand executable
nasm -f bin ./boot.asm -o boot.bin

#generate 512 bytes boot.bin
#boot sign at 511 and 512

ndisasm boot.bin

-hda/-hdb file  use 'file' as hard disk 0/1 image
qemu-system-x86_64 -hda boot.bin