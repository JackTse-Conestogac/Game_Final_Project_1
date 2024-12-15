; ModuleID = 'typemaps.arm64-v8a.ll'
source_filename = "typemaps.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

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
], align 8

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [132 x i64] [
	i64 128182020419974451, ; 0: 0x1c764de51b97533 => java/lang/String
	i64 146042335049966109, ; 1: 0x206d8baded2621d => java/util/concurrent/Executor
	i64 191318127108177865, ; 2: 0x2a7b2d2ad603fc9 => android/provider/Settings$NameValueTable
	i64 361870449891484378, ; 3: 0x5059f41c47e22da => android/os/Bundle
	i64 363417747702605178, ; 4: 0x50b1e841ce2e57a => android/widget/TextView
	i64 420183352050048797, ; 5: 0x5d4ca884f79df1d => android/media/MediaPlayer
	i64 698738878519169148, ; 6: 0x9b26b4ed4e3d07c => mono/android/content/DialogInterface_OnClickListenerImplementor
	i64 705175846315662030, ; 7: 0x9c949b22fd49ace => android/view/MotionEvent
	i64 870874870088288028, ; 8: 0xc15f8148b6d471c => java/lang/Exception
	i64 1027042189323199138, ; 9: 0xe40c96dfff2e2a2 => crc64493ac3851fab1842/OrientationListener
	i64 1078373297160254773, ; 10: 0xef726cce080f535 => android/app/KeyguardManager
	i64 1079586186822872943, ; 11: 0xefb75eac1feef6f => java/util/function/Consumer
	i64 1118658323616363018, ; 12: 0xf8645d1842ff20a => mono/android/media/MediaPlayer_OnCompletionListenerImplementor
	i64 1264118133047759527, ; 13: 0x118b0cbe927112a7 => android/provider/Settings
	i64 1317579852464953526, ; 14: 0x1248fbe51d6298b6 => java/io/FileInputStream
	i64 1320822650197077237, ; 15: 0x12548133cc496cf5 => android/runtime/JavaProxyThrowable
	i64 1579421067141938651, ; 16: 0x15eb3b17a9c37ddb => javax/microedition/khronos/egl/EGL
	i64 1747499027921055994, ; 17: 0x18405d1b749330fa => android/os/BaseBundle
	i64 1831728799718484971, ; 18: 0x196b9ba37012abeb => java/io/IOException
	i64 1885389416169908981, ; 19: 0x1a2a3faf4e16aaf5 => android/provider/MediaStore$Images$Media
	i64 1891509142727870308, ; 20: 0x1a3ffd8b2db2c764 => android/database/Cursor
	i64 2111352555338672611, ; 21: 0x1d4d07f6709329e3 => android/view/InputEvent
	i64 2164140653916027403, ; 22: 0x1e08927568a57a0b => java/io/InputStream
	i64 2270205244544766606, ; 23: 0x1f8163a45051d28e => android/view/SurfaceHolder
	i64 2542726837267699812, ; 24: 0x2349949628319864 => android/view/Window
	i64 2885364006830175112, ; 25: 0x280adf46e2cf7388 => android/content/IntentFilter
	i64 2972252214977986258, ; 26: 0x293f8fa450a17ed2 => android/content/Intent
	i64 3071747017624329461, ; 27: 0x2aa109a3415d1cf5 => android/os/Build
	i64 3312753486604898190, ; 28: 0x2df943be8d858f8e => android/app/Dialog
	i64 3476617847597562063, ; 29: 0x303f6d8331d5f8cf => java/io/PrintWriter
	i64 3530631042196079534, ; 30: 0x30ff523a0f1083ae => android/content/DialogInterface
	i64 3648679180818523925, ; 31: 0x32a2b662280d2715 => android/content/pm/PackageManager
	i64 3852049679258842853, ; 32: 0x35753ac6356176e5 => android/view/SurfaceHolder$Callback
	i64 3904020371636272704, ; 33: 0x362dddd7f744be40 => android/hardware/SensorEventListener
	i64 3940353796168302121, ; 34: 0x36aef2e695f93e29 => android/graphics/Canvas
	i64 4159151334517947946, ; 35: 0x39b8461a4508be2a => android/hardware/Sensor
	i64 4305371449952891808, ; 36: 0x3bbfc085dc8cf3a0 => java/lang/Class
	i64 4325151021872010138, ; 37: 0x3c0605f05299539a => javax/microedition/khronos/egl/EGL10
	i64 4328468547648071486, ; 38: 0x3c11cf35fc03a73e => android/net/Uri
	i64 4406641945990788791, ; 39: 0x3d278980a31df6b7 => android/content/BroadcastReceiver
	i64 4413535772071861656, ; 40: 0x3d40076699d29d98 => android/provider/MediaStore
	i64 4515736889328482736, ; 41: 0x3eab1ec6838d39b0 => android/hardware/SensorEvent
	i64 4982359867582679768, ; 42: 0x4524e5e6e26d8ad8 => javax/microedition/khronos/egl/EGLContext
	i64 5214467817578676657, ; 43: 0x485d82da477bc1b1 => java/lang/Error
	i64 5407512276612009785, ; 44: 0x4b0b57c3ee05cf39 => android/view/SurfaceView
	i64 5808851769133758690, ; 45: 0x509d2fe84c1df8e2 => crc64493ac3851fab1842/ScreenReceiver
	i64 5866051512250042973, ; 46: 0x516866c54dce8a5d => android/database/ContentObserver
	i64 6000768439507874839, ; 47: 0x5347031a303df417 => java/lang/Enum
	i64 6194639450693030133, ; 48: 0x55f7c7c2822dd0f5 => crc64f0e061189adeef62/Accelerometer_SensorListener
	i64 6875961628645093091, ; 49: 0x5f6c52abbc9b6ee3 => android/content/ContentResolver
	i64 6885700444039377452, ; 50: 0x5f8eec1264b7722c => android/view/InputDevice
	i64 6887549445287282166, ; 51: 0x5f957dba8b4985f6 => android/view/Surface
	i64 7234103110495206036, ; 52: 0x6464b273799d7a94 => android/graphics/Bitmap$Config
	i64 7291810569935423650, ; 53: 0x6531b714667088a2 => android/os/Build$VERSION
	i64 7359209775714103835, ; 54: 0x66212a4cdd05721b => android/content/pm/PackageItemInfo
	i64 7437796681088239247, ; 55: 0x67385cac9fd8068f => java/io/FileDescriptor
	i64 8190305621607579207, ; 56: 0x71a9cf9199cdfe47 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 8322972551956625025, ; 57: 0x7381237062b37681 => crc64f0e061189adeef62/Compass_SensorListener
	i64 8362058396472415889, ; 58: 0x740bffceb8cf9691 => mono/android/content/DialogInterface_OnCancelListenerImplementor
	i64 8487642170263250902, ; 59: 0x75ca29959b2aa7d6 => android/content/ContextWrapper
	i64 8587172038193766563, ; 60: 0x772bc378d1b4e0a3 => java/lang/Runnable
	i64 8625055343724598723, ; 61: 0x77b25a233aca15c3 => android/provider/MediaStore$Audio$Media
	i64 8719122993390795943, ; 62: 0x79008c2aa5ffbca7 => android/view/OrientationEventListener
	i64 8784751650103882924, ; 63: 0x79e9b5150877f4ac => android/content/res/Configuration
	i64 9052904945156302472, ; 64: 0x7da26115516b2688 => android/graphics/Paint
	i64 9286063777946211584, ; 65: 0x80deb9ce6e1b1500 => android/content/res/AssetFileDescriptor
	i64 9360306727378170850, ; 66: 0x81e67d60221333e2 => android/hardware/SensorManager
	i64 9650117721466985813, ; 67: 0x85ec1af06cbddd55 => android/view/KeyCharacterMap
	i64 9667515047141612341, ; 68: 0x8629e9b6f59e9b35 => java/lang/Thread
	i64 9869939015140501507, ; 69: 0x88f9113db837e803 => android/app/Activity
	i64 10006390178266264615, ; 70: 0x8addd6d9db84b427 => android/media/AudioManager
	i64 10330027021200976477, ; 71: 0x8f5ba0d84edeea5d => android/content/ContentUris
	i64 10341525521370885639, ; 72: 0x8f847aab80f2ae07 => javax/microedition/khronos/egl/EGLSurface
	i64 10499957734077086001, ; 73: 0x91b757ed9047b931 => android/view/ViewGroup$LayoutParams
	i64 10556732314164660806, ; 74: 0x92810c1b96ac0a46 => android/view/WindowManager
	i64 10735120544654490755, ; 75: 0x94facf421d20fc83 => javax/microedition/khronos/egl/EGLDisplay
	i64 10808978037618020601, ; 76: 0x96013441bd3890f9 => android/database/DataSetObserver
	i64 11112718717483603117, ; 77: 0x9a384ecbbc71d4ad => android/os/Handler
	i64 11280841333105678042, ; 78: 0x9c8d996c8b4ed6da => java/util/function/IntConsumer
	i64 11573301743732151818, ; 79: 0xa09ca09e3190560a => mono/java/lang/RunnableImplementor
	i64 11585998938245262039, ; 80: 0xa0c9bca62a296ad7 => mono/android/runtime/JavaArray
	i64 11954228872253987625, ; 81: 0xa5e5f3d2b66adb29 => android/view/View
	i64 12010988764752805573, ; 82: 0xa6af9aa5044c7ec5 => android/provider/MediaStore$Images
	i64 12016049636675011370, ; 83: 0xa6c1957b1579c32a => android/widget/EditText
	i64 12228984007958404582, ; 84: 0xa9b61429ce4b1de6 => android/content/Context
	i64 12255524138452416756, ; 85: 0xaa145e4578ae78f4 => crc64493ac3851fab1842/MonoGameAndroidGameView
	i64 12458575303368155603, ; 86: 0xace5c03ae4b6a1d3 => android/content/res/Resources
	i64 12476375190645835422, ; 87: 0xad24fd221af1069e => android/os/Looper
	i64 12658804585597598720, ; 88: 0xafad1bb38da17c00 => javax/microedition/khronos/egl/EGLConfig
	i64 12751697412850589334, ; 89: 0xb0f7213c503a1e96 => android/provider/Settings$System
	i64 13191394589072141775, ; 90: 0xb7113f7cdda7adcf => android/app/AlertDialog$Builder
	i64 13335777145830317192, ; 91: 0xb91232a87cfd1c88 => android/graphics/Point
	i64 13402681668680117407, ; 92: 0xb9ffe3f79b516c9f => android/view/ViewManager
	i64 13402779434266666368, ; 93: 0xba003ce26e602580 => mono/android/TypeManager
	i64 13491848569179882038, ; 94: 0xbb3cacca71544236 => android/app/AlertDialog
	i64 13493236796125990997, ; 95: 0xbb419b603751d055 => android/graphics/Rect
	i64 13556576098032765635, ; 96: 0xbc22a222a5cb4ac3 => android/util/DisplayMetrics
	i64 13667817128403725814, ; 97: 0xbdadd7435980edf6 => android/content/DialogInterface$OnCancelListener
	i64 13770727111868296170, ; 98: 0xbf1b735909c02bea => java/io/StringWriter
	i64 13805562342397192842, ; 99: 0xbf9735ce2f182a8a => android/util/AttributeSet
	i64 14031640676547298208, ; 100: 0xc2ba66da3d8603a0 => java/nio/channels/FileChannel
	i64 14122621771724408359, ; 101: 0xc3fda1ad30d4c627 => android/util/AndroidException
	i64 14130685465173083664, ; 102: 0xc41a4790206ac610 => android/provider/Settings$SettingNotFoundException
	i64 14167891754637755728, ; 103: 0xc49e767c735e8550 => java/lang/Object
	i64 14206023932851353817, ; 104: 0xc525ef800c4d78d9 => mono/android/runtime/OutputStreamAdapter
	i64 14246866163714017024, ; 105: 0xc5b7094af2b4c700 => crc64493ac3851fab1842/AndroidGameActivity
	i64 14279287371309537477, ; 106: 0xc62a383594a058c5 => android/view/View$OnTouchListener
	i64 14574847037663328426, ; 107: 0xca444228ef93b8aa => android/graphics/BitmapFactory$Options
	i64 14684559126920293129, ; 108: 0xcbca08b94b4deb09 => java/lang/CharSequence
	i64 14830759644181035942, ; 109: 0xcdd17151d49bfba6 => android/content/res/AssetManager
	i64 14940408132235664607, ; 110: 0xcf56fe09e1439cdf => java/lang/Throwable
	i64 14940704599466395126, ; 111: 0xcf580bac893d45f6 => android/util/Log
	i64 15142650489578038267, ; 112: 0xd22580641d31a3fb => java/lang/StackTraceElement
	i64 15633873768898914415, ; 113: 0xd8f6ad5c6a84686f => java/io/Writer
	i64 15699556301161391558, ; 114: 0xd9e00746adf865c6 => android/view/WindowMetrics
	i64 16003229482241506982, ; 115: 0xde16e46ce4103ea6 => android/graphics/Bitmap
	i64 16218544741485660249, ; 116: 0xe113d8834a084859 => android/os/Vibrator
	i64 16314168557433322311, ; 117: 0xe26791dde7a8fb47 => android/view/ContextThemeWrapper
	i64 16413651262945443612, ; 118: 0xe3c900dc43013f1c => android/content/DialogInterface$OnClickListener
	i64 16510466397656947047, ; 119: 0xe520f5b6645d9967 => android/provider/MediaStore$Audio
	i64 16542847110558016359, ; 120: 0xe593ffcc9e686367 => android/app/Application
	i64 16684630517664605545, ; 121: 0xe78bb70e8e0a6569 => android/media/MediaPlayer$OnCompletionListener
	i64 16723123314454325679, ; 122: 0xe814780d351a69af => mono/android/runtime/InputStreamAdapter
	i64 16832017439803262409, ; 123: 0xe99756ae80a745c9 => android/view/ViewGroup
	i64 17125416866214736517, ; 124: 0xeda9b3e7cd367285 => java/io/OutputStream
	i64 17296586735193580360, ; 125: 0xf009d1fe91f26348 => android/content/pm/ApplicationInfo
	i64 17312589003384955623, ; 126: 0xf042abf8f91822e7 => android/view/KeyEvent
	i64 17485531046532206351, ; 127: 0xf2a915d8319dcf0f => android/database/CharArrayBuffer
	i64 17542023464739623563, ; 128: 0xf371c966495f528b => android/view/Display
	i64 17645817129531856090, ; 129: 0xf4e28930113fd4da => java/io/Closeable
	i64 17786854109604896016, ; 130: 0xf6d79992eab25d10 => android/graphics/BitmapFactory
	i64 17977796191809717842 ; 131: 0xf97df662d1304652 => crc64fcb58ddc37e15954/ActivityAndriod
], align 8

