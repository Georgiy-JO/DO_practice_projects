#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include <stdio.h>

typedef struct previous_symbols {
  int gen_1, gen_2;
} previous;

unsigned int flag_finder(int argc, char **argv);
void the_printer(const char *name, unsigned int flags, unsigned int *i,
                 previous *prev);