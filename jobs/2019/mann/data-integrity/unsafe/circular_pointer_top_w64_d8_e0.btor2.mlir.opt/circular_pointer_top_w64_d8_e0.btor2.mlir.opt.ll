; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @verifier_error()

declare i1 @nd_bv1()

declare i5 @nd_bv5()

declare i64 @nd_bv64()

define void @main() !dbg !3 {
  %1 = call i64 @nd_bv64(), !dbg !7
  %2 = call i5 @nd_bv5(), !dbg !9
  %3 = call i64 @nd_bv64(), !dbg !10
  %4 = call i64 @nd_bv64(), !dbg !11
  %5 = call i64 @nd_bv64(), !dbg !12
  %6 = call i64 @nd_bv64(), !dbg !13
  %7 = call i64 @nd_bv64(), !dbg !14
  %8 = call i64 @nd_bv64(), !dbg !15
  %9 = call i64 @nd_bv64(), !dbg !16
  %10 = call i64 @nd_bv64(), !dbg !17
  %11 = call i5 @nd_bv5(), !dbg !18
  %12 = call i1 @nd_bv1(), !dbg !19
  %13 = call i1 @nd_bv1(), !dbg !20
  %14 = call i5 @nd_bv5(), !dbg !21
  %15 = call i64 @nd_bv64(), !dbg !22
  %16 = call i5 @nd_bv5(), !dbg !23
  br label %17, !dbg !24

17:                                               ; preds = %173, %0
  %18 = phi i64 [ %43, %173 ], [ %1, %0 ]
  %19 = phi i5 [ %50, %173 ], [ %2, %0 ]
  %20 = phi i64 [ %54, %173 ], [ %3, %0 ]
  %21 = phi i64 [ %58, %173 ], [ %4, %0 ]
  %22 = phi i64 [ %62, %173 ], [ %5, %0 ]
  %23 = phi i64 [ %66, %173 ], [ %6, %0 ]
  %24 = phi i64 [ %70, %173 ], [ %7, %0 ]
  %25 = phi i64 [ %74, %173 ], [ %8, %0 ]
  %26 = phi i64 [ %78, %173 ], [ %9, %0 ]
  %27 = phi i64 [ %84, %173 ], [ %10, %0 ]
  %28 = phi i5 [ %89, %173 ], [ %11, %0 ]
  %29 = phi i1 [ %95, %173 ], [ %12, %0 ]
  %30 = phi i1 [ %114, %173 ], [ %13, %0 ]
  %31 = phi i5 [ %119, %173 ], [ %14, %0 ]
  %32 = phi i64 [ %122, %173 ], [ %15, %0 ]
  %33 = phi i1 [ false, %173 ], [ true, %0 ]
  %34 = phi i5 [ %126, %173 ], [ %16, %0 ]
  %35 = call i64 @nd_bv64(), !dbg !25
  %36 = lshr i5 %34, 0, !dbg !26
  %37 = trunc i5 %36 to i4, !dbg !27
  %38 = icmp eq i4 %37, -8, !dbg !28
  %39 = call i1 @nd_bv1(), !dbg !29
  %40 = and i1 %39, %38, !dbg !30
  %41 = select i1 %40, i64 %35, i64 %18, !dbg !31
  %42 = call i1 @nd_bv1(), !dbg !32
  %43 = select i1 %42, i64 0, i64 %41, !dbg !33
  %44 = call i1 @nd_bv1(), !dbg !34
  %45 = zext i1 %44 to i5, !dbg !35
  %46 = add i5 %19, %45, !dbg !36
  %47 = or i1 %39, %44, !dbg !37
  %48 = or i1 %47, %42, !dbg !38
  %49 = select i1 %48, i5 %46, i5 %19, !dbg !39
  %50 = select i1 %42, i5 0, i5 %49, !dbg !40
  %51 = icmp eq i4 %37, 7, !dbg !41
  %52 = and i1 %39, %51, !dbg !42
  %53 = select i1 %52, i64 %35, i64 %20, !dbg !43
  %54 = select i1 %42, i64 0, i64 %53, !dbg !44
  %55 = icmp eq i4 %37, 6, !dbg !45
  %56 = and i1 %39, %55, !dbg !46
  %57 = select i1 %56, i64 %35, i64 %21, !dbg !47
  %58 = select i1 %42, i64 0, i64 %57, !dbg !48
  %59 = icmp eq i4 %37, 5, !dbg !49
  %60 = and i1 %39, %59, !dbg !50
  %61 = select i1 %60, i64 %35, i64 %22, !dbg !51
  %62 = select i1 %42, i64 0, i64 %61, !dbg !52
  %63 = icmp eq i4 %37, 4, !dbg !53
  %64 = and i1 %39, %63, !dbg !54
  %65 = select i1 %64, i64 %35, i64 %23, !dbg !55
  %66 = select i1 %42, i64 0, i64 %65, !dbg !56
  %67 = icmp eq i4 %37, 3, !dbg !57
  %68 = and i1 %39, %67, !dbg !58
  %69 = select i1 %68, i64 %35, i64 %24, !dbg !59
  %70 = select i1 %42, i64 0, i64 %69, !dbg !60
  %71 = icmp eq i4 %37, 2, !dbg !61
  %72 = and i1 %39, %71, !dbg !62
  %73 = select i1 %72, i64 %35, i64 %25, !dbg !63
  %74 = select i1 %42, i64 0, i64 %73, !dbg !64
  %75 = icmp eq i4 %37, 1, !dbg !65
  %76 = and i1 %39, %75, !dbg !66
  %77 = select i1 %76, i64 %35, i64 %26, !dbg !67
  %78 = select i1 %42, i64 0, i64 %77, !dbg !68
  %79 = bitcast i4 %37 to <4 x i1>, !dbg !69
  %80 = call i1 @llvm.vector.reduce.and.v4i1(<4 x i1> %79), !dbg !70
  %81 = xor i1 %80, true, !dbg !71
  %82 = and i1 %39, %81, !dbg !72
  %83 = select i1 %82, i64 %35, i64 %27, !dbg !73
  %84 = select i1 %42, i64 0, i64 %83, !dbg !74
  %85 = zext i1 %44 to i5, !dbg !75
  %86 = zext i1 %39 to i5, !dbg !76
  %87 = add i5 %28, %86, !dbg !77
  %88 = sub i5 %87, %85, !dbg !78
  %89 = select i1 %42, i5 0, i5 %88, !dbg !79
  %90 = call i1 @nd_bv1(), !dbg !80
  %91 = and i1 %90, %39, !dbg !81
  %92 = or i1 %29, %91, !dbg !82
  %93 = xor i1 %29, true, !dbg !83
  %94 = select i1 %93, i1 %92, i1 %29, !dbg !84
  %95 = select i1 %42, i1 false, i1 %94, !dbg !85
  %96 = zext i1 %44 to i5, !dbg !86
  %97 = xor i1 %29, true, !dbg !87
  %98 = and i1 %39, %97, !dbg !88
  %99 = zext i1 %98 to i5, !dbg !89
  %100 = add i5 %31, %99, !dbg !90
  %101 = sub i5 %100, %96, !dbg !91
  %102 = select i1 %42, i5 0, i5 %101, !dbg !92
  %103 = bitcast i5 %102 to <5 x i1>, !dbg !93
  %104 = call i1 @llvm.vector.reduce.and.v5i1(<5 x i1> %103), !dbg !94
  %105 = xor i1 %104, true, !dbg !95
  %106 = bitcast i5 %31 to <5 x i1>, !dbg !96
  %107 = call i1 @llvm.vector.reduce.and.v5i1(<5 x i1> %106), !dbg !97
  %108 = xor i1 %30, true, !dbg !98
  %109 = and i1 %29, %108, !dbg !99
  %110 = and i1 %109, %107, !dbg !100
  %111 = and i1 %110, %105, !dbg !101
  %112 = or i1 %111, %30, !dbg !102
  %113 = select i1 true, i1 %112, i1 %30, !dbg !103
  %114 = select i1 %42, i1 false, i1 %113, !dbg !104
  %115 = or i1 %39, %44, !dbg !105
  %116 = or i1 %115, %42, !dbg !106
  %117 = or i1 %116, %29, !dbg !107
  %118 = select i1 %117, i5 %102, i5 %31, !dbg !108
  %119 = select i1 %42, i5 0, i5 %118, !dbg !109
  %120 = and i1 %91, %93, !dbg !110
  %121 = select i1 %120, i64 %35, i64 %32, !dbg !111
  %122 = select i1 %42, i64 0, i64 %121, !dbg !112
  %123 = zext i1 %39 to i5, !dbg !113
  %124 = add i5 %34, %123, !dbg !114
  %125 = select i1 %48, i5 %124, i5 %34, !dbg !115
  %126 = select i1 %42, i5 0, i5 %125, !dbg !116
  %127 = icmp eq i1 %42, %33, !dbg !117
  %128 = or i1 %127, false, !dbg !118
  call void @llvm.assume(i1 %128), !dbg !119
  %129 = xor i1 %39, true, !dbg !120
  %130 = icmp eq i5 %28, 9, !dbg !121
  %131 = xor i1 %130, true, !dbg !122
  %132 = or i1 %131, %129, !dbg !123
  %133 = or i1 %132, false, !dbg !124
  call void @llvm.assume(i1 %133), !dbg !125
  %134 = xor i1 %44, true, !dbg !126
  %135 = bitcast i5 %28 to <5 x i1>, !dbg !127
  %136 = call i1 @llvm.vector.reduce.and.v5i1(<5 x i1> %135), !dbg !128
  %137 = xor i1 %136, true, !dbg !129
  %138 = xor i1 %137, true, !dbg !130
  %139 = or i1 %138, %134, !dbg !131
  %140 = or i1 %139, false, !dbg !132
  call void @llvm.assume(i1 %140), !dbg !133
  %141 = call i64 @nd_bv64(), !dbg !134
  %142 = lshr i5 %19, 0, !dbg !135
  %143 = trunc i5 %142 to i4, !dbg !136
  %144 = icmp eq i4 %143, -8, !dbg !137
  %145 = select i1 %144, i64 %18, i64 %141, !dbg !138
  %146 = icmp eq i4 %143, 7, !dbg !139
  %147 = select i1 %146, i64 %20, i64 %145, !dbg !140
  %148 = icmp eq i4 %143, 6, !dbg !141
  %149 = select i1 %148, i64 %21, i64 %147, !dbg !142
  %150 = icmp eq i4 %143, 5, !dbg !143
  %151 = select i1 %150, i64 %22, i64 %149, !dbg !144
  %152 = icmp eq i4 %143, 4, !dbg !145
  %153 = select i1 %152, i64 %23, i64 %151, !dbg !146
  %154 = icmp eq i4 %143, 3, !dbg !147
  %155 = select i1 %154, i64 %24, i64 %153, !dbg !148
  %156 = icmp eq i4 %143, 2, !dbg !149
  %157 = select i1 %156, i64 %25, i64 %155, !dbg !150
  %158 = icmp eq i4 %143, 1, !dbg !151
  %159 = select i1 %158, i64 %26, i64 %157, !dbg !152
  %160 = bitcast i4 %143 to <4 x i1>, !dbg !153
  %161 = call i1 @llvm.vector.reduce.and.v4i1(<4 x i1> %160), !dbg !154
  %162 = xor i1 %161, true, !dbg !155
  %163 = select i1 %162, i64 %27, i64 %159, !dbg !156
  %164 = icmp eq i64 %32, %163, !dbg !157
  %165 = xor i1 %111, true, !dbg !158
  %166 = or i1 %165, %164, !dbg !159
  %167 = call i1 @nd_bv1(), !dbg !160
  %168 = select i1 %33, i1 %167, i1 %166, !dbg !161
  %169 = xor i1 %168, true, !dbg !162
  %170 = select i1 %33, i1 false, i1 true, !dbg !163
  %171 = and i1 %170, %169, !dbg !164
  %172 = xor i1 %171, true, !dbg !165
  br i1 %172, label %173, label %174, !dbg !166

173:                                              ; preds = %17
  br label %17, !dbg !167

174:                                              ; preds = %17
  call void @verifier_error(), !dbg !168
  unreachable, !dbg !169
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i1 @llvm.vector.reduce.and.v4i1(<4 x i1>) #0

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i1 @llvm.vector.reduce.and.v5i1(<5 x i1>) #0

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nofree nosync nounwind readnone willreturn }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !4, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "btor2mlir-1/hwmcc20/btor2/bv/2019/mann/data-integrity/unsafe/circular_pointer_top_w64_d8_e0.btor2.mlir.opt", directory: "/home/jetafese")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 8, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 9, column: 10, scope: !8)
!10 = !DILocation(line: 10, column: 10, scope: !8)
!11 = !DILocation(line: 11, column: 10, scope: !8)
!12 = !DILocation(line: 12, column: 10, scope: !8)
!13 = !DILocation(line: 13, column: 10, scope: !8)
!14 = !DILocation(line: 14, column: 10, scope: !8)
!15 = !DILocation(line: 15, column: 10, scope: !8)
!16 = !DILocation(line: 16, column: 10, scope: !8)
!17 = !DILocation(line: 17, column: 11, scope: !8)
!18 = !DILocation(line: 18, column: 11, scope: !8)
!19 = !DILocation(line: 19, column: 11, scope: !8)
!20 = !DILocation(line: 20, column: 11, scope: !8)
!21 = !DILocation(line: 21, column: 11, scope: !8)
!22 = !DILocation(line: 22, column: 11, scope: !8)
!23 = !DILocation(line: 23, column: 11, scope: !8)
!24 = !DILocation(line: 24, column: 5, scope: !8)
!25 = !DILocation(line: 26, column: 11, scope: !8)
!26 = !DILocation(line: 29, column: 11, scope: !8)
!27 = !DILocation(line: 30, column: 11, scope: !8)
!28 = !DILocation(line: 31, column: 11, scope: !8)
!29 = !DILocation(line: 32, column: 11, scope: !8)
!30 = !DILocation(line: 33, column: 11, scope: !8)
!31 = !DILocation(line: 34, column: 11, scope: !8)
!32 = !DILocation(line: 36, column: 11, scope: !8)
!33 = !DILocation(line: 37, column: 11, scope: !8)
!34 = !DILocation(line: 38, column: 11, scope: !8)
!35 = !DILocation(line: 39, column: 11, scope: !8)
!36 = !DILocation(line: 40, column: 11, scope: !8)
!37 = !DILocation(line: 41, column: 11, scope: !8)
!38 = !DILocation(line: 42, column: 11, scope: !8)
!39 = !DILocation(line: 43, column: 11, scope: !8)
!40 = !DILocation(line: 45, column: 11, scope: !8)
!41 = !DILocation(line: 48, column: 11, scope: !8)
!42 = !DILocation(line: 49, column: 11, scope: !8)
!43 = !DILocation(line: 50, column: 11, scope: !8)
!44 = !DILocation(line: 51, column: 11, scope: !8)
!45 = !DILocation(line: 54, column: 11, scope: !8)
!46 = !DILocation(line: 55, column: 11, scope: !8)
!47 = !DILocation(line: 56, column: 11, scope: !8)
!48 = !DILocation(line: 57, column: 11, scope: !8)
!49 = !DILocation(line: 60, column: 11, scope: !8)
!50 = !DILocation(line: 61, column: 11, scope: !8)
!51 = !DILocation(line: 62, column: 11, scope: !8)
!52 = !DILocation(line: 63, column: 11, scope: !8)
!53 = !DILocation(line: 66, column: 11, scope: !8)
!54 = !DILocation(line: 67, column: 11, scope: !8)
!55 = !DILocation(line: 68, column: 11, scope: !8)
!56 = !DILocation(line: 69, column: 11, scope: !8)
!57 = !DILocation(line: 72, column: 11, scope: !8)
!58 = !DILocation(line: 73, column: 11, scope: !8)
!59 = !DILocation(line: 74, column: 11, scope: !8)
!60 = !DILocation(line: 75, column: 11, scope: !8)
!61 = !DILocation(line: 78, column: 11, scope: !8)
!62 = !DILocation(line: 79, column: 11, scope: !8)
!63 = !DILocation(line: 80, column: 11, scope: !8)
!64 = !DILocation(line: 81, column: 11, scope: !8)
!65 = !DILocation(line: 84, column: 11, scope: !8)
!66 = !DILocation(line: 85, column: 11, scope: !8)
!67 = !DILocation(line: 86, column: 11, scope: !8)
!68 = !DILocation(line: 87, column: 11, scope: !8)
!69 = !DILocation(line: 88, column: 11, scope: !8)
!70 = !DILocation(line: 89, column: 11, scope: !8)
!71 = !DILocation(line: 91, column: 11, scope: !8)
!72 = !DILocation(line: 92, column: 12, scope: !8)
!73 = !DILocation(line: 93, column: 12, scope: !8)
!74 = !DILocation(line: 94, column: 12, scope: !8)
!75 = !DILocation(line: 95, column: 12, scope: !8)
!76 = !DILocation(line: 96, column: 12, scope: !8)
!77 = !DILocation(line: 97, column: 12, scope: !8)
!78 = !DILocation(line: 98, column: 12, scope: !8)
!79 = !DILocation(line: 99, column: 12, scope: !8)
!80 = !DILocation(line: 100, column: 12, scope: !8)
!81 = !DILocation(line: 101, column: 12, scope: !8)
!82 = !DILocation(line: 102, column: 12, scope: !8)
!83 = !DILocation(line: 104, column: 12, scope: !8)
!84 = !DILocation(line: 105, column: 12, scope: !8)
!85 = !DILocation(line: 107, column: 12, scope: !8)
!86 = !DILocation(line: 108, column: 12, scope: !8)
!87 = !DILocation(line: 110, column: 12, scope: !8)
!88 = !DILocation(line: 111, column: 12, scope: !8)
!89 = !DILocation(line: 112, column: 12, scope: !8)
!90 = !DILocation(line: 113, column: 12, scope: !8)
!91 = !DILocation(line: 114, column: 12, scope: !8)
!92 = !DILocation(line: 115, column: 12, scope: !8)
!93 = !DILocation(line: 116, column: 12, scope: !8)
!94 = !DILocation(line: 117, column: 12, scope: !8)
!95 = !DILocation(line: 119, column: 12, scope: !8)
!96 = !DILocation(line: 120, column: 12, scope: !8)
!97 = !DILocation(line: 121, column: 12, scope: !8)
!98 = !DILocation(line: 123, column: 12, scope: !8)
!99 = !DILocation(line: 124, column: 12, scope: !8)
!100 = !DILocation(line: 125, column: 12, scope: !8)
!101 = !DILocation(line: 126, column: 12, scope: !8)
!102 = !DILocation(line: 127, column: 12, scope: !8)
!103 = !DILocation(line: 128, column: 12, scope: !8)
!104 = !DILocation(line: 129, column: 12, scope: !8)
!105 = !DILocation(line: 130, column: 12, scope: !8)
!106 = !DILocation(line: 131, column: 12, scope: !8)
!107 = !DILocation(line: 132, column: 12, scope: !8)
!108 = !DILocation(line: 133, column: 12, scope: !8)
!109 = !DILocation(line: 134, column: 12, scope: !8)
!110 = !DILocation(line: 135, column: 12, scope: !8)
!111 = !DILocation(line: 136, column: 12, scope: !8)
!112 = !DILocation(line: 137, column: 12, scope: !8)
!113 = !DILocation(line: 138, column: 12, scope: !8)
!114 = !DILocation(line: 139, column: 12, scope: !8)
!115 = !DILocation(line: 140, column: 12, scope: !8)
!116 = !DILocation(line: 141, column: 12, scope: !8)
!117 = !DILocation(line: 144, column: 12, scope: !8)
!118 = !DILocation(line: 145, column: 12, scope: !8)
!119 = !DILocation(line: 146, column: 5, scope: !8)
!120 = !DILocation(line: 150, column: 12, scope: !8)
!121 = !DILocation(line: 153, column: 12, scope: !8)
!122 = !DILocation(line: 155, column: 12, scope: !8)
!123 = !DILocation(line: 156, column: 12, scope: !8)
!124 = !DILocation(line: 157, column: 12, scope: !8)
!125 = !DILocation(line: 158, column: 5, scope: !8)
!126 = !DILocation(line: 162, column: 12, scope: !8)
!127 = !DILocation(line: 163, column: 12, scope: !8)
!128 = !DILocation(line: 164, column: 12, scope: !8)
!129 = !DILocation(line: 166, column: 12, scope: !8)
!130 = !DILocation(line: 168, column: 12, scope: !8)
!131 = !DILocation(line: 169, column: 12, scope: !8)
!132 = !DILocation(line: 170, column: 12, scope: !8)
!133 = !DILocation(line: 171, column: 5, scope: !8)
!134 = !DILocation(line: 172, column: 12, scope: !8)
!135 = !DILocation(line: 174, column: 12, scope: !8)
!136 = !DILocation(line: 175, column: 12, scope: !8)
!137 = !DILocation(line: 176, column: 12, scope: !8)
!138 = !DILocation(line: 177, column: 12, scope: !8)
!139 = !DILocation(line: 179, column: 12, scope: !8)
!140 = !DILocation(line: 180, column: 12, scope: !8)
!141 = !DILocation(line: 182, column: 12, scope: !8)
!142 = !DILocation(line: 183, column: 12, scope: !8)
!143 = !DILocation(line: 185, column: 12, scope: !8)
!144 = !DILocation(line: 186, column: 12, scope: !8)
!145 = !DILocation(line: 188, column: 12, scope: !8)
!146 = !DILocation(line: 189, column: 12, scope: !8)
!147 = !DILocation(line: 191, column: 12, scope: !8)
!148 = !DILocation(line: 192, column: 12, scope: !8)
!149 = !DILocation(line: 194, column: 12, scope: !8)
!150 = !DILocation(line: 195, column: 12, scope: !8)
!151 = !DILocation(line: 197, column: 12, scope: !8)
!152 = !DILocation(line: 198, column: 12, scope: !8)
!153 = !DILocation(line: 199, column: 12, scope: !8)
!154 = !DILocation(line: 200, column: 12, scope: !8)
!155 = !DILocation(line: 202, column: 12, scope: !8)
!156 = !DILocation(line: 203, column: 12, scope: !8)
!157 = !DILocation(line: 204, column: 12, scope: !8)
!158 = !DILocation(line: 206, column: 12, scope: !8)
!159 = !DILocation(line: 207, column: 12, scope: !8)
!160 = !DILocation(line: 208, column: 12, scope: !8)
!161 = !DILocation(line: 209, column: 12, scope: !8)
!162 = !DILocation(line: 211, column: 12, scope: !8)
!163 = !DILocation(line: 212, column: 12, scope: !8)
!164 = !DILocation(line: 213, column: 12, scope: !8)
!165 = !DILocation(line: 215, column: 12, scope: !8)
!166 = !DILocation(line: 216, column: 5, scope: !8)
!167 = !DILocation(line: 218, column: 5, scope: !8)
!168 = !DILocation(line: 220, column: 5, scope: !8)
!169 = !DILocation(line: 221, column: 5, scope: !8)
