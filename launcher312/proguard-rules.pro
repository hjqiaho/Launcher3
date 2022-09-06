# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile


#指定压缩级别
-optimizationpasses 5
#保留行号
-keepattributes SourceFile,LineNumberTable
#保持泛型
-keepattributes Signature

-keepattributes InnerClasses

#保持所有实现 Serializable 接口的类成员
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

#Fragment不需要在AndroidManifest.xml中注册，需要额外保护下
-keep public class * extends android.support.v4.app.Fragment
-keep public class * extends android.app.Fragment
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.Service
-keep public class * extends android.app.Activity
-keep public class * extends android.content.BroadcastReceiver

-keep class com.android.launcher3.** {*;}


-keepclassmembers class com.fundot.p4bu.ii.managers.StoreJsMngr {
   public *;
}
-keepclassmembers class com.fundot.p4bu.ii.managers.HubMngr {
   public *;
}

-keep public class com.fundot.p4bu.ii.Monitor {
    public *;
}

-keep public class com.fundot.p4bu.activities.AdminActivity {
   public *;
}

-keep public class com.fundot.p4bu.ii.lib.entities.ActivitySwitchBean {
   public *;
}

-keep public class com.fundot.p4bu.ii.hook.classs.** {
   public *;
}
-keep public class com.fundot.p4bu.ii.hook.appclasss.** {
   public *;
}

-keep public class com.fundot.p4bu.ii.hook.manager.BaseManager {
   public *;
}

-keep public class com.fundot.p4bu.ii.hook.manager.SystemServerManager {
   public *;
}

-keep class com.fundot.p4bu.ii.managers.UpdateMngr$UpdateResponse{*;}
-keep class com.fundot.p4bu.ii.managers.UpdateMngr$Fixes{*;}
-keep class com.fundot.p4bu.ii.managers.UpdateMngr$AutoStart{*;}
-keep class com.fundot.p4bu.ii.managers.FixesMngr$FixesResponse{*;}
-keep class com.fundot.p4bu.ii.managers.FixesMngr$FixesResponse$AutoInstall{*;}
-keep class com.fundot.p4bu.ii.managers.FixesMngr$FixesResponse$AppSiteRules{*;}

-keep class com.fundot.p4bu.ii.managers.HubMngr$HubResponse{*;}
-keep class com.fundot.p4bu.ii.P4buApplication {*;}

-keep class com.swift.sandhook.**{*;}
-keep class com.fundot.p4bu.ii.hook.classs.**{*;}
-keep class com.fundot.p4bu.ii.hook.appclasss.**{*;}
-keep class com.fundot.p4bu.ii.lib.entities.**{*;}
-keep class com.fundot.p4bu.ii.lib.data.**{*;}
-keep class com.microsoft.signalr.**{*;}
-keep class com.microsoft.**{*;}
-keep class com.microsoft.signalr.HubConnection$ConnectionState{*;}
-keep interface com.microsoft.signalr.**{*;}
-keep interface com.microsoft.**{*;}
-keep class com.google.** {*;}
-keep class androidx.room.** {*;}
-keep class com.androidnetworking.** {*;}
-keep class com.alibaba.sdk.android.** {*;}
-keep class androidx.preference.** {*;}
-keep class org.apache.commons.io.** {*;}

-keep class com.fundot.p4bu.ii.lib.**{
    *;
 }
############################# 代码中的model不被混淆 ###################
-keep class **.*model*.** {*;}
-keep class **.*response*.** {*;}
-keep class **.*bean*.** {*;}
-keep class **.*entity*.** {*;}

#viewbing
-keepclassmembers class ** implements androidx.viewbinding.ViewBinding {
    public static ** bind(***);
    public static ** inflate(***);
    public static ** inflate(**,**);
}
#viewbing END

-keep class com.fundot.p4bu.aidl.**{*;}

