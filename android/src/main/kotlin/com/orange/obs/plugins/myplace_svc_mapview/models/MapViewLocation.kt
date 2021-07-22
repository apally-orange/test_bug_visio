package com.orange.obs.plugins.myplace_svc_mapview.models

import android.location.Location

//todo(team) manage altitude location.setAltitude(position.getMapId() * mGeoloc.getGeolocFloorCoefficient());
data class MapViewLocation(
        val latitude: Double = 0.0,
        val longitude: Double = 0.0,
        val altitude: Double = 0.0,
        val bearing: Float = 0f) {

    constructor(map: Map<String, Any>) : this(map["latitude"] as Double,
            map["longitude"] as Double,
            map["altitude"] as Double,
            (map["bearing"] as Double).toFloat())


    fun toNativeLocation(): Location {
        val loc = Location("")
        loc.latitude = latitude
        loc.longitude = longitude
        loc.altitude = altitude
        loc.bearing = bearing
        return loc
    }
}
