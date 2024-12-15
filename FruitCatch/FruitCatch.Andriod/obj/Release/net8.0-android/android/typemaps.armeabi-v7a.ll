; ModuleID = 'typemaps.armeabi-v7a.ll'
source_filename = "typemaps.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 3, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 132, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [3 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] c"\08\F2\AB\EC\EB\AD@I\9CR\99\F4\0D\82\CB\07", ; module_uuid: ecabf208-adeb-4940-9c52-99f40d82cb07
		i32 6, ; uint32_t entry_count (0x6)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: MonoGame.Framework
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] c"O\DBh\92\00E7@\BA\81\B0\DC\CDa\F8\0E", ; module_uuid: 9268db4f-4500-4037-ba81-b0dccd61f80e
		i32 1, ; uint32_t entry_count (0x1)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: FruitCatch.Andriod
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] c"\A5\E8\F9\15u \15L\B6\EB9\C0\D6\B2\B0\DF", ; module_uuid: 15f9e8a5-2075-4c15-b6eb-39c0d6b2b0df
		i32 125, ; uint32_t entry_count (0x7d)
		i32 44, ; uint32_t duplicate_count (0x2c)
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	} ; 2
], align 4

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [132 x i32] [
	i32 12341354, ; 0: 0xbc506a => java/lang/Object
	i32 34115578, ; 1: 0x2088ffa => android/content/pm/PackageItemInfo
	i32 74282880, ; 2: 0x46d7780 => android/view/ViewGroup
	i32 118977103, ; 3: 0x717724f => android/util/DisplayMetrics
	i32 139280357, ; 4: 0x84d3fe5 => android/view/KeyEvent
	i32 183151336, ; 5: 0xaeaaae8 => android/view/OrientationEventListener
	i32 262602588, ; 6: 0xfa6ff5c => android/provider/MediaStore
	i32 366534601, ; 7: 0x15d8dfc9 => android/view/ViewGroup$LayoutParams
	i32 393371378, ; 8: 0x17725ef2 => mono/java/lang/RunnableImplementor
	i32 445764737, ; 9: 0x1a91d481 => android/provider/Settings$SettingNotFoundException
	i32 531198748, ; 10: 0x1fa9731c => mono/android/runtime/OutputStreamAdapter
	i32 559360414, ; 11: 0x2157299e => crc64493ac3851fab1842/AndroidGameActivity
	i32 581097368, ; 12: 0x22a2d798 => java/nio/channels/FileChannel
	i32 591810476, ; 13: 0x23464fac => android/os/Bundle
	i32 699867921, ; 14: 0x29b72311 => android/content/res/AssetFileDescriptor
	i32 780408360, ; 15: 0x2e841628 => java/lang/CharSequence
	i32 780987551, ; 16: 0x2e8cec9f => java/io/PrintWriter
	i32 806800039, ; 17: 0x3016caa7 => java/lang/Thread
	i32 827461610, ; 18: 0x31520fea => android/provider/MediaStore$Images
	i32 857458217, ; 19: 0x331bc629 => android/content/res/AssetManager
	i32 864882745, ; 20: 0x338d1039 => android/graphics/Bitmap$Config
	i32 883855573, ; 21: 0x34ae90d5 => android/provider/MediaStore$Images$Media
	i32 885223365, ; 22: 0x34c36fc5 => android/content/ContentResolver
	i32 906034180, ; 23: 0x3600fc04 => android/database/Cursor
	i32 928674904, ; 24: 0x375a7458 => android/graphics/BitmapFactory
	i32 996699600, ; 25: 0x3b686dd0 => java/io/FileDescriptor
	i32 1018791985, ; 26: 0x3cb98831 => android/widget/EditText
	i32 1026417919, ; 27: 0x3d2de4ff => android/view/WindowMetrics
	i32 1030707578, ; 28: 0x3d6f597a => android/database/DataSetObserver
	i32 1035992969, ; 29: 0x3dbfff89 => android/content/res/Resources
	i32 1070459310, ; 30: 0x3fcde9ae => android/database/ContentObserver
	i32 1077629184, ; 31: 0x403b5100 => java/util/function/Consumer
	i32 1084296731, ; 32: 0x40a10e1b => android/hardware/Sensor
	i32 1097102249, ; 33: 0x416473a9 => android/hardware/SensorManager
	i32 1102556300, ; 34: 0x41b7ac8c => android/provider/Settings$NameValueTable
	i32 1196093578, ; 35: 0x474af08a => android/provider/Settings$System
	i32 1267415633, ; 36: 0x4b8b3a51 => android/os/Vibrator
	i32 1298454265, ; 37: 0x4d64d6f9 => java/lang/Throwable
	i32 1340347874, ; 38: 0x4fe415e2 => android/graphics/Paint
	i32 1340834341, ; 39: 0x4feb8225 => android/media/MediaPlayer$OnCompletionListener
	i32 1358802632, ; 40: 0x50fdaec8 => crc64493ac3851fab1842/OrientationListener
	i32 1415978247, ; 41: 0x54661d07 => android/content/pm/ApplicationInfo
	i32 1424548067, ; 42: 0x54e8e0e3 => android/graphics/BitmapFactory$Options
	i32 1433059198, ; 43: 0x556abf7e => android/view/ViewManager
	i32 1457311873, ; 44: 0x56dcd081 => mono/android/content/DialogInterface_OnCancelListenerImplementor
	i32 1489594546, ; 45: 0x58c968b2 => java/nio/channels/spi/AbstractInterruptibleChannel
	i32 1492815417, ; 46: 0x58fa8e39 => java/util/concurrent/Executor
	i32 1518406749, ; 47: 0x5a810c5d => android/provider/MediaStore$Audio$Media
	i32 1536774344, ; 48: 0x5b9950c8 => android/provider/MediaStore$Audio
	i32 1553648812, ; 49: 0x5c9accac => android/app/KeyguardManager
	i32 1573833883, ; 50: 0x5dcecc9b => android/app/AlertDialog
	i32 1584672329, ; 51: 0x5e742e49 => android/view/Display
	i32 1586851388, ; 52: 0x5e956e3c => android/os/Handler
	i32 1638234847, ; 53: 0x61a57adf => crc64493ac3851fab1842/ScreenReceiver
	i32 1646348278, ; 54: 0x622147f6 => android/view/View
	i32 1661912031, ; 55: 0x630ec3df => android/view/View$OnTouchListener
	i32 1758490869, ; 56: 0x68d070f5 => android/os/BaseBundle
	i32 1772705556, ; 57: 0x69a95714 => android/graphics/Point
	i32 1851730788, ; 58: 0x6e5f2b64 => java/lang/Runnable
	i32 1872777977, ; 59: 0x6fa052f9 => javax/microedition/khronos/egl/EGLConfig
	i32 1944129628, ; 60: 0x73e1105c => java/io/OutputStream
	i32 1962126435, ; 61: 0x74f3ac63 => android/content/BroadcastReceiver
	i32 1985929388, ; 62: 0x765ee0ac => android/app/Activity
	i32 2008064836, ; 63: 0x77b0a344 => android/content/Intent
	i32 2027782872, ; 64: 0x78dd82d8 => android/view/ContextThemeWrapper
	i32 2036556174, ; 65: 0x7963618e => android/content/DialogInterface
	i32 2061721420, ; 66: 0x7ae35f4c => android/database/CharArrayBuffer
	i32 2073337312, ; 67: 0x7b949de0 => android/app/AlertDialog$Builder
	i32 2114237978, ; 68: 0x7e04b61a => android/content/res/Configuration
	i32 2194570250, ; 69: 0x82ce7c0a => javax/microedition/khronos/egl/EGL10
	i32 2284656609, ; 70: 0x882d17e1 => android/app/Application
	i32 2296411383, ; 71: 0x88e074f7 => android/content/IntentFilter
	i32 2333838264, ; 72: 0x8b1b8bb8 => javax/microedition/khronos/egl/EGLSurface
	i32 2363729366, ; 73: 0x8ce3a5d6 => java/lang/Enum
	i32 2382171607, ; 74: 0x8dfd0dd7 => crc64fcb58ddc37e15954/ActivityAndriod
	i32 2442189280, ; 75: 0x9190d9e0 => android/util/AndroidException
	i32 2558143838, ; 76: 0x987a2d5e => java/io/FileInputStream
	i32 2603371956, ; 77: 0x9b2c4db4 => android/media/AudioManager
	i32 2628279754, ; 78: 0x9ca85dca => android/content/DialogInterface$OnCancelListener
	i32 2637159311, ; 79: 0x9d2fdb8f => android/content/pm/PackageManager
	i32 2663462016, ; 80: 0x9ec13480 => mono/android/media/MediaPlayer_OnCompletionListenerImplementor
	i32 2681988174, ; 81: 0x9fdbe44e => android/view/MotionEvent
	i32 2687778660, ; 82: 0xa0343f64 => android/widget/TextView
	i32 2692535938, ; 83: 0xa07cd682 => android/util/Log
	i32 2789289167, ; 84: 0xa6412ccf => javax/microedition/khronos/egl/EGLDisplay
	i32 2815615939, ; 85: 0xa7d2e3c3 => android/os/Build
	i32 2874673969, ; 86: 0xab580b31 => java/lang/StackTraceElement
	i32 2887387454, ; 87: 0xac1a093e => javax/microedition/khronos/egl/EGLContext
	i32 2898734456, ; 88: 0xacc72d78 => javax/microedition/khronos/egl/EGL
	i32 2917163057, ; 89: 0xade06031 => android/view/SurfaceHolder
	i32 2918613155, ; 90: 0xadf680a3 => android/content/DialogInterface$OnClickListener
	i32 2928676880, ; 91: 0xae901010 => android/view/InputDevice
	i32 2932874700, ; 92: 0xaed01dcc => android/view/InputEvent
	i32 2933762856, ; 93: 0xaeddab28 => android/util/AttributeSet
	i32 2942792700, ; 94: 0xaf6773fc => java/lang/Exception
	i32 2980510762, ; 95: 0xb1a6fc2a => mono/android/runtime/JavaArray
	i32 2983720033, ; 96: 0xb1d7f461 => mono/android/TypeManager
	i32 3011322120, ; 97: 0xb37d2108 => android/view/Surface
	i32 3014164775, ; 98: 0xb3a88127 => crc64f0e061189adeef62/Accelerometer_SensorListener
	i32 3032808825, ; 99: 0xb4c4fd79 => java/io/StringWriter
	i32 3214744068, ; 100: 0xbf9d1a04 => android/view/WindowManager
	i32 3284821309, ; 101: 0xc3ca653d => android/view/KeyCharacterMap
	i32 3515974447, ; 102: 0xd191832f => java/util/function/IntConsumer
	i32 3549151004, ; 103: 0xd38bbf1c => android/provider/Settings
	i32 3576242387, ; 104: 0xd52920d3 => android/runtime/JavaProxyThrowable
	i32 3630284820, ; 105: 0xd861c014 => android/media/MediaPlayer
	i32 3666243682, ; 106: 0xda867062 => java/lang/String
	i32 3715861037, ; 107: 0xdd7b8a2d => android/os/Build$VERSION
	i32 3759929762, ; 108: 0xe01bf9a2 => android/graphics/Bitmap
	i32 3763853270, ; 109: 0xe057d7d6 => android/view/Window
	i32 3823421666, ; 110: 0xe3e4c8e2 => android/net/Uri
	i32 3882570516, ; 111: 0xe76b5314 => java/lang/Class
	i32 3900581163, ; 112: 0xe87e252b => java/io/InputStream
	i32 3931120197, ; 113: 0xea502245 => mono/android/content/DialogInterface_OnClickListenerImplementor
	i32 3933245259, ; 114: 0xea708f4b => android/graphics/Rect
	i32 3969984744, ; 115: 0xeca128e8 => mono/android/runtime/InputStreamAdapter
	i32 3993327007, ; 116: 0xee05559f => android/content/ContextWrapper
	i32 3995406185, ; 117: 0xee250f69 => android/graphics/Canvas
	i32 4020308495, ; 118: 0xefa10a0f => java/lang/Error
	i32 4030673356, ; 119: 0xf03f31cc => android/app/Dialog
	i32 4051772911, ; 120: 0xf18125ef => android/content/Context
	i32 4085114189, ; 121: 0xf37de54d => android/view/SurfaceView
	i32 4092334250, ; 122: 0xf3ec10aa => crc64f0e061189adeef62/Compass_SensorListener
	i32 4101363546, ; 123: 0xf475d75a => java/io/Writer
	i32 4117799665, ; 124: 0xf570a2f1 => android/view/SurfaceHolder$Callback
	i32 4118878202, ; 125: 0xf58117fa => android/os/Looper
	i32 4157808693, ; 126: 0xf7d32035 => java/io/IOException
	i32 4175389061, ; 127: 0xf8df6185 => android/content/ContentUris
	i32 4181143849, ; 128: 0xf9373129 => crc64493ac3851fab1842/MonoGameAndroidGameView
	i32 4246685161, ; 129: 0xfd1f45e9 => android/hardware/SensorEventListener
	i32 4260664886, ; 130: 0xfdf49636 => android/hardware/SensorEvent
	i32 4277523103 ; 131: 0xfef5d29f => java/io/Closeable
], align 4

