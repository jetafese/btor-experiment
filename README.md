# btor-experiment

## Build verification jobs for KLEE using CMake

1. Create a build directory
   ```bash
   $ mkdir build ; cd build
   ```
2. Configure with cmake
   ```bash
   $ cmake \
      -DCMAKE_C_COMPILER=clang-14 \
      -DCMAKE_CXX_COMPILER=clang++-14 \
      ../ -GNinja
   ```

3. Compile
   ```bash
   $ ninja
   ```
   or
   ```bash
   $ cmake --build .
   ```
Compiled bitcode files are placed under `build/jobs/<NAME>/llvm-ir/<NAME>.bc`

4. Run all tests
   ```bash
   $ ninja test
   ```
   or
   ```bash
   $ cmake --build . --target test
   ```
   or
   ```bash
   $ ctest
   ```
5. Run individual test
   ```bash
   $ ctest -R <TEST_NAME>
   ```
   To run all klee tests, the `<TEST_NAME>` is klee.

6. Run individual file manually
   ```bash
   $ klee [options] <BC_FILE> 
   ```
   The `<BC_FILE>` is located on `build/jobs/<NAME>/llvm-ir/<NAME>.klee.ir/<NAME>.bc`
