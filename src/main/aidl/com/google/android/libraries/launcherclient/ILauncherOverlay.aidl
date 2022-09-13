package com.google.android.libraries.launcherclient;

import com.google.android.libraries.launcherclient.ILauncherOverlayCallback;
import android.view.WindowManager.LayoutParams;

interface ILauncherOverlay{
    void closeOverlay(int options);

    void endScroll();

    String getVoiceSearchLanguage();

    boolean isVoiceDetectionRunning();

    void onPause();

    void onResume();

    void onScroll(float progress);

    void openOverlay(int options);

    void requestVoiceDetection(boolean start);

    void startScroll();

    void windowAttached(in LayoutParams attrs, ILauncherOverlayCallback callbacks, int options);

    void windowDetached(boolean isChangingConfigurations);

}
