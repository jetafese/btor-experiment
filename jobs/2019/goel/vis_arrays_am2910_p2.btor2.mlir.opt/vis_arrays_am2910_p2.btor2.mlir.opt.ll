; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @__VERIFIER_error()

declare i16 @nd_bv12()

declare i8 @nd_bv1()

declare void @btor2mlir_print_input_num(i64, i64, i64)

declare i8 @nd_bv4()

define void @main() !dbg !3 {
  br label %1, !dbg !7

1:                                                ; preds = %76, %0
  %2 = phi i1 [ true, %76 ], [ false, %0 ]
  %3 = phi i3 [ %4, %76 ], [ 0, %0 ]
  %4 = phi i3 [ %46, %76 ], [ 0, %0 ]
  %5 = phi i12 [ %67, %76 ], [ 0, %0 ]
  %6 = call i8 @nd_bv4(), !dbg !9
  %7 = trunc i8 %6 to i4, !dbg !10
  %8 = icmp eq i4 %7, 0, !dbg !11
  %9 = select i1 %8, i3 0, i3 %4, !dbg !12
  %10 = add i3 %4, 1, !dbg !13
  %11 = icmp ne i3 %4, -3, !dbg !14
  %12 = icmp eq i4 %7, 5, !dbg !15
  %13 = icmp eq i4 %7, 4, !dbg !16
  %14 = icmp eq i4 %7, 1, !dbg !17
  %15 = call i8 @nd_bv1(), !dbg !18
  %16 = trunc i8 %15 to i1, !dbg !19
  %17 = xor i1 %16, true, !dbg !20
  %18 = call i8 @nd_bv1(), !dbg !21
  %19 = trunc i8 %18 to i1, !dbg !22
  %20 = and i1 %19, %17, !dbg !23
  %21 = xor i1 %20, true, !dbg !24
  %22 = and i1 %21, %14, !dbg !25
  %23 = or i1 %22, %13, !dbg !26
  %24 = or i1 %23, %12, !dbg !27
  %25 = and i1 %24, %11, !dbg !28
  %26 = select i1 %25, i3 %10, i3 %9, !dbg !29
  %27 = sub i3 %4, 1, !dbg !30
  %28 = icmp ne i3 %4, 0, !dbg !31
  %29 = icmp eq i4 %7, -1, !dbg !32
  %30 = icmp eq i4 %7, -8, !dbg !33
  %31 = or i1 %30, %29, !dbg !34
  %32 = icmp ne i12 %5, 0, !dbg !35
  %33 = xor i1 %32, true, !dbg !36
  %34 = and i1 %33, %31, !dbg !37
  %35 = icmp eq i4 %7, -1, !dbg !38
  %36 = icmp eq i4 %7, -3, !dbg !39
  %37 = icmp eq i4 %7, -5, !dbg !40
  %38 = icmp eq i4 %7, -6, !dbg !41
  %39 = or i1 %38, %37, !dbg !42
  %40 = or i1 %39, %36, !dbg !43
  %41 = or i1 %40, %35, !dbg !44
  %42 = xor i1 %20, true, !dbg !45
  %43 = and i1 %42, %41, !dbg !46
  %44 = or i1 %43, %34, !dbg !47
  %45 = and i1 %44, %28, !dbg !48
  %46 = select i1 %45, i3 %27, i3 %26, !dbg !49
  %47 = sub i12 %5, 1, !dbg !50
  %48 = call i8 @nd_bv1(), !dbg !51
  %49 = trunc i8 %48 to i1, !dbg !52
  %50 = icmp eq i4 %7, -1, !dbg !53
  %51 = icmp eq i4 %7, -7, !dbg !54
  %52 = icmp eq i4 %7, -8, !dbg !55
  %53 = or i1 %52, %51, !dbg !56
  %54 = or i1 %53, %50, !dbg !57
  %55 = and i1 %32, %54, !dbg !58
  %56 = and i1 %55, %49, !dbg !59
  %57 = select i1 %56, i12 %47, i12 %5, !dbg !60
  %58 = call i16 @nd_bv12(), !dbg !61
  %59 = trunc i16 %58 to i12, !dbg !62
  %60 = xor i1 %49, true, !dbg !63
  %61 = icmp eq i4 %7, 4, !dbg !64
  %62 = xor i1 %20, true, !dbg !65
  %63 = and i1 %62, %61, !dbg !66
  %64 = icmp eq i4 %7, -4, !dbg !67
  %65 = or i1 %64, %63, !dbg !68
  %66 = or i1 %65, %60, !dbg !69
  %67 = select i1 %66, i12 %59, i12 %57, !dbg !70
  %68 = icmp eq i3 %4, -1, !dbg !71
  %69 = icmp ne i3 %3, -2, !dbg !72
  %70 = icmp eq i1 %2, false, !dbg !73
  %71 = or i1 %70, %69, !dbg !74
  %72 = or i1 %71, %68, !dbg !75
  %73 = xor i1 %72, true, !dbg !76
  %74 = and i1 true, %73, !dbg !77
  %75 = xor i1 %74, true, !dbg !78
  br i1 %75, label %76, label %77, !dbg !79

76:                                               ; preds = %1
  br label %1, !dbg !80

77:                                               ; preds = %1
  call void @__VERIFIER_error(), !dbg !81
  unreachable, !dbg !82
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !4, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "for-klee-hwmcc20/btor2/bv/2019/goel/vis_arrays_am2910_p2.btor2.mlir.opt", directory: "/home/jetafese")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 11, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 16, column: 11, scope: !8)
!10 = !DILocation(line: 17, column: 11, scope: !8)
!11 = !DILocation(line: 18, column: 11, scope: !8)
!12 = !DILocation(line: 19, column: 11, scope: !8)
!13 = !DILocation(line: 21, column: 11, scope: !8)
!14 = !DILocation(line: 23, column: 11, scope: !8)
!15 = !DILocation(line: 25, column: 11, scope: !8)
!16 = !DILocation(line: 27, column: 11, scope: !8)
!17 = !DILocation(line: 29, column: 11, scope: !8)
!18 = !DILocation(line: 30, column: 11, scope: !8)
!19 = !DILocation(line: 31, column: 11, scope: !8)
!20 = !DILocation(line: 33, column: 11, scope: !8)
!21 = !DILocation(line: 34, column: 11, scope: !8)
!22 = !DILocation(line: 35, column: 11, scope: !8)
!23 = !DILocation(line: 36, column: 11, scope: !8)
!24 = !DILocation(line: 38, column: 11, scope: !8)
!25 = !DILocation(line: 39, column: 11, scope: !8)
!26 = !DILocation(line: 40, column: 11, scope: !8)
!27 = !DILocation(line: 41, column: 11, scope: !8)
!28 = !DILocation(line: 42, column: 11, scope: !8)
!29 = !DILocation(line: 43, column: 11, scope: !8)
!30 = !DILocation(line: 44, column: 11, scope: !8)
!31 = !DILocation(line: 45, column: 11, scope: !8)
!32 = !DILocation(line: 47, column: 11, scope: !8)
!33 = !DILocation(line: 49, column: 11, scope: !8)
!34 = !DILocation(line: 50, column: 11, scope: !8)
!35 = !DILocation(line: 52, column: 11, scope: !8)
!36 = !DILocation(line: 54, column: 11, scope: !8)
!37 = !DILocation(line: 55, column: 11, scope: !8)
!38 = !DILocation(line: 56, column: 11, scope: !8)
!39 = !DILocation(line: 58, column: 11, scope: !8)
!40 = !DILocation(line: 60, column: 11, scope: !8)
!41 = !DILocation(line: 62, column: 11, scope: !8)
!42 = !DILocation(line: 63, column: 11, scope: !8)
!43 = !DILocation(line: 64, column: 11, scope: !8)
!44 = !DILocation(line: 65, column: 11, scope: !8)
!45 = !DILocation(line: 67, column: 11, scope: !8)
!46 = !DILocation(line: 68, column: 11, scope: !8)
!47 = !DILocation(line: 69, column: 11, scope: !8)
!48 = !DILocation(line: 70, column: 11, scope: !8)
!49 = !DILocation(line: 71, column: 11, scope: !8)
!50 = !DILocation(line: 73, column: 11, scope: !8)
!51 = !DILocation(line: 74, column: 11, scope: !8)
!52 = !DILocation(line: 75, column: 11, scope: !8)
!53 = !DILocation(line: 76, column: 11, scope: !8)
!54 = !DILocation(line: 78, column: 11, scope: !8)
!55 = !DILocation(line: 79, column: 11, scope: !8)
!56 = !DILocation(line: 80, column: 11, scope: !8)
!57 = !DILocation(line: 81, column: 11, scope: !8)
!58 = !DILocation(line: 82, column: 11, scope: !8)
!59 = !DILocation(line: 83, column: 11, scope: !8)
!60 = !DILocation(line: 84, column: 11, scope: !8)
!61 = !DILocation(line: 85, column: 11, scope: !8)
!62 = !DILocation(line: 86, column: 11, scope: !8)
!63 = !DILocation(line: 88, column: 11, scope: !8)
!64 = !DILocation(line: 89, column: 11, scope: !8)
!65 = !DILocation(line: 91, column: 11, scope: !8)
!66 = !DILocation(line: 92, column: 11, scope: !8)
!67 = !DILocation(line: 94, column: 11, scope: !8)
!68 = !DILocation(line: 95, column: 11, scope: !8)
!69 = !DILocation(line: 96, column: 11, scope: !8)
!70 = !DILocation(line: 97, column: 11, scope: !8)
!71 = !DILocation(line: 99, column: 11, scope: !8)
!72 = !DILocation(line: 101, column: 11, scope: !8)
!73 = !DILocation(line: 103, column: 11, scope: !8)
!74 = !DILocation(line: 104, column: 11, scope: !8)
!75 = !DILocation(line: 105, column: 11, scope: !8)
!76 = !DILocation(line: 107, column: 12, scope: !8)
!77 = !DILocation(line: 108, column: 12, scope: !8)
!78 = !DILocation(line: 110, column: 12, scope: !8)
!79 = !DILocation(line: 111, column: 5, scope: !8)
!80 = !DILocation(line: 113, column: 5, scope: !8)
!81 = !DILocation(line: 115, column: 5, scope: !8)
!82 = !DILocation(line: 116, column: 5, scope: !8)
