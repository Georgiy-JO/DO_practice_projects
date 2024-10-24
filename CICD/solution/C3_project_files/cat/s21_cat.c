#include "s21_cat.h"

#include "../common/error_handeller.h"

int main(int argc, char *argv[]) {
  unsigned int flagls = flag_finder(argc, argv);
  if (flagls == 0)
    error_handeller(-2);
  else {
    previous prev = {'\n', '\0'};
    for (unsigned int i = optind, lines = 1; (int)i < argc; i++) {
      the_printer(argv[i], flagls, &lines, &prev);
      if (lines == 0) {
        error_handeller(-1);
        break;
      }
    }
  }
  return 0;
}

void the_printer(const char *name, unsigned int flags, unsigned int *i,
                 previous *prev) {
  FILE *file = 0;
  file = fopen(name, "r");
  if (file == NULL) {
    *i = 0;
  } else {
    int sim;
    while (!feof(file) && (sim = getc(file)) != EOF) {
      if (flags % 5 == 0 && prev->gen_1 == '\n' && sim == '\n' &&
          prev->gen_2 == '\n')
        continue;

      if (flags % 3 == 0 && prev->gen_1 == '\n') {
        printf("%6u\t", *i);
        (*i)++;
      }
      if (flags % 2 == 0 && sim != '\n' && prev->gen_1 == '\n') {
        printf("%6u\t", *i);
        (*i)++;
      }

      if (flags % 7 == 0 &&
          ((sim >= 0 && sim <= 31 && sim != '\t' && sim != '\n') ||
           (sim >= 127 && sim < 160))) {
        if (sim - 128 >= 0 && sim - 128 < 32)
          printf("M-^%c", sim - 128 + 64);
        else if (sim == 127)
          printf("^%c", sim - 128 + 64);
        else
          printf("^%c", sim + 64);
      } else if (flags % 13 == 0 && sim == '\t') {
        printf("^%c", sim + 64);
      } else if (sim == '\n') {
        if (flags % 11 == 0)
          printf("$\n");
        else
          printf("\n");
      } else
        printf("%c", sim);

      prev->gen_2 = prev->gen_1;
      prev->gen_1 = sim;
    }
    fclose(file);
  }
}

unsigned int flag_finder(int argc, char **argv) {
  unsigned int flag = 1;
  static struct option longies[] = {{"number-nonblank", no_argument, 0, 'b'},
                                    {"squeeze-blank", no_argument, 0, 's'},
                                    {"number", no_argument, 0, 'n'},
                                    {0, 0, 0, 0}};
  int why_index = 0;
  char switcher;
  while ((switcher =
              getopt_long(argc, argv, ":benstETv", longies, &why_index)) >= 0) {
    switch (switcher) {
      case 'b':
        if (flag % 2 != 0) flag *= 2;
        if (flag % 3 == 0) flag /= 3;
        break;
      case 'e':
        if (flag % 11 != 0) flag *= 11;
        if (flag % 7 != 0) flag *= 7;
        break;
      case 'n':
        if (flag % 2 != 0)
          if (flag % 3 != 0) flag *= 3;
        break;
      case 's':
        if (flag % 5 != 0) flag *= 5;
        break;
      case 't':
        if (flag % 13 != 0) flag *= 13;
        if (flag % 7 != 0) flag *= 7;
        break;
      case 'E':
        if (flag % 11 != 0) flag *= 11;
        break;
      case 'T':
        if (flag % 13 != 0) flag *= 13;
        break;
      case 'v':
        if (flag % 7 != 0) flag *= 7;
        break;
      default:
        flag = 0;
        break;
    }
    if (flag == 0) break;
  }
  return (flag == 1) ? 17 : flag;
}
