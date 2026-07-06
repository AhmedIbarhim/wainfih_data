// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgentProviderModel {

 String? get serviceProviderNameAr; String? get serviceProviderNameEn; String get mobileNumber1; String? get mobileNumber2; String? get contactPersonName; String? get notes; Map<String, dynamic> get image; double get lat; double get lng; int? get districtId; int? get typeId; List<int>? get categoryIds;
/// Create a copy of AgentProviderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentProviderModelCopyWith<AgentProviderModel> get copyWith => _$AgentProviderModelCopyWithImpl<AgentProviderModel>(this as AgentProviderModel, _$identity);

  /// Serializes this AgentProviderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentProviderModel&&(identical(other.serviceProviderNameAr, serviceProviderNameAr) || other.serviceProviderNameAr == serviceProviderNameAr)&&(identical(other.serviceProviderNameEn, serviceProviderNameEn) || other.serviceProviderNameEn == serviceProviderNameEn)&&(identical(other.mobileNumber1, mobileNumber1) || other.mobileNumber1 == mobileNumber1)&&(identical(other.mobileNumber2, mobileNumber2) || other.mobileNumber2 == mobileNumber2)&&(identical(other.contactPersonName, contactPersonName) || other.contactPersonName == contactPersonName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceProviderNameAr,serviceProviderNameEn,mobileNumber1,mobileNumber2,contactPersonName,notes,const DeepCollectionEquality().hash(image),lat,lng,districtId,typeId,const DeepCollectionEquality().hash(categoryIds));

