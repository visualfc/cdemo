; ModuleID = 'wrap.c'
source_filename = "wrap.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.array = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @demo1(i64 %0, i64 %1) #0 {
  %3 = alloca %struct.array, align 1
  %4 = getelementptr inbounds { i64, i64 }, ptr %3, i32 0, i32 0
  store i64 %0, ptr %4, align 1
  %5 = getelementptr inbounds { i64, i64 }, ptr %3, i32 0, i32 1
  store i64 %1, ptr %5, align 1
  %6 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 0
  %7 = load i32, ptr %6, align 1
  %8 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 1
  %9 = load i32, ptr %8, align 1
  %10 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 2
  %11 = load i32, ptr %10, align 1
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7, i32 noundef %9, i32 noundef %11)
  ret i32 100
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @demo2(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.array, align 1
  store ptr %0, ptr %2, align 8
  %4 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 0
  store i32 1, ptr %4, align 1
  %5 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 1
  store i32 2, ptr %5, align 1
  %6 = getelementptr inbounds %struct.array, ptr %3, i32 0, i32 2
  store i32 3, ptr %6, align 1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds { i64, i64 }, ptr %3, i32 0, i32 0
  %9 = load i64, ptr %8, align 1
  %10 = getelementptr inbounds { i64, i64 }, ptr %3, i32 0, i32 1
  %11 = load i64, ptr %10, align 1
  %12 = call i32 %7(i64 %9, i64 %11)
  ret i32 %12
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"Homebrew clang version 18.1.8"}