@module0_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 122; uint32_t java_map_index (0x7a)
	} ; 5
], align 4

@module1_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 74; uint32_t java_map_index (0x4a)
	} ; 0
], align 4

@module2_managed_to_java = internal dso_local constant [125 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554529, ; uint32_t type_token_id (0x2000061)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554530, ; uint32_t type_token_id (0x2000062)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554531, ; uint32_t type_token_id (0x2000063)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554532, ; uint32_t type_token_id (0x2000064)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554533, ; uint32_t type_token_id (0x2000065)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554556, ; uint32_t type_token_id (0x200007c)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554607, ; uint32_t type_token_id (0x20000af)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 57; uint32_t java_map_index (0x39)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554683, ; uint32_t type_token_id (0x20000fb)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554694, ; uint32_t type_token_id (0x2000106)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554699, ; uint32_t type_token_id (0x200010b)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554716, ; uint32_t type_token_id (0x200011c)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 96; uint32_t java_map_index (0x60)
	} ; 124
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [44 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554507, ; uint32_t type_token_id (0x200004b)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554513, ; uint32_t type_token_id (0x2000051)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 93; uint32_t java_map_index (0x5d)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554611, ; uint32_t type_token_id (0x20000b3)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554681, ; uint32_t type_token_id (0x20000f9)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554684, ; uint32_t type_token_id (0x20000fc)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554691, ; uint32_t type_token_id (0x2000103)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554709, ; uint32_t type_token_id (0x2000115)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554711, ; uint32_t type_token_id (0x2000117)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 131; uint32_t java_map_index (0x83)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554738, ; uint32_t type_token_id (0x2000132)
		i32 58; uint32_t java_map_index (0x3a)
	} ; 43
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [132 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 0
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 1
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 2
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 3
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 4
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 5
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 7
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 8
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554532, ; uint32_t type_token_id (0x2000064)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 9
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 10
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 12
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 13
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554694, ; uint32_t type_token_id (0x2000106)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 14
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 15
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 16
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 17
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 19
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 20
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554529, ; uint32_t type_token_id (0x2000061)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 22
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 23
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 24
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554716, ; uint32_t type_token_id (0x200011c)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 25
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 26
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 28
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 29
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 30
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 31
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 32
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 33
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554531, ; uint32_t type_token_id (0x2000063)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 34
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554533, ; uint32_t type_token_id (0x2000065)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 35
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 36
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 37
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 38
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 39
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 40
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 41
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 43
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 44
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 45
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 46
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 47
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 48
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 50
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 52
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 53
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 54
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 55
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 56
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 57
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 58
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 59
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 60
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 61
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 62
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 63
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 64
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 65
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 66
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 67
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 68
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 69
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 70
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 71
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 73
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 74
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 75
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 76
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 77
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 78
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554699, ; uint32_t type_token_id (0x200010b)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 79
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 80
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 81
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 82
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 83
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 84
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 85
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 86
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 87
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 88
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 89
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 90
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 92
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 95
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 96
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 97
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 98
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 100
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 101
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 102
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554530, ; uint32_t type_token_id (0x2000062)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 103
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 104
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 105
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 106
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 107
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 109
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 110
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 111
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 112
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 113
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 114
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 115
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 116
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 117
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 118
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 119
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 120
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 121
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 122
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 123
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 124
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 125
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 126
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 127
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 128
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 129
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 130
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 112; uint32_t java_name_index (0x70)
	} ; 131
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [132 x ptr] [
	ptr @.str.0, ; 0
	ptr @.str.1, ; 1
	ptr @.str.2, ; 2
	ptr @.str.3, ; 3
	ptr @.str.4, ; 4
	ptr @.str.5, ; 5
	ptr @.str.6, ; 6
	ptr @.str.7, ; 7
	ptr @.str.8, ; 8
	ptr @.str.9, ; 9
	ptr @.str.10, ; 10
	ptr @.str.11, ; 11
	ptr @.str.12, ; 12
	ptr @.str.13, ; 13
	ptr @.str.14, ; 14
	ptr @.str.15, ; 15
	ptr @.str.16, ; 16
	ptr @.str.17, ; 17
	ptr @.str.18, ; 18
	ptr @.str.19, ; 19
	ptr @.str.20, ; 20
	ptr @.str.21, ; 21
	ptr @.str.22, ; 22
	ptr @.str.23, ; 23
	ptr @.str.24, ; 24
	ptr @.str.25, ; 25
	ptr @.str.26, ; 26
	ptr @.str.27, ; 27
	ptr @.str.28, ; 28
	ptr @.str.29, ; 29
	ptr @.str.30, ; 30
	ptr @.str.31, ; 31
	ptr @.str.32, ; 32
	ptr @.str.33, ; 33
	ptr @.str.34, ; 34
	ptr @.str.35, ; 35
	ptr @.str.36, ; 36
	ptr @.str.37, ; 37
	ptr @.str.38, ; 38
	ptr @.str.39, ; 39
	ptr @.str.40, ; 40
	ptr @.str.41, ; 41
	ptr @.str.42, ; 42
	ptr @.str.43, ; 43
	ptr @.str.44, ; 44
	ptr @.str.45, ; 45
	ptr @.str.46, ; 46
	ptr @.str.47, ; 47
	ptr @.str.48, ; 48
	ptr @.str.49, ; 49
	ptr @.str.50, ; 50
	ptr @.str.51, ; 51
	ptr @.str.52, ; 52
	ptr @.str.53, ; 53
	ptr @.str.54, ; 54
	ptr @.str.55, ; 55
	ptr @.str.56, ; 56
	ptr @.str.57, ; 57
	ptr @.str.58, ; 58
	ptr @.str.59, ; 59
	ptr @.str.60, ; 60
	ptr @.str.61, ; 61
	ptr @.str.62, ; 62
	ptr @.str.63, ; 63
	ptr @.str.64, ; 64
	ptr @.str.65, ; 65
	ptr @.str.66, ; 66
	ptr @.str.67, ; 67
	ptr @.str.68, ; 68
	ptr @.str.69, ; 69
	ptr @.str.70, ; 70
	ptr @.str.71, ; 71
	ptr @.str.72, ; 72
	ptr @.str.73, ; 73
	ptr @.str.74, ; 74
	ptr @.str.75, ; 75
	ptr @.str.76, ; 76
	ptr @.str.77, ; 77
	ptr @.str.78, ; 78
	ptr @.str.79, ; 79
	ptr @.str.80, ; 80
	ptr @.str.81, ; 81
	ptr @.str.82, ; 82
	ptr @.str.83, ; 83
	ptr @.str.84, ; 84
	ptr @.str.85, ; 85
	ptr @.str.86, ; 86
	ptr @.str.87, ; 87
	ptr @.str.88, ; 88
	ptr @.str.89, ; 89
	ptr @.str.90, ; 90
	ptr @.str.91, ; 91
	ptr @.str.92, ; 92
	ptr @.str.93, ; 93
	ptr @.str.94, ; 94
	ptr @.str.95, ; 95
	ptr @.str.96, ; 96
	ptr @.str.97, ; 97
	ptr @.str.98, ; 98
	ptr @.str.99, ; 99
	ptr @.str.100, ; 100
	ptr @.str.101, ; 101
	ptr @.str.102, ; 102
	ptr @.str.103, ; 103
	ptr @.str.104, ; 104
	ptr @.str.105, ; 105
	ptr @.str.106, ; 106
	ptr @.str.107, ; 107
	ptr @.str.108, ; 108
	ptr @.str.109, ; 109
	ptr @.str.110, ; 110
	ptr @.str.111, ; 111
	ptr @.str.112, ; 112
	ptr @.str.113, ; 113
	ptr @.str.114, ; 114
	ptr @.str.115, ; 115
	ptr @.str.116, ; 116
	ptr @.str.117, ; 117
	ptr @.str.118, ; 118
	ptr @.str.119, ; 119
	ptr @.str.120, ; 120
	ptr @.str.121, ; 121
	ptr @.str.122, ; 122
	ptr @.str.123, ; 123
	ptr @.str.124, ; 124
	ptr @.str.125, ; 125
	ptr @.str.126, ; 126
	ptr @.str.127, ; 127
	ptr @.str.128, ; 128
	ptr @.str.129, ; 129
	ptr @.str.130, ; 130
	ptr @.str.131 ; 131
], align 4

