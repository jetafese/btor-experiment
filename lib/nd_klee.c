#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

/* #######################################
   #      The KLEE Function Declaration      #
   #######################################
 *  The following declarations are borrowed from
 *  https://github.com/klee/klee/blob/master/include/klee/klee.h
 *  We only put some functions that we used for running KLEE.
 */

/* klee_make_symbolic - Make the contents of the object pointer to by \arg
   * addr symbolic.
   *
   * \arg addr - The start of the object.
   * \arg nbytes - The number of bytes to make symbolic; currently this *must*
   * be the entire contents of the object.
   * \arg name - A name used for identifying the object in messages, output
   * files, etc. If NULL, object is called "unnamed".
   E.g.
   int a;
   klee_make_symbolic(&a, sizeof(a), "name_for_a");
*/
extern void klee_make_symbolic(void *addr, size_t nbytes, const char *name);

/* klee_range - Construct a symbolic value in the signed interval
  * [begin,end).
  *
  * \arg name - A name used for identifying the object in messages, output
  * files, etc. If NULL, object is called "unnamed".
*/
extern int klee_range(int begin, int end, const char *name);

/*  klee_int - Construct an unconstrained symbolic integer.
  *
  * \arg name - An optional name, used for identifying the object in messages,
  * output files, etc.
*/
extern int klee_int(const char *name);

/**
 * klee_assume - Constrain the values symbolic variables can take.
 * \arg condition - the constraint for symbolic variables
 */
extern void klee_assume(uintptr_t condition);

/* klee_assert - Special klee assert macro. 
  * this assert should be used when path consistency
  * across platforms is desired (e.g., in tests).
  * NB: __assert_fail is a klee "special" function
*/
extern void __assert_fail (const char *__assertion, const char *__file,
			   unsigned int __line, const char *__function);
# define klee_assert(expr)                                            \
  ((expr)                                                             \
   ? (void) (0)                                                       \
   : __assert_fail (#expr, __FILE__, __LINE__, __PRETTY_FUNCTION__))  \


uint8_t nd_bv4(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 16);

  return res;
}

uint8_t nd_bv8(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");

  return res;
}

void verifier_error(void) {
  klee_assert(0);
}