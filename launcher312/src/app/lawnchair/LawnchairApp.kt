package app.lawnchair

import android.app.Application
import android.content.Context


open class LawnchairApp : Application() {
    override fun onCreate() {
        super.onCreate()
        instance = this
    }
    companion object {
        private const val TAG = "LawnchairApp"

        @JvmStatic
        var instance: LawnchairApp? = null
            private set

        lateinit var lawnchairAppDataSource:LawnchairAppDataSource
    }
    interface LawnchairAppDataSource {
        fun getForceClearLauncherDb(): Boolean
        fun setForceClearLauncherDb(clearDb:Boolean)
        fun getDisabledPackageStr(): List<String>
        fun updateDisabledPackageStr()
        fun getWaitApprovalPackages(): List<String>
        fun updateWaitApprovalPackages()
        fun setLauncherEnable(enable:Boolean)
        fun launcheronCreate(launcher: LawnchairLauncher)
        fun launcherOnResume(launcher: LawnchairLauncher)
    }
}
val Context.lawnchairApp get() = applicationContext as LawnchairApp
