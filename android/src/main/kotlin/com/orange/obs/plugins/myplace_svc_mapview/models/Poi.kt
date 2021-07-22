package com.orange.obs.plugins.myplace_svc_mapview.models

import android.content.res.Resources
import com.google.gson.annotations.SerializedName
import com.orange.obs.plugins.myplace_svc_mapview.R

data class Poi(
        var id: String,
        var title: String,
        var shortDescription: String? = null,
        var description: String? = null,
        var latitude: Double = 0.0,
        var longitude: Double = 0.0,
        var location: String,
        var categories: List<Category>,
        var roomId: String? = null,
        var roomStatus: PoiStatus? = PoiStatus.UNKNOWN) 

enum class PoiStatus {
        @SerializedName("free")
        AVAILABLE,
        @SerializedName("occupied")
        OCCUPIED,
        @SerializedName("reserved")
        RESERVED,
        @SerializedName("unknown")
        UNKNOWN;

    companion object{
        fun color(status: PoiStatus?, res: Resources): Int{
            return when (status) {
                PoiStatus.AVAILABLE -> res.getColor(R.color.room_free, null)
                PoiStatus.OCCUPIED -> res.getColor(R.color.room_occupied, null)
                PoiStatus.RESERVED -> res.getColor(R.color.room_reserved, null)
                else -> res.getColor(R.color.room_unknown, null)
            }
        }

        fun label(status: PoiStatus, res: Resources): String{
            return when (status) {
                PoiStatus.AVAILABLE -> res.getString(R.string.available)
                PoiStatus.OCCUPIED -> res.getString(R.string.occupied)
                PoiStatus.RESERVED -> res.getString(R.string.reserved)
                else -> res.getString(R.string.unknown)
            }
        }
    }
}
