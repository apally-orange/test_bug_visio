import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_poi_action.freezed.dart';

enum MapAction {
  navigate,
  locate,
}

@freezed
abstract class MapPoiAction with _$MapPoiAction {
  const factory MapPoiAction({
    String poiId,
    MapAction action,
  }) = _MapPoiAction;
}
