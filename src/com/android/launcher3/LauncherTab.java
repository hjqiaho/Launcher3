package com.android.launcher3;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import java.io.PrintWriter;
import android.util.Log;

import com.android.systemui.plugins.shared.LauncherOverlayManager;
import com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlay;

import com.google.android.libraries.launcherclient.LauncherClient;
import com.google.android.libraries.launcherclient.LauncherClientCallbacksAdapter;

public class LauncherTab implements LauncherOverlayManager{

    private Launcher mLauncher;
    private final String TAG = "LauncherTab";
    private LauncherClient mLauncherClient;

    public LauncherTab(Launcher launcher) {
        mLauncher = launcher;
        mLauncherClient = new LauncherClient(launcher,
                new LauncherClientCallbacksAdapter(launcher.getWorkspace()), true);

        launcher.setLauncherOverlay(new LauncherOverlays());
        Log.d(TAG, "LauncherTab");
    }

    protected LauncherClient getClient() {
        return mLauncherClient;
    }

    @Override
    public void onDeviceProvideChanged() { }

    @Override
    public void onAttachedToWindow() {
        Log.e(TAG, "onAttachedToWindow");
        mLauncherClient.onAttachedToWindow();
    }

    @Override
    public void onDetachedFromWindow() {
        Log.e(TAG, "onDetachedFromWindow");
        mLauncherClient.onDetachedFromWindow();
    }

    @Override
    public void dump(String prefix, PrintWriter w) { }

    @Override
    public void openOverlay() { }

    @Override
    public void hideOverlay(boolean animate) {
        Log.d(TAG, "hideOverlay");
        mLauncherClient.hideOverlay(true);
        hideOverlay(animate ? 200 : 0);
    }

    @Override
    public void hideOverlay(int duration) { }

    @Override
    public boolean startSearch(byte[] config, Bundle extras) {
        return false;
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle bundle) { }

    @Override
    public void onActivityStarted(Activity activity) { }

    @Override
    public void onActivityResumed(Activity activity) {
        Log.d(TAG, "onActivityResumed");
        mLauncherClient.onResume();
    }

    @Override
    public void onActivityPaused(Activity activity) {
        Log.d(TAG, "onActivityPaused");
        mLauncherClient.onPause();
    }

    @Override
    public void onActivityStopped(Activity activity) { }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) { }

    @Override
    public void onActivityDestroyed(Activity activity) {
        mLauncherClient.onDestroy();
    }

    private class LauncherOverlays implements LauncherOverlay {
        @Override
        public void onScrollInteractionBegin() {
            Log.i(TAG, "onScrollInteractionBegin");
            mLauncherClient.startMove();
        }

        @Override
        public void onScrollInteractionEnd() {
            Log.i(TAG, "onScrollInteractionEnd");
            mLauncherClient.endMove();
        }

        @Override
        public void onScrollChange(float progress, boolean rtl) {
            Log.i(TAG, "onScrollChange  "+progress);
            mLauncherClient.updateMove(progress);
        }

        @Override
        public void setOverlayCallbacks(LauncherOverlayCallbacks callbacks) {
        }
    }
}
