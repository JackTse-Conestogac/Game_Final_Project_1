; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [34 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [68 x i64] [
	i64 120698629574877762, ; 0: Mono.Android => 0x1accec39cafe242 => 33
	i64 750875890346172408, ; 1: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 27
	i64 799765834175365804, ; 2: System.ComponentModel.dll => 0xb1956c9f18442ac => 11
	i64 1268860745194512059, ; 3: System.Drawing.dll => 0x119be62002c19ebb => 14
	i64 1513467482682125403, ; 4: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 32
	i64 1537168428375924959, ; 5: System.Threading.Thread.dll => 0x15551e8a954ae0df => 27
	i64 1743969030606105336, ; 6: System.Memory.dll => 0x1833d297e88f2af8 => 16
	i64 1767386781656293639, ; 7: System.Private.Uri.dll => 0x188704e9f5582107 => 19
	i64 1875417405349196092, ; 8: System.Drawing.Primitives => 0x1a06d2319b6c713c => 13
	i64 2102659300918482391, ; 9: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 13
	i64 2287834202362508563, ; 10: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 5
	i64 2335503487726329082, ; 11: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 24
	i64 2497223385847772520, ; 12: System.Runtime => 0x22a7eb7046413568 => 22
	i64 2730259014180778965, ; 13: FruitCatch.GameAssets.dll => 0x25e3d41b9d0db3d5 => 3
	i64 3311221304742556517, ; 14: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 17
	i64 3551103847008531295, ; 15: System.Private.CoreLib.dll => 0x31480e226177735f => 30
	i64 3571415421602489686, ; 16: System.Runtime.dll => 0x319037675df7e556 => 22
	i64 3966267475168208030, ; 17: System.Memory => 0x370b03412596249e => 16
	i64 4009997192427317104, ; 18: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 21
	i64 4154383907710350974, ; 19: System.ComponentModel => 0x39a7562737acb67e => 11
	i64 4205801962323029395, ; 20: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 10
	i64 4783864354832935512, ; 21: MonoGame.Framework => 0x4263b348e3786a58 => 1
	i64 4809057822547766521, ; 22: System.Drawing => 0x42bd349c3145ecf9 => 14
	i64 5103417709280584325, ; 23: System.Collections.Specialized => 0x46d2fb5e161b6285 => 7
	i64 5182934613077526976, ; 24: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 7
	i64 5610856691579038728, ; 25: FruitCatch.GameAssets => 0x4dddc46ef3312c08 => 3
	i64 6222399776351216807, ; 26: System.Text.Json.dll => 0x565a67a0ffe264a7 => 25
	i64 6357457916754632952, ; 27: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 0
	i64 6894844156784520562, ; 28: System.Numerics.Vectors => 0x5faf683aead1ad72 => 17
	i64 7270811800166795866, ; 29: System.Linq => 0x64e71ccf51a90a5a => 15
	i64 7328660988031287225, ; 30: FruitCatch.Andriod => 0x65b4a256f6de3fb9 => 4
	i64 7377312882064240630, ; 31: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 10
	i64 7489048572193775167, ; 32: System.ObjectModel => 0x67ee71ff6b419e3f => 18
	i64 7714652370974252055, ; 33: System.Private.CoreLib => 0x6b0ff375198b9c17 => 30
	i64 8064050204834738623, ; 34: System.Collections.dll => 0x6fe942efa61731bf => 8
	i64 8167236081217502503, ; 35: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 31
	i64 8185542183669246576, ; 36: System.Collections => 0x7198e33f4794aa70 => 8
	i64 8542727676164789457, ; 37: FruitCatch.Core => 0x768ddd8f66b354d1 => 2
	i64 8563666267364444763, ; 38: System.Private.Uri => 0x76d841191140ca5b => 19
	i64 8626175481042262068, ; 39: Java.Interop => 0x77b654e585b55834 => 31
	i64 9659729154652888475, ; 40: System.Text.RegularExpressions => 0x860e407c9991dd9b => 26
	i64 9702891218465930390, ; 41: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 6
	i64 9808709177481450983, ; 42: Mono.Android.dll => 0x881f890734e555e7 => 33
	i64 11398943845512338812, ; 43: FruitCatch.Core.dll => 0x9e312f0886635d7c => 2
	i64 11485890710487134646, ; 44: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 20
	i64 11967058488280265467, ; 45: FruitCatch.Andriod.dll => 0xa613884a7844b2fb => 4
	i64 12145679461940342714, ; 46: System.Text.Json => 0xa88e1f1ebcb62fba => 25
	i64 12201331334810686224, ; 47: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 21
	i64 12475113361194491050, ; 48: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 0
	i64 12708922737231849740, ; 49: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 23
	i64 13343850469010654401, ; 50: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 32
	i64 13717397318615465333, ; 51: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 9
	i64 13881769479078963060, ; 52: System.Console.dll => 0xc0a5f3cade5c6774 => 12
	i64 14125464355221830302, ; 53: System.Threading.dll => 0xc407bafdbc707a9e => 28
	i64 14254574811015963973, ; 54: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 23
	i64 14551742072151931844, ; 55: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 24
	i64 14843517874685189901, ; 56: MonoGame.Framework.dll => 0xcdfec4dcd9c59f0d => 1
	i64 15076659072870671916, ; 57: System.ObjectModel.dll => 0xd13b0d8c1620662c => 18
	i64 15133485256822086103, ; 58: System.Linq.dll => 0xd204f0a9127dd9d7 => 15
	i64 15527772828719725935, ; 59: System.Console => 0xd77dbb1e38cd3d6f => 12
	i64 15609085926864131306, ; 60: System.dll => 0xd89e9cf3334914ea => 29
	i64 16154507427712707110, ; 61: System => 0xe03056ea4e39aa26 => 29
	i64 16890310621557459193, ; 62: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 26
	i64 17008137082415910100, ; 63: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 6
	i64 17062143951396181894, ; 64: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 9
	i64 17712670374920797664, ; 65: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 20
	i64 18025913125965088385, ; 66: System.Threading => 0xfa28e87b91334681 => 28
	i64 18245806341561545090 ; 67: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 5
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [68 x i32] [
	i32 33, ; 0
	i32 27, ; 1
	i32 11, ; 2
	i32 14, ; 3
	i32 32, ; 4
	i32 27, ; 5
	i32 16, ; 6
	i32 19, ; 7
	i32 13, ; 8
	i32 13, ; 9
	i32 5, ; 10
	i32 24, ; 11
	i32 22, ; 12
	i32 3, ; 13
	i32 17, ; 14
	i32 30, ; 15
	i32 22, ; 16
	i32 16, ; 17
	i32 21, ; 18
	i32 11, ; 19
	i32 10, ; 20
	i32 1, ; 21
	i32 14, ; 22
	i32 7, ; 23
	i32 7, ; 24
	i32 3, ; 25
	i32 25, ; 26
	i32 0, ; 27
	i32 17, ; 28
	i32 15, ; 29
	i32 4, ; 30
	i32 10, ; 31
	i32 18, ; 32
	i32 30, ; 33
	i32 8, ; 34
	i32 31, ; 35
	i32 8, ; 36
	i32 2, ; 37
	i32 19, ; 38
	i32 31, ; 39
	i32 26, ; 40
	i32 6, ; 41
	i32 33, ; 42
	i32 2, ; 43
	i32 20, ; 44
	i32 4, ; 45
	i32 25, ; 46
	i32 21, ; 47
	i32 0, ; 48
	i32 23, ; 49
	i32 32, ; 50
	i32 9, ; 51
	i32 12, ; 52
	i32 28, ; 53
	i32 23, ; 54
	i32 24, ; 55
	i32 1, ; 56
	i32 18, ; 57
	i32 15, ; 58
	i32 12, ; 59
	i32 29, ; 60
	i32 29, ; 61
	i32 26, ; 62
	i32 6, ; 63
	i32 9, ; 64
	i32 20, ; 65
	i32 28, ; 66
	i32 5 ; 67
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
