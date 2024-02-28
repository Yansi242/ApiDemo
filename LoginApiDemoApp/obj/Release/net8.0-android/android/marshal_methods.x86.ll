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

@assembly_image_cache = dso_local local_unnamed_addr global [131 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [262 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 48
	i32 42244203, ; 2: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 120
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 83839681, ; 6: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 110
	i32 136584136, ; 8: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 9: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 159306688, ; 10: System.ComponentModel.Annotations => 0x97ed3c0 => 83
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 86
	i32 230752869, ; 14: Microsoft.CSharp.dll => 0xdc10265 => 78
	i32 246610117, ; 15: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 108
	i32 317674968, ; 16: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 321963286, ; 18: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 379916513, ; 20: System.Threading.Thread.dll => 0x16a510e1 => 120
	i32 385762202, ; 21: System.Memory.dll => 0x16fe439a => 97
	i32 395744057, ; 22: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 23: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 82
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 456227837, ; 26: System.Web.HttpUtility.dll => 0x1b317bfd => 122
	i32 459347974, ; 27: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 469710990, ; 28: System.dll => 0x1bff388e => 126
	i32 489220957, ; 29: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 30: System.ObjectModel => 0x1dbae811 => 103
	i32 513247710, ; 31: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 538707440, ; 32: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 33: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 627609679, ; 34: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 627931235, ; 35: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 36: System.Text.Encodings.Web.dll => 0x27787397 => 117
	i32 672442732, ; 37: System.Collections.Concurrent => 0x2814a96c => 79
	i32 690569205, ; 38: System.Xml.Linq.dll => 0x29293ff5 => 123
	i32 759454413, ; 39: System.Net.Requests => 0x2d445acd => 101
	i32 775507847, ; 40: System.IO.Compression => 0x2e394f87 => 94
	i32 777317022, ; 41: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 42: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 804715423, ; 43: System.Data.Common => 0x2ff6fb9f => 88
	i32 823281589, ; 44: System.Private.Uri.dll => 0x311247b5 => 104
	i32 830298997, ; 45: System.IO.Compression.Brotli => 0x317d5b75 => 93
	i32 869139383, ; 46: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 878954865, ; 47: System.Net.Http.Json => 0x3463c971 => 98
	i32 880668424, ; 48: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 49: System.ComponentModel.Primitives.dll => 0x35e25008 => 84
	i32 918734561, ; 50: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 955402788, ; 51: Newtonsoft.Json => 0x38f24a24 => 48
	i32 961460050, ; 52: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 975874589, ; 54: System.Xml.XDocument => 0x3a2aaa1d => 125
	i32 990727110, ; 55: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 56: System.Collections.dll => 0x3b2c715c => 82
	i32 1012816738, ; 57: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1019214401, ; 58: System.Drawing => 0x3cbffa41 => 92
	i32 1028951442, ; 59: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1036536393, ; 61: System.Drawing.Primitives.dll => 0x3dc84a49 => 91
	i32 1043950537, ; 62: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 63: System.Linq.Expressions.dll => 0x3e444eb4 => 95
	i32 1052210849, ; 64: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 65: System.ComponentModel.TypeConverter => 0x408b17f4 => 85
	i32 1084122840, ; 66: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 67: System => 0x41761b2c => 126
	i32 1108272742, ; 68: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 69: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 70: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 71: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 72: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1260983243, ; 73: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 74: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1308624726, ; 75: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 76: System.Linq => 0x4eed2679 => 96
	i32 1336711579, ; 77: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 78: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 79: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 80: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1408764838, ; 81: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 112
	i32 1430672901, ; 82: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 83: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 84: System.IO.Compression.dll => 0x57261233 => 94
	i32 1469204771, ; 85: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 86: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 87: System.IO.Compression.Brotli.dll => 0x583e844f => 93
	i32 1526286932, ; 88: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 89: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 119
	i32 1622152042, ; 90: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 91: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 92: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 93: System.Net.Http.dll => 0x61b9038d => 99
	i32 1639986890, ; 94: System.Text.RegularExpressions => 0x61c036ca => 119
	i32 1657153582, ; 95: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 96: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 97: System.Net.Primitives.dll => 0x63fca3d0 => 100
	i32 1679769178, ; 98: System.Security.Cryptography => 0x641f3e5a => 115
	i32 1729485958, ; 99: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1743415430, ; 100: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 101: System.Diagnostics.TraceSource.dll => 0x69239124 => 90
	i32 1766324549, ; 102: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 103: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 104: Mono.Android.Runtime.dll => 0x6a216153 => 129
	i32 1782862114, ; 105: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 106: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1793755602, ; 107: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 108: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1813058853, ; 109: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 110: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 111: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1824175904, ; 112: System.Text.Encoding.Extensions => 0x6cbab720 => 116
	i32 1824722060, ; 113: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 112
	i32 1828688058, ; 114: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1853025655, ; 115: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 116: System.Linq.Expressions => 0x6ec71a65 => 95
	i32 1870277092, ; 117: System.Reflection.Primitives => 0x6f7a29e4 => 109
	i32 1875935024, ; 118: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 119: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 120: System.Collections.NonGeneric.dll => 0x71dc7c8b => 80
	i32 1937139211, ; 121: LoginApiDemoApp => 0x7376660b => 77
	i32 1939592360, ; 122: System.Private.Xml.Linq => 0x739bd4a8 => 105
	i32 1953182387, ; 123: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 124: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 125: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 126: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2045470958, ; 127: System.Private.Xml => 0x79eb68ee => 106
	i32 2055257422, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2066184531, ; 129: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 130: System.Diagnostics.TraceSource => 0x7b6f419e => 90
	i32 2079903147, ; 131: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 132: System.Numerics.Vectors => 0x7c9bf920 => 102
	i32 2127167465, ; 133: System.Console => 0x7ec9ffe9 => 87
	i32 2142473426, ; 134: System.Collections.Specialized => 0x7fb38cd2 => 81
	i32 2159891885, ; 135: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 136: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 137: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 138: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 139: System.ObjectModel.dll => 0x82b6c85e => 103
	i32 2201107256, ; 140: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 141: System.Net.Http => 0x8334206b => 99
	i32 2207618523, ; 142: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 143: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2279755925, ; 144: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2303942373, ; 145: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 146: System.Private.CoreLib.dll => 0x896b7878 => 127
	i32 2353062107, ; 147: System.Net.Primitives => 0x8c40e0db => 100
	i32 2366048013, ; 148: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 149: System.Xml.ReaderWriter.dll => 0x8d24e767 => 124
	i32 2371007202, ; 150: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 151: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 152: System.Web.HttpUtility => 0x8f24faee => 122
	i32 2427813419, ; 153: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 154: System.Console.dll => 0x912896e5 => 87
	i32 2475788418, ; 155: Java.Interop.dll => 0x93918882 => 128
	i32 2480646305, ; 156: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2503351294, ; 157: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2538310050, ; 158: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 108
	i32 2550873716, ; 159: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 160: Microsoft.CSharp => 0x98ba5a04 => 78
	i32 2570120770, ; 161: System.Text.Encodings.Web => 0x9930ee42 => 117
	i32 2576534780, ; 162: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 163: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 116
	i32 2593496499, ; 164: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 165: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 166: System.Private.Xml.dll => 0x9bfe3a41 => 106
	i32 2620871830, ; 167: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2626831493, ; 168: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2664396074, ; 169: System.Xml.XDocument.dll => 0x9ecf752a => 125
	i32 2665622720, ; 170: System.Drawing.Primitives => 0x9ee22cc0 => 91
	i32 2676780864, ; 171: System.Data.Common.dll => 0x9f8c6f40 => 88
	i32 2724373263, ; 172: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 173: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 174: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2740698338, ; 175: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 176: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 177: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 178: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 179: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2785988530, ; 180: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 181: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2810250172, ; 182: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2853208004, ; 183: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2861189240, ; 184: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 185: System.Private.CoreLib => 0xad6f1e8a => 127
	i32 2916838712, ; 186: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 187: System.Numerics.Vectors.dll => 0xae037813 => 102
	i32 2959614098, ; 188: System.ComponentModel.dll => 0xb0682092 => 86
	i32 2978675010, ; 189: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 190: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 191: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 192: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 193: Mono.Android.Runtime => 0xb65adef9 => 129
	i32 3059793426, ; 194: System.ComponentModel.Primitives => 0xb660be12 => 84
	i32 3159123045, ; 195: System.Reflection.Primitives.dll => 0xbc4c6465 => 109
	i32 3178803400, ; 196: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3220365878, ; 197: System.Threading => 0xbff2e236 => 121
	i32 3258312781, ; 198: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3280506390, ; 199: System.ComponentModel.Annotations.dll => 0xc3888e16 => 83
	i32 3305363605, ; 200: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 201: System.Net.Requests.dll => 0xc5b097e4 => 101
	i32 3317135071, ; 202: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 203: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3357674450, ; 204: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 205: System.Text.Json => 0xc82afec1 => 118
	i32 3362522851, ; 206: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 207: Java.Interop => 0xc8a662e9 => 128
	i32 3374999561, ; 208: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3381016424, ; 209: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 210: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3458724246, ; 211: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 212: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 85
	i32 3476120550, ; 213: Mono.Android => 0xcf3163e6 => 130
	i32 3484440000, ; 214: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 215: System.Text.Json.dll => 0xcfbaacae => 118
	i32 3509114376, ; 216: System.Xml.Linq => 0xd128d608 => 123
	i32 3580758918, ; 217: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 218: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 219: System.Linq.dll => 0xd715a361 => 96
	i32 3641597786, ; 220: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643446276, ; 221: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 222: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3657292374, ; 223: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 224: Mono.Android.dll => 0xdae8aa5e => 130
	i32 3724971120, ; 225: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3737834244, ; 226: System.Net.Http.Json.dll => 0xdecad304 => 98
	i32 3748608112, ; 227: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 89
	i32 3751619990, ; 228: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 229: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 230: System.Collections.NonGeneric => 0xe2098b0b => 80
	i32 3802395368, ; 231: System.Collections.Specialized.dll => 0xe2a3f2e8 => 81
	i32 3823082795, ; 232: System.Security.Cryptography.dll => 0xe3df9d2b => 115
	i32 3841636137, ; 233: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 234: System.Runtime.InteropServices.dll => 0xe56ef253 => 110
	i32 3896106733, ; 235: System.Collections.Concurrent.dll => 0xe839deed => 79
	i32 3896760992, ; 236: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3920221145, ; 237: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 238: System.Xml.ReaderWriter => 0xea213423 => 124
	i32 3931092270, ; 239: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 240: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 4025784931, ; 241: System.Memory => 0xeff49a63 => 97
	i32 4046471985, ; 242: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4054681211, ; 243: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 107
	i32 4068434129, ; 244: System.Private.Xml.Linq.dll => 0xf27f60d1 => 105
	i32 4073602200, ; 245: System.Threading.dll => 0xf2ce3c98 => 121
	i32 4091086043, ; 246: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 247: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4099507663, ; 248: System.Drawing.dll => 0xf45985cf => 92
	i32 4100113165, ; 249: System.Private.Uri => 0xf462c30d => 104
	i32 4103439459, ; 250: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 251: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4147896353, ; 252: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 107
	i32 4150914736, ; 253: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 254: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 256: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 89
	i32 4249188766, ; 257: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 258: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274088162, ; 259: LoginApiDemoApp.dll => 0xfec168e2 => 77
	i32 4274976490, ; 260: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959 ; 261: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [262 x i32] [
	i32 0, ; 0
	i32 48, ; 1
	i32 9, ; 2
	i32 120, ; 3
	i32 33, ; 4
	i32 47, ; 5
	i32 17, ; 6
	i32 110, ; 7
	i32 32, ; 8
	i32 25, ; 9
	i32 83, ; 10
	i32 53, ; 11
	i32 71, ; 12
	i32 86, ; 13
	i32 78, ; 14
	i32 108, ; 15
	i32 30, ; 16
	i32 49, ; 17
	i32 8, ; 18
	i32 60, ; 19
	i32 120, ; 20
	i32 97, ; 21
	i32 34, ; 22
	i32 28, ; 23
	i32 82, ; 24
	i32 59, ; 25
	i32 122, ; 26
	i32 113, ; 27
	i32 126, ; 28
	i32 6, ; 29
	i32 103, ; 30
	i32 42, ; 31
	i32 27, ; 32
	i32 39, ; 33
	i32 57, ; 34
	i32 19, ; 35
	i32 117, ; 36
	i32 79, ; 37
	i32 123, ; 38
	i32 101, ; 39
	i32 94, ; 40
	i32 25, ; 41
	i32 41, ; 42
	i32 88, ; 43
	i32 104, ; 44
	i32 93, ; 45
	i32 10, ; 46
	i32 98, ; 47
	i32 24, ; 48
	i32 84, ; 49
	i32 21, ; 50
	i32 48, ; 51
	i32 14, ; 52
	i32 60, ; 53
	i32 125, ; 54
	i32 23, ; 55
	i32 82, ; 56
	i32 70, ; 57
	i32 92, ; 58
	i32 38, ; 59
	i32 50, ; 60
	i32 91, ; 61
	i32 4, ; 62
	i32 95, ; 63
	i32 62, ; 64
	i32 85, ; 65
	i32 75, ; 66
	i32 126, ; 67
	i32 26, ; 68
	i32 20, ; 69
	i32 16, ; 70
	i32 22, ; 71
	i32 67, ; 72
	i32 2, ; 73
	i32 58, ; 74
	i32 11, ; 75
	i32 96, ; 76
	i32 31, ; 77
	i32 32, ; 78
	i32 70, ; 79
	i32 54, ; 80
	i32 112, ; 81
	i32 0, ; 82
	i32 6, ; 83
	i32 94, ; 84
	i32 51, ; 85
	i32 42, ; 86
	i32 93, ; 87
	i32 30, ; 88
	i32 119, ; 89
	i32 64, ; 90
	i32 73, ; 91
	i32 56, ; 92
	i32 99, ; 93
	i32 119, ; 94
	i32 114, ; 95
	i32 74, ; 96
	i32 100, ; 97
	i32 115, ; 98
	i32 52, ; 99
	i32 1, ; 100
	i32 90, ; 101
	i32 71, ; 102
	i32 39, ; 103
	i32 129, ; 104
	i32 17, ; 105
	i32 59, ; 106
	i32 9, ; 107
	i32 64, ; 108
	i32 75, ; 109
	i32 74, ; 110
	i32 68, ; 111
	i32 116, ; 112
	i32 112, ; 113
	i32 40, ; 114
	i32 26, ; 115
	i32 95, ; 116
	i32 109, ; 117
	i32 8, ; 118
	i32 2, ; 119
	i32 80, ; 120
	i32 77, ; 121
	i32 105, ; 122
	i32 13, ; 123
	i32 35, ; 124
	i32 5, ; 125
	i32 62, ; 126
	i32 106, ; 127
	i32 61, ; 128
	i32 4, ; 129
	i32 90, ; 130
	i32 114, ; 131
	i32 102, ; 132
	i32 87, ; 133
	i32 81, ; 134
	i32 45, ; 135
	i32 12, ; 136
	i32 41, ; 137
	i32 40, ; 138
	i32 103, ; 139
	i32 76, ; 140
	i32 99, ; 141
	i32 14, ; 142
	i32 36, ; 143
	i32 69, ; 144
	i32 18, ; 145
	i32 127, ; 146
	i32 100, ; 147
	i32 12, ; 148
	i32 124, ; 149
	i32 35, ; 150
	i32 13, ; 151
	i32 122, ; 152
	i32 10, ; 153
	i32 87, ; 154
	i32 128, ; 155
	i32 43, ; 156
	i32 16, ; 157
	i32 108, ; 158
	i32 11, ; 159
	i32 78, ; 160
	i32 117, ; 161
	i32 15, ; 162
	i32 116, ; 163
	i32 20, ; 164
	i32 76, ; 165
	i32 106, ; 166
	i32 56, ; 167
	i32 15, ; 168
	i32 125, ; 169
	i32 91, ; 170
	i32 88, ; 171
	i32 111, ; 172
	i32 49, ; 173
	i32 51, ; 174
	i32 1, ; 175
	i32 21, ; 176
	i32 44, ; 177
	i32 45, ; 178
	i32 72, ; 179
	i32 27, ; 180
	i32 47, ; 181
	i32 54, ; 182
	i32 72, ; 183
	i32 46, ; 184
	i32 127, ; 185
	i32 73, ; 186
	i32 102, ; 187
	i32 86, ; 188
	i32 58, ; 189
	i32 34, ; 190
	i32 7, ; 191
	i32 65, ; 192
	i32 129, ; 193
	i32 84, ; 194
	i32 109, ; 195
	i32 66, ; 196
	i32 121, ; 197
	i32 52, ; 198
	i32 83, ; 199
	i32 7, ; 200
	i32 101, ; 201
	i32 57, ; 202
	i32 67, ; 203
	i32 24, ; 204
	i32 118, ; 205
	i32 55, ; 206
	i32 128, ; 207
	i32 69, ; 208
	i32 3, ; 209
	i32 37, ; 210
	i32 22, ; 211
	i32 85, ; 212
	i32 130, ; 213
	i32 23, ; 214
	i32 118, ; 215
	i32 123, ; 216
	i32 31, ; 217
	i32 33, ; 218
	i32 96, ; 219
	i32 61, ; 220
	i32 28, ; 221
	i32 66, ; 222
	i32 36, ; 223
	i32 130, ; 224
	i32 65, ; 225
	i32 98, ; 226
	i32 89, ; 227
	i32 3, ; 228
	i32 53, ; 229
	i32 80, ; 230
	i32 81, ; 231
	i32 115, ; 232
	i32 38, ; 233
	i32 110, ; 234
	i32 79, ; 235
	i32 55, ; 236
	i32 19, ; 237
	i32 124, ; 238
	i32 68, ; 239
	i32 50, ; 240
	i32 97, ; 241
	i32 44, ; 242
	i32 107, ; 243
	i32 105, ; 244
	i32 121, ; 245
	i32 5, ; 246
	i32 46, ; 247
	i32 92, ; 248
	i32 104, ; 249
	i32 29, ; 250
	i32 37, ; 251
	i32 107, ; 252
	i32 29, ; 253
	i32 113, ; 254
	i32 63, ; 255
	i32 89, ; 256
	i32 18, ; 257
	i32 43, ; 258
	i32 77, ; 259
	i32 111, ; 260
	i32 63 ; 261
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
