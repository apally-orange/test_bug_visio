import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_bug_visio/myplace_svc_mapview.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';
import 'package:test_bug_visio/src/modules/android_view/view.dart';

class MapView extends StatefulWidget {
  /// Creates a [MapView]
  const MapView({
    Key? key,
    required this.mapHashCode,
    required this.places,
    this.onMapViewCreated,
    this.isReducedMobilityForItinerary = false,
    this.favoriteBuildingPlaceId,
    this.promptUserToDownloadMap = false,
  }) : super(key: key);

  /// Callback method for when the map is ready to be used.
  final VoidCallback? onMapViewCreated;

  /// The hash code of the map to load.
  final String mapHashCode;

  /// The places we want to display on the map.
  final List<Poi> places;

  /// User choice how find itineary
  final bool isReducedMobilityForItinerary;

  /// User choice favorite building visioglobe id
  final String? favoriteBuildingPlaceId;

  final bool promptUserToDownloadMap;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late Map<String, dynamic> _creationParams;
  late MapViewController controller;
  late MapService _mapService;

  @override
  void initState() {
    super.initState();
    _creationParams = <String, dynamic>{
      'hash': widget.mapHashCode,
      'pois': widget.places.map((p) => p.toJson()).toList(),
      'isReducedMobilityForItinerary': widget.isReducedMobilityForItinerary,
      'favoriteBuildingPlaceId': widget.favoriteBuildingPlaceId,
      'promptUserToDownloadMap': widget.promptUserToDownloadMap
    };
    _mapService = context.read<MapService>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _mapService.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mapHashCode != widget.mapHashCode) {
      // Todo(team): we need a method on the controller to update the
      // mapHashCode.
    }
    if (oldWidget.places != widget.places) {
      _mapService.updatePlaces(widget.places);
    }
  }

  @override
  Widget build(BuildContext context) {
    const viewType = 'com.orange.obs.myplace.plugins/map_view';

    return AndroidMapView(
      viewType: viewType,
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParams: _creationParams,
      creationParamsCodec: const StandardMessageCodec(),
      pois: widget.places,
    );
  }

  void _onPlatformViewCreated(int id) {
    controller = MapViewController(
      id: id,
    );
    _mapService.addController(controller);

    if (widget.onMapViewCreated == null) {
      return;
    }
    widget.onMapViewCreated!.call();
  }
}
