import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';

const String _channelName = 'com.orange.obs.myplace.plugins/map_view';

/// A map controller
class MapViewController {
  /// Create a [MapViewController]
  MapViewController({
    required this.id,
  }) {
    _channel = MethodChannel('$_channelName$id');
    _channel.setMethodCallHandler(methodCallHandler);
  }

  final int id;
  late MethodChannel _channel;
  VoidCallback? onMapReady;

  /// To start a navigation to a Poi
  Future<void> startNavigationToPlace(String placeId) async {
    return _channel.invokeMethod('map#startNavigationToPlace', placeId);
  }

  /// Center camera and show popup on a Poi
  Future<void> focusOnPlace(String placeId) async {
    return _channel.invokeMethod('map#focusOnPlace', placeId);
  }

  /// To update list pois
  Future<void> updatePlaces(List<Poi> places) async {
    if (places.isNotEmpty) {
      return _channel.invokeMethod(
        'map#updatePlaces',
        places.map((p) => p.toJson()).toList(),
      );
    }
  }

  /// Call Native to Flutter
  @visibleForTesting
  @protected
  Future<void> methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'map#isReady':
        if (onMapReady != null) {
          onMapReady!.call();
          onMapReady = null; //To call only one by map
        }
        return;

      default:
        throw MissingPluginException();
    }
  }
}
