import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:test_bug_visio/myplace_svc_mapview.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';

class MapService {
  @visibleForTesting
  @protected
  final List<Completer<MapViewController>> completerStack = [];

  @visibleForTesting
  @protected
  Completer<MapViewController> currentCompleter =
      Completer<MapViewController>();

  void addController(MapViewController controller) {
    final completer = Completer<MapViewController>();
    controller.onMapReady =
        () => !completer.isCompleted ? completer.complete(controller) : null;
    if (currentCompleter.isCompleted) {
      completerStack.add(currentCompleter);
    }
    currentCompleter = completer;
  }

  void dispose() {
    currentCompleter = completerStack.isEmpty
        ? Completer<MapViewController>()
        : completerStack.removeLast();
  }

  Future<void> focusOnPlace(String placeId) async {
    final MapViewController controller = await currentCompleter.future;
    controller.focusOnPlace(placeId);
  }

  Future<void> startNavigationToPlace(String placeId) async {
    final MapViewController controller = await currentCompleter.future;
    controller.startNavigationToPlace(placeId);
  }

  Future<void> startNavigationToPoi(Poi poi) async {
    final MapViewController controller = await currentCompleter.future;
    controller.startNavigationToPlace(poi.location!);
  }

  Future<void> updatePlaces(List<Poi> pois) async {
    final MapViewController controller = await currentCompleter.future;
    controller.updatePlaces(pois);
  }
}
