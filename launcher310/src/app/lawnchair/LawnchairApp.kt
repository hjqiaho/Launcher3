package app.lawnchair

import android.app.Application
import android.content.Context
import android.content.res.Configuration
import android.util.DisplayMetrics
import android.view.WindowManager
import com.android.launcher3.InvariantDeviceProfile
import com.android.launcher3.Utilities


open class LawnchairApp : Application() {
    override fun onCreate() {
        super.onCreate()
        instance = this

        if(isPhone()){
            Utilities.getPrefs(this).edit().putString("idp_grid_name", "4_by_6").apply()
        }else{
            Utilities.getPrefs(this).edit().putString("idp_grid_name", "5_by_5").apply()
        }
    }
    fun isPhone(): Boolean {

        return false
    }
    companion object {
        private const val TAG = "LawnchairApp"

        var instance: LawnchairApp? = null
            private set

        var lawnchairAppDataSource:LawnchairAppDataSource? = null
    }
    interface LawnchairAppDataSource {
        fun getForceClearLauncherDb(): Boolean
        fun setForceClearLauncherDb(clearDb:Boolean)
        fun getDisabledPackageStr(): List<String>
        fun updateDisabledPackageStr(disablePackages:List<String>?)
        fun getWaitApprovalPackages(): List<String>
        fun updateWaitApprovalPackages()
        fun setLauncherEnable(enable:Boolean)
        fun launcheronCreate(launcher: LawnchairLauncher)
        fun launcherOnResume(launcher: LawnchairLauncher)
        fun channelIsMTG(): Boolean
        fun forceReload()
        fun reloadIcon()
        fun controlModel():Boolean
        fun enableAndResetCache()
        fun onPackagesRemoved(vararg packages: String)
        fun onPackagesUnavailable(vararg packages: String)
        fun onPackageAdded(packages: String)
        fun onPackagesAvailable(vararg packages: String)
    }
}
val Context.lawnchairApp get() = applicationContext as LawnchairApp
