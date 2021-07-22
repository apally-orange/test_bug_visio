import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'poi.g.dart';
part 'poi.freezed.dart';

enum RoomStatus {
  unknown,
  free,
  occupied,
  reserved,
}

typedef Deserialize<T> = T Function(Map<String, dynamic> map);

extension JsonExtensions on List<dynamic> {
  List<T> deserializeGqlList<T extends Object>(Deserialize<T> deserializer) {
    return map(
      (dynamic edge) {
        final map = edge?['node'] as Map<String, dynamic>?;
        if (map == null) {
          return null;
        }
        return deserializer(map);
      },
    ).whereNotNull().toList();
  }

  List<T> deserializeList<T extends Object>(Deserialize<T> deserializer) {
    return map(
      (dynamic e) {
        if (e == null) {
          return null;
        }
        return deserializer(e as Map<String, dynamic>);
      },
    ).whereNotNull().toList();
  }
}

/// A poi's building.
@freezed
class PoiBuilding with _$PoiBuilding {
  /// Creates a [PoiBuilding].
  @JsonSerializable(explicitToJson: true)
  const factory PoiBuilding({
    required String id,
    String? externalId,
    String? remoteControlId,
    String? flexOfficeId,
    required String title,
    @Default(0) int minFloor,
    @Default(0) int maxFloor,
    @Default(false) bool isFake,
  }) = _PoiBuilding;

  /// Creates a [PoiBuilding] from json.
  factory PoiBuilding.fromJson(Map<String, dynamic> json) =>
      _$PoiBuildingFromJson(json);

  factory PoiBuilding.all(String title) {
    return PoiBuilding(
      id: buildingAll,
      flexOfficeId: buildingAll,
      title: title,
      minFloor: 0,
      maxFloor: 0,
      isFake: true,
    );
  }

  static const buildingAll = 'all';
}

/// A poi's floor.
@freezed
class PoiFloor with _$PoiFloor {
  /// Creates a [PoiFloor].
  @JsonSerializable(explicitToJson: true)
  const factory PoiFloor({
    String? title,
    String? flexOfficeId,
    int? floorIndex,
    String? visioglobeId,
  }) = _PoiFloor;

  /// Creates a [PoiFloor] from json.
  factory PoiFloor.fromJson(Map<String, dynamic> json) =>
      _$PoiFloorFromJson(json);
}

/// A poi's category.
@freezed
class PoiCategory with _$PoiCategory {
  /// Creates a [PoiCategory].
  @JsonSerializable(explicitToJson: true)
  const factory PoiCategory({
    required String id,
    required String title,
    required String technicalId,
    String? zoomLevel,
    GqlImage? icon,
    @JsonKey(fromJson: _gqlImagesFromJson) List<GqlImage>? statusIcon,
  }) = _PoiCategory;

  /// Creates a [PoiCategory] from json.
  factory PoiCategory.fromJson(Map<String, dynamic> json) =>
      _$PoiCategoryFromJson(json);
}

/// A point of interet (POI).
@freezed
class Poi with _$Poi {
  /// Creates a [Poi].
  @JsonSerializable(explicitToJson: true)
  const factory Poi({
    required String id,
    String? location,
    String? roomId,
    RoomStatus? roomStatus,
    String? title,
    String? description,
    String? shortDescription,
    @JsonKey(fromJson: _coordFromJson) double? latitude,
    @JsonKey(fromJson: _coordFromJson) double? longitude,
    @Default(<PoiCategory>[])
    @JsonKey(fromJson: _poiCategoriesFromJson)
        List<PoiCategory> categories,
    @JsonKey(fromJson: _poiBuildingFromJson) PoiBuilding? building,
    @JsonKey(fromJson: _poiFloorFromJson) PoiFloor? floor,
    @Default(<GqlImage>[])
    @JsonKey(fromJson: _gqlImagesFromJson)
        List<GqlImage> images,
  }) = _Poi;

  /// Creates a [Poi] from json.
  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}

@freezed
class DirectoryPoi with _$DirectoryPoi {
  const factory DirectoryPoi({
    required String id,
    required String title,
  }) = _DirectoryPoi;
  factory DirectoryPoi.fromJson(Map<String, dynamic> json) =>
      _$DirectoryPoiFromJson(json);
}

/// A Gql Response Image model.
@freezed
class GqlImage with _$GqlImage {
  /// Creates a [GqlImage].
  const factory GqlImage({
    String? title,
    required String contentUrl,
  }) = _GqlImage;

  /// Creates a [GqlImage] from json.
  factory GqlImage.fromJson(Map<String, dynamic> json) =>
      _$GqlImageFromJson(json);
}

List<GqlImage> _gqlImagesFromJson(Map<String, dynamic>? json) {
  return (json?['edges'] as List?)?.deserializeGqlList(
        (map) => GqlImage.fromJson(map),
      ) ??
      <GqlImage>[];
}

List<PoiCategory> _poiCategoriesFromJson(Map<String, dynamic>? json) {
  return (json?['edges'] as List?)?.deserializeGqlList(
        (map) => PoiCategory.fromJson(map),
      ) ??
      <PoiCategory>[];
}

double? _coordFromJson(String? coord) =>
    (coord != null && coord.isNotEmpty) ? double.tryParse(coord) : null;

PoiFloor? _poiFloorFromJson(Map<String, dynamic>? json) {
  final list = (json?['edges'] as List?)?.deserializeGqlList(
        (map) => PoiFloor.fromJson(map),
      ) ??
      <PoiFloor>[];

  return list.firstOrNull;
}

PoiBuilding? _poiBuildingFromJson(Map<String, dynamic>? json) {
  final list = (json?['edges'] as List?)?.deserializeGqlList(
        (map) => PoiBuilding.fromJson(map),
      ) ??
      <PoiBuilding>[];

  return list.firstOrNull;
}
