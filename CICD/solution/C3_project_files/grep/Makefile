CC=gcc
CFLAGS= -std=c11 -Wall -Werror -Wextra -c
OFLAG= -o
SRC=../src/grep
CL=../../materials/linters/.clang-format
ERRDR=../common/
CP=cp

all: s21_grep

s21_grep: s21_grep.o error_handeller.o
#	@$(CP) $(CL) .clang-format
#	@$(CP) $(CL) $(ERRDR).clang-format
#	@clang-format -i *.c
#	@clang-format -i *.h
#	@clang-format -i $(ERRDR)*.c
#	@clang-format -i $(ERRDR)*.h
	$(CC) s21_grep.o error_handeller.o $(OFLAG) s21_grep
#	@rm -f .clang-format
#	@rm -f $(ERRDR).clang-format
	@rm -f *.o
	@rm -f $(ERRDR)*.o

s21_grep.o: s21_grep.c s21_grep.h
	@$(CC) $(CFLAGS) s21_grep.c s21_grep.h

error_handeller.o: $(ERRDR)error_handeller.c $(ERRDR)error_handeller.h
	@$(CC) $(CFLAGS) $(ERRDR)error_handeller.c $(ERRDR)error_handeller.h

clear: clear_o clear_grep clear_cl

clear_cl:
	@rm -f .clang-format

clear_o:
	@rm -f *.o
	@rm -f $(ERRDR)*.o

clear_grep: clear_o
	rm -f s21_grep

rebuild: clear s21_grep
