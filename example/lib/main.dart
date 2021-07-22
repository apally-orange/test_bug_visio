import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_bug_visio/myplace_svc_mapview.dart';

String poisWS = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  poisWS = await rootBundle.loadString('assets/poi_bridge.json');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => MapService(),
        ),
      ],
      child: const MaterialApp(
        home: SampleMapView(),
      ),
    );
  }
}

class SampleMapView extends StatelessWidget {
  const SampleMapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapService = context.watch<MapService>();
    final List<Poi> pois = (json.decode(poisWS) as List)
        .map((dynamic p) => Poi.fromJson(p as Map<String, dynamic>))
        .map((e) => e.copyWith(roomStatus: RoomStatus.free))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigation),
            onPressed: () =>
                mapService.startNavigationToPlace(pois[0].location!),
          ),
          IconButton(
            icon: const Icon(Icons.filter_center_focus),
            onPressed: () => mapService.focusOnPlace(pois[0].location!),
          ),
        ],
      ),
      body: MapView(
        places: pois,
        mapHashCode: 'm4b29e45535df17be9fffe16a088184690800a1dc',
        //'m05e57ee028b117e658a07d8b1a4bf0e0f8247bb2',
      ),
    );
  }
}