; Strings
@.str.0 = private unnamed_addr constant [51 x i8] c"crc64f0e061189adeef62/Accelerometer_SensorListener\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"crc64f0e061189adeef62/Compass_SensorListener\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/AndroidGameActivity\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"crc64493ac3851fab1842/MonoGameAndroidGameView\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/OrientationListener\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"crc64493ac3851fab1842/ScreenReceiver\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"crc64fcb58ddc37e15954/ActivityAndriod\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"javax/microedition/khronos/egl/EGLConfig\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLContext\00", align 1
@.str.9 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLDisplay\00", align 1
@.str.10 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLSurface\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c"javax/microedition/khronos/egl/EGL\00", align 1
@.str.12 = private unnamed_addr constant [37 x i8] c"javax/microedition/khronos/egl/EGL10\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"android/widget/EditText\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"android/widget/TextView\00", align 1
@.str.15 = private unnamed_addr constant [30 x i8] c"android/util/AndroidException\00", align 1
@.str.16 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.str.17 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.18 = private unnamed_addr constant [17 x i8] c"android/util/Log\00", align 1
@.str.19 = private unnamed_addr constant [28 x i8] c"android/provider/MediaStore\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"android/provider/MediaStore$Audio\00", align 1
@.str.21 = private unnamed_addr constant [40 x i8] c"android/provider/MediaStore$Audio$Media\00", align 1
@.str.22 = private unnamed_addr constant [35 x i8] c"android/provider/MediaStore$Images\00", align 1
@.str.23 = private unnamed_addr constant [41 x i8] c"android/provider/MediaStore$Images$Media\00", align 1
@.str.24 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 1
@.str.25 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 1
@.str.26 = private unnamed_addr constant [51 x i8] c"android/provider/Settings$SettingNotFoundException\00", align 1
@.str.27 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$System\00", align 1
@.str.28 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.29 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.30 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.31 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.32 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.33 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.34 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 1
@.str.35 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.str.36 = private unnamed_addr constant [27 x i8] c"android/media/AudioManager\00", align 1
@.str.37 = private unnamed_addr constant [26 x i8] c"android/media/MediaPlayer\00", align 1
@.str.38 = private unnamed_addr constant [47 x i8] c"android/media/MediaPlayer$OnCompletionListener\00", align 1
@.str.39 = private unnamed_addr constant [63 x i8] c"mono/android/media/MediaPlayer_OnCompletionListenerImplementor\00", align 1
@.str.40 = private unnamed_addr constant [37 x i8] c"android/hardware/SensorEventListener\00", align 1
@.str.41 = private unnamed_addr constant [24 x i8] c"android/hardware/Sensor\00", align 1
@.str.42 = private unnamed_addr constant [29 x i8] c"android/hardware/SensorEvent\00", align 1
@.str.43 = private unnamed_addr constant [31 x i8] c"android/hardware/SensorManager\00", align 1
@.str.44 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 1
@.str.45 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 1
@.str.46 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 1
@.str.47 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 1
@.str.48 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.49 = private unnamed_addr constant [24 x i8] c"android/app/AlertDialog\00", align 1
@.str.50 = private unnamed_addr constant [32 x i8] c"android/app/AlertDialog$Builder\00", align 1
@.str.51 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.52 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 1
@.str.53 = private unnamed_addr constant [28 x i8] c"android/app/KeyguardManager\00", align 1
@.str.54 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.55 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.str.56 = private unnamed_addr constant [25 x i8] c"android/view/InputDevice\00", align 1
@.str.57 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.str.58 = private unnamed_addr constant [36 x i8] c"android/view/SurfaceHolder$Callback\00", align 1
@.str.59 = private unnamed_addr constant [27 x i8] c"android/view/SurfaceHolder\00", align 1
@.str.60 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.str.61 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.str.62 = private unnamed_addr constant [29 x i8] c"android/view/KeyCharacterMap\00", align 1
@.str.63 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.str.64 = private unnamed_addr constant [25 x i8] c"android/view/MotionEvent\00", align 1
@.str.65 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.str.66 = private unnamed_addr constant [21 x i8] c"android/view/Surface\00", align 1
@.str.67 = private unnamed_addr constant [25 x i8] c"android/view/SurfaceView\00", align 1
@.str.68 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.69 = private unnamed_addr constant [34 x i8] c"android/view/View$OnTouchListener\00", align 1
@.str.70 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.str.71 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.str.72 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.73 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.str.74 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.75 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 1
@.str.76 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.77 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.78 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 1
@.str.79 = private unnamed_addr constant [31 x i8] c"android/graphics/Bitmap$Config\00", align 1
@.str.80 = private unnamed_addr constant [31 x i8] c"android/graphics/BitmapFactory\00", align 1
@.str.81 = private unnamed_addr constant [39 x i8] c"android/graphics/BitmapFactory$Options\00", align 1
@.str.82 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.str.83 = private unnamed_addr constant [23 x i8] c"android/graphics/Paint\00", align 1
@.str.84 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.str.85 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.str.86 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.str.87 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.str.88 = private unnamed_addr constant [28 x i8] c"android/content/ContentUris\00", align 1
@.str.89 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.90 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.91 = private unnamed_addr constant [49 x i8] c"android/content/DialogInterface$OnCancelListener\00", align 1
@.str.92 = private unnamed_addr constant [65 x i8] c"mono/android/content/DialogInterface_OnCancelListenerImplementor\00", align 1
@.str.93 = private unnamed_addr constant [48 x i8] c"android/content/DialogInterface$OnClickListener\00", align 1
@.str.94 = private unnamed_addr constant [64 x i8] c"mono/android/content/DialogInterface_OnClickListenerImplementor\00", align 1
@.str.95 = private unnamed_addr constant [32 x i8] c"android/content/DialogInterface\00", align 1
@.str.96 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.str.97 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.str.98 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 1
@.str.99 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.str.100 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.str.101 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.str.102 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.str.103 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.str.104 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.str.105 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.str.106 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.str.107 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.str.108 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.109 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.110 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.str.111 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.112 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 1
@.str.113 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.114 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.115 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.116 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.117 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.118 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.119 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.120 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.str.121 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.122 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.123 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.str.124 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.125 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.126 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.127 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.128 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.129 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.130 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.131 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [19 x i8] c"MonoGame.Framework\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [19 x i8] c"FruitCatch.Andriod\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1

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
