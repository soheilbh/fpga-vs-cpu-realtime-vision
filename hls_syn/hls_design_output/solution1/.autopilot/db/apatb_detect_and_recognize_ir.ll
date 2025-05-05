; ModuleID = '/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn/hls_design_output/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.ssdm_int<8, false>" }
%"struct.ssdm_int<8, false>" = type { i8 }

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_detect_and_recognize_ir([800 x %"struct.ap_uint<8>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="600" "partition" %frame, i8* noalias nocapture nonnull dereferenceable(1) %result) local_unnamed_addr #1 {
entry:
  %0 = bitcast [800 x %"struct.ap_uint<8>"]* %frame to [600 x [800 x %"struct.ap_uint<8>"]]*
  %_0 = call i8* @malloc(i64 60000)
  %frame_copy_0 = bitcast i8* %_0 to [600 x [100 x i8]]*
  %_1 = call i8* @malloc(i64 60000)
  %frame_copy_1 = bitcast i8* %_1 to [600 x [100 x i8]]*
  %_2 = call i8* @malloc(i64 60000)
  %frame_copy_2 = bitcast i8* %_2 to [600 x [100 x i8]]*
  %_3 = call i8* @malloc(i64 60000)
  %frame_copy_3 = bitcast i8* %_3 to [600 x [100 x i8]]*
  %_4 = call i8* @malloc(i64 60000)
  %frame_copy_4 = bitcast i8* %_4 to [600 x [100 x i8]]*
  %_5 = call i8* @malloc(i64 60000)
  %frame_copy_5 = bitcast i8* %_5 to [600 x [100 x i8]]*
  %_6 = call i8* @malloc(i64 60000)
  %frame_copy_6 = bitcast i8* %_6 to [600 x [100 x i8]]*
  %_7 = call i8* @malloc(i64 60000)
  %frame_copy_7 = bitcast i8* %_7 to [600 x [100 x i8]]*
  %1 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_0, i64 0, i64 0
  %2 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_1, i64 0, i64 0
  %3 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_2, i64 0, i64 0
  %4 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_3, i64 0, i64 0
  %5 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_4, i64 0, i64 0
  %6 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_5, i64 0, i64 0
  %7 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_6, i64 0, i64 0
  %8 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %frame_copy_7, i64 0, i64 0
  %result_copy = alloca i8, align 512
  call void @copy_in([600 x [800 x %"struct.ap_uint<8>"]]* nonnull %0, [600 x [100 x i8]]* %frame_copy_0, [600 x [100 x i8]]* %frame_copy_1, [600 x [100 x i8]]* %frame_copy_2, [600 x [100 x i8]]* %frame_copy_3, [600 x [100 x i8]]* %frame_copy_4, [600 x [100 x i8]]* %frame_copy_5, [600 x [100 x i8]]* %frame_copy_6, [600 x [100 x i8]]* %frame_copy_7, i8* nonnull %result, i8* nonnull align 512 %result_copy)
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %1, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %2, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %3, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %4, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %5, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %6, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %7, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %8, i32 999, i32 1, i32 2, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %1, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %2, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %3, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %4, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %5, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %6, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %7, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([100 x i8]* %8, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @apatb_detect_and_recognize_hw([600 x [100 x i8]]* %frame_copy_0, [600 x [100 x i8]]* %frame_copy_1, [600 x [100 x i8]]* %frame_copy_2, [600 x [100 x i8]]* %frame_copy_3, [600 x [100 x i8]]* %frame_copy_4, [600 x [100 x i8]]* %frame_copy_5, [600 x [100 x i8]]* %frame_copy_6, [600 x [100 x i8]]* %frame_copy_7, i8* %result_copy)
  call void @copy_back([600 x [800 x %"struct.ap_uint<8>"]]* %0, [600 x [100 x i8]]* %frame_copy_0, [600 x [100 x i8]]* %frame_copy_1, [600 x [100 x i8]]* %frame_copy_2, [600 x [100 x i8]]* %frame_copy_3, [600 x [100 x i8]]* %frame_copy_4, [600 x [100 x i8]]* %frame_copy_5, [600 x [100 x i8]]* %frame_copy_6, [600 x [100 x i8]]* %frame_copy_7, i8* %result, i8* %result_copy)
  call void @free(i8* %_0)
  call void @free(i8* %_1)
  call void @free(i8* %_2)
  call void @free(i8* %_3)
  call void @free(i8* %_4)
  call void @free(i8* %_5)
  call void @free(i8* %_6)
  call void @free(i8* %_7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a600a800struct.ap_uint<8>"([600 x [800 x %"struct.ap_uint<8>"]]* "orig.arg.no"="0" %dst, [600 x [800 x %"struct.ap_uint<8>"]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %src, null
  %1 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [600 x [800 x %"struct.ap_uint<8>"]], [600 x [800 x %"struct.ap_uint<8>"]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [600 x [800 x %"struct.ap_uint<8>"]], [600 x [800 x %"struct.ap_uint<8>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a800struct.ap_uint<8>"([800 x %"struct.ap_uint<8>"]* %dst.addr, [800 x %"struct.ap_uint<8>"]* %src.addr, i64 800)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a800struct.ap_uint<8>"([800 x %"struct.ap_uint<8>"]* "orig.arg.no"="0" %dst, [800 x %"struct.ap_uint<8>"]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [800 x %"struct.ap_uint<8>"]* %src, null
  %1 = icmp eq [800 x %"struct.ap_uint<8>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [800 x %"struct.ap_uint<8>"], [800 x %"struct.ap_uint<8>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [800 x %"struct.ap_uint<8>"], [800 x %"struct.ap_uint<8>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i8, i8* %src.addr.0.0.05, align 1
  store i8 %3, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %dst, i8* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq i8* %dst, null
  %1 = icmp eq i8* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i8, i8* %src, align 1
  store i8 %3, i8* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #4

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a800struct.ap_uint<8>.11.12"([100 x i8]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [100 x i8]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [800 x %"struct.ap_uint<8>"]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [800 x %"struct.ap_uint<8>"]* %src, null
  %1 = icmp eq [100 x i8]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.0.0.06.exit, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.0.0.06.exit ]
  %3 = urem i64 %for.loop.idx8, 100
  %4 = udiv i64 %for.loop.idx8, 100
  %src.addr.0.0.05 = getelementptr [800 x %"struct.ap_uint<8>"], [800 x %"struct.ap_uint<8>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %5 = getelementptr [100 x i8], [100 x i8]* %dst_0, i64 0, i64 %3
  %6 = getelementptr [100 x i8], [100 x i8]* %dst_1, i64 0, i64 %3
  %7 = getelementptr [100 x i8], [100 x i8]* %dst_2, i64 0, i64 %3
  %8 = getelementptr [100 x i8], [100 x i8]* %dst_3, i64 0, i64 %3
  %9 = getelementptr [100 x i8], [100 x i8]* %dst_4, i64 0, i64 %3
  %10 = getelementptr [100 x i8], [100 x i8]* %dst_5, i64 0, i64 %3
  %11 = getelementptr [100 x i8], [100 x i8]* %dst_6, i64 0, i64 %3
  %12 = getelementptr [100 x i8], [100 x i8]* %dst_7, i64 0, i64 %3
  %13 = load i8, i8* %src.addr.0.0.05, align 1
  switch i64 %4, label %dst.addr.0.0.06.case.7 [
    i64 0, label %dst.addr.0.0.06.case.0
    i64 1, label %dst.addr.0.0.06.case.1
    i64 2, label %dst.addr.0.0.06.case.2
    i64 3, label %dst.addr.0.0.06.case.3
    i64 4, label %dst.addr.0.0.06.case.4
    i64 5, label %dst.addr.0.0.06.case.5
    i64 6, label %dst.addr.0.0.06.case.6
  ]

dst.addr.0.0.06.case.0:                           ; preds = %for.loop
  store i8 %13, i8* %5, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.1:                           ; preds = %for.loop
  store i8 %13, i8* %6, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.2:                           ; preds = %for.loop
  store i8 %13, i8* %7, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.3:                           ; preds = %for.loop
  store i8 %13, i8* %8, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.4:                           ; preds = %for.loop
  store i8 %13, i8* %9, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.5:                           ; preds = %for.loop
  store i8 %13, i8* %10, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.6:                           ; preds = %for.loop
  store i8 %13, i8* %11, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.7:                           ; preds = %for.loop
  %for.loop.idx8.off = add nsw i64 %for.loop.idx8, -700
  %14 = icmp ult i64 %for.loop.idx8.off, 100
  call void @llvm.assume(i1 %14)
  store i8 %13, i8* %12, align 1
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.exit:                             ; preds = %dst.addr.0.0.06.case.7, %dst.addr.0.0.06.case.6, %dst.addr.0.0.06.case.5, %dst.addr.0.0.06.case.4, %dst.addr.0.0.06.case.3, %dst.addr.0.0.06.case.2, %dst.addr.0.0.06.case.1, %dst.addr.0.0.06.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.0.0.06.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a600a800struct.ap_uint<8>.10.13"([600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [600 x [800 x %"struct.ap_uint<8>"]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %src, null
  %1 = icmp eq [600 x [100 x i8]]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_0, i64 0, i64 %for.loop.idx2
  %4 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_1, i64 0, i64 %for.loop.idx2
  %5 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_2, i64 0, i64 %for.loop.idx2
  %6 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_3, i64 0, i64 %for.loop.idx2
  %7 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_4, i64 0, i64 %for.loop.idx2
  %8 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_5, i64 0, i64 %for.loop.idx2
  %9 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_6, i64 0, i64 %for.loop.idx2
  %10 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %dst_7, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [600 x [800 x %"struct.ap_uint<8>"]], [600 x [800 x %"struct.ap_uint<8>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a800struct.ap_uint<8>.11.12"([100 x i8]* %3, [100 x i8]* %4, [100 x i8]* %5, [100 x i8]* %6, [100 x i8]* %7, [100 x i8]* %8, [100 x i8]* %9, [100 x i8]* %10, [800 x %"struct.ap_uint<8>"]* %src.addr, i64 800)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a600a800struct.ap_uint<8>.9.14"([600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [600 x [100 x i8]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [600 x [800 x %"struct.ap_uint<8>"]]* readonly "orig.arg.no"="1" %src) #3 {
entry:
  %0 = icmp eq [600 x [100 x i8]]* %dst_0, null
  %1 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a600a800struct.ap_uint<8>.10.13"([600 x [100 x i8]]* nonnull %dst_0, [600 x [100 x i8]]* %dst_1, [600 x [100 x i8]]* %dst_2, [600 x [100 x i8]]* %dst_3, [600 x [100 x i8]]* %dst_4, [600 x [100 x i8]]* %dst_5, [600 x [100 x i8]]* %dst_6, [600 x [100 x i8]]* %dst_7, [600 x [800 x %"struct.ap_uint<8>"]]* nonnull %src, i64 600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([600 x [800 x %"struct.ap_uint<8>"]]* readonly "orig.arg.no"="0", [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.0" %_0, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.1" %_1, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.2" %_2, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.3" %_3, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.4" %_4, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.5" %_5, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.6" %_6, [600 x [100 x i8]]* "orig.arg.no"="1" "unpacked"="1.7" %_7, i8* readonly "orig.arg.no"="2", i8* align 512 "orig.arg.no"="3") #5 {
entry:
  call void @"onebyonecpy_hls.p0a600a800struct.ap_uint<8>.9.14"([600 x [100 x i8]]* %_0, [600 x [100 x i8]]* %_1, [600 x [100 x i8]]* %_2, [600 x [100 x i8]]* %_3, [600 x [100 x i8]]* %_4, [600 x [100 x i8]]* %_5, [600 x [100 x i8]]* %_6, [600 x [100 x i8]]* %_7, [600 x [800 x %"struct.ap_uint<8>"]]* %0)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %2, i8* %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a800struct.ap_uint<8>.23.24"([800 x %"struct.ap_uint<8>"]* "orig.arg.no"="0" %dst, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [100 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [100 x i8]* %src_0, null
  %1 = icmp eq [800 x %"struct.ap_uint<8>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.0.0.05.exit, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.0.0.05.exit ]
  %3 = urem i64 %for.loop.idx8, 100
  %4 = udiv i64 %for.loop.idx8, 100
  %5 = getelementptr [100 x i8], [100 x i8]* %src_0, i64 0, i64 %3
  %6 = getelementptr [100 x i8], [100 x i8]* %src_1, i64 0, i64 %3
  %7 = getelementptr [100 x i8], [100 x i8]* %src_2, i64 0, i64 %3
  %8 = getelementptr [100 x i8], [100 x i8]* %src_3, i64 0, i64 %3
  %9 = getelementptr [100 x i8], [100 x i8]* %src_4, i64 0, i64 %3
  %10 = getelementptr [100 x i8], [100 x i8]* %src_5, i64 0, i64 %3
  %11 = getelementptr [100 x i8], [100 x i8]* %src_6, i64 0, i64 %3
  %12 = getelementptr [100 x i8], [100 x i8]* %src_7, i64 0, i64 %3
  %dst.addr.0.0.06 = getelementptr [800 x %"struct.ap_uint<8>"], [800 x %"struct.ap_uint<8>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  switch i64 %4, label %src.addr.0.0.05.case.7 [
    i64 0, label %src.addr.0.0.05.case.0
    i64 1, label %src.addr.0.0.05.case.1
    i64 2, label %src.addr.0.0.05.case.2
    i64 3, label %src.addr.0.0.05.case.3
    i64 4, label %src.addr.0.0.05.case.4
    i64 5, label %src.addr.0.0.05.case.5
    i64 6, label %src.addr.0.0.05.case.6
  ]

src.addr.0.0.05.case.0:                           ; preds = %for.loop
  %13 = load i8, i8* %5, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.1:                           ; preds = %for.loop
  %14 = load i8, i8* %6, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.2:                           ; preds = %for.loop
  %15 = load i8, i8* %7, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.3:                           ; preds = %for.loop
  %16 = load i8, i8* %8, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.4:                           ; preds = %for.loop
  %17 = load i8, i8* %9, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.5:                           ; preds = %for.loop
  %18 = load i8, i8* %10, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.6:                           ; preds = %for.loop
  %19 = load i8, i8* %11, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.7:                           ; preds = %for.loop
  %for.loop.idx8.off = add nsw i64 %for.loop.idx8, -700
  %20 = icmp ult i64 %for.loop.idx8.off, 100
  call void @llvm.assume(i1 %20)
  %21 = load i8, i8* %12, align 1
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.exit:                             ; preds = %src.addr.0.0.05.case.7, %src.addr.0.0.05.case.6, %src.addr.0.0.05.case.5, %src.addr.0.0.05.case.4, %src.addr.0.0.05.case.3, %src.addr.0.0.05.case.2, %src.addr.0.0.05.case.1, %src.addr.0.0.05.case.0
  %22 = phi i8 [ %13, %src.addr.0.0.05.case.0 ], [ %14, %src.addr.0.0.05.case.1 ], [ %15, %src.addr.0.0.05.case.2 ], [ %16, %src.addr.0.0.05.case.3 ], [ %17, %src.addr.0.0.05.case.4 ], [ %18, %src.addr.0.0.05.case.5 ], [ %19, %src.addr.0.0.05.case.6 ], [ %21, %src.addr.0.0.05.case.7 ]
  store i8 %22, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.0.0.05.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a600a800struct.ap_uint<8>.22.25"([600 x [800 x %"struct.ap_uint<8>"]]* "orig.arg.no"="0" %dst, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [600 x [100 x i8]]* %src_0, null
  %1 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [600 x [800 x %"struct.ap_uint<8>"]], [600 x [800 x %"struct.ap_uint<8>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_0, i64 0, i64 %for.loop.idx2
  %4 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_1, i64 0, i64 %for.loop.idx2
  %5 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_2, i64 0, i64 %for.loop.idx2
  %6 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_3, i64 0, i64 %for.loop.idx2
  %7 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_4, i64 0, i64 %for.loop.idx2
  %8 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_5, i64 0, i64 %for.loop.idx2
  %9 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_6, i64 0, i64 %for.loop.idx2
  %10 = getelementptr [600 x [100 x i8]], [600 x [100 x i8]]* %src_7, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a800struct.ap_uint<8>.23.24"([800 x %"struct.ap_uint<8>"]* %dst.addr, [100 x i8]* %3, [100 x i8]* %4, [100 x i8]* %5, [100 x i8]* %6, [100 x i8]* %7, [100 x i8]* %8, [100 x i8]* %9, [100 x i8]* %10, i64 800)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a600a800struct.ap_uint<8>.21.26"([600 x [800 x %"struct.ap_uint<8>"]]* "orig.arg.no"="0" %dst, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7) #3 {
entry:
  %0 = icmp eq [600 x [800 x %"struct.ap_uint<8>"]]* %dst, null
  %1 = icmp eq [600 x [100 x i8]]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a600a800struct.ap_uint<8>.22.25"([600 x [800 x %"struct.ap_uint<8>"]]* nonnull %dst, [600 x [100 x i8]]* nonnull %src_0, [600 x [100 x i8]]* %src_1, [600 x [100 x i8]]* %src_2, [600 x [100 x i8]]* %src_3, [600 x [100 x i8]]* %src_4, [600 x [100 x i8]]* %src_5, [600 x [100 x i8]]* %src_6, [600 x [100 x i8]]* %src_7, i64 600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([600 x [800 x %"struct.ap_uint<8>"]]* "orig.arg.no"="0", [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %_4, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %_5, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %_6, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %_7, i8* "orig.arg.no"="2", i8* readonly align 512 "orig.arg.no"="3") #6 {
entry:
  call void @"onebyonecpy_hls.p0a600a800struct.ap_uint<8>.21.26"([600 x [800 x %"struct.ap_uint<8>"]]* %0, [600 x [100 x i8]]* %_0, [600 x [100 x i8]]* %_1, [600 x [100 x i8]]* %_2, [600 x [100 x i8]]* %_3, [600 x [100 x i8]]* %_4, [600 x [100 x i8]]* %_5, [600 x [100 x i8]]* %_6, [600 x [100 x i8]]* %_7)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %1, i8* align 512 %2)
  ret void
}

declare void @apatb_detect_and_recognize_hw([600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, i8*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([600 x [800 x %"struct.ap_uint<8>"]]* "orig.arg.no"="0", [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %_4, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %_5, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %_6, [600 x [100 x i8]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %_7, i8* "orig.arg.no"="2", i8* readonly align 512 "orig.arg.no"="3") #6 {
entry:
  call fastcc void @onebyonecpy_hls.p0i8(i8* %1, i8* align 512 %2)
  ret void
}

declare void @detect_and_recognize_hw_stub([800 x %"struct.ap_uint<8>"]* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull)

define void @detect_and_recognize_hw_stub_wrapper([600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, [600 x [100 x i8]]*, i8*) #7 {
entry:
  %9 = call i8* @malloc(i64 480000)
  %10 = bitcast i8* %9 to [600 x [800 x %"struct.ap_uint<8>"]]*
  call void @copy_out([600 x [800 x %"struct.ap_uint<8>"]]* %10, [600 x [100 x i8]]* %0, [600 x [100 x i8]]* %1, [600 x [100 x i8]]* %2, [600 x [100 x i8]]* %3, [600 x [100 x i8]]* %4, [600 x [100 x i8]]* %5, [600 x [100 x i8]]* %6, [600 x [100 x i8]]* %7, i8* null, i8* %8)
  %11 = bitcast [600 x [800 x %"struct.ap_uint<8>"]]* %10 to [800 x %"struct.ap_uint<8>"]*
  call void @detect_and_recognize_hw_stub([800 x %"struct.ap_uint<8>"]* %11, i8* %8)
  call void @copy_in([600 x [800 x %"struct.ap_uint<8>"]]* %10, [600 x [100 x i8]]* %0, [600 x [100 x i8]]* %1, [600 x [100 x i8]]* %2, [600 x [100 x i8]]* %3, [600 x [100 x i8]]* %4, [600 x [100 x i8]]* %5, [600 x [100 x i8]]* %6, [600 x [100 x i8]]* %7, i8* null, i8* %8)
  call void @free(i8* %9)
  ret void
}

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { nounwind willreturn }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"0", [600 x [800 x %"struct.ap_uint<8>"]]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Block", !"dim=2", !"factor=8"}
!10 = !{!11, !12, !13, !14, !15, !16, !17, !18}
!11 = !{!"0.0", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!12 = !{!"0.1", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!13 = !{!"0.2", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!14 = !{!"0.3", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!15 = !{!"0.4", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!16 = !{!"0.5", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!17 = !{!"0.6", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!18 = !{!"0.7", [600 x [100 x %"struct.ap_uint<8>"]]* null}
!19 = !DILocation(line: 37, column: 9, scope: !20)
!20 = distinct !DISubprogram(name: "detect_and_recognize", linkageName: "_Z20detect_and_recognizePA800_7ap_uintILi8EERc", scope: !21, file: !21, line: 30, type: !22, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !89, variables: !4)
!21 = !DIFile(filename: "src/hls_wrapper.cpp", directory: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24, !87}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 6400, elements: !85)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_uint<8>", file: !27, line: 183, size: 8, flags: DIFlagTypePassByValue, elements: !28, templateParams: !84, identifier: "_ZTS7ap_uintILi8EE")
!27 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/ap_int.h", directory: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn")
!28 = !{!29, !64, !69, !73, !78}
!29 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !26, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<8, false>", file: !31, line: 124, size: 8, flags: DIFlagTypePassByValue, elements: !32, templateParams: !62, identifier: "_ZTS11ap_int_baseILi8ELb0EE")
!31 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/etc/ap_int_base.h", directory: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn")
!32 = !{!33, !51, !53, !55}
!33 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !30, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<8, false>", file: !35, line: 519, size: 8, flags: DIFlagTypePassByValue, elements: !36, templateParams: !46, identifier: "_ZTS8ssdm_intILi8ELb0EE")
!35 = !DIFile(filename: "/tools/Xilinx/Vitis/2024.2/common/technology/autopilot/etc/ap_common.h", directory: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn")
!36 = !{!37, !39, !43}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !34, file: !35, line: 521, baseType: !38, size: 8)
!38 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!39 = !DISubprogram(name: "ssdm_int", scope: !34, file: !35, line: 522, type: !40, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!43 = !DISubprogram(name: "ssdm_int", scope: !34, file: !35, line: 523, type: !44, isLocal: false, isDefinition: false, scopeLine: 523, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !42, !38}
!46 = !{!47, !49}
!47 = !DITemplateValueParameter(name: "_AP_N", type: !48, value: i32 8)
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DITemplateValueParameter(name: "_AP_S", type: !50, value: i8 0)
!50 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !30, file: !31, line: 148, baseType: !52, flags: DIFlagStaticMember, extraData: i32 8)
!52 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !48)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !30, file: !31, line: 149, baseType: !54, flags: DIFlagStaticMember, extraData: i1 false)
!54 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!55 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi8ELb0EEaSERKS0_", scope: !30, file: !31, line: 479, type: !56, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !59, !60}
!58 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!60 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!62 = !{!63, !49}
!63 = !DITemplateValueParameter(name: "_AP_W", type: !48, value: i32 8)
!64 = !DISubprogram(name: "ap_uint", scope: !26, file: !27, line: 298, type: !65, isLocal: false, isDefinition: false, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67, !68}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!68 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!69 = !DISubprogram(name: "ap_uint", scope: !26, file: !27, line: 299, type: !70, isLocal: false, isDefinition: false, scopeLine: 299, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !67, !72}
!72 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!73 = !DISubprogram(name: "ap_uint", scope: !26, file: !27, line: 300, type: !74, isLocal: false, isDefinition: false, scopeLine: 300, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DISubroutineType(types: !75)
!75 = !{null, !67, !76}
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "half", file: !35, line: 613, baseType: !77)
!77 = !DIBasicType(name: "__fp16", size: 16, encoding: DW_ATE_float)
!78 = !DISubprogram(name: "operator=", linkageName: "_ZN7ap_uintILi8EEaSERKS0_", scope: !26, file: !27, line: 311, type: !79, isLocal: false, isDefinition: false, scopeLine: 311, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !67, !82}
!81 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !26, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!84 = !{!63}
!85 = !{!86}
!86 = !DISubrange(count: 800)
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !90, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!90 = !DIFile(filename: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn/hls_design_output/solution1/.autopilot/db/hls_wrapper.pp.0.cpp", directory: "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn")
