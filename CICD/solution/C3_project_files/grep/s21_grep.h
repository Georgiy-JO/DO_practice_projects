#define _POSIX_C_SOURCE 200809L

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ENTER printf("\n")

typedef struct flags_list {
  int e;  // pattern flag + pattrn counter  // !+DONE+!
  int i;  // Ignore uppercase vs. lowercase  // !+DONE+!
  int v;  // Invert match  // !+DONE+!
  int c;  // Output count of matching lines only  // !+DONE+!
  int l;  // Output matching files only  // !+DONE+!
  int n;  // Precede each matching line with a line number  // !+DONE+!

  int h;  // Output matching lines without file names  //!+DONE+!
  int s;  // Suppress error messages about nonexistent or unreadable files  //
          // !+DONE+!
  int f;  // Take regexes from a file  //(useless)//!+DONE+!
  int o;  // Output the matched parts of a matching line //!+DONE+!

  int E;         //!+DONE+!
  int file_amo;  // used
} fl_ls;

int line_checker(const char *name, regex_t *exp, fl_ls flags);
regex_t *flag_finder(int argc, char **argv, fl_ls *flags);
char input_mask_adder(char *arg, fl_ls *flags, regex_t **masks);
char file_mask_adder(const char *f_name, fl_ls *flags, regex_t **masks);
void free_my_mask(const fl_ls *flags, regex_t **masks);
void flag_o_handeller(char *line, const char *file_name, fl_ls flags,
                      regex_t *musk, int line_num);