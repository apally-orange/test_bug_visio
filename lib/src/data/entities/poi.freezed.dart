// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'poi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PoiBuilding _$PoiBuildingFromJson(Map<String, dynamic> json) {
  return _PoiBuilding.fromJson(json);
}

/// @nodoc
class _$PoiBuildingTearOff {
  const _$PoiBuildingTearOff();

// ignore: unused_element
  _PoiBuilding call(
      {@required String id,
      String externalId,
      String remoteControlId,
      String flexOfficeId,
      String title}) {
    return _PoiBuilding(
      id: id,
      externalId: externalId,
      remoteControlId: remoteControlId,
      flexOfficeId: flexOfficeId,
      title: title,
    );
  }

// ignore: unused_element
  PoiBuilding fromJson(Map<String, Object> json) {
    return PoiBuilding.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PoiBuilding = _$PoiBuildingTearOff();

/// @nodoc
mixin _$PoiBuilding {
  String get id;
  String get externalId;
  String get remoteControlId;
  String get flexOfficeId;
  String get title;

  Map<String, dynamic> toJson();
  $PoiBuildingCopyWith<PoiBuilding> get copyWith;
}

/// @nodoc
abstract class $PoiBuildingCopyWith<$Res> {
  factory $PoiBuildingCopyWith(
          PoiBuilding value, $Res Function(PoiBuilding) then) =
      _$PoiBuildingCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String externalId,
      String remoteControlId,
      String flexOfficeId,
      String title});
}

/// @nodoc
class _$PoiBuildingCopyWithImpl<$Res> implements $PoiBuildingCopyWith<$Res> {
  _$PoiBuildingCopyWithImpl(this._value, this._then);

  final PoiBuilding _value;
  // ignore: unused_field
  final $Res Function(PoiBuilding) _then;

