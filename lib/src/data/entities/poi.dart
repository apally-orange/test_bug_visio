import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.g.dart';
part 'poi.freezed.dart';

enum RoomStatus {
  unknown,
  free,
  occupied,
  reserved,
}

/// A poi's building.
@freezed
abstract class PoiBuilding with _$PoiBuilding {
  /// Creates a [PoiBuilding].
  @JsonSerializable(explicitToJson: true)
  const factory PoiBuilding({
    @required String id,
    String externalId,
    String remoteControlId,
    String flexOfficeId,
    String title,
  }) = _PoiBuilding;

  /// Creates a [PoiBuilding] from json.
  factory PoiBuilding.fromJson(Map<String, dynamic> json) =>
      _$PoiBuildingFromJson(json);
}

/// A poi's floor.
@freezed
abstract class PoiFloor with _$PoiFloor {
  /// Creates a [PoiFloor].
  @JsonSerializable(explicitToJson: true)
  const factory PoiFloor({
    String title,
    String flexOfficeId,
  }) = _PoiFloor;

  /// Creates a [PoiFloor] from json.
  factory PoiFloor.fromJson(Map<String, dynamic> json) =>
      _$PoiFloorFromJson(json);
}

/// A poi's category.
@freezed
abstract class PoiCategory with _$PoiCategory {
  /// Creates a [PoiCategory].
  @JsonSerializable(explicitToJson: true)
  const factory PoiCategory({
    @required String id,
    @required String title,
    @required String technicalId,
    String zoomLevel,
    GqlImage icon,
    @JsonKey(fromJson: _statusIconsFromJson) List<GqlImage> statusIcon,
  }) = _PoiCategory;

  /// Creates a [PoiCategory] from json.
  factory PoiCategory.fromJson(Map<String, dynamic> json) =>
      _$PoiCategoryFromJson(json);
}

/// A point of interet (POI).
@freezed
abstract class Poi with _$Poi {
  /// Creates a [Poi].
  @JsonSerializable(explicitToJson: true)
  const factory Poi({
    @required String id,
    String location,
    String roomId,
    RoomStatus roomStatus,
    String title,
    String description,
    String shortDescription,
    @JsonKey(fromJson: _coordFromJson) double latitude,
    @JsonKey(fromJson: _coordFromJson) double longitude,
    @JsonKey(fromJson: _poiCategoriesFromJson) List<PoiCategory> categories,
    @JsonKey(fromJson: _poiBuildingFromJson) PoiBuilding building,
    @JsonKey(fromJson: _poiFloorFromJson) PoiFloor floor,
  }) = _Poi;

  /// Creates a [Poi] from json.
  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}

@freezed
abstract class DirectoryPoi with _$DirectoryPoi {
  const factory DirectoryPoi({
    @required String id,
    @required String title,
  }) = _DirectoryPoi;
  factory DirectoryPoi.fromJson(Map<String, dynamic> json) =>
      _$DirectoryPoiFromJson(json);
}

/// A Gql Response Image model.
@freezed
abstract class GqlImage with _$GqlImage {
  /// Creates a [GqlImage].
  const factory GqlImage({
    String title,
    @required String contentUrl,
  }) = _GqlImage;

  /// Creates a [GqlImage] from json.
  factory GqlImage.fromJson(Map<String, dynamic> json) =>
      _$GqlImageFromJson(json);
}

List<GqlImage> _statusIconsFromJson(Map<String, dynamic> json) => json != null
    ? (json['edges'] as List)
        ?.map((dynamic e) => e == null || e['node'] == null
            ? null
            : GqlImage.fromJson(e['node'] as Map<String, dynamic>))
        ?.toList()
    : null;

List<PoiCategory> _poiCategoriesFromJson(Map<String, dynamic> json) =>
    json != null
        ? (json['edges'] as List)
            ?.map((dynamic e) => e == null || e['node'] == null
                ? null
                : PoiCategory.fromJson(e['node'] as Map<String, dynamic>))
            ?.toList()
        : null;

double _coordFromJson(String coord) =>
    (coord != null && coord.isNotEmpty) ? double.parse(coord) : null;

PoiFloor _poiFloorFromJson(Map<String, dynamic> json) {
  final list = (json['edges'] as List)
      ?.map((dynamic e) => e == null || e['node'] == null
          ? null
          : PoiFloor.fromJson(e['node'] as Map<String, dynamic>))
      ?.toList();

  return list?.firstOrNull;
}

PoiBuilding _poiBuildingFromJson(Map<String, dynamic> json) {
  final list = (json['edges'] as List)
      ?.map((dynamic e) => e == null || e['node'] == null
          ? null
          : PoiBuilding.fromJson(e['node'] as Map<String, dynamic>))
      ?.toList();

  return list?.firstOrNull;
}

extension ListExtensions<T> on List<T> {
  T get firstOrNull => isEmpty ? null : first;
  T firstWhereOrDefault(bool Function(T) test, [T defaultValue]) {
    return firstWhere(test, orElse: () => defaultValue);
  }

  List<T> clone() => List<T>.from(this);
}
