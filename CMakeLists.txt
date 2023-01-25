cmake_minimum_required(VERSION 3.18.4)
project(btor-experiment C CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/llvmir)
include(LLVMIRUtil)
include(CTest)

# Default is release with debug info
if(NOT CMAKE_BUILD_TYPE)
  set(
    CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING
    "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE
  )
endif()

set(LIB_DIR_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib)

########### CODE FOR ATTACHING BC and LINKING ##########
# linking
function(llvm_link name)
  set(options)
  set(oneValueArgs)
  set(multiValueArgs LINK OVERRIDE)
  cmake_parse_arguments(LLVMIR_ATTACH
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if(NOT LLVMIR_ATTACH_LINK)
    message(FATAL_ERROR "llvm_link: missing LINK option")
  endif()

  set(LLVMIR_TARGETS ${LLVMIR_ATTACH_LINK})
  set(LLVMIR_OVERRIDE_TARGETS ${LLVMIR_ATTACH_OVERRIDE})

  set(TRGT ${name})
  # use the first target as the main dependency
  list(GET LLVMIR_TARGETS 0 DEPENDS_TRGT)


    ## preamble
  foreach(IR ${LLVMIR_TARGETS})
    llvmir_check_target_properties(${IR})
  endforeach()

  set(OUT_LLVMIR_FILES "")
  set(FULL_OUT_LLVMIR_FILES "")

  get_property(IN_LLVMIR_TYPE TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_TYPE)
  get_property(LLVMIR_EXTERNAL_TYPE TARGET ${DEPENDS_TRGT}
    PROPERTY LLVMIR_EXTERNAL_TYPE)
  get_property(INFILES TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_FILES)
  get_property(IN_LLVMIR_DIR TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_DIR)
  get_property(LINKER_LANGUAGE TARGET ${DEPENDS_TRGT} PROPERTY LINKER_LANGUAGE)
  get_property(LINK_DEPENDS TARGET ${DEPENDS_TRGT} PROPERTY LINK_DEPENDS)
  get_property(LINK_FLAGS TARGET ${DEPENDS_TRGT} PROPERTY LINK_FLAGS)
  get_property(LINK_FLAGS_${CMAKE_BUILD_TYPE}
    TARGET ${DEPENDS_TRGT}
    PROPERTY LINK_FLAGS_${CMAKE_BUILD_TYPE})
  get_property(INTERFACE_LINK_LIBRARIES
    TARGET ${DEPENDS_TRGT}
    PROPERTY INTERFACE_LINK_LIBRARIES)
  get_property(LINK_LIBRARIES TARGET ${DEPENDS_TRGT} PROPERTY LINK_LIBRARIES)
  get_property(LINK_INTERFACE_LIBRARIES
    TARGET ${DEPENDS_TRGT}
    PROPERTY LINK_INTERFACE_LIBRARIES)
  get_property(LINK_INTERFACE_LIBRARIES_${CMAKE_BUILD_TYPE}
    TARGET ${DEPENDS_TRGT}
    PROPERTY LINK_INTERFACE_LIBRARIES_${CMAKE_BUILD_TYPE})
  get_property(SHORT_NAME TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_SHORT_NAME)

  if(NOT "${IN_LLVMIR_TYPE}" STREQUAL "${LLVMIR_BINARY_TYPE}")
    message(FATAL_ERROR "Cannot attach ${TRGT} to a ${IN_LLVMIR_TYPE} target.")
  endif()

  ## main operations
  set(WORK_DIR "${CMAKE_CURRENT_BINARY_DIR}/${LLVMIR_DIR}/${TRGT}")
  file(MAKE_DIRECTORY ${WORK_DIR})

  set(IN_FULL_LLVMIR_FILES "")
  foreach(IR ${LLVMIR_TARGETS})
    get_property(INFILES TARGET ${IR} PROPERTY LLVMIR_FILES)
    get_property(IN_LLVMIR_DIR TARGET ${IR} PROPERTY LLVMIR_DIR)
    foreach(IN_LLVMIR_FILE ${INFILES})
      list(APPEND IN_FULL_LLVMIR_FILES "${IN_LLVMIR_DIR}/${IN_LLVMIR_FILE}")
    endforeach()
  endforeach()

  get_property(IN_LLVMIR_LINK TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_LINK)
  foreach(IR ${IN_LLVMIR_LINK})
    get_property(INFILES TARGET ${IR} PROPERTY LLVMIR_FILES)
    get_property(IN_LLVMIR_DIR TARGET ${IR} PROPERTY LLVMIR_DIR)
    foreach(IN_LLVMIR_FILE ${INFILES})
      list(APPEND IN_FULL_LLVMIR_FILES "${IN_LLVMIR_DIR}/${IN_LLVMIR_FILE}")
    endforeach()
  endforeach()


  set(IN_FULL_LLVMIR_OVERIDE_FILES "")
  foreach(IR ${LLVMIR_OVERRIDE_TARGETS})
    get_property(INFILES TARGET ${IR} PROPERTY LLVMIR_FILES)
    get_property(IN_LLVMIR_DIR TARGET ${IR} PROPERTY LLVMIR_DIR)
    foreach(IN_LLVMIR_FILE ${INFILES})
      list(APPEND IN_FULL_LLVMIR_OVERRIDE_FILES "${IN_LLVMIR_DIR}/${IN_LLVMIR_FILE}")
    endforeach()
  endforeach()

  get_property(IN_LLVMIR_OVERRIDE TARGET ${DEPENDS_TRGT} PROPERTY LLVMIR_OVERRIDE)
  foreach(IR ${IN_LLVMIR_OVERRIDE})
    get_property(INFILES TARGET ${IR} PROPERTY LLVMIR_FILES)
    get_property(IN_LLVMIR_DIR TARGET ${IR} PROPERTY LLVMIR_DIR)
    foreach(IN_LLVMIR_FILE ${INFILES})
      list(APPEND IN_FULL_LLVMIR_OVERRIDE_FILES "${IN_LLVMIR_DIR}/${IN_LLVMIR_FILE}")
    endforeach()
  endforeach()

  set(IN_OVERRIDE_OPTIONS ${IN_FULL_LLVMIR_OVERRIDE_FILES})
  list(TRANSFORM IN_OVERRIDE_OPTIONS PREPEND "--override=" )

  set(FULL_OUT_LLVMIR_FILE "${WORK_DIR}/${TRGT}.${LLVMIR_BINARY_FMT_SUFFIX}")
  if(SHORT_NAME)
    set(FULL_OUT_LLVMIR_FILE
      "${WORK_DIR}/${SHORT_NAME}.${LLVMIR_BINARY_FMT_SUFFIX}")
  endif()
  get_filename_component(OUT_LLVMIR_FILE ${FULL_OUT_LLVMIR_FILE} NAME)

  list(APPEND OUT_LLVMIR_FILES ${OUT_LLVMIR_FILE})
  list(APPEND FULL_OUT_LLVMIR_FILES ${FULL_OUT_LLVMIR_FILE})

  # setup custom target
  add_custom_target(${TRGT} DEPENDS ${FULL_OUT_LLVMIR_FILES})

  set_property(TARGET ${TRGT} PROPERTY LLVMIR_TYPE ${LLVMIR_BINARY_TYPE})
  set_property(TARGET ${TRGT}
    PROPERTY LLVMIR_EXTERNAL_TYPE ${LLVMIR_EXTERNAL_TYPE})
  set_property(TARGET ${TRGT} PROPERTY LLVMIR_DIR ${WORK_DIR})
  set_property(TARGET ${TRGT} PROPERTY LLVMIR_FILES ${OUT_LLVMIR_FILES})
  set_property(TARGET ${TRGT} PROPERTY LINKER_LANGUAGE ${LINKER_LANGUAGE})
  set_property(TARGET ${TRGT} PROPERTY LINK_DEPENDS ${LINK_DEPENDS})
  set_property(TARGET ${TRGT} PROPERTY LINK_FLAGS ${LINK_FLAGS})
  set_property(TARGET ${TRGT}
    PROPERTY LINK_FLAGS_${CMAKE_BUILD_TYPE} ${LINK_FLAGS_${CMAKE_BUILD_TYPE}})
  set_property(TARGET ${TRGT}
    PROPERTY INTERFACE_LINK_LIBRARIES ${INTERFACE_LINK_LIBRARIES})
  set_property(TARGET ${TRGT}
    PROPERTY LINK_INTERFACE_LIBRARIES ${LINK_INTERFACE_LIBRARIES})
  set_property(TARGET ${TRGT}
    PROPERTY
    LINK_INTERFACE_LIBRARIES_${CMAKE_BUILD_TYPE}
    ${LINK_INTERFACE_LIBRARIES_${CMAKE_BUILD_TYPE}})
  set_property(TARGET ${TRGT} PROPERTY EXCLUDE_FROM_ALL OFF)
  set_property(TARGET ${TRGT} PROPERTY LLVMIR_SHORT_NAME ${SHORT_NAME})

  add_custom_command(OUTPUT ${FULL_OUT_LLVMIR_FILE}
    COMMAND ${LLVMIR_LINK}
    ARGS
    ${LLVMIR_ATTACH_UNPARSED_ARGUMENTS}
    -o ${FULL_OUT_LLVMIR_FILE} ${IN_FULL_LLVMIR_FILES} ${IN_OVERRIDE_OPTIONS}
    DEPENDS ${IN_FULL_LLVMIR_FILES} ${IN_FULL_LLVMIR_OVERRIDE_FILES}
    COMMENT "Linking LLVM bitcode ${OUT_LLVMIR_FILE}"
    VERBATIM)

  ## postamble
endfunction()

# bc
function(attach_bc name)
  set(options)
  set(oneValueArgs LINKER_LANGUAGE)
  set(multiValueArgs)
  cmake_parse_arguments(ARGS
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if (NOT ARGS_LINKER_LANGUAGE)
    set(ARGS_LINKER_LANGUAGE "C")
  endif()

  set(SOURCE_EXE ${name})
  set(TARGET_BC "${SOURCE_EXE}.ir")
  set(TARGET_OBJ "${SOURCE_EXE}.obj")

  # setup target with the options that we need
  set_target_properties(${SOURCE_EXE} PROPERTIES LINKER_LANGUAGE ${ARGS_LINKER_LANGUAGE})
  target_compile_options(${SOURCE_EXE} PUBLIC -O1 -Xclang -disable-llvm-optzns)
  target_compile_options(${SOURCE_EXE} PUBLIC -Wno-macro-redefined)
  target_compile_options(${SOURCE_EXE} PUBLIC -g)
  target_compile_options(${SOURCE_EXE} PUBLIC -fdeclspec)
  set_property(TARGET ${SOURCE_EXE} PROPERTY EXCLUDE_FROM_ALL ON)

  # convert ${SOURCE_EXE} target to llvm
  llvmir_attach_bc_target(TARGET ${TARGET_OBJ} DEPENDS ${SOURCE_EXE})
  set_property(TARGET ${TARGET_OBJ} PROPERTY EXCLUDE_FROM_ALL ON)

  get_property(IN_LLVMIR_LINK TARGET ${SOURCE_EXE} PROPERTY LLVMIR_LINK)
  get_property(IN_LLVMIR_OVERRIDE TARGET ${SOURCE_EXE} PROPERTY LLVMIR_OVERRIDE)
  set_property(TARGET ${TARGET_OBJ} PROPERTY LLVMIR_LINK ${IN_LLVMIR_LINK})
  set_property(TARGET ${TARGET_OBJ} PROPERTY LLVMIR_OVERRIDE ${IN_LLVMIR_OVERRIDE})
  # link all files of ${TARGET_OBJ} together
  # llvmir_attach_link_target(TARGET ${TARGET_BC} DEPENDS ${TARGET_OBJ})
  llvm_link(${TARGET_BC} LINK ${TARGET_OBJ})
  add_dependencies(${TARGET_BC} ${TARGET_OBJ})

  set_property(TARGET ${TARGET_BC} PROPERTY EXCLUDE_FROM_ALL OFF)
endfunction()

function(link_libraries target)
  set_property(TARGET ${target} APPEND PROPERTY LLVMIR_LINK ${ARGN})
endfunction()

function(attach_bc_link name)
  cmake_parse_arguments(ARG
    "EXCLUDE_FROM_ALL" "" "" ${ARGN})
  # For klee
  set(TARGET_KLEE "${name}.klee")
  add_executable(${TARGET_KLEE} ${ARG_UNPARSED_ARGUMENTS})
  link_libraries(${TARGET_KLEE} klee_lib.ir)
  attach_bc(${TARGET_KLEE})
  # TODO: for libfuzzer
  set(TARGET_LIBFUZZ "${name}.fuzz")
#   add_executable(${TARGET_LIBFUZZ} ${ARG_UNPARSED_ARGUMENTS})
#   link_libraries(${TARGET_LIBFUZZ} fuzz_lib.ir)
#   attach_bc(${TARGET_LIBFUZZ})
endfunction()

function(get_file_name VAR LLVMIR_TARGET)
  get_property(DIR TARGET ${LLVMIR_TARGET} PROPERTY LLVMIR_DIR)
  get_property(FILES TARGET ${LLVMIR_TARGET} PROPERTY LLVMIR_FILES)
  set(${VAR} "${DIR}/${FILES}" PARENT_SCOPE)
endfunction()

# Unit test for testing btor
function(add_btor_test TARGET)
  # For klee
  get_file_name(KLEEBC ${TARGET}.klee.ir)
  add_test(NAME "klee_${TARGET}_test" COMMAND klee --libc=uclibc --exit-on-error ${KLEEBC})
  # TODO: for libfuzzer
endfunction()
########### END ##########


add_subdirectory(lib)

# TODO: Add each job's subdirectory HERE
add_subdirectory(jobs/factorial)
add_subdirectory(jobs/2020-rast-p00)
add_subdirectory(jobs/2020-rast-p01)
add_subdirectory(jobs/2020-rast-p03)
add_subdirectory(jobs/2020-rast-p04)
add_subdirectory(jobs/2020-rast-p06)
add_subdirectory(jobs/2020-rast-p11)
add_subdirectory(jobs/intersymbol_analog_estimation_convergence)