  @override
  $Res call({
    Object id = freezed,
    Object externalId = freezed,
    Object remoteControlId = freezed,
    Object flexOfficeId = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      externalId:
          externalId == freezed ? _value.externalId : externalId as String,
      remoteControlId: remoteControlId == freezed
          ? _value.remoteControlId
          : remoteControlId as String,
      flexOfficeId: flexOfficeId == freezed
          ? _value.flexOfficeId
          : flexOfficeId as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class _$PoiBuildingCopyWith<$Res>
    implements $PoiBuildingCopyWith<$Res> {
  factory _$PoiBuildingCopyWith(
          _PoiBuilding value, $Res Function(_PoiBuilding) then) =
      __$PoiBuildingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String externalId,
      String remoteControlId,
      String flexOfficeId,
      String title});
}

/// @nodoc
class __$PoiBuildingCopyWithImpl<$Res> extends _$PoiBuildingCopyWithImpl<$Res>
    implements _$PoiBuildingCopyWith<$Res> {
  __$PoiBuildingCopyWithImpl(
      _PoiBuilding _value, $Res Function(_PoiBuilding) _then)
      : super(_value, (v) => _then(v as _PoiBuilding));

  @override
  _PoiBuilding get _value => super._value as _PoiBuilding;

  @override
  $Res call({
    Object id = freezed,
    Object externalId = freezed,
    Object remoteControlId = freezed,
    Object flexOfficeId = freezed,
    Object title = freezed,
  }) {
    return _then(_PoiBuilding(
      id: id == freezed ? _value.id : id as String,
      externalId:
          externalId == freezed ? _value.externalId : externalId as String,
      remoteControlId: remoteControlId == freezed
          ? _value.remoteControlId
          : remoteControlId as String,
      flexOfficeId: flexOfficeId == freezed
          ? _value.flexOfficeId
          : flexOfficeId as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_PoiBuilding with DiagnosticableTreeMixin implements _PoiBuilding {
  const _$_PoiBuilding(
      {@required this.id,
      this.externalId,
      this.remoteControlId,
      this.flexOfficeId,
      this.title})
      : assert(id != null);

  factory _$_PoiBuilding.fromJson(Map<String, dynamic> json) =>
      _$_$_PoiBuildingFromJson(json);

  @override
  final String id;
  @override
  final String externalId;
  @override
  final String remoteControlId;
  @override
  final String flexOfficeId;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PoiBuilding(id: $id, externalId: $externalId, remoteControlId: $remoteControlId, flexOfficeId: $flexOfficeId, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PoiBuilding'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('externalId', externalId))
      ..add(DiagnosticsProperty('remoteControlId', remoteControlId))
      ..add(DiagnosticsProperty('flexOfficeId', flexOfficeId))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PoiBuilding &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.remoteControlId, remoteControlId) ||
                const DeepCollectionEquality()
                    .equals(other.remoteControlId, remoteControlId)) &&
            (identical(other.flexOfficeId, flexOfficeId) ||
                const DeepCollectionEquality()
                    .equals(other.flexOfficeId, flexOfficeId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(remoteControlId) ^
      const DeepCollectionEquality().hash(flexOfficeId) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$PoiBuildingCopyWith<_PoiBuilding> get copyWith =>
      __$PoiBuildingCopyWithImpl<_PoiBuilding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PoiBuildingToJson(this);
  }
}

abstract class _PoiBuilding implements PoiBuilding {
  const factory _PoiBuilding(
      {@required String id,
      String externalId,
      String remoteControlId,
      String flexOfficeId,
      String title}) = _$_PoiBuilding;

  factory _PoiBuilding.fromJson(Map<String, dynamic> json) =
      _$_PoiBuilding.fromJson;

  @override
  String get id;
  @override
  String get externalId;
  @override
  String get remoteControlId;
  @override
  String get flexOfficeId;
  @override
  String get title;
  @override
  _$PoiBuildingCopyWith<_PoiBuilding> get copyWith;
}

PoiFloor _$PoiFloorFromJson(Map<String, dynamic> json) {
  return _PoiFloor.fromJson(json);
}

/// @nodoc
class _$PoiFloorTearOff {
  const _$PoiFloorTearOff();

// ignore: unused_element
  _PoiFloor call({String title, String flexOfficeId}) {
    return _PoiFloor(
      title: title,
      flexOfficeId: flexOfficeId,
    );
  }

// ignore: unused_element
  PoiFloor fromJson(Map<String, Object> json) {
    return PoiFloor.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PoiFloor = _$PoiFloorTearOff();

/// @nodoc
mixin _$PoiFloor {
  String get title;
  String get flexOfficeId;

  Map<String, dynamic> toJson();
  $PoiFloorCopyWith<PoiFloor> get copyWith;
}

/// @nodoc
abstract class $PoiFloorCopyWith<$Res> {
  factory $PoiFloorCopyWith(PoiFloor value, $Res Function(PoiFloor) then) =
      _$PoiFloorCopyWithImpl<$Res>;
  $Res call({String title, String flexOfficeId});
}

/// @nodoc
class _$PoiFloorCopyWithImpl<$Res> implements $PoiFloorCopyWith<$Res> {
  _$PoiFloorCopyWithImpl(this._value, this._then);

  final PoiFloor _value;
  // ignore: unused_field
  final $Res Function(PoiFloor) _then;

  @override
  $Res call({
    Object title = freezed,
    Object flexOfficeId = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      flexOfficeId: flexOfficeId == freezed
          ? _value.flexOfficeId
          : flexOfficeId as String,
    ));
  }
}

/// @nodoc
abstract class _$PoiFloorCopyWith<$Res> implements $PoiFloorCopyWith<$Res> {
  factory _$PoiFloorCopyWith(_PoiFloor value, $Res Function(_PoiFloor) then) =
      __$PoiFloorCopyWithImpl<$Res>;
  @override
  $Res call({String title, String flexOfficeId});
}

/// @nodoc
class __$PoiFloorCopyWithImpl<$Res> extends _$PoiFloorCopyWithImpl<$Res>
    implements _$PoiFloorCopyWith<$Res> {
  __$PoiFloorCopyWithImpl(_PoiFloor _value, $Res Function(_PoiFloor) _then)
      : super(_value, (v) => _then(v as _PoiFloor));

  @override
  _PoiFloor get _value => super._value as _PoiFloor;

  @override
  $Res call({
    Object title = freezed,
    Object flexOfficeId = freezed,
  }) {
    return _then(_PoiFloor(
      title: title == freezed ? _value.title : title as String,
      flexOfficeId: flexOfficeId == freezed
          ? _value.flexOfficeId
          : flexOfficeId as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_PoiFloor with DiagnosticableTreeMixin implements _PoiFloor {
  const _$_PoiFloor({this.title, this.flexOfficeId});

  factory _$_PoiFloor.fromJson(Map<String, dynamic> json) =>
      _$_$_PoiFloorFromJson(json);

  @override
  final String title;
  @override
  final String flexOfficeId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PoiFloor(title: $title, flexOfficeId: $flexOfficeId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PoiFloor'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('flexOfficeId', flexOfficeId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PoiFloor &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.flexOfficeId, flexOfficeId) ||
                const DeepCollectionEquality()
                    .equals(other.flexOfficeId, flexOfficeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(flexOfficeId);

  @override
  _$PoiFloorCopyWith<_PoiFloor> get copyWith =>
      __$PoiFloorCopyWithImpl<_PoiFloor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PoiFloorToJson(this);
  }
}

abstract class _PoiFloor implements PoiFloor {
  const factory _PoiFloor({String title, String flexOfficeId}) = _$_PoiFloor;

  factory _PoiFloor.fromJson(Map<String, dynamic> json) = _$_PoiFloor.fromJson;

  @override
  String get title;
  @override
  String get flexOfficeId;
  @override
  _$PoiFloorCopyWith<_PoiFloor> get copyWith;
}

PoiCategory _$PoiCategoryFromJson(Map<String, dynamic> json) {
  return _PoiCategory.fromJson(json);
}

/// @nodoc
class _$PoiCategoryTearOff {
  const _$PoiCategoryTearOff();

// ignore: unused_element
  _PoiCategory call(
      {@required String id,
      @required String title,
      @required String technicalId,
      String zoomLevel,
      GqlImage icon,
      @JsonKey(fromJson: _statusIconsFromJson) List<GqlImage> statusIcon}) {
    return _PoiCategory(
      id: id,
      title: title,
      technicalId: technicalId,
      zoomLevel: zoomLevel,
      icon: icon,
      statusIcon: statusIcon,
    );
  }

// ignore: unused_element
  PoiCategory fromJson(Map<String, Object> json) {
    return PoiCategory.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PoiCategory = _$PoiCategoryTearOff();

/// @nodoc
mixin _$PoiCategory {
  String get id;
  String get title;
  String get technicalId;
  String get zoomLevel;
  GqlImage get icon;
  @JsonKey(fromJson: _statusIconsFromJson)
  List<GqlImage> get statusIcon;

  Map<String, dynamic> toJson();
  $PoiCategoryCopyWith<PoiCategory> get copyWith;
}

/// @nodoc
abstract class $PoiCategoryCopyWith<$Res> {
  factory $PoiCategoryCopyWith(
          PoiCategory value, $Res Function(PoiCategory) then) =
      _$PoiCategoryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String technicalId,
      String zoomLevel,
      GqlImage icon,
      @JsonKey(fromJson: _statusIconsFromJson) List<GqlImage> statusIcon});

  $GqlImageCopyWith<$Res> get icon;
}

/// @nodoc
class _$PoiCategoryCopyWithImpl<$Res> implements $PoiCategoryCopyWith<$Res> {
  _$PoiCategoryCopyWithImpl(this._value, this._then);

  final PoiCategory _value;
  // ignore: unused_field
  final $Res Function(PoiCategory) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object technicalId = freezed,
    Object zoomLevel = freezed,
    Object icon = freezed,
    Object statusIcon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      technicalId:
          technicalId == freezed ? _value.technicalId : technicalId as String,
      zoomLevel: zoomLevel == freezed ? _value.zoomLevel : zoomLevel as String,
      icon: icon == freezed ? _value.icon : icon as GqlImage,
      statusIcon: statusIcon == freezed
          ? _value.statusIcon
          : statusIcon as List<GqlImage>,
    ));
  }

  @override
  $GqlImageCopyWith<$Res> get icon {
    if (_value.icon == null) {
      return null;
    }
    return $GqlImageCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value));
    });
  }
}

/// @nodoc
abstract class _$PoiCategoryCopyWith<$Res>
    implements $PoiCategoryCopyWith<$Res> {
  factory _$PoiCategoryCopyWith(
          _PoiCategory value, $Res Function(_PoiCategory) then) =
      __$PoiCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String technicalId,
      String zoomLevel,
      GqlImage icon,
      @JsonKey(fromJson: _statusIconsFromJson) List<GqlImage> statusIcon});

  @override
  $GqlImageCopyWith<$Res> get icon;
}

/// @nodoc
class __$PoiCategoryCopyWithImpl<$Res> extends _$PoiCategoryCopyWithImpl<$Res>
    implements _$PoiCategoryCopyWith<$Res> {
  __$PoiCategoryCopyWithImpl(
      _PoiCategory _value, $Res Function(_PoiCategory) _then)
      : super(_value, (v) => _then(v as _PoiCategory));

  @override
  _PoiCategory get _value => super._value as _PoiCategory;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object technicalId = freezed,
    Object zoomLevel = freezed,
    Object icon = freezed,
    Object statusIcon = freezed,
  }) {
    return _then(_PoiCategory(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      technicalId:
          technicalId == freezed ? _value.technicalId : technicalId as String,
      zoomLevel: zoomLevel == freezed ? _value.zoomLevel : zoomLevel as String,
      icon: icon == freezed ? _value.icon : icon as GqlImage,
      statusIcon: statusIcon == freezed
          ? _value.statusIcon
          : statusIcon as List<GqlImage>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_PoiCategory with DiagnosticableTreeMixin implements _PoiCategory {
  const _$_PoiCategory(
      {@required this.id,
      @required this.title,
      @required this.technicalId,
      this.zoomLevel,
      this.icon,
      @JsonKey(fromJson: _statusIconsFromJson) this.statusIcon})
      : assert(id != null),
        assert(title != null),
        assert(technicalId != null);

  factory _$_PoiCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_PoiCategoryFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String technicalId;
  @override
  final String zoomLevel;
  @override
  final GqlImage icon;
  @override
  @JsonKey(fromJson: _statusIconsFromJson)
  final List<GqlImage> statusIcon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PoiCategory(id: $id, title: $title, technicalId: $technicalId, zoomLevel: $zoomLevel, icon: $icon, statusIcon: $statusIcon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PoiCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('technicalId', technicalId))
      ..add(DiagnosticsProperty('zoomLevel', zoomLevel))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('statusIcon', statusIcon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PoiCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.technicalId, technicalId) ||
                const DeepCollectionEquality()
                    .equals(other.technicalId, technicalId)) &&
            (identical(other.zoomLevel, zoomLevel) ||
                const DeepCollectionEquality()
                    .equals(other.zoomLevel, zoomLevel)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.statusIcon, statusIcon) ||
                const DeepCollectionEquality()
                    .equals(other.statusIcon, statusIcon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(technicalId) ^
      const DeepCollectionEquality().hash(zoomLevel) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(statusIcon);

  @override
  _$PoiCategoryCopyWith<_PoiCategory> get copyWith =>
      __$PoiCategoryCopyWithImpl<_PoiCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PoiCategoryToJson(this);
  }
}

abstract class _PoiCategory implements PoiCategory {
  const factory _PoiCategory(
          {@required String id,
          @required String title,
          @required String technicalId,
          String zoomLevel,
          GqlImage icon,
          @JsonKey(fromJson: _statusIconsFromJson) List<GqlImage> statusIcon}) =
      _$_PoiCategory;

  factory _PoiCategory.fromJson(Map<String, dynamic> json) =
      _$_PoiCategory.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get technicalId;
  @override
  String get zoomLevel;
  @override
  GqlImage get icon;
  @override
  @JsonKey(fromJson: _statusIconsFromJson)
  List<GqlImage> get statusIcon;
  @override
  _$PoiCategoryCopyWith<_PoiCategory> get copyWith;
}

Poi _$PoiFromJson(Map<String, dynamic> json) {
  return _Poi.fromJson(json);
}

/// @nodoc
class _$PoiTearOff {
  const _$PoiTearOff();

// ignore: unused_element
  _Poi call(
      {@required String id,
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
      @JsonKey(fromJson: _poiFloorFromJson) PoiFloor floor}) {
    return _Poi(
      id: id,
      location: location,
      roomId: roomId,
      roomStatus: roomStatus,
      title: title,
      description: description,
      shortDescription: shortDescription,
      latitude: latitude,
      longitude: longitude,
      categories: categories,
      building: building,
      floor: floor,
    );
  }

// ignore: unused_element
  Poi fromJson(Map<String, Object> json) {
    return Poi.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Poi = _$PoiTearOff();

/// @nodoc
mixin _$Poi {
  String get id;
  String get location;
  String get roomId;
  RoomStatus get roomStatus;
  String get title;
  String get description;
  String get shortDescription;
  @JsonKey(fromJson: _coordFromJson)
  double get latitude;
  @JsonKey(fromJson: _coordFromJson)
  double get longitude;
  @JsonKey(fromJson: _poiCategoriesFromJson)
  List<PoiCategory> get categories;
  @JsonKey(fromJson: _poiBuildingFromJson)
  PoiBuilding get building;
  @JsonKey(fromJson: _poiFloorFromJson)
  PoiFloor get floor;

  Map<String, dynamic> toJson();
  $PoiCopyWith<Poi> get copyWith;
}

/// @nodoc
abstract class $PoiCopyWith<$Res> {
  factory $PoiCopyWith(Poi value, $Res Function(Poi) then) =
      _$PoiCopyWithImpl<$Res>;
  $Res call(
      {String id,
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
      @JsonKey(fromJson: _poiFloorFromJson) PoiFloor floor});

  $PoiBuildingCopyWith<$Res> get building;
  $PoiFloorCopyWith<$Res> get floor;
}

/// @nodoc
class _$PoiCopyWithImpl<$Res> implements $PoiCopyWith<$Res> {
  _$PoiCopyWithImpl(this._value, this._then);

  final Poi _value;
  // ignore: unused_field
  final $Res Function(Poi) _then;

  @override
  $Res call({
    Object id = freezed,
    Object location = freezed,
    Object roomId = freezed,
    Object roomStatus = freezed,
    Object title = freezed,
    Object description = freezed,
    Object shortDescription = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object categories = freezed,
    Object building = freezed,
    Object floor = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      location: location == freezed ? _value.location : location as String,
      roomId: roomId == freezed ? _value.roomId : roomId as String,
      roomStatus:
          roomStatus == freezed ? _value.roomStatus : roomStatus as RoomStatus,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      categories: categories == freezed
          ? _value.categories
          : categories as List<PoiCategory>,
      building: building == freezed ? _value.building : building as PoiBuilding,
      floor: floor == freezed ? _value.floor : floor as PoiFloor,
    ));
  }

  @override
  $PoiBuildingCopyWith<$Res> get building {
    if (_value.building == null) {
      return null;
    }
    return $PoiBuildingCopyWith<$Res>(_value.building, (value) {
      return _then(_value.copyWith(building: value));
    });
  }

  @override
  $PoiFloorCopyWith<$Res> get floor {
    if (_value.floor == null) {
      return null;
    }
    return $PoiFloorCopyWith<$Res>(_value.floor, (value) {
      return _then(_value.copyWith(floor: value));
    });
  }
}

/// @nodoc
abstract class _$PoiCopyWith<$Res> implements $PoiCopyWith<$Res> {
  factory _$PoiCopyWith(_Poi value, $Res Function(_Poi) then) =
      __$PoiCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
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
      @JsonKey(fromJson: _poiFloorFromJson) PoiFloor floor});

  @override
  $PoiBuildingCopyWith<$Res> get building;
  @override
  $PoiFloorCopyWith<$Res> get floor;
}

/// @nodoc
class __$PoiCopyWithImpl<$Res> extends _$PoiCopyWithImpl<$Res>
    implements _$PoiCopyWith<$Res> {
  __$PoiCopyWithImpl(_Poi _value, $Res Function(_Poi) _then)
      : super(_value, (v) => _then(v as _Poi));

  @override
  _Poi get _value => super._value as _Poi;

  @override
  $Res call({
    Object id = freezed,
    Object location = freezed,
    Object roomId = freezed,
    Object roomStatus = freezed,
    Object title = freezed,
    Object description = freezed,
    Object shortDescription = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object categories = freezed,
    Object building = freezed,
    Object floor = freezed,
  }) {
    return _then(_Poi(
      id: id == freezed ? _value.id : id as String,
      location: location == freezed ? _value.location : location as String,
      roomId: roomId == freezed ? _value.roomId : roomId as String,
      roomStatus:
          roomStatus == freezed ? _value.roomStatus : roomStatus as RoomStatus,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      categories: categories == freezed
          ? _value.categories
          : categories as List<PoiCategory>,
      building: building == freezed ? _value.building : building as PoiBuilding,
      floor: floor == freezed ? _value.floor : floor as PoiFloor,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Poi with DiagnosticableTreeMixin implements _Poi {
  const _$_Poi(
      {@required this.id,
      this.location,
      this.roomId,
      this.roomStatus,
      this.title,
      this.description,
      this.shortDescription,
      @JsonKey(fromJson: _coordFromJson) this.latitude,
      @JsonKey(fromJson: _coordFromJson) this.longitude,
      @JsonKey(fromJson: _poiCategoriesFromJson) this.categories,
      @JsonKey(fromJson: _poiBuildingFromJson) this.building,
      @JsonKey(fromJson: _poiFloorFromJson) this.floor})
      : assert(id != null);

  factory _$_Poi.fromJson(Map<String, dynamic> json) => _$_$_PoiFromJson(json);

  @override
  final String id;
  @override
  final String location;
  @override
  final String roomId;
  @override
  final RoomStatus roomStatus;
  @override
  final String title;
  @override
  final String description;
  @override
  final String shortDescription;
  @override
  @JsonKey(fromJson: _coordFromJson)
  final double latitude;
  @override
  @JsonKey(fromJson: _coordFromJson)
  final double longitude;
  @override
  @JsonKey(fromJson: _poiCategoriesFromJson)
  final List<PoiCategory> categories;
  @override
  @JsonKey(fromJson: _poiBuildingFromJson)
  final PoiBuilding building;
  @override
  @JsonKey(fromJson: _poiFloorFromJson)
  final PoiFloor floor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Poi(id: $id, location: $location, roomId: $roomId, roomStatus: $roomStatus, title: $title, description: $description, shortDescription: $shortDescription, latitude: $latitude, longitude: $longitude, categories: $categories, building: $building, floor: $floor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Poi'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('roomId', roomId))
      ..add(DiagnosticsProperty('roomStatus', roomStatus))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('building', building))
      ..add(DiagnosticsProperty('floor', floor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Poi &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)) &&
            (identical(other.roomStatus, roomStatus) ||
                const DeepCollectionEquality()
                    .equals(other.roomStatus, roomStatus)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.shortDescription, shortDescription) ||
                const DeepCollectionEquality()
                    .equals(other.shortDescription, shortDescription)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.building, building) ||
                const DeepCollectionEquality()
                    .equals(other.building, building)) &&
            (identical(other.floor, floor) ||
                const DeepCollectionEquality().equals(other.floor, floor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(roomId) ^
      const DeepCollectionEquality().hash(roomStatus) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(shortDescription) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(building) ^
      const DeepCollectionEquality().hash(floor);

  @override
  _$PoiCopyWith<_Poi> get copyWith =>
      __$PoiCopyWithImpl<_Poi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PoiToJson(this);
  }
}

abstract class _Poi implements Poi {
  const factory _Poi(
      {@required String id,
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
      @JsonKey(fromJson: _poiFloorFromJson) PoiFloor floor}) = _$_Poi;

  factory _Poi.fromJson(Map<String, dynamic> json) = _$_Poi.fromJson;

  @override
  String get id;
  @override
  String get location;
  @override
  String get roomId;
  @override
  RoomStatus get roomStatus;
  @override
  String get title;
  @override
  String get description;
  @override
  String get shortDescription;
  @override
  @JsonKey(fromJson: _coordFromJson)
  double get latitude;
  @override
  @JsonKey(fromJson: _coordFromJson)
  double get longitude;
  @override
  @JsonKey(fromJson: _poiCategoriesFromJson)
  List<PoiCategory> get categories;
  @override
  @JsonKey(fromJson: _poiBuildingFromJson)
  PoiBuilding get building;
  @override
  @JsonKey(fromJson: _poiFloorFromJson)
  PoiFloor get floor;
  @override
  _$PoiCopyWith<_Poi> get copyWith;
}

DirectoryPoi _$DirectoryPoiFromJson(Map<String, dynamic> json) {
  return _DirectoryPoi.fromJson(json);
}

/// @nodoc
class _$DirectoryPoiTearOff {
  const _$DirectoryPoiTearOff();

// ignore: unused_element
  _DirectoryPoi call({@required String id, @required String title}) {
    return _DirectoryPoi(
      id: id,
      title: title,
    );
  }

// ignore: unused_element
  DirectoryPoi fromJson(Map<String, Object> json) {
    return DirectoryPoi.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DirectoryPoi = _$DirectoryPoiTearOff();

/// @nodoc
mixin _$DirectoryPoi {
  String get id;
  String get title;

  Map<String, dynamic> toJson();
  $DirectoryPoiCopyWith<DirectoryPoi> get copyWith;
}

/// @nodoc
abstract class $DirectoryPoiCopyWith<$Res> {
  factory $DirectoryPoiCopyWith(
          DirectoryPoi value, $Res Function(DirectoryPoi) then) =
      _$DirectoryPoiCopyWithImpl<$Res>;
  $Res call({String id, String title});
}

/// @nodoc
class _$DirectoryPoiCopyWithImpl<$Res> implements $DirectoryPoiCopyWith<$Res> {
  _$DirectoryPoiCopyWithImpl(this._value, this._then);

  final DirectoryPoi _value;
  // ignore: unused_field
  final $Res Function(DirectoryPoi) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class _$DirectoryPoiCopyWith<$Res>
    implements $DirectoryPoiCopyWith<$Res> {
  factory _$DirectoryPoiCopyWith(
          _DirectoryPoi value, $Res Function(_DirectoryPoi) then) =
      __$DirectoryPoiCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title});
}

/// @nodoc
class __$DirectoryPoiCopyWithImpl<$Res> extends _$DirectoryPoiCopyWithImpl<$Res>
    implements _$DirectoryPoiCopyWith<$Res> {
  __$DirectoryPoiCopyWithImpl(
      _DirectoryPoi _value, $Res Function(_DirectoryPoi) _then)
      : super(_value, (v) => _then(v as _DirectoryPoi));

  @override
  _DirectoryPoi get _value => super._value as _DirectoryPoi;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
  }) {
    return _then(_DirectoryPoi(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DirectoryPoi with DiagnosticableTreeMixin implements _DirectoryPoi {
  const _$_DirectoryPoi({@required this.id, @required this.title})
      : assert(id != null),
        assert(title != null);

  factory _$_DirectoryPoi.fromJson(Map<String, dynamic> json) =>
      _$_$_DirectoryPoiFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DirectoryPoi(id: $id, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DirectoryPoi'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DirectoryPoi &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$DirectoryPoiCopyWith<_DirectoryPoi> get copyWith =>
      __$DirectoryPoiCopyWithImpl<_DirectoryPoi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DirectoryPoiToJson(this);
  }
}

abstract class _DirectoryPoi implements DirectoryPoi {
  const factory _DirectoryPoi({@required String id, @required String title}) =
      _$_DirectoryPoi;

  factory _DirectoryPoi.fromJson(Map<String, dynamic> json) =
      _$_DirectoryPoi.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  _$DirectoryPoiCopyWith<_DirectoryPoi> get copyWith;
}

GqlImage _$GqlImageFromJson(Map<String, dynamic> json) {
  return _GqlImage.fromJson(json);
}

/// @nodoc
class _$GqlImageTearOff {
  const _$GqlImageTearOff();

// ignore: unused_element
  _GqlImage call({String title, @required String contentUrl}) {
    return _GqlImage(
      title: title,
      contentUrl: contentUrl,
    );
  }

// ignore: unused_element
  GqlImage fromJson(Map<String, Object> json) {
    return GqlImage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GqlImage = _$GqlImageTearOff();

/// @nodoc
mixin _$GqlImage {
  String get title;
  String get contentUrl;

  Map<String, dynamic> toJson();
  $GqlImageCopyWith<GqlImage> get copyWith;
}

/// @nodoc
abstract class $GqlImageCopyWith<$Res> {
  factory $GqlImageCopyWith(GqlImage value, $Res Function(GqlImage) then) =
      _$GqlImageCopyWithImpl<$Res>;
  $Res call({String title, String contentUrl});
}

/// @nodoc
class _$GqlImageCopyWithImpl<$Res> implements $GqlImageCopyWith<$Res> {
  _$GqlImageCopyWithImpl(this._value, this._then);

  final GqlImage _value;
  // ignore: unused_field
  final $Res Function(GqlImage) _then;

  @override
  $Res call({
    Object title = freezed,
    Object contentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      contentUrl:
          contentUrl == freezed ? _value.contentUrl : contentUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$GqlImageCopyWith<$Res> implements $GqlImageCopyWith<$Res> {
  factory _$GqlImageCopyWith(_GqlImage value, $Res Function(_GqlImage) then) =
      __$GqlImageCopyWithImpl<$Res>;
  @override
  $Res call({String title, String contentUrl});
}

/// @nodoc
class __$GqlImageCopyWithImpl<$Res> extends _$GqlImageCopyWithImpl<$Res>
    implements _$GqlImageCopyWith<$Res> {
  __$GqlImageCopyWithImpl(_GqlImage _value, $Res Function(_GqlImage) _then)
      : super(_value, (v) => _then(v as _GqlImage));

  @override
  _GqlImage get _value => super._value as _GqlImage;

  @override
  $Res call({
    Object title = freezed,
    Object contentUrl = freezed,
  }) {
    return _then(_GqlImage(
      title: title == freezed ? _value.title : title as String,
      contentUrl:
          contentUrl == freezed ? _value.contentUrl : contentUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GqlImage with DiagnosticableTreeMixin implements _GqlImage {
  const _$_GqlImage({this.title, @required this.contentUrl})
      : assert(contentUrl != null);

  factory _$_GqlImage.fromJson(Map<String, dynamic> json) =>
      _$_$_GqlImageFromJson(json);

  @override
  final String title;
  @override
  final String contentUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GqlImage(title: $title, contentUrl: $contentUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GqlImage'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('contentUrl', contentUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GqlImage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.contentUrl, contentUrl) ||
                const DeepCollectionEquality()
                    .equals(other.contentUrl, contentUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(contentUrl);

  @override
  _$GqlImageCopyWith<_GqlImage> get copyWith =>
      __$GqlImageCopyWithImpl<_GqlImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GqlImageToJson(this);
  }
}

abstract class _GqlImage implements GqlImage {
  const factory _GqlImage({String title, @required String contentUrl}) =
      _$_GqlImage;

  factory _GqlImage.fromJson(Map<String, dynamic> json) = _$_GqlImage.fromJson;

  @override
  String get title;
  @override
  String get contentUrl;
  @override
  _$GqlImageCopyWith<_GqlImage> get copyWith;
}
