
package app.lawnchair

import android.os.Bundle
import app.lawnchair.LawnchairApp.Companion.lawnchairAppDataSource
import com.android.launcher3.Launcher

class LawnchairLauncher : Launcher() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lawnchairAppDataSource?.launcheronCreate(this);
    }


    override fun onResume() {
        super.onResume()

        lawnchairAppDataSource?.launcherOnResume(this);
    }



    companion object {

    }
}
