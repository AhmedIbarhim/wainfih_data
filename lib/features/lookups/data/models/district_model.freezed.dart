// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictModel {

 int get id; String get districtNameAr; String get districtNameEn; int get cityId; CityModel? get city;
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<DistrictModel> get copyWith => _$DistrictModelCopyWithImpl<DistrictModel>(this as DistrictModel, _$identity);

  /// Serializes this DistrictModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictModel&&(identical(other.id, id) || other.id == id)&&(identical(other.districtNameAr, districtNameAr) || other.districtNameAr == districtNameAr)&&(identical(other.districtNameEn, districtNameEn) || other.districtNameEn == districtNameEn)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,districtNameAr,districtNameEn,cityId,city);

@override
String toString() {
  return 'DistrictModel(id: $id, districtNameAr: $districtNameAr, districtNameEn: $districtNameEn, cityId: $cityId, city: $city)';
}


}

/// @nodoc
abstract mixin class $DistrictModelCopyWith<$Res>  {
  factory $DistrictModelCopyWith(DistrictModel value, $Res Function(DistrictModel) _then) = _$DistrictModelCopyWithImpl;
@useResult
$Res call({
 int id, String districtNameAr, String districtNameEn, int cityId, CityModel? city
});


$CityModelCopyWith<$Res>? get city;

}
/// @nodoc
class _$DistrictModelCopyWithImpl<$Res>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._self, this._then);

  final DistrictModel _self;
  final $Res Function(DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? districtNameAr = null,Object? districtNameEn = null,Object? cityId = null,Object? city = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,districtNameAr: null == districtNameAr ? _self.districtNameAr : districtNameAr // ignore: cast_nullable_to_non_nullable
as String,districtNameEn: null == districtNameEn ? _self.districtNameEn : districtNameEn // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityModel?,
  ));
}
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [DistrictModel].
extension DistrictModelPatterns on DistrictModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistrictModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistrictModel value)  $default,){
final _that = this;
switch (_that) {
case _DistrictModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistrictModel value)?  $default,){
final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String districtNameAr,  String districtNameEn,  int cityId,  CityModel? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.id,_that.districtNameAr,_that.districtNameEn,_that.cityId,_that.city);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String districtNameAr,  String districtNameEn,  int cityId,  CityModel? city)  $default,) {final _that = this;
switch (_that) {
case _DistrictModel():
return $default(_that.id,_that.districtNameAr,_that.districtNameEn,_that.cityId,_that.city);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String districtNameAr,  String districtNameEn,  int cityId,  CityModel? city)?  $default,) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.id,_that.districtNameAr,_that.districtNameEn,_that.cityId,_that.city);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DistrictModel implements DistrictModel {
  const _DistrictModel({required this.id, required this.districtNameAr, required this.districtNameEn, required this.cityId, this.city});
  factory _DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);

@override final  int id;
@override final  String districtNameAr;
@override final  String districtNameEn;
@override final  int cityId;
@override final  CityModel? city;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistrictModelCopyWith<_DistrictModel> get copyWith => __$DistrictModelCopyWithImpl<_DistrictModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistrictModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictModel&&(identical(other.id, id) || other.id == id)&&(identical(other.districtNameAr, districtNameAr) || other.districtNameAr == districtNameAr)&&(identical(other.districtNameEn, districtNameEn) || other.districtNameEn == districtNameEn)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,districtNameAr,districtNameEn,cityId,city);

@override
String toString() {
  return 'DistrictModel(id: $id, districtNameAr: $districtNameAr, districtNameEn: $districtNameEn, cityId: $cityId, city: $city)';
}


}

/// @nodoc
abstract mixin class _$DistrictModelCopyWith<$Res> implements $DistrictModelCopyWith<$Res> {
  factory _$DistrictModelCopyWith(_DistrictModel value, $Res Function(_DistrictModel) _then) = __$DistrictModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String districtNameAr, String districtNameEn, int cityId, CityModel? city
});


@override $CityModelCopyWith<$Res>? get city;

}
/// @nodoc
class __$DistrictModelCopyWithImpl<$Res>
    implements _$DistrictModelCopyWith<$Res> {
  __$DistrictModelCopyWithImpl(this._self, this._then);

  final _DistrictModel _self;
  final $Res Function(_DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? districtNameAr = null,Object? districtNameEn = null,Object? cityId = null,Object? city = freezed,}) {
  return _then(_DistrictModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,districtNameAr: null == districtNameAr ? _self.districtNameAr : districtNameAr // ignore: cast_nullable_to_non_nullable
as String,districtNameEn: null == districtNameEn ? _self.districtNameEn : districtNameEn // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityModel?,
  ));
}

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
