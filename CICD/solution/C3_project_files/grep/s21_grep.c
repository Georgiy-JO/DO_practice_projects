#include "s21_grep.h"

#include "../common/error_handeller.h"

int main(int argc, char *argv[]) {
  fl_ls flags = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  regex_t *masks = flag_finder(argc, argv, &flags);
  if (masks) {
    flags.file_amo = argc - optind;
    for (int i = optind, length; i < argc; i++) {
      if ((length = line_checker(argv[i], masks, flags)) == -1) {
        if (flags.s != 1) error_handeller(length);
        continue;
      }
      if (flags.c == 1 || flags.l == 1) {
        if (flags.l != 1) {
          if (flags.file_amo > 1 && flags.h != 1) printf("%s:", argv[i]);
          printf("%d", length);
        } else if (length == 0)
          continue;
        else
          printf("%s", argv[i]);
        /*if ((i + 1) != argc)*/ ENTER;
      }
    }
    free_my_mask(&flags, &masks);
  }
  return 0;
}

int line_checker(const char *name, regex_t *exp, fl_ls flags) {
  FILE *file = 0;
  file = fopen(name, "r");
  int error_and_counter = 0;
  if (file == NULL) {
    error_and_counter = -1;
  } else {
    char *line = NULL;
    size_t line_len = 0;
    for (int flag_found, line_number = 1; getline(&line, &line_len, file) > 0;
         line_number++) {
      flag_found = 0;
      int temp = strlen(line) - 1;
      if (line[temp] == '\n' || line[temp] == EOF) line[temp] = '\0';
      for (int i = 0; i < flags.e; i++) {
        if (flags.v == 1) {
          if (!regexec(&exp[i], line, 0, NULL, 0)) break;
          if (i + 1 == flags.e) {
            flag_found = 1;
          }
        } else {
          if (!regexec(&exp[i], line, 0, NULL, 0)) {
            flag_found = 1;
            break;
          }
        }
      }
      if (flag_found == 1) {
        if (flags.c == 1 || flags.l == 1) {
          error_and_counter++;
        } else {
          if (flags.o == 1) {
            if (flags.v == 0)
              flag_o_handeller(line, name, flags, exp, line_number);
          } else {
            if (flags.file_amo > 1 && flags.h != 1) printf("%s:", name);
            if (flags.n == 1) printf("%d:", line_number);
            printf("%s\n", line);
          }
        }
      }
    }
    free(line);
    line = NULL;
    fclose(file);
  }
  return error_and_counter;
}

void flag_o_handeller(char *line, const char *file_name, fl_ls flags,
                      regex_t *musk, int line_num) {
  int delta;
  char temp[strlen(line)];
  regmatch_t match[10], close_match[1];
  close_match[0].rm_so = strlen(line) + 1;
  while (close_match[0].rm_so != (int)strlen(line)) {
    close_match[0].rm_so = strlen(line);
    for (int i = 0; i < flags.e; i++) {
      if (!regexec(&musk[i], line, 10, match, 0) &&
          match[0].rm_so < close_match[0].rm_so)
        close_match[0] = match[0];
    }

    if (close_match[0].rm_so != (int)strlen(line)) {
      delta = close_match[0].rm_eo;
      if (flags.file_amo > 1 && flags.h != 1) printf("%s:", file_name);
      if (flags.n == 1) printf("%d:", line_num);
      for (int i = close_match[0].rm_so; i < close_match[0].rm_eo; i++) {
        printf("%c", line[i]);
      }
      printf("\n");
      // printf("%.*s\n", (close_match[0].rm_eo - close_match[0].rm_so), (line +
      // close_match[0].rm_so));
      strcpy(temp, &line[delta]);
      strcpy(line, temp);
      if (close_match[0].rm_eo == '\0') break;
    }
  }
}

regex_t *flag_finder(int argc, char **argv, fl_ls *flags) {
  regex_t *masks = NULL;
  char switcher, flag_error = 0;
  for (opterr = 0;
       (switcher = getopt_long(argc, argv, "e:vclnhsf:oiE", 0, 0)) >= 0;) {
    if (switcher == 'i') flags->i = REG_ICASE;
    if (switcher == 'E') flags->E = REG_EXTENDED;
  }
  for (optind = 1, opterr = 1;
       (switcher = getopt_long(argc, argv, "e:vclnhsf:oiE", 0, 0)) >= 0 &&
       flag_error == 0;) {
    switch (switcher) {
      case 'e':
        flag_error = input_mask_adder(optarg, flags, &masks);
        break;
      case 'v':
        flags->v = 1;
        break;
      case 'c':
        flags->c = 1;
        break;
      case 'o':
        flags->o = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 'l':
        flags->l = 1;
        break;
      case 'h':
        flags->h = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 'f':
        flag_error = file_mask_adder(optarg, flags, &masks);
        break;
      default:
        if (switcher != 'i' && switcher != 'E') flag_error = 1;  // wrong flags
        break;
    }
  }
  if (flags->e == 0) {
    flag_error = input_mask_adder(argv[optind], flags, &masks);
    optind++;
  }
  if (flag_error == 1 && flags->e != 0) free_my_mask(flags, &masks);
  return masks;
}

void free_my_mask(const fl_ls *flags, regex_t **masks) {
  for (int i = 0; i < (flags->e); i++) {
    regfree(&(*masks)[i]);
  }
  free(*masks);
  *masks = NULL;
}

char input_mask_adder(char *arg, fl_ls *flags, regex_t **masks) {
  (flags->e)++;
  *masks = (regex_t *)realloc(*masks, (flags->e) * sizeof(regex_t));
  if (regcomp(&(*masks)[(flags->e) - 1], arg, flags->i | flags->E)) {
    error_handeller(-4);
    return 1;
  }
  return 0;
}

char file_mask_adder(const char *f_name, fl_ls *flags, regex_t **masks) {
  int f_error = 0;
  (flags->f) = 1;
  FILE *file = fopen(f_name, "r");
  if (!file) {
    error_handeller(-6);
    f_error = 1;
  } else {
    char *line = NULL;
    size_t line_len = 0;
    long line_count = 0;
    for (; getline(&line, &line_len, file) > 0;) {
      line_count++;
    }
    fseek(file, 0, SEEK_SET);
    *masks =
        (regex_t *)realloc(*masks, ((flags->e) + line_count) * sizeof(regex_t));
    for (int tmp; getline(&line, &line_len, file) > 0 && f_error == 0;
         (flags->e)++) {
      tmp = strlen(line);
      if (line[tmp - 1] == '\n' || line[tmp - 1] == EOF) line[tmp - 1] = '\0';
      if (regcomp(&(*masks)[flags->e], line, flags->i | flags->E)) {
        error_handeller(-4);
        f_error = 1;
      }
    }

    free(line);
    line = NULL;
    fclose(file);
  }
  return f_error;
}