@module0_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 105; uint32_t java_map_index (0x69)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 85; uint32_t java_map_index (0x55)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 45; uint32_t java_map_index (0x2d)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 48; uint32_t java_map_index (0x30)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 57; uint32_t java_map_index (0x39)
	} ; 5
], align 4

@module1_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 131; uint32_t java_map_index (0x83)
	} ; 0
], align 4

@module2_managed_to_java = internal dso_local constant [125 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 83; uint32_t java_map_index (0x53)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 101; uint32_t java_map_index (0x65)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 96; uint32_t java_map_index (0x60)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554521, ; uint32_t type_token_id (0x2000059)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 111; uint32_t java_map_index (0x6f)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 119; uint32_t java_map_index (0x77)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 61; uint32_t java_map_index (0x3d)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 82; uint32_t java_map_index (0x52)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554529, ; uint32_t type_token_id (0x2000061)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554530, ; uint32_t type_token_id (0x2000062)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554531, ; uint32_t type_token_id (0x2000063)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554532, ; uint32_t type_token_id (0x2000064)
		i32 102; uint32_t java_map_index (0x66)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554533, ; uint32_t type_token_id (0x2000065)
		i32 89; uint32_t java_map_index (0x59)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 27; uint32_t java_map_index (0x1b)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 53; uint32_t java_map_index (0x35)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 77; uint32_t java_map_index (0x4d)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 87; uint32_t java_map_index (0x57)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 70; uint32_t java_map_index (0x46)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554556, ; uint32_t type_token_id (0x200007c)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 127; uint32_t java_map_index (0x7f)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 69; uint32_t java_map_index (0x45)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 94; uint32_t java_map_index (0x5e)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 90; uint32_t java_map_index (0x5a)
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 120; uint32_t java_map_index (0x78)
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 117; uint32_t java_map_index (0x75)
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 128; uint32_t java_map_index (0x80)
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 50; uint32_t java_map_index (0x32)
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 33554591, ; uint32_t type_token_id (0x200009f)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 33554593, ; uint32_t type_token_id (0x20000a1)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 33554595, ; uint32_t type_token_id (0x20000a3)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 33554597, ; uint32_t type_token_id (0x20000a5)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 67; uint32_t java_map_index (0x43)
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 126; uint32_t java_map_index (0x7e)
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 51; uint32_t java_map_index (0x33)
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 44; uint32_t java_map_index (0x2c)
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 81; uint32_t java_map_index (0x51)
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 33554607, ; uint32_t type_token_id (0x20000af)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 73; uint32_t java_map_index (0x49)
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 114; uint32_t java_map_index (0x72)
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 122; uint32_t java_map_index (0x7a)
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 33554645, ; uint32_t type_token_id (0x20000d5)
		i32 80; uint32_t java_map_index (0x50)
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 104; uint32_t java_map_index (0x68)
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 115; uint32_t java_map_index (0x73)
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 52; uint32_t java_map_index (0x34)
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 130; uint32_t java_map_index (0x82)
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 107; uint32_t java_map_index (0x6b)
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 64; uint32_t java_map_index (0x40)
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 91; uint32_t java_map_index (0x5b)
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 95; uint32_t java_map_index (0x5f)
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 71; uint32_t java_map_index (0x47)
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 59; uint32_t java_map_index (0x3b)
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 33554683, ; uint32_t type_token_id (0x20000fb)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 58; uint32_t java_map_index (0x3a)
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 33554686, ; uint32_t type_token_id (0x20000fe)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 33554690, ; uint32_t type_token_id (0x2000102)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 33554694, ; uint32_t type_token_id (0x2000106)
		i32 65; uint32_t java_map_index (0x41)
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 109; uint32_t java_map_index (0x6d)
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 63; uint32_t java_map_index (0x3f)
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 86; uint32_t java_map_index (0x56)
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 33554699, ; uint32_t type_token_id (0x200010b)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 125; uint32_t java_map_index (0x7d)
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 54; uint32_t java_map_index (0x36)
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 33554706, ; uint32_t type_token_id (0x2000112)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 33554708, ; uint32_t type_token_id (0x2000114)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 33554710, ; uint32_t type_token_id (0x2000116)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 33554716, ; uint32_t type_token_id (0x200011c)
		i32 55; uint32_t java_map_index (0x37)
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 33554718, ; uint32_t type_token_id (0x200011e)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 98; uint32_t java_map_index (0x62)
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 33554734, ; uint32_t type_token_id (0x200012e)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 33554737, ; uint32_t type_token_id (0x2000131)
		i32 60; uint32_t java_map_index (0x3c)
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 103; uint32_t java_map_index (0x67)
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 112; uint32_t java_map_index (0x70)
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 68; uint32_t java_map_index (0x44)
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 79; uint32_t java_map_index (0x4f)
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 110; uint32_t java_map_index (0x6e)
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 93; uint32_t java_map_index (0x5d)
	} ; 124
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [44 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 88; uint32_t java_map_index (0x58)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554507, ; uint32_t type_token_id (0x200004b)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 75; uint32_t java_map_index (0x4b)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 72; uint32_t java_map_index (0x48)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554513, ; uint32_t type_token_id (0x2000051)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554515, ; uint32_t type_token_id (0x2000053)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554516, ; uint32_t type_token_id (0x2000054)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554522, ; uint32_t type_token_id (0x200005a)
		i32 99; uint32_t java_map_index (0x63)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554541, ; uint32_t type_token_id (0x200006d)
		i32 116; uint32_t java_map_index (0x74)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554544, ; uint32_t type_token_id (0x2000070)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554548, ; uint32_t type_token_id (0x2000074)
		i32 121; uint32_t java_map_index (0x79)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 66; uint32_t java_map_index (0x42)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 46; uint32_t java_map_index (0x2e)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 76; uint32_t java_map_index (0x4c)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554590, ; uint32_t type_token_id (0x200009e)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554592, ; uint32_t type_token_id (0x20000a0)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554596, ; uint32_t type_token_id (0x20000a4)
		i32 92; uint32_t java_map_index (0x5c)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554598, ; uint32_t type_token_id (0x20000a6)
		i32 74; uint32_t java_map_index (0x4a)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554603, ; uint32_t type_token_id (0x20000ab)
		i32 62; uint32_t java_map_index (0x3e)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 106; uint32_t java_map_index (0x6a)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554611, ; uint32_t type_token_id (0x20000b3)
		i32 123; uint32_t java_map_index (0x7b)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554676, ; uint32_t type_token_id (0x20000f4)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554678, ; uint32_t type_token_id (0x20000f6)
		i32 49; uint32_t java_map_index (0x31)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554681, ; uint32_t type_token_id (0x20000f9)
		i32 84; uint32_t java_map_index (0x54)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554684, ; uint32_t type_token_id (0x20000fc)
		i32 97; uint32_t java_map_index (0x61)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554687, ; uint32_t type_token_id (0x20000ff)
		i32 118; uint32_t java_map_index (0x76)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554691, ; uint32_t type_token_id (0x2000103)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554702, ; uint32_t type_token_id (0x200010e)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554707, ; uint32_t type_token_id (0x2000113)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554709, ; uint32_t type_token_id (0x2000115)
		i32 78; uint32_t java_map_index (0x4e)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554711, ; uint32_t type_token_id (0x2000117)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554713, ; uint32_t type_token_id (0x2000119)
		i32 100; uint32_t java_map_index (0x64)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554715, ; uint32_t type_token_id (0x200011b)
		i32 56; uint32_t java_map_index (0x38)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554719, ; uint32_t type_token_id (0x200011f)
		i32 129; uint32_t java_map_index (0x81)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554721, ; uint32_t type_token_id (0x2000121)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554724, ; uint32_t type_token_id (0x2000124)
		i32 124; uint32_t java_map_index (0x7c)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554728, ; uint32_t type_token_id (0x2000128)
		i32 113; uint32_t java_map_index (0x71)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554731, ; uint32_t type_token_id (0x200012b)
		i32 47; uint32_t java_map_index (0x2f)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554735, ; uint32_t type_token_id (0x200012f)
		i32 108; uint32_t java_map_index (0x6c)
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 33554738, ; uint32_t type_token_id (0x2000132)
		i32 60; uint32_t java_map_index (0x3c)
	} ; 43
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [132 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554741, ; uint32_t type_token_id (0x2000135)
		i32 127; uint32_t java_name_index (0x7f)
	}, ; 0
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 107; uint32_t java_name_index (0x6b)
	}, ; 1
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554531, ; uint32_t type_token_id (0x2000063)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 2
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554537, ; uint32_t type_token_id (0x2000069)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 3
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554518, ; uint32_t type_token_id (0x2000056)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 4
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554546, ; uint32_t type_token_id (0x2000072)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 5
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554689, ; uint32_t type_token_id (0x2000101)
		i32 94; uint32_t java_name_index (0x5e)
	}, ; 6
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554601, ; uint32_t type_token_id (0x20000a9)
		i32 64; uint32_t java_name_index (0x40)
	}, ; 7
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554733, ; uint32_t type_token_id (0x200012d)
		i32 122; uint32_t java_name_index (0x7a)
	}, ; 8
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 9
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 53; uint32_t java_name_index (0x35)
	}, ; 10
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 105; uint32_t java_name_index (0x69)
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554549, ; uint32_t type_token_id (0x2000075)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 12
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554530, ; uint32_t type_token_id (0x2000062)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 13
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554717, ; uint32_t type_token_id (0x200011d)
		i32 111; uint32_t java_name_index (0x6f)
	}, ; 14
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554647, ; uint32_t type_token_id (0x20000d7)
		i32 76; uint32_t java_name_index (0x4c)
	}, ; 15
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 16
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 17
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554722, ; uint32_t type_token_id (0x2000122)
		i32 114; uint32_t java_name_index (0x72)
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554529, ; uint32_t type_token_id (0x2000061)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 19
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 47; uint32_t java_name_index (0x2f)
	}, ; 20
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554589, ; uint32_t type_token_id (0x200009d)
		i32 57; uint32_t java_name_index (0x39)
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554720, ; uint32_t type_token_id (0x2000120)
		i32 113; uint32_t java_name_index (0x71)
	}, ; 22
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 59; uint32_t java_name_index (0x3b)
	}, ; 23
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554612, ; uint32_t type_token_id (0x20000b4)
		i32 72; uint32_t java_name_index (0x48)
	}, ; 24
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554693, ; uint32_t type_token_id (0x2000105)
		i32 97; uint32_t java_name_index (0x61)
	}, ; 25
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554692, ; uint32_t type_token_id (0x2000104)
		i32 96; uint32_t java_name_index (0x60)
	}, ; 26
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554535, ; uint32_t type_token_id (0x2000067)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 52; uint32_t java_name_index (0x34)
	}, ; 28
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554725, ; uint32_t type_token_id (0x2000125)
		i32 116; uint32_t java_name_index (0x74)
	}, ; 29
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 95; uint32_t java_name_index (0x5f)
	}, ; 30
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554699, ; uint32_t type_token_id (0x200010b)
		i32 102; uint32_t java_name_index (0x66)
	}, ; 31
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 58; uint32_t java_name_index (0x3a)
	}, ; 32
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 33
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554670, ; uint32_t type_token_id (0x20000ee)
		i32 82; uint32_t java_name_index (0x52)
	}, ; 34
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 35
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554729, ; uint32_t type_token_id (0x2000129)
		i32 119; uint32_t java_name_index (0x77)
	}, ; 36
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554514, ; uint32_t type_token_id (0x2000052)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 37
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554543, ; uint32_t type_token_id (0x200006f)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 38
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554675, ; uint32_t type_token_id (0x20000f3)
		i32 86; uint32_t java_name_index (0x56)
	}, ; 39
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554525, ; uint32_t type_token_id (0x200005d)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 40
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 41
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554506, ; uint32_t type_token_id (0x200004a)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 42
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554732, ; uint32_t type_token_id (0x200012c)
		i32 121; uint32_t java_name_index (0x79)
	}, ; 43
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554605, ; uint32_t type_token_id (0x20000ad)
		i32 67; uint32_t java_name_index (0x43)
	}, ; 44
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554616, ; uint32_t type_token_id (0x20000b8)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 45
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 45; uint32_t java_name_index (0x2d)
	}, ; 46
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554730, ; uint32_t type_token_id (0x200012a)
		i32 120; uint32_t java_name_index (0x78)
	}, ; 47
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33555141, ; uint32_t type_token_id (0x20002c5)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 48
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554677, ; uint32_t type_token_id (0x20000f5)
		i32 87; uint32_t java_name_index (0x57)
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554588, ; uint32_t type_token_id (0x200009c)
		i32 56; uint32_t java_name_index (0x38)
	}, ; 50
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554604, ; uint32_t type_token_id (0x20000ac)
		i32 66; uint32_t java_name_index (0x42)
	}, ; 51
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554667, ; uint32_t type_token_id (0x20000eb)
		i32 79; uint32_t java_name_index (0x4f)
	}, ; 52
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 53
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554701, ; uint32_t type_token_id (0x200010d)
		i32 104; uint32_t java_name_index (0x68)
	}, ; 54
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554716, ; uint32_t type_token_id (0x200011c)
		i32 110; uint32_t java_name_index (0x6e)
	}, ; 55
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554714, ; uint32_t type_token_id (0x200011a)
		i32 109; uint32_t java_name_index (0x6d)
	}, ; 56
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33555142, ; uint32_t type_token_id (0x20002c6)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 57
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554685, ; uint32_t type_token_id (0x20000fd)
		i32 92; uint32_t java_name_index (0x5c)
	}, ; 58
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554682, ; uint32_t type_token_id (0x20000fa)
		i32 90; uint32_t java_name_index (0x5a)
	}, ; 59
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 124; uint32_t java_name_index (0x7c)
	}, ; 60
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554527, ; uint32_t type_token_id (0x200005f)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 61
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554602, ; uint32_t type_token_id (0x20000aa)
		i32 65; uint32_t java_name_index (0x41)
	}, ; 62
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554696, ; uint32_t type_token_id (0x2000108)
		i32 100; uint32_t java_name_index (0x64)
	}, ; 63
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554671, ; uint32_t type_token_id (0x20000ef)
		i32 83; uint32_t java_name_index (0x53)
	}, ; 64
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554694, ; uint32_t type_token_id (0x2000106)
		i32 98; uint32_t java_name_index (0x62)
	}, ; 65
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 66
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554599, ; uint32_t type_token_id (0x20000a7)
		i32 62; uint32_t java_name_index (0x3e)
	}, ; 67
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554743, ; uint32_t type_token_id (0x2000137)
		i32 128; uint32_t java_name_index (0x80)
	}, ; 68
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 48; uint32_t java_name_index (0x30)
	}, ; 69
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554545, ; uint32_t type_token_id (0x2000071)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 70
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554679, ; uint32_t type_token_id (0x20000f7)
		i32 88; uint32_t java_name_index (0x58)
	}, ; 71
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 72
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554610, ; uint32_t type_token_id (0x20000b2)
		i32 71; uint32_t java_name_index (0x47)
	}, ; 73
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 61; uint32_t java_name_index (0x3d)
	}, ; 74
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 75
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 46; uint32_t java_name_index (0x2e)
	}, ; 76
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554538, ; uint32_t type_token_id (0x200006a)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 77
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 106; uint32_t java_name_index (0x6a)
	}, ; 78
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554744, ; uint32_t type_token_id (0x2000138)
		i32 129; uint32_t java_name_index (0x81)
	}, ; 79
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 75; uint32_t java_name_index (0x4b)
	}, ; 80
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554606, ; uint32_t type_token_id (0x20000ae)
		i32 68; uint32_t java_name_index (0x44)
	}, ; 81
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554528, ; uint32_t type_token_id (0x2000060)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 82
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554517, ; uint32_t type_token_id (0x2000055)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 83
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554680, ; uint32_t type_token_id (0x20000f8)
		i32 89; uint32_t java_name_index (0x59)
	}, ; 84
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554613, ; uint32_t type_token_id (0x20000b5)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 85
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554697, ; uint32_t type_token_id (0x2000109)
		i32 101; uint32_t java_name_index (0x65)
	}, ; 86
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554539, ; uint32_t type_token_id (0x200006b)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 87
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 88
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554533, ; uint32_t type_token_id (0x2000065)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 89
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 50; uint32_t java_name_index (0x32)
	}, ; 90
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554672, ; uint32_t type_token_id (0x20000f0)
		i32 84; uint32_t java_name_index (0x54)
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 60; uint32_t java_name_index (0x3c)
	}, ; 92
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554757, ; uint32_t type_token_id (0x2000145)
		i32 131; uint32_t java_name_index (0x83)
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 49; uint32_t java_name_index (0x31)
	}, ; 94
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554673, ; uint32_t type_token_id (0x20000f1)
		i32 85; uint32_t java_name_index (0x55)
	}, ; 95
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554520, ; uint32_t type_token_id (0x2000058)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 96
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 91; uint32_t java_name_index (0x5b)
	}, ; 97
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554726, ; uint32_t type_token_id (0x2000126)
		i32 117; uint32_t java_name_index (0x75)
	}, ; 98
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 99
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554712, ; uint32_t type_token_id (0x2000118)
		i32 108; uint32_t java_name_index (0x6c)
	}, ; 100
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554519, ; uint32_t type_token_id (0x2000057)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 101
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554532, ; uint32_t type_token_id (0x2000064)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 102
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554739, ; uint32_t type_token_id (0x2000133)
		i32 125; uint32_t java_name_index (0x7d)
	}, ; 103
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554658, ; uint32_t type_token_id (0x20000e2)
		i32 77; uint32_t java_name_index (0x4d)
	}, ; 104
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554608, ; uint32_t type_token_id (0x20000b0)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 105
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 69; uint32_t java_name_index (0x45)
	}, ; 106
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554669, ; uint32_t type_token_id (0x20000ed)
		i32 81; uint32_t java_name_index (0x51)
	}, ; 107
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 123; uint32_t java_name_index (0x7b)
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554695, ; uint32_t type_token_id (0x2000107)
		i32 99; uint32_t java_name_index (0x63)
	}, ; 109
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554745, ; uint32_t type_token_id (0x2000139)
		i32 130; uint32_t java_name_index (0x82)
	}, ; 110
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554523, ; uint32_t type_token_id (0x200005b)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 111
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554740, ; uint32_t type_token_id (0x2000134)
		i32 126; uint32_t java_name_index (0x7e)
	}, ; 112
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554727, ; uint32_t type_token_id (0x2000127)
		i32 118; uint32_t java_name_index (0x76)
	}, ; 113
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554614, ; uint32_t type_token_id (0x20000b6)
		i32 73; uint32_t java_name_index (0x49)
	}, ; 114
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554666, ; uint32_t type_token_id (0x20000ea)
		i32 78; uint32_t java_name_index (0x4e)
	}, ; 115
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554540, ; uint32_t type_token_id (0x200006c)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 116
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554586, ; uint32_t type_token_id (0x200009a)
		i32 54; uint32_t java_name_index (0x36)
	}, ; 117
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 93; uint32_t java_name_index (0x5d)
	}, ; 118
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554526, ; uint32_t type_token_id (0x200005e)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 119
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 51; uint32_t java_name_index (0x33)
	}, ; 120
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 121
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554643, ; uint32_t type_token_id (0x20000d3)
		i32 74; uint32_t java_name_index (0x4a)
	}, ; 122
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554609, ; uint32_t type_token_id (0x20000b1)
		i32 70; uint32_t java_name_index (0x46)
	}, ; 123
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554723, ; uint32_t type_token_id (0x2000123)
		i32 115; uint32_t java_name_index (0x73)
	}, ; 124
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554700, ; uint32_t type_token_id (0x200010c)
		i32 103; uint32_t java_name_index (0x67)
	}, ; 125
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554600, ; uint32_t type_token_id (0x20000a8)
		i32 63; uint32_t java_name_index (0x3f)
	}, ; 126
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 44; uint32_t java_name_index (0x2c)
	}, ; 127
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554587, ; uint32_t type_token_id (0x200009b)
		i32 55; uint32_t java_name_index (0x37)
	}, ; 128
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 112; uint32_t java_name_index (0x70)
	}, ; 129
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index (0x2)
		i32 33554668, ; uint32_t type_token_id (0x20000ec)
		i32 80; uint32_t java_name_index (0x50)
	}, ; 130
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 6; uint32_t java_name_index (0x6)
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
], align 8

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
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
