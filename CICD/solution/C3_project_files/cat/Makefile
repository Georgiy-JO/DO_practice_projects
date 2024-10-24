CC=gcc
CFLAGS= -std=c11 -Wall -Werror -Wextra -c
OFLAG= -o
SRC=../src/cat
CL=../../materials/linters/.clang-format
ERRDR=../common/
CP=cp

all: s21_cat

s21_cat: s21_cat.o  error_handeller.o
#	@$(CP) $(CL) .clang-format
#	@$(CP) $(CL) $(ERRDR).clang-format
#	@clang-format -i *.c
#	@clang-format -i *.h
#	@clang-format -i $(ERRDR)*.c
#	@clang-format -i $(ERRDR)*.h
	$(CC) s21_cat.o error_handeller.o $(OFLAG) s21_cat
#	@rm -f .clang-format
#	@rm -f $(ERRDR).clang-format
	@rm -f *.o
	@rm -f $(ERRDR)*.o

s21_cat.o: s21_cat.c s21_cat.h
	@$(CC) $(CFLAGS) s21_cat.c s21_cat.h

error_handeller.o: $(ERRDR)error_handeller.c $(ERRDR)error_handeller.h
	@$(CC) $(CFLAGS) $(ERRDR)error_handeller.c $(ERRDR)error_handeller.h

clear: clear_o clear_cat clear_cl

clear_cl:
	@rm -f .clang-format

clear_o:
	@rm -f *.o
	@rm -f $(ERRDR)*.o

clear_cat: clear_o
	rm -f s21_cat

rebuild: clear s21_cat