# ------------jenkins打包追加--------------------------------------
# support-v4
-dontwarn android.support.v4.**
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }
-keep public class * extends android.support.v4.**
# support-v7
-dontwarn android.support.v7.**                                             #去掉警告
-keep class android.support.v7.** { *; }                                    #过滤android.support.v7
-keep interface android.support.v7.app.** { *; }
-keep public class * extends android.support.v7.**
# androidx
-keep class com.google.android.material.** {*;}
-keep class androidx.** {*;}
-keep public class * extends androidx.**
-keep interface androidx.** {*;}
-dontwarn com.google.android.material.**
-dontnote com.google.android.material.**
-dontwarn androidx.**

-keep class com.fundot.p4bu.ii.activities.BaseWebViewActivity
-keep class com.fundot.p4bu.ii.activities.LoginActivity

#Glide
-keep class com.bumptech.glide.**{*;}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule {
 <init>(...);
}
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
-keep class com.bumptech.glide.load.data.ParcelFileDescriptorRewinder$InternalRewinder {
  *** rewind();
}
#Glide END

# ------------okhttp3--------------------------------------
# JSR 305 annotations are for embedding nullability information.
# JSR 305注释用于嵌入可空性信息
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
# 资源加载了相对路径，因此必须保留此类的包。
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
# Animal Sniffer compileOnly依赖项，以确保API与旧版本的Java兼容
-dontwarn org.codehaus.mojo.animal_sniffer.*
# OkHttp platform used only on JVM and when Conscrypt dependency is available.
# OkHttp平台仅在JVM上使用，并且当Conscrypt依赖性可用时。
-dontwarn okhttp3.internal.platform.ConscryptPlatform
-dontwarn okhttp3.**
-keep class okhttp3.**{*;}
# ------------okhttp3--------------------------------------



##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature
# For using GSON @Expose annotation
-keepattributes *Annotation*
# Gson specific classes
-dontwarn sun.misc.**
-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { <fields>; }

# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

##---------------End: proguard configuration for Gson  ----------

#********************************
-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# Only required if you use AsyncExecutor
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}



-keep public class com.squareup.javawriter.** {*;}
-keep public class io.reactivex.** {*;}
-keep public class javax.inject.** {*;}
-keep public class org.hamcrest.** {*;}
-keep public class org.reactivestreams.** {*;}
-keep public class com.fundot.p4bu.ii.P4buMngr.** {*;}
-keep public class com.fundot.p4bu.netcontroller.Allowed {*;}
-keep public class com.fundot.p4bu.netcontroller.Packet {*;}
-keep public class com.fundot.p4bu.netcontroller.ResourceRecord {*;}
-keep public class com.fundot.p4bu.netcontroller.PackageInformation {*;}
-keep public class com.fundot.p4bu.netcontroller.Usage {*;}
-keep public class com.fundot.p4bu.netcontroller.Util {*;}
-keep public class com.fundot.p4bu.netcontroller.NetControlService {*;}
-keep public class com.fundot.p4bu.ii.services.MediaProjectionService {*;}

-keep class com.fundot.p4bu.permissionguidance.bean.**{*;}
-keep class com.fundot.p4bu.plugin.bean.**{*;}
-keep class com.fundot.p4bu.setting.bean.**{*;}
-keep class com.fundot.p4bu.timeplan.bean.**{*;}
-keep class com.fundot.p4bu.usagetime.bean.**{*;}
-keep class com.dhl.filescanner.**{*;}
-keep class com.liulishuo.filedownloader.**{*;}
-keep class com.huawei.android.app.admin.**{*;}
-keep class com.hihonor.android.app.admin.**{*;}
-keep class com.huawei.hem.license.**{*;}
-keep class android.bluetooth.BluetoothAdapter.**{*;}
-keepattributes *Annotation*

-dontwarn com.swift.sandhook.**
-dontwarn com.fundot.p4bu.ii.hook.classs.**
-dontwarn com.fundot.p4bu.ii.hook.appclasss.**
-dontwarn com.microsoft.signalr.**
