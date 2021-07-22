package com.orange.obs.plugins.myplace_svc_mapview.models

data class Category (
    var id: String,
    var title: String,
    var technicalId: String,
    var icon: GqlImage,
    var zoomLevel: String,
    var statusIcon: List<GqlImage>? = null)