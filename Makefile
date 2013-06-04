boc: img
	bochs -q -f /home/maosuhan/workspace/nasm/mynix/mynix.bxrc	
img: bin
	dd if=/dev/zero of=empty.img bs=512 count=2880
	dd if=hello.bin of=mynix_fd.img bs=512 count=1
	dd of=mynix_fd.img if=empty.img seek=1 skip=1 bs=512 count=2879
	rm empty.img
bin:
	nasm hello.asm -l hello.lst -o hello.bin
