package com.orange.obs.plugins.myplace_svc_mapview

import android.annotation.TargetApi
import android.app.Activity
import android.app.Application
import android.content.Context
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.os.Bundle
import android.text.Html
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.ImageView
import android.widget.TextView
import com.google.gson.Gson
import com.orange.obs.plugins.myplace_svc_mapview.models.MapViewLocation
import com.orange.obs.plugins.myplace_svc_mapview.models.Poi
import com.orange.obs.plugins.myplace_svc_mapview.models.PoiStatus
import com.orange.obs.plugins.myplace_svc_mapview.view_model.ViewModelData
import com.visioglobe.visiomoveessential.VMEMapView
import com.visioglobe.visiomoveessential.callbacks.VMEComputeRouteCallback
import com.visioglobe.visiomoveessential.enums.VMELocationTrackingMode
import com.visioglobe.visiomoveessential.enums.VMERouteDestinationsOrder
import com.visioglobe.visiomoveessential.enums.VMERouteRequestType
import com.visioglobe.visiomoveessential.enums.VMEViewMode
import com.visioglobe.visiomoveessential.listeners.VMELifeCycleListener
import com.visioglobe.visiomoveessential.listeners.VMEPlaceListener
import com.visioglobe.visiomoveessential.models.*
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import org.json.JSONException
import org.json.JSONObject

@TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
class MapView(
        private val id: Int,
        private val context: Context,
        private val messenger: BinaryMessenger,
        private val activity: Activity,
        private val mapHash: String,
        private var pois: List<Poi>,
        private val isReducedMobilityForItinerary: Boolean = false,
        private val favoriteBuildingPlaceId: String?,
        private val allowBooking: Boolean = false,
        private val allowReporting: Boolean = false
) :
        PlatformView,
        MethodChannel.MethodCallHandler,
        Application.ActivityLifecycleCallbacks {
    private val viewModel = ViewModelData()
    private val mapView = VMEMapView(context, null)
    private val methodChannel: MethodChannel
    private var disposed = false
    private val visioglobeLifeCycleListener: VisioglobeLifeCycleListener = VisioglobeLifeCycleListener()
    private val visioglobePlaceListener: VisioglobePlaceListener = VisioglobePlaceListener()
    private val visioglobeRouteListener: VisioglobeRouteListener = VisioglobeRouteListener()
    private var currentOverlayViewId: String? = null
    private var lastUserLocation: MapViewLocation? = null

    companion object {
        private val TAG = "Map Native"
        val CHANNEL = "com.orange.obs.myplace.plugins/map_view"
        private val METHOD_MAP_SET_LOCATION = "map#setLocation"
        private val METHOD_MAP_START_NAVIGATION_TO_PLACE = "map#startNavigationToPlace"
        private val METHOD_MAP_START_NAVIGATION_TO_POSITION = "map#startNavigationToPosition"
        private val METHOD_MAP_UPDATE_POIS = "map#updatePlaces"
        private val METHOD_MAP_BOOKING = "map#booking"
        private val METHOD_MAP_REPORTING = "map#reporting"
        private val METHOD_MAP_FOCUS_ON_PLACE = "map#focusOnPlace"
        private val METHOD_MAP_READY = "map#isReady"
    }

    init {
        methodChannel = MethodChannel(messenger, "$CHANNEL$id")
        methodChannel.setMethodCallHandler(this)
        activity.application.registerActivityLifecycleCallbacks(this)
        loadMap()
    }

    private fun loadMap() {
        mapView.mapHash = mapHash
        mapView.promptUserToDownloadMap = false
        mapView.setLifeCycleListener(visioglobeLifeCycleListener)
        mapView.setPlaceListener(visioglobePlaceListener)
        mapView.loadMap()
    }

    fun reLoadMap() {
        mapView.unloadMap()
        loadMap()
    }

    override fun getView(): View {
        return mapView
    }

    override fun dispose() {
        if (disposed) {
            return
        }
        disposed = true
        methodChannel.setMethodCallHandler(null)
        mapView.unloadMap()
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_MAP_SET_LOCATION -> {
                val loc: HashMap<String, Any> = call.arguments as HashMap<String, Any>?
                        ?: return
                val location = MapViewLocation(loc)
                val vmeLocation: VMELocation? = mapView.createLocationFromLocation(location.toNativeLocation())
                if (vmeLocation != null) {
                    mapView.updateLocation(vmeLocation)
                    if (lastUserLocation == null) {
                        centerOnLocation(vmeLocation)
                    }
                    lastUserLocation = location
                } else {
                    lastUserLocation = null
                }
            }
            METHOD_MAP_START_NAVIGATION_TO_PLACE -> {
                val placeId: String = call.arguments as String?
                        ?: return
                startNavigationToPlace(placeId)
            }
            METHOD_MAP_START_NAVIGATION_TO_POSITION -> {
                val position: HashMap<String, Any> = call.arguments as HashMap<String, Any>?
                        ?: return
                startNavigationToPosition(position)
            }
            METHOD_MAP_UPDATE_POIS -> {
                val poisMap: List<Map<String, Any>> = call.arguments as List<Map<String, Any>>
                        ?: return
                val previousPois = pois
                pois = viewModel.poisListFromMap(poisMap)
                if (!isSameListOfPois(previousPois, pois)) {
                    addPoiListToMap()
                    mapView.unloadMap()
                    loadMap()
                }
                refreshRoomStatusList()
            }
            METHOD_MAP_FOCUS_ON_PLACE -> {
                val placeId: String = call.arguments as String?
                        ?: return
                focusOnPlace(placeId)
            }
            else -> result.notImplemented()
        }
    }

    private fun isSameListOfPois(list1: List<Poi>, list2: List<Poi>): Boolean {
        if (list1.count() != list2.count()) {
            return false
        }

        for (poi in list1) {
            if (list2.firstOrNull { it.id == poi.id } == null) {
                return false
            }
        }
        return true
    }

    // Application.ActivityLifecycleCallbacks methods
    override fun onActivityResumed(activity: Activity) {
        if (disposed || activity.hashCode() != context.hashCode()) {
            return
        }
        mapView.onResume()
    }

    override fun onActivityPaused(activity: Activity) {
        if (disposed || activity.hashCode() != context.hashCode()) {
            return
        }
        mapView.onPause()
    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {}

    override fun onActivityStarted(activity: Activity) {}

    override fun onActivityStopped(activity: Activity) {}

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle?) {}

    override fun onActivityDestroyed(activity: Activity) {}

    private fun addPoiListToMap() {
        val visioglobeData = viewModel.buildVisioglobeData(pois)
        try {
            mapView.updatePlaceData(JSONObject(Gson().toJson(visioglobeData)))
        } catch (e: JSONException) {
            throw IllegalStateException("JSON Exception", e)
        }
    }

    private fun focusOnPlace(placeId: String) {
        displayPoiCardDetails(placeId)
        centerOnPlaceById(placeId)
    }

    private fun refreshRoomStatusList() {
        pois.map {
            if (it.location != null) {
                if (it.roomStatus == null) {
                    mapView.resetPlaceColor(it.location)
                } else {
                    mapView.setPlaceColor(it.location, PoiStatus.color(it.roomStatus, context.resources))
                }
            }
        }
    }

    private fun displayPoiCardDetails(placeId: String) {
        // Remove current overlay, if any
        currentOverlayViewId?.let {
            mapView.removeOverlayView(it)
        }
        // Get data on POI details
        val place: VMEPlace = mapView.getPlace(placeId)
        val poi: Poi? = pois.find { it.location == placeId }
        // Display overlay
        poi?.let {
            val placeView: View = getPoiView(place, it)
            currentOverlayViewId = placeId
            mapView.addOverlayView(placeId, placeView, placeId)
        }
    }

    private fun getPoiView(place: VMEPlace, poi: Poi): View {
        return LayoutInflater.from(context).inflate(R.layout.poi_info_layout, FrameLayout(context), true).apply {
            findViewById<TextView>(R.id.poi_title_text)
                    .apply {
                        text = place.name
                    }
            if (poi.roomStatus == null || poi.roomStatus == PoiStatus.UNKNOWN) {
                findViewById<View>(R.id.status_layout).visibility = View.GONE
            } else {
                findViewById<View>(R.id.status_layout).visibility = View.VISIBLE
            }
            findViewById<TextView>(R.id.room_status_text)
                    .apply {
                        poi.roomStatus?.let {
                            text = PoiStatus.label(it, resources)
                        }
                    }
            findViewById<View>(R.id.room_status_icon)
                    .apply {
                        (background as GradientDrawable).setColor(PoiStatus.color(poi.roomStatus, context.resources))
                    }
            var visibilityDesc = View.VISIBLE
            findViewById<TextView>(R.id.poi_description_text)
                    .apply {
                        if (!poi.shortDescription.isNullOrEmpty()) {
                            text = poi.shortDescription
                        } else if (!poi.description.isNullOrEmpty()) {
                            text = Html.fromHtml(poi.description)
                        } else {
                            visibilityDesc = View.GONE
                        }
                    }
            findViewById<View>(R.id.poi_description_text).visibility = visibilityDesc

            findViewById<ImageButton>(R.id.poi_itinerary_button)
                    .apply {
                        setOnClickListener { startNavigationToPlace(place.id) }
                        visibility = if (lastUserLocation == null) {
                            View.GONE
                        } else {
                            View.VISIBLE
                        }
                        (background as GradientDrawable).setColor(context.resources.getColor(R.color.popup_button, null))
                    }
            findViewById<ImageButton>(R.id.poi_reporting_button)
                    .apply {
                        setOnClickListener {
                            currentOverlayViewId?.let {
                                mapView.removeOverlayView(currentOverlayViewId)
                                currentOverlayViewId = null
                            }
                            methodChannel.invokeMethod(METHOD_MAP_REPORTING, poi.id)
                        }
                        visibility = if (allowReporting) {
                            View.VISIBLE
                        } else {
                            View.GONE
                        }
                        (background as GradientDrawable).setColor(context.resources.getColor(R.color.popup_button, null))
                    }
            findViewById<ImageButton>(R.id.poi_booking_button)
                    .apply {
                        visibility = if (allowBooking && poi.roomStatus != null && poi.roomStatus != PoiStatus.UNKNOWN) {
                            View.VISIBLE
                        } else {
                            View.GONE
                        }
                        if (poi.roomStatus == PoiStatus.AVAILABLE) {
                            setOnClickListener {
                                currentOverlayViewId?.let {
                                    mapView.removeOverlayView(currentOverlayViewId)
                                    currentOverlayViewId = null
                                }
                                methodChannel.invokeMethod(METHOD_MAP_BOOKING, poi.id)
                            }
                            (background as GradientDrawable).setColor(context.resources.getColor(R.color.popup_button, null))
                        } else {
                            (background as GradientDrawable).setColor(context.resources.getColor(R.color.popup_button_disable, null))
                        }
                    }
            findViewById<ImageView>(R.id.poi_close_button)
                    .apply {
                        setOnClickListener {
                            mapView.removeOverlayView(currentOverlayViewId)
                            currentOverlayViewId = null
                        }
                    }
        }
    }

    private fun centerOnPlaceById(placeId: String) {
        val cameraUpdate = VMECameraUpdateBuilder()
                .setTargets(listOf(placeId))
                .setViewMode(VMEViewMode.FLOOR)
                .build()
        mapView.animateCamera(cameraUpdate)
    }

    private fun centerOnLocation(vmeLocation: VMELocation) {
        centerOnPosition(vmeLocation.position)
    }

    private fun centerOnPosition(vmePosition: VMEPosition) {
        val cameraUpdate = VMECameraUpdateBuilder()
                .setTargets(listOf(vmePosition))
                .setViewMode(VMEViewMode.FLOOR)
                .setDistanceRange(VMECameraDistanceRange.newAltitudeRange(
                        vmePosition.altitude + 10,
                        vmePosition.altitude + 20))
                .build()
        mapView.animateCamera(cameraUpdate)
    }

    private fun startNavigationToPlace(placeId: String) {
       
        val origin = lastUserLocation ;

        // No origin location
        if (origin == null) {
            centerOnPlaceById(placeId);
            // TODO : find a way to launch itinerary when user location is ready
        }
        else {
            // Launch itinerary
            val routeRequest = VMERouteRequest(
                    VMERouteRequestType.FASTEST,
                    VMERouteDestinationsOrder.IN_ORDER,
                    isReducedMobilityForItinerary)

            routeRequest.addDestination(placeId)
            routeRequest.setOrigin(mapView.createPositionFromLocation(origin.toNativeLocation()))
            mapView.computeRoute(routeRequest, visioglobeRouteListener)
        }
    }

    private fun startNavigationToPosition(hashmapLocation: HashMap<String, Any>) {

        val origin = lastUserLocation ;

        // Get destination location
        val location = MapViewLocation(hashmapLocation)
        val vmePosition: VMEPosition? = mapView.createPositionFromLocation(location.toNativeLocation())
        if (vmePosition != null) {

             // No origin location
            if (origin == null) {
                centerOnPosition(vmePosition);
                // TODO : find a way to launch itinerary when user location is ready
            }
            else {
                // Launch itinerary
                val routeRequest = VMERouteRequest(
                        VMERouteRequestType.FASTEST,
                        VMERouteDestinationsOrder.IN_ORDER,
                        isReducedMobilityForItinerary)

                routeRequest.addDestination(vmePosition)
                routeRequest.setOrigin(mapView.createPositionFromLocation(origin.toNativeLocation()))
                mapView.computeRoute(routeRequest, visioglobeRouteListener)
            }
        }
    }

    inner class VisioglobeLifeCycleListener : VMELifeCycleListener() {
        override fun mapDidLoad(vmeMapView: VMEMapView) {
            super.mapDidLoad(vmeMapView)
            methodChannel.invokeMethod(METHOD_MAP_READY, null)
            if (lastUserLocation == null) {
                favoriteBuildingPlaceId?.let {
                    centerOnPlaceById(it)
                }
            }
        }

        override fun mapDidInitializeEngine(vmeMapView: VMEMapView?) {
            addPoiListToMap()
            refreshRoomStatusList()
        }
    }

    inner class VisioglobePlaceListener : VMEPlaceListener() {
        override fun mapDidSelectPlace(vmeMapView: VMEMapView, placeId: String, vmePosition: VMEPosition): Boolean {
            displayPoiCardDetails(placeId)
            mapView.locationTrackingMode = VMELocationTrackingMode.NONE
            centerOnPlaceById(placeId)
            return true
        }
    }

    inner class VisioglobeRouteListener : VMEComputeRouteCallback {
        override fun computeRouteDidFinish(
                vmeMapView: VMEMapView?,
                routeRequest: VMERouteRequest,
                routeResult: VMERouteResult
        ): Boolean {
            currentOverlayViewId?.let {
                mapView.removeOverlayView(currentOverlayViewId)
                currentOverlayViewId = null
            }
            return true
        }

        override fun computeRouteDidFail(
                vmeMapView: VMEMapView?,
                routeRequest: VMERouteRequest,
                s: String
        ) {
            Log.e(TAG, "compute route failed: $s")
        }
    }
}
