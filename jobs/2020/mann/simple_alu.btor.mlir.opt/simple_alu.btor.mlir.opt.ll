; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @__VERIFIER_error()

declare i16 @nd_bv16()

declare void @btor2mlir_print_input_num(i64, i64, i64)

declare i8 @nd_bv1()

declare void @btor2mlir_print_state_num(i64, i64, i64)

declare i8 @nd_bv4()

define void @main() !dbg !3 {
  %1 = call i8 @nd_bv4(), !dbg !7
  %2 = trunc i8 %1 to i4, !dbg !9
  br label %3, !dbg !10

3:                                                ; preds = %25, %0
  %4 = phi i4 [ %7, %25 ], [ %2, %0 ]
  %5 = phi i16 [ %8, %25 ], [ 0, %0 ]
  %6 = phi i1 [ false, %25 ], [ true, %0 ]
  %7 = select i1 %6, i4 0, i4 %4, !dbg !11
  %8 = add i16 %5, 1, !dbg !12
  %9 = call i8 @nd_bv1(), !dbg !13
  %10 = trunc i8 %9 to i1, !dbg !14
  %11 = call i16 @nd_bv16(), !dbg !15
  %12 = call i16 @nd_bv16(), !dbg !16
  %13 = add i16 %12, %11, !dbg !17
  %14 = sub i16 %12, %11, !dbg !18
  %15 = icmp ne i4 %4, 0, !dbg !19
  %16 = xor i1 %15, true, !dbg !20
  %17 = select i1 %16, i16 %13, i16 %14, !dbg !21
  %18 = icmp eq i16 %17, %13, !dbg !22
  %19 = icmp ugt i16 %5, 0, !dbg !23
  %20 = select i1 %19, i1 %18, i1 %10, !dbg !24
  %21 = xor i1 %20, true, !dbg !25
  %22 = select i1 %19, i1 true, i1 false, !dbg !26
  %23 = and i1 %22, %21, !dbg !27
  %24 = xor i1 %23, true, !dbg !28
  br i1 %24, label %25, label %26, !dbg !29

25:                                               ; preds = %3
  br label %3, !dbg !30

26:                                               ; preds = %3
  call void @__VERIFIER_error(), !dbg !31
  unreachable, !dbg !32
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !4, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "for-klee-hwmcc20/btor2/bv/2020/mann/simple_alu.btor.mlir.opt", directory: "/home/jetafese")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 11, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 12, column: 10, scope: !8)
!10 = !DILocation(line: 13, column: 5, scope: !8)
!11 = !DILocation(line: 16, column: 10, scope: !8)
!12 = !DILocation(line: 19, column: 11, scope: !8)
!13 = !DILocation(line: 21, column: 11, scope: !8)
!14 = !DILocation(line: 22, column: 11, scope: !8)
!15 = !DILocation(line: 23, column: 11, scope: !8)
!16 = !DILocation(line: 25, column: 11, scope: !8)
!17 = !DILocation(line: 27, column: 11, scope: !8)
!18 = !DILocation(line: 28, column: 11, scope: !8)
!19 = !DILocation(line: 30, column: 11, scope: !8)
!20 = !DILocation(line: 32, column: 11, scope: !8)
!21 = !DILocation(line: 33, column: 11, scope: !8)
!22 = !DILocation(line: 34, column: 11, scope: !8)
!23 = !DILocation(line: 36, column: 11, scope: !8)
!24 = !DILocation(line: 37, column: 11, scope: !8)
!25 = !DILocation(line: 39, column: 11, scope: !8)
!26 = !DILocation(line: 40, column: 11, scope: !8)
!27 = !DILocation(line: 41, column: 11, scope: !8)
!28 = !DILocation(line: 43, column: 11, scope: !8)
!29 = !DILocation(line: 44, column: 5, scope: !8)
!30 = !DILocation(line: 46, column: 5, scope: !8)
!31 = !DILocation(line: 48, column: 5, scope: !8)
!32 = !DILocation(line: 49, column: 5, scope: !8)
