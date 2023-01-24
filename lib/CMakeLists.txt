add_library(
  klee_lib
  nd_klee.c
)
attach_bc(klee_lib)