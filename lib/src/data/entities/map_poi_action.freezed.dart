// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'map_poi_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MapPoiActionTearOff {
  const _$MapPoiActionTearOff();

// ignore: unused_element
  _MapPoiAction call({String poiId, MapAction action}) {
    return _MapPoiAction(
      poiId: poiId,
      action: action,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MapPoiAction = _$MapPoiActionTearOff();

/// @nodoc
mixin _$MapPoiAction {
  String get poiId;
  MapAction get action;

  $MapPoiActionCopyWith<MapPoiAction> get copyWith;
}

/// @nodoc
abstract class $MapPoiActionCopyWith<$Res> {
  factory $MapPoiActionCopyWith(
          MapPoiAction value, $Res Function(MapPoiAction) then) =
      _$MapPoiActionCopyWithImpl<$Res>;
  $Res call({String poiId, MapAction action});
}

/// @nodoc
class _$MapPoiActionCopyWithImpl<$Res> implements $MapPoiActionCopyWith<$Res> {
  _$MapPoiActionCopyWithImpl(this._value, this._then);

  final MapPoiAction _value;
  // ignore: unused_field
  final $Res Function(MapPoiAction) _then;

  @override
  $Res call({
    Object poiId = freezed,
    Object action = freezed,
  }) {
    return _then(_value.copyWith(
      poiId: poiId == freezed ? _value.poiId : poiId as String,
      action: action == freezed ? _value.action : action as MapAction,
    ));
  }
}

/// @nodoc
abstract class _$MapPoiActionCopyWith<$Res>
    implements $MapPoiActionCopyWith<$Res> {
  factory _$MapPoiActionCopyWith(
          _MapPoiAction value, $Res Function(_MapPoiAction) then) =
      __$MapPoiActionCopyWithImpl<$Res>;
  @override
  $Res call({String poiId, MapAction action});
}

/// @nodoc
class __$MapPoiActionCopyWithImpl<$Res> extends _$MapPoiActionCopyWithImpl<$Res>
    implements _$MapPoiActionCopyWith<$Res> {
  __$MapPoiActionCopyWithImpl(
      _MapPoiAction _value, $Res Function(_MapPoiAction) _then)
      : super(_value, (v) => _then(v as _MapPoiAction));

  @override
  _MapPoiAction get _value => super._value as _MapPoiAction;

  @override
  $Res call({
    Object poiId = freezed,
    Object action = freezed,
  }) {
    return _then(_MapPoiAction(
      poiId: poiId == freezed ? _value.poiId : poiId as String,
      action: action == freezed ? _value.action : action as MapAction,
    ));
  }
}

/// @nodoc
class _$_MapPoiAction implements _MapPoiAction {
  const _$_MapPoiAction({this.poiId, this.action});

  @override
  final String poiId;
  @override
  final MapAction action;

  @override
  String toString() {
    return 'MapPoiAction(poiId: $poiId, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MapPoiAction &&
            (identical(other.poiId, poiId) ||
                const DeepCollectionEquality().equals(other.poiId, poiId)) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(poiId) ^
      const DeepCollectionEquality().hash(action);

  @override
  _$MapPoiActionCopyWith<_MapPoiAction> get copyWith =>
      __$MapPoiActionCopyWithImpl<_MapPoiAction>(this, _$identity);
}

abstract class _MapPoiAction implements MapPoiAction {
  const factory _MapPoiAction({String poiId, MapAction action}) =
      _$_MapPoiAction;

  @override
  String get poiId;
  @override
  MapAction get action;
  @override
  _$MapPoiActionCopyWith<_MapPoiAction> get copyWith;
}
