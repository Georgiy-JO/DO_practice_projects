CC = gcc
FLGS = -Werror -Wextra -Wall
LIB = -lfcgi

OUTPUT = theApp
# SRC_FILES = $(shell find ./ -type file -name '*.c')
SRC_FILES = *.c
OBJECT_FILES =$(SRC_FILES:.c=.o)

all: $(OUTPUT)

$(OUTPUT): $(OBJECT_FILES)
	$(CC) $(FLGS) $< -o $(OUTPUT) $(LIB)
	rm -f *.o

%.o: %.c
	$(CC) $(FLGS) -c $< -o $@

clang_me:
	clang-format --style=Google -i *.c

clear: 
	rm -f *.o $(OUTPUT)

rebuild: clear all

.PHONY: all theApp clear rebuild
