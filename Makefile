#detect if the system is windows or mac
ifeq ($(OS),Windows_NT)
	OS = Windows
else
	OS = $(shell uname -s)
endif

ifeq ($(OS),Windows)
all: *.cpp *.c *.h
	g++ -o nx2elf *.cpp *.c -lstdc++fs -std=c++17
clean:
	rm -f nx2elf.exe
	rm -f *.o
else
all: *.cpp *.c *.h
	g++ -o nx2elf *.cpp *.c -std=c++17 -Wno-deprecated-declarations -Wno-deprecated
clean:
	rm -f nx2elf
	rm -f *.o
endif
