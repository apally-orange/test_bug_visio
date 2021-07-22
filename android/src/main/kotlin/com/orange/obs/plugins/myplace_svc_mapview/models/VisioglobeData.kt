package com.orange.obs.plugins.myplace_svc_mapview.models

data class VisioglobeData(
        var places: HashMap<String, VisioglobePlace>,
        var categories: HashMap<String, VisioglobeCategory>)


