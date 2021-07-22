package com.orange.obs.plugins.myplace_svc_mapview

import android.app.Activity
import android.content.Context
import com.orange.obs.plugins.myplace_svc_mapview.view_model.ViewModelData
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MapViewFactory(private val messenger: BinaryMessenger, private val activity: Activity)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val viewModel = ViewModelData()

    override fun create(context: Context, id: Int, args: Any?): PlatformView? {
        if (args != null) {
            val params = args as Map<String, Any>
            val mapHash = params["hash"] as? String
            if (mapHash != null) {
                val poisMap = params["pois"] as List<Map<String, Any>>
                val pois = viewModel.poisListFromMap(poisMap)
                val isReducedMobilityForItinerary = params["isReducedMobilityForItinerary"] as? Boolean ?: false
                val favoriteBuildingPlaceId = params["favoriteBuildingPlaceId"] as? String
                val allowBooking = params["allowBooking"] as? Boolean ?: false
                val allowReporting = params["allowReporting"] as? Boolean ?: false
                return MapView(id, context, messenger, activity, mapHash, pois, isReducedMobilityForItinerary, favoriteBuildingPlaceId, allowBooking, allowReporting)
            } else {
                throw IllegalArgumentException("Hash parameter was not specified")
            }
        } else {
            throw IllegalArgumentException("Arguments can't be null")
        }
    }
}