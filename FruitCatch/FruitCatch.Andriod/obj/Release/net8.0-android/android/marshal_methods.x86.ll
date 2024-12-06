; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [34 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [68 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 27
	i32 117431740, ; 1: System.Runtime.InteropServices => 0x6ffddbc => 20
	i32 205061960, ; 2: System.ComponentModel => 0xc38ff48 => 11
	i32 321652532, ; 3: FruitCatch.GameAssets => 0x132c0734 => 3
	i32 379916513, ; 4: System.Threading.Thread.dll => 0x16a510e1 => 27
	i32 385762202, ; 5: System.Memory.dll => 0x16fe439a => 16
	i32 395744057, ; 6: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 442565967, ; 7: System.Collections => 0x1a61054f => 8
	i32 459347974, ; 8: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 21
	i32 469710990, ; 9: System.dll => 0x1bff388e => 29
	i32 478745277, ; 10: FruitCatch.Core => 0x1c8912bd => 2
	i32 498788369, ; 11: System.ObjectModel => 0x1dbae811 => 18
	i32 507640256, ; 12: MonoGame.Framework => 0x1e41f9c0 => 1
	i32 662205335, ; 13: System.Text.Encodings.Web.dll => 0x27787397 => 24
	i32 672442732, ; 14: System.Collections.Concurrent => 0x2814a96c => 5
	i32 823281589, ; 15: System.Private.Uri.dll => 0x311247b5 => 19
	i32 904024072, ; 16: System.ComponentModel.Primitives.dll => 0x35e25008 => 9
	i32 992768348, ; 17: System.Collections.dll => 0x3b2c715c => 8
	i32 1019214401, ; 18: System.Drawing => 0x3cbffa41 => 14
	i32 1036536393, ; 19: System.Drawing.Primitives.dll => 0x3dc84a49 => 13
	i32 1082857460, ; 20: System.ComponentModel.TypeConverter => 0x408b17f4 => 10
	i32 1098259244, ; 21: System => 0x41761b2c => 29
	i32 1148908091, ; 22: FruitCatch.GameAssets.dll => 0x447af23b => 3
	i32 1324164729, ; 23: System.Linq => 0x4eed2679 => 15
	i32 1517992127, ; 24: FruitCatch.Core.dll => 0x5a7ab8bf => 2
	i32 1543031311, ; 25: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 26
	i32 1639986890, ; 26: System.Text.RegularExpressions => 0x61c036ca => 26
	i32 1657153582, ; 27: System.Runtime => 0x62c6282e => 22
	i32 1780572499, ; 28: Mono.Android.Runtime.dll => 0x6a216153 => 32
	i32 1824175904, ; 29: System.Text.Encoding.Extensions => 0x6cbab720 => 23
	i32 1910275211, ; 30: System.Collections.NonGeneric.dll => 0x71dc7c8b => 6
	i32 2079903147, ; 31: System.Runtime.dll => 0x7bf8cdab => 22
	i32 2090596640, ; 32: System.Numerics.Vectors => 0x7c9bf920 => 17
	i32 2127167465, ; 33: System.Console => 0x7ec9ffe9 => 12
	i32 2142473426, ; 34: System.Collections.Specialized => 0x7fb38cd2 => 7
	i32 2193016926, ; 35: System.ObjectModel.dll => 0x82b6c85e => 18
	i32 2305521784, ; 36: System.Private.CoreLib.dll => 0x896b7878 => 30
	i32 2353837538, ; 37: FruitCatch.Andriod => 0x8c4cb5e2 => 4
	i32 2435356389, ; 38: System.Console.dll => 0x912896e5 => 12
	i32 2475788418, ; 39: Java.Interop.dll => 0x93918882 => 31
	i32 2570120770, ; 40: System.Text.Encodings.Web => 0x9930ee42 => 24
	i32 2585220780, ; 41: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 23
	i32 2665622720, ; 42: System.Drawing.Primitives => 0x9ee22cc0 => 13
	i32 2909740682, ; 43: System.Private.CoreLib => 0xad6f1e8a => 30
	i32 2919462931, ; 44: System.Numerics.Vectors.dll => 0xae037813 => 17
	i32 2920923626, ; 45: FruitCatch.Andriod.dll => 0xae19c1ea => 4
	i32 2959614098, ; 46: System.ComponentModel.dll => 0xb0682092 => 11
	i32 3038032645, ; 47: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 48: Mono.Android.Runtime => 0xb65adef9 => 32
	i32 3059793426, ; 49: System.ComponentModel.Primitives => 0xb660be12 => 9
	i32 3220365878, ; 50: System.Threading => 0xbff2e236 => 28
	i32 3358260929, ; 51: System.Text.Json => 0xc82afec1 => 25
	i32 3366347497, ; 52: Java.Interop => 0xc8a662e9 => 31
	i32 3471940407, ; 53: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 10
	i32 3476120550, ; 54: Mono.Android => 0xcf3163e6 => 33
	i32 3485117614, ; 55: System.Text.Json.dll => 0xcfbaacae => 25
	i32 3608519521, ; 56: System.Linq.dll => 0xd715a361 => 15
	i32 3672681054, ; 57: Mono.Android.dll => 0xdae8aa5e => 33
	i32 3792276235, ; 58: System.Collections.NonGeneric => 0xe2098b0b => 6
	i32 3802395368, ; 59: System.Collections.Specialized.dll => 0xe2a3f2e8 => 7
	i32 3831343120, ; 60: MonoGame.Framework.dll => 0xe45da810 => 1
	i32 3849253459, ; 61: System.Runtime.InteropServices.dll => 0xe56ef253 => 20
	i32 3896106733, ; 62: System.Collections.Concurrent.dll => 0xe839deed => 5
	i32 4025784931, ; 63: System.Memory => 0xeff49a63 => 16
	i32 4073602200, ; 64: System.Threading.dll => 0xf2ce3c98 => 28
	i32 4099507663, ; 65: System.Drawing.dll => 0xf45985cf => 14
	i32 4100113165, ; 66: System.Private.Uri => 0xf462c30d => 19
	i32 4181436372 ; 67: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 21
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [68 x i32] [
	i32 27, ; 0
	i32 20, ; 1
	i32 11, ; 2
	i32 3, ; 3
	i32 27, ; 4
	i32 16, ; 5
	i32 0, ; 6
	i32 8, ; 7
	i32 21, ; 8
	i32 29, ; 9
	i32 2, ; 10
	i32 18, ; 11
	i32 1, ; 12
	i32 24, ; 13
	i32 5, ; 14
	i32 19, ; 15
	i32 9, ; 16
	i32 8, ; 17
	i32 14, ; 18
	i32 13, ; 19
	i32 10, ; 20
	i32 29, ; 21
	i32 3, ; 22
	i32 15, ; 23
	i32 2, ; 24
	i32 26, ; 25
	i32 26, ; 26
	i32 22, ; 27
	i32 32, ; 28
	i32 23, ; 29
	i32 6, ; 30
	i32 22, ; 31
	i32 17, ; 32
	i32 12, ; 33
	i32 7, ; 34
	i32 18, ; 35
	i32 30, ; 36
	i32 4, ; 37
	i32 12, ; 38
	i32 31, ; 39
	i32 24, ; 40
	i32 23, ; 41
	i32 13, ; 42
	i32 30, ; 43
	i32 17, ; 44
	i32 4, ; 45
	i32 11, ; 46
	i32 0, ; 47
	i32 32, ; 48
	i32 9, ; 49
	i32 28, ; 50
	i32 25, ; 51
	i32 31, ; 52
	i32 10, ; 53
	i32 33, ; 54
	i32 25, ; 55
	i32 15, ; 56
	i32 33, ; 57
	i32 6, ; 58
	i32 7, ; 59
	i32 1, ; 60
	i32 20, ; 61
	i32 5, ; 62
	i32 16, ; 63
	i32 28, ; 64
	i32 14, ; 65
	i32 19, ; 66
	i32 21 ; 67
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
