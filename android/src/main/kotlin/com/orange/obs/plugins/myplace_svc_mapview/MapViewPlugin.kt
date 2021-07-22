package com.orange.obs.plugins.myplace_svc_mapview

import android.annotation.TargetApi
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry.Registrar

/** MapviewPlugin */
@TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
public class MapViewPlugin():
        FlutterPlugin,
        ActivityAware {

  private lateinit var flutterPluginBinding: FlutterPluginBinding

  override fun onAttachedToEngine( binding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = binding
  }

  override fun onDetachedFromEngine( binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun onAttachedToActivity( binding: ActivityPluginBinding) {
    flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory(
                    MapView.CHANNEL,
                    MapViewFactory(
                            flutterPluginBinding.binaryMessenger, binding.getActivity()))
  }

  override fun onDetachedFromActivity() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }
}
