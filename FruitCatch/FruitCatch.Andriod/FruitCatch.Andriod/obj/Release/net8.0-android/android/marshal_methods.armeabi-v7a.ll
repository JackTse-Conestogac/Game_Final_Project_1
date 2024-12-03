; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [31 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [62 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 24
	i32 117431740, ; 1: System.Runtime.InteropServices => 0x6ffddbc => 19
	i32 205061960, ; 2: System.ComponentModel => 0xc38ff48 => 11
	i32 321652532, ; 3: FruitCatch.GameAssets => 0x132c0734 => 3
	i32 379916513, ; 4: System.Threading.Thread.dll => 0x16a510e1 => 24
	i32 395744057, ; 5: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 442565967, ; 6: System.Collections => 0x1a61054f => 8
	i32 459347974, ; 7: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 20
	i32 469710990, ; 8: System.dll => 0x1bff388e => 26
	i32 478745277, ; 9: FruitCatch.Core => 0x1c8912bd => 2
	i32 498788369, ; 10: System.ObjectModel => 0x1dbae811 => 17
	i32 507640256, ; 11: MonoGame.Framework => 0x1e41f9c0 => 1
	i32 672442732, ; 12: System.Collections.Concurrent => 0x2814a96c => 5
	i32 823281589, ; 13: System.Private.Uri.dll => 0x311247b5 => 18
	i32 904024072, ; 14: System.ComponentModel.Primitives.dll => 0x35e25008 => 9
	i32 992768348, ; 15: System.Collections.dll => 0x3b2c715c => 8
	i32 1019214401, ; 16: System.Drawing => 0x3cbffa41 => 14
	i32 1036536393, ; 17: System.Drawing.Primitives.dll => 0x3dc84a49 => 13
	i32 1082857460, ; 18: System.ComponentModel.TypeConverter => 0x408b17f4 => 10
	i32 1098259244, ; 19: System => 0x41761b2c => 26
	i32 1148908091, ; 20: FruitCatch.GameAssets.dll => 0x447af23b => 3
	i32 1324164729, ; 21: System.Linq => 0x4eed2679 => 15
	i32 1517992127, ; 22: FruitCatch.Core.dll => 0x5a7ab8bf => 2
	i32 1543031311, ; 23: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 23
	i32 1639986890, ; 24: System.Text.RegularExpressions => 0x61c036ca => 23
	i32 1657153582, ; 25: System.Runtime => 0x62c6282e => 21
	i32 1780572499, ; 26: Mono.Android.Runtime.dll => 0x6a216153 => 29
	i32 1824175904, ; 27: System.Text.Encoding.Extensions => 0x6cbab720 => 22
	i32 1910275211, ; 28: System.Collections.NonGeneric.dll => 0x71dc7c8b => 6
	i32 2079903147, ; 29: System.Runtime.dll => 0x7bf8cdab => 21
	i32 2090596640, ; 30: System.Numerics.Vectors => 0x7c9bf920 => 16
	i32 2127167465, ; 31: System.Console => 0x7ec9ffe9 => 12
	i32 2142473426, ; 32: System.Collections.Specialized => 0x7fb38cd2 => 7
	i32 2193016926, ; 33: System.ObjectModel.dll => 0x82b6c85e => 17
	i32 2305521784, ; 34: System.Private.CoreLib.dll => 0x896b7878 => 27
	i32 2353837538, ; 35: FruitCatch.Andriod => 0x8c4cb5e2 => 4
	i32 2435356389, ; 36: System.Console.dll => 0x912896e5 => 12
	i32 2475788418, ; 37: Java.Interop.dll => 0x93918882 => 28
	i32 2585220780, ; 38: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 22
	i32 2665622720, ; 39: System.Drawing.Primitives => 0x9ee22cc0 => 13
	i32 2909740682, ; 40: System.Private.CoreLib => 0xad6f1e8a => 27
	i32 2919462931, ; 41: System.Numerics.Vectors.dll => 0xae037813 => 16
	i32 2920923626, ; 42: FruitCatch.Andriod.dll => 0xae19c1ea => 4
	i32 2959614098, ; 43: System.ComponentModel.dll => 0xb0682092 => 11
	i32 3038032645, ; 44: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 45: Mono.Android.Runtime => 0xb65adef9 => 29
	i32 3059793426, ; 46: System.ComponentModel.Primitives => 0xb660be12 => 9
	i32 3220365878, ; 47: System.Threading => 0xbff2e236 => 25
	i32 3366347497, ; 48: Java.Interop => 0xc8a662e9 => 28
	i32 3471940407, ; 49: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 10
	i32 3476120550, ; 50: Mono.Android => 0xcf3163e6 => 30
	i32 3608519521, ; 51: System.Linq.dll => 0xd715a361 => 15
	i32 3672681054, ; 52: Mono.Android.dll => 0xdae8aa5e => 30
	i32 3792276235, ; 53: System.Collections.NonGeneric => 0xe2098b0b => 6
	i32 3802395368, ; 54: System.Collections.Specialized.dll => 0xe2a3f2e8 => 7
	i32 3831343120, ; 55: MonoGame.Framework.dll => 0xe45da810 => 1
	i32 3849253459, ; 56: System.Runtime.InteropServices.dll => 0xe56ef253 => 19
	i32 3896106733, ; 57: System.Collections.Concurrent.dll => 0xe839deed => 5
	i32 4073602200, ; 58: System.Threading.dll => 0xf2ce3c98 => 25
	i32 4099507663, ; 59: System.Drawing.dll => 0xf45985cf => 14
	i32 4100113165, ; 60: System.Private.Uri => 0xf462c30d => 18
	i32 4181436372 ; 61: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 20
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [62 x i32] [
	i32 24, ; 0
	i32 19, ; 1
	i32 11, ; 2
	i32 3, ; 3
	i32 24, ; 4
	i32 0, ; 5
	i32 8, ; 6
	i32 20, ; 7
	i32 26, ; 8
	i32 2, ; 9
	i32 17, ; 10
	i32 1, ; 11
	i32 5, ; 12
	i32 18, ; 13
	i32 9, ; 14
	i32 8, ; 15
	i32 14, ; 16
	i32 13, ; 17
	i32 10, ; 18
	i32 26, ; 19
	i32 3, ; 20
	i32 15, ; 21
	i32 2, ; 22
	i32 23, ; 23
	i32 23, ; 24
	i32 21, ; 25
	i32 29, ; 26
	i32 22, ; 27
	i32 6, ; 28
	i32 21, ; 29
	i32 16, ; 30
	i32 12, ; 31
	i32 7, ; 32
	i32 17, ; 33
	i32 27, ; 34
	i32 4, ; 35
	i32 12, ; 36
	i32 28, ; 37
	i32 22, ; 38
	i32 13, ; 39
	i32 27, ; 40
	i32 16, ; 41
	i32 4, ; 42
	i32 11, ; 43
	i32 0, ; 44
	i32 29, ; 45
	i32 9, ; 46
	i32 25, ; 47
	i32 28, ; 48
	i32 10, ; 49
	i32 30, ; 50
	i32 15, ; 51
	i32 30, ; 52
	i32 6, ; 53
	i32 7, ; 54
	i32 1, ; 55
	i32 19, ; 56
	i32 5, ; 57
	i32 25, ; 58
	i32 14, ; 59
	i32 18, ; 60
	i32 20 ; 61
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
