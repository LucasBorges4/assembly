NOME = input

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
#  comentario
	rm -rf *.o

%.o: %.asm
	nasm -f elf64 $<