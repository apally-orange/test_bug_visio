import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_poi_action.freezed.dart';

enum MapAction {
  navigate,
  locate,
}

@freezed
class MapPoiAction with _$MapPoiAction {
  const factory MapPoiAction({
    required String poiId,
    required MapAction action,
  }) = _MapPoiAction;
}
