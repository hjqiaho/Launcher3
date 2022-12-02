
package app.lawnchair

import android.os.Bundle
import app.lawnchair.LawnchairApp.Companion.lawnchairAppDataSource
import com.android.launcher3.Launcher

class LawnchairLauncher : Launcher() {

    @JvmField
    var harmony_active_to_init: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        harmony_active_to_init = intent.getBooleanExtra(HARMONY_ACTIVE_TO_INIT,false);


        lawnchairAppDataSource.launcheronCreate(this);
    }


    override fun onResume() {
        super.onResume()

        lawnchairAppDataSource.launcherOnResume(this);
    }



    companion object {

        //鸿蒙 激活之后 启动华为相关服务调用相关接口 huaweiInit
        @JvmField
        val HARMONY_ACTIVE_TO_INIT = "harmony.active_to_init"

    }
}