@override
String toString() {
  return 'AgentProviderModel(serviceProviderNameAr: $serviceProviderNameAr, serviceProviderNameEn: $serviceProviderNameEn, mobileNumber1: $mobileNumber1, mobileNumber2: $mobileNumber2, contactPersonName: $contactPersonName, notes: $notes, image: $image, lat: $lat, lng: $lng, districtId: $districtId, typeId: $typeId, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class $AgentProviderModelCopyWith<$Res>  {
  factory $AgentProviderModelCopyWith(AgentProviderModel value, $Res Function(AgentProviderModel) _then) = _$AgentProviderModelCopyWithImpl;
@useResult
$Res call({
 String? serviceProviderNameAr, String? serviceProviderNameEn, String mobileNumber1, String? mobileNumber2, String? contactPersonName, String? notes, Map<String, dynamic> image, double lat, double lng, int? districtId, int? typeId, List<int>? categoryIds
});




}
/// @nodoc
class _$AgentProviderModelCopyWithImpl<$Res>
    implements $AgentProviderModelCopyWith<$Res> {
  _$AgentProviderModelCopyWithImpl(this._self, this._then);

  final AgentProviderModel _self;
  final $Res Function(AgentProviderModel) _then;

/// Create a copy of AgentProviderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceProviderNameAr = freezed,Object? serviceProviderNameEn = freezed,Object? mobileNumber1 = null,Object? mobileNumber2 = freezed,Object? contactPersonName = freezed,Object? notes = freezed,Object? image = null,Object? lat = null,Object? lng = null,Object? districtId = freezed,Object? typeId = freezed,Object? categoryIds = freezed,}) {
  return _then(_self.copyWith(
serviceProviderNameAr: freezed == serviceProviderNameAr ? _self.serviceProviderNameAr : serviceProviderNameAr // ignore: cast_nullable_to_non_nullable
as String?,serviceProviderNameEn: freezed == serviceProviderNameEn ? _self.serviceProviderNameEn : serviceProviderNameEn // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber1: null == mobileNumber1 ? _self.mobileNumber1 : mobileNumber1 // ignore: cast_nullable_to_non_nullable
as String,mobileNumber2: freezed == mobileNumber2 ? _self.mobileNumber2 : mobileNumber2 // ignore: cast_nullable_to_non_nullable
as String?,contactPersonName: freezed == contactPersonName ? _self.contactPersonName : contactPersonName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,categoryIds: freezed == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentProviderModel].
extension AgentProviderModelPatterns on AgentProviderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentProviderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentProviderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentProviderModel value)  $default,){
final _that = this;
switch (_that) {
case _AgentProviderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentProviderModel value)?  $default,){
final _that = this;
switch (_that) {
case _AgentProviderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serviceProviderNameAr,  String? serviceProviderNameEn,  String mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic> image,  double lat,  double lng,  int? districtId,  int? typeId,  List<int>? categoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentProviderModel() when $default != null:
return $default(_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.districtId,_that.typeId,_that.categoryIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serviceProviderNameAr,  String? serviceProviderNameEn,  String mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic> image,  double lat,  double lng,  int? districtId,  int? typeId,  List<int>? categoryIds)  $default,) {final _that = this;
switch (_that) {
case _AgentProviderModel():
return $default(_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.districtId,_that.typeId,_that.categoryIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serviceProviderNameAr,  String? serviceProviderNameEn,  String mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic> image,  double lat,  double lng,  int? districtId,  int? typeId,  List<int>? categoryIds)?  $default,) {final _that = this;
switch (_that) {
case _AgentProviderModel() when $default != null:
return $default(_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.districtId,_that.typeId,_that.categoryIds);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AgentProviderModel implements AgentProviderModel {
  const _AgentProviderModel({this.serviceProviderNameAr, this.serviceProviderNameEn, required this.mobileNumber1, this.mobileNumber2, this.contactPersonName, this.notes, required final  Map<String, dynamic> image, required this.lat, required this.lng, this.districtId, this.typeId, final  List<int>? categoryIds}): _image = image,_categoryIds = categoryIds;
  factory _AgentProviderModel.fromJson(Map<String, dynamic> json) => _$AgentProviderModelFromJson(json);

@override final  String? serviceProviderNameAr;
@override final  String? serviceProviderNameEn;
@override final  String mobileNumber1;
@override final  String? mobileNumber2;
@override final  String? contactPersonName;
@override final  String? notes;
 final  Map<String, dynamic> _image;
@override Map<String, dynamic> get image {
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_image);
}

@override final  double lat;
@override final  double lng;
@override final  int? districtId;
@override final  int? typeId;
 final  List<int>? _categoryIds;
@override List<int>? get categoryIds {
  final value = _categoryIds;
  if (value == null) return null;
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AgentProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentProviderModelCopyWith<_AgentProviderModel> get copyWith => __$AgentProviderModelCopyWithImpl<_AgentProviderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentProviderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentProviderModel&&(identical(other.serviceProviderNameAr, serviceProviderNameAr) || other.serviceProviderNameAr == serviceProviderNameAr)&&(identical(other.serviceProviderNameEn, serviceProviderNameEn) || other.serviceProviderNameEn == serviceProviderNameEn)&&(identical(other.mobileNumber1, mobileNumber1) || other.mobileNumber1 == mobileNumber1)&&(identical(other.mobileNumber2, mobileNumber2) || other.mobileNumber2 == mobileNumber2)&&(identical(other.contactPersonName, contactPersonName) || other.contactPersonName == contactPersonName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._image, _image)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceProviderNameAr,serviceProviderNameEn,mobileNumber1,mobileNumber2,contactPersonName,notes,const DeepCollectionEquality().hash(_image),lat,lng,districtId,typeId,const DeepCollectionEquality().hash(_categoryIds));

@override
String toString() {
  return 'AgentProviderModel(serviceProviderNameAr: $serviceProviderNameAr, serviceProviderNameEn: $serviceProviderNameEn, mobileNumber1: $mobileNumber1, mobileNumber2: $mobileNumber2, contactPersonName: $contactPersonName, notes: $notes, image: $image, lat: $lat, lng: $lng, districtId: $districtId, typeId: $typeId, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class _$AgentProviderModelCopyWith<$Res> implements $AgentProviderModelCopyWith<$Res> {
  factory _$AgentProviderModelCopyWith(_AgentProviderModel value, $Res Function(_AgentProviderModel) _then) = __$AgentProviderModelCopyWithImpl;
@override @useResult
$Res call({
 String? serviceProviderNameAr, String? serviceProviderNameEn, String mobileNumber1, String? mobileNumber2, String? contactPersonName, String? notes, Map<String, dynamic> image, double lat, double lng, int? districtId, int? typeId, List<int>? categoryIds
});




}
/// @nodoc
class __$AgentProviderModelCopyWithImpl<$Res>
    implements _$AgentProviderModelCopyWith<$Res> {
  __$AgentProviderModelCopyWithImpl(this._self, this._then);

  final _AgentProviderModel _self;
  final $Res Function(_AgentProviderModel) _then;

/// Create a copy of AgentProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceProviderNameAr = freezed,Object? serviceProviderNameEn = freezed,Object? mobileNumber1 = null,Object? mobileNumber2 = freezed,Object? contactPersonName = freezed,Object? notes = freezed,Object? image = null,Object? lat = null,Object? lng = null,Object? districtId = freezed,Object? typeId = freezed,Object? categoryIds = freezed,}) {
  return _then(_AgentProviderModel(
serviceProviderNameAr: freezed == serviceProviderNameAr ? _self.serviceProviderNameAr : serviceProviderNameAr // ignore: cast_nullable_to_non_nullable
as String?,serviceProviderNameEn: freezed == serviceProviderNameEn ? _self.serviceProviderNameEn : serviceProviderNameEn // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber1: null == mobileNumber1 ? _self.mobileNumber1 : mobileNumber1 // ignore: cast_nullable_to_non_nullable
as String,mobileNumber2: freezed == mobileNumber2 ? _self.mobileNumber2 : mobileNumber2 // ignore: cast_nullable_to_non_nullable
as String?,contactPersonName: freezed == contactPersonName ? _self.contactPersonName : contactPersonName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,categoryIds: freezed == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
