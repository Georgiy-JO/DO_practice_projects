#include "error_handeller.h"

void error_handeller(int flag) {
  switch (flag) {
    case -1:
      fprintf(stderr, "%s",
              "No such file or directory or the file is unopenable!\n");
      break;
    case -2:
      fprintf(stderr, "%s", "Illegal option! (Invalid flag.)\n");
      break;
    case -3:
      fprintf(stderr, "%s", "Memory issue.\n");
      break;
    case -4:
      fprintf(stderr, "%s", "Fatal regular expression Error.\n");
      break;
    case -5:  // elsewhere handled flag
      break;
    case -6:
      fprintf(stderr, "%s", "Expression file error. File not found.\n");
      break;
    default:
      fprintf(stderr, "%s", "Unknown Error!\n");
      break;
  }
}