// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PoiBuilding _$_$_PoiBuildingFromJson(Map<String, dynamic> json) {
  return _$_PoiBuilding(
    id: json['id'] as String,
    externalId: json['externalId'] as String?,
    remoteControlId: json['remoteControlId'] as String?,
    flexOfficeId: json['flexOfficeId'] as String?,
    title: json['title'] as String,
    minFloor: json['minFloor'] as int? ?? 0,
    maxFloor: json['maxFloor'] as int? ?? 0,
    isFake: json['isFake'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_PoiBuildingToJson(_$_PoiBuilding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'remoteControlId': instance.remoteControlId,
      'flexOfficeId': instance.flexOfficeId,
      'title': instance.title,
      'minFloor': instance.minFloor,
      'maxFloor': instance.maxFloor,
      'isFake': instance.isFake,
    };

_$_PoiFloor _$_$_PoiFloorFromJson(Map<String, dynamic> json) {
  return _$_PoiFloor(
    title: json['title'] as String?,
    flexOfficeId: json['flexOfficeId'] as String?,
    floorIndex: json['floorIndex'] as int?,
    visioglobeId: json['visioglobeId'] as String?,
  );
}

Map<String, dynamic> _$_$_PoiFloorToJson(_$_PoiFloor instance) =>
    <String, dynamic>{
      'title': instance.title,
      'flexOfficeId': instance.flexOfficeId,
      'floorIndex': instance.floorIndex,
      'visioglobeId': instance.visioglobeId,
    };

_$_PoiCategory _$_$_PoiCategoryFromJson(Map<String, dynamic> json) {
  return _$_PoiCategory(
    id: json['id'] as String,
    title: json['title'] as String,
    technicalId: json['technicalId'] as String,
    zoomLevel: json['zoomLevel'] as String?,
    icon: json['icon'] == null
        ? null
        : GqlImage.fromJson(json['icon'] as Map<String, dynamic>),
    statusIcon: _gqlImagesFromJson(json['statusIcon'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$_$_PoiCategoryToJson(_$_PoiCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'technicalId': instance.technicalId,
      'zoomLevel': instance.zoomLevel,
      'icon': instance.icon?.toJson(),
      'statusIcon': instance.statusIcon?.map((e) => e.toJson()).toList(),
    };

_$_Poi _$_$_PoiFromJson(Map<String, dynamic> json) {
  return _$_Poi(
    id: json['id'] as String,
    location: json['location'] as String?,
    roomId: json['roomId'] as String?,
    roomStatus: _$enumDecodeNullable(_$RoomStatusEnumMap, json['roomStatus']),
    title: json['title'] as String?,
    description: json['description'] as String?,
    shortDescription: json['shortDescription'] as String?,
    latitude: _coordFromJson(json['latitude'] as String?),
    longitude: _coordFromJson(json['longitude'] as String?),
    categories:
        _poiCategoriesFromJson(json['categories'] as Map<String, dynamic>?),
    building: _poiBuildingFromJson(json['building'] as Map<String, dynamic>?),
    floor: _poiFloorFromJson(json['floor'] as Map<String, dynamic>?),
    images: _gqlImagesFromJson(json['images'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$_$_PoiToJson(_$_Poi instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'roomId': instance.roomId,
      'roomStatus': _$RoomStatusEnumMap[instance.roomStatus],
      'title': instance.title,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'building': instance.building?.toJson(),
      'floor': instance.floor?.toJson(),
      'images': instance.images.map((e) => e.toJson()).toList(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$RoomStatusEnumMap = {
  RoomStatus.unknown: 'unknown',
  RoomStatus.free: 'free',
  RoomStatus.occupied: 'occupied',
  RoomStatus.reserved: 'reserved',
};

_$_DirectoryPoi _$_$_DirectoryPoiFromJson(Map<String, dynamic> json) {
  return _$_DirectoryPoi(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$_$_DirectoryPoiToJson(_$_DirectoryPoi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$_GqlImage _$_$_GqlImageFromJson(Map<String, dynamic> json) {
  return _$_GqlImage(
    title: json['title'] as String?,
    contentUrl: json['contentUrl'] as String,
  );
}

Map<String, dynamic> _$_$_GqlImageToJson(_$_GqlImage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contentUrl': instance.contentUrl,
    };
