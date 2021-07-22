package com.orange.obs.plugins.myplace_svc_mapview.view_model

import com.google.gson.Gson
import com.orange.obs.plugins.myplace_svc_mapview.models.*

class ViewModelData {

    fun buildVisioglobeData(
            pois: List<Poi>
    ): VisioglobeData {
        val poiMap = HashMap<String, VisioglobePlace>()
        val categoryMap = HashMap<String, VisioglobeCategory>()
        val categoriesOnlyOne = pois.flatMap { it.categories }.distinctBy { it.id }

        pois
                .asSequence()
                .associateTo(poiMap) { poi ->
                    poi.location to VisioglobePlace(poi.title,
                            poi.description ?: "",
                            poi.categories?.firstOrNull()?.icon?.contentUrl ?: "",
                            poi.categories?.map { it.id })
                }

        categoriesOnlyOne
                .asSequence()
                .associateTo(categoryMap) {
                    it.id to VisioglobeCategory(it.title, it?.icon?.contentUrl ?: "")
                }

        return VisioglobeData(poiMap, categoryMap)
    }


    fun poisListFromMap(poisMap: List<Map<String, Any>>): List<Poi> {
        val pois = ArrayList<Poi>()
        val gson = Gson()
        poisMap.forEach {
            val poisStr: String = gson.toJson(it)
            pois.add(gson.fromJson(poisStr, Poi::class.java))
        }
        return pois
    }
}