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


uint8_t nd_bv1(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 2);
  return res;
}

uint8_t nd_bv2(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 4);
  return res;
}

uint8_t nd_bv3(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 8);
  return res;
}

uint8_t nd_bv4(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 16);
  return res;
}

uint8_t nd_bv5(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 32);
  return res;
}

uint8_t nd_bv6(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 64);
  return res;
}

uint8_t nd_bv7(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  klee_assume(res >= 0 && res < 128);
  return res;
}

uint8_t nd_bv8(void) {
  uint8_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint8_t");
  return res;
}

uint16_t nd_bv9(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 512);
  return res;
}

uint16_t nd_bv10(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 1024);
  return res;
}

uint16_t nd_bv11(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 2048);
  return res;
}

uint16_t nd_bv12(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 4096);
  return res;
}

uint16_t nd_bv13(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 8192);
  return res;
}

uint16_t nd_bv14(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 16384);
  return res;
}

uint16_t nd_bv15(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  klee_assume(res >= 0 && res < 32768);
  return res;
}

uint16_t nd_bv16(void) {
  uint16_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint16_t");
  return res;
}

uint32_t nd_bv17(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 131072);
  return res;
}

uint32_t nd_bv18(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 262144);
  return res;
}

uint32_t nd_bv19(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 524288);
  return res;
}

uint32_t nd_bv20(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 1048576);
  return res;
}

uint32_t nd_bv21(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 2097152);
  return res;
}

uint32_t nd_bv22(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 4194304);
  return res;
}

uint32_t nd_bv23(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 8388608);
  return res;
}

uint32_t nd_bv24(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 16777216);
  return res;
}

uint32_t nd_bv25(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 33554432);
  return res;
}

uint32_t nd_bv26(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 67108864);
  return res;
}

uint32_t nd_bv27(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 134217728);
  return res;
}

uint32_t nd_bv28(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 268435456);
  return res;
}

uint32_t nd_bv29(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 536870912);
  return res;
}

uint32_t nd_bv30(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 1073741824);
  return res;
}

uint32_t nd_bv31(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  klee_assume(res >= 0 && res < 2147483648);
  return res;
}

uint32_t nd_bv32(void) {
  uint32_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint32_t");
  return res;
}

uint64_t nd_bv33(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 8589934592);
  return res;
}

uint64_t nd_bv34(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 17179869184);
  return res;
}

uint64_t nd_bv35(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 34359738368);
  return res;
}

uint64_t nd_bv36(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 68719476736);
  return res;
}

uint64_t nd_bv37(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 137438953472);
  return res;
}

uint64_t nd_bv38(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 274877906944);
  return res;
}

uint64_t nd_bv39(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 549755813888);
  return res;
}

uint64_t nd_bv40(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 1099511627776);
  return res;
}

uint64_t nd_bv41(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 2199023255552);
  return res;
}

uint64_t nd_bv42(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 4398046511104);
  return res;
}

uint64_t nd_bv43(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 8796093022208);
  return res;
}

uint64_t nd_bv44(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 17592186044416);
  return res;
}

uint64_t nd_bv45(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 35184372088832);
  return res;
}

uint64_t nd_bv46(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 70368744177664);
  return res;
}

uint64_t nd_bv47(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 140737488355328);
  return res;
}

uint64_t nd_bv48(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 281474976710656);
  return res;
}

uint64_t nd_bv49(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 562949953421312);
  return res;
}

uint64_t nd_bv50(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 1125899906842624);
  return res;
}

uint64_t nd_bv51(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 2251799813685248);
  return res;
}

uint64_t nd_bv52(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 4503599627370496);
  return res;
}

uint64_t nd_bv53(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 9007199254740992);
  return res;
}

uint64_t nd_bv54(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 18014398509481984);
  return res;
}

uint64_t nd_bv55(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 36028797018963970);
  return res;
}

uint64_t nd_bv56(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 72057594037927940);
  return res;
}

uint64_t nd_bv57(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 144115188075855870);
  return res;
}

uint64_t nd_bv58(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 288230376151711740);
  return res;
}

uint64_t nd_bv59(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 576460752303423500);
  return res;
}

uint64_t nd_bv60(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 1152921504606847000);
  return res;
}

uint64_t nd_bv61(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 2305843009213694000);
  return res;
}
uint64_t nd_bv62(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 4611686018427388000);
  return res;
}

uint64_t nd_bv63(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  klee_assume(res >= 0 && res < 4611686018427388000*2ULL);
  return res;
}

uint64_t nd_bv64(void) {
  uint64_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint64_t");
  return res;
}

__uint128_t nd_bv128(void) {
  __uint128_t res;
  klee_make_symbolic(&res, sizeof(res), "res_uint128_t");
  return res;
}

void __VERIFIER_error(void) {
  klee_assert(0);
}