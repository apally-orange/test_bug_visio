package com.exemple.test_bug_visio

import android.view.View
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry.Registrar

/** TestBugVisioPlugin */
public class TestBugVisioPlugin : FlutterPlugin, ActivityAware {
    private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    companion object {
        var containerView: View? = null

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            containerView = registrar.view()
            if (registrar.activity() != null) {
                registrar
                        .platformViewRegistry()
                        .registerViewFactory(
                                "test_channel",
                                PluginFactory(containerView))
            }
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterPluginBinding = binding
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        flutterPluginBinding
                .platformViewRegistry
                .registerViewFactory(
                        "test_channel",
                        PluginFactory(containerView))
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
