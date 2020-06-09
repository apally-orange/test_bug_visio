package com.exemple.test_bug_visio


import android.content.Context
import android.graphics.Rect
import android.util.Log
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.*
import com.visioglobe.visiomoveessential.VMEMapView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class PluginView(private val context: Context, private val containerView: View?) :
        PlatformView {
    private val mapView = VMEMapView(context, null)
    private var disposed = false

    class MyLayout(context: Context, var containerView: View?) : LinearLayout(context) {
        private var proxy: ThreadedInputConnectionProxyAdapterView? = null

        init {
            setFocusable(true)
            setFocusableInTouchMode(true)
            setClickable(true)
        }

        override fun onFocusChanged(gainFocus: Boolean, direction: Int, previouslyFocusedRect: Rect?) {
            Log.e("TestEmbeddedView", "onFocusChaned")
            super.onFocusChanged(gainFocus, direction, previouslyFocusedRect)
        }

        override fun checkInputConnectionProxy(view: View): Boolean {
            proxy = ThreadedInputConnectionProxyAdapterView(containerView, view, view.getHandler())
            setInputConnectionTarget(proxy!!)
            return super.checkInputConnectionProxy(view)
        }

        fun setInputConnectionTarget(targetView: View) {
            targetView.requestFocus()
            containerView!!.post(
                    object : Runnable {
                        override fun run() {
                            val imm: InputMethodManager = getContext().getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
                            // This is a hack to make InputMethodManager believe that the target view now has focus.
                            // As a result, InputMethodManager will think that targetView is focused, and will call
                            // getHandler() of the view when creating input connection.

                            // Step 1: Set targetView as InputMethodManager#mNextServedView. This does not affect
                            // the real window focus.
                            targetView.onWindowFocusChanged(true)

                            // Step 2: Have InputMethodManager focus in on targetView. As a result, IMM will call
                            // onCreateInputConnection() on targetView on the same thread as
                            // targetView.getHandler(). It will also call subsequent InputConnection methods on this
                            // thread. This is the IME thread in cases where targetView is our proxyAdapterView.
                            imm.isActive(containerView)
                        }
                    })
        }
    }

    private val rootLayout = MyLayout(context, containerView)

    init {
        mapView.mapHash = "ma10a386909f58fb12f8bbde9c3111c46077f485d"
        mapView.loadMap()
        rootLayout.addView(mapView)
    }

    override fun onFlutterViewAttached(view: View) {
        rootLayout.containerView = view;
    }

    override fun getView(): View {
        return rootLayout
    }

    override fun dispose() {
        if (disposed) {
            return
        }
        disposed = true
        mapView.unloadMap()
    }
}