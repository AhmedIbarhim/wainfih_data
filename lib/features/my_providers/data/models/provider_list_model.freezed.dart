// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProviderListModel {

 int get id; String? get serviceProviderNameAr; String? get serviceProviderNameEn; String? get mobileNumber1; String? get mobileNumber2; String? get contactPersonName; String? get notes; Map<String, dynamic>? get image; double? get lat; double? get lng; String get state; String get status; DateTime? get createdAt; SpTypeModel? get type; DistrictModel? get district; bool? get featured; bool? get bookable; double? get distance;
/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderListModelCopyWith<ProviderListModel> get copyWith => _$ProviderListModelCopyWithImpl<ProviderListModel>(this as ProviderListModel, _$identity);

  /// Serializes this ProviderListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceProviderNameAr, serviceProviderNameAr) || other.serviceProviderNameAr == serviceProviderNameAr)&&(identical(other.serviceProviderNameEn, serviceProviderNameEn) || other.serviceProviderNameEn == serviceProviderNameEn)&&(identical(other.mobileNumber1, mobileNumber1) || other.mobileNumber1 == mobileNumber1)&&(identical(other.mobileNumber2, mobileNumber2) || other.mobileNumber2 == mobileNumber2)&&(identical(other.contactPersonName, contactPersonName) || other.contactPersonName == contactPersonName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.state, state) || other.state == state)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.district, district) || other.district == district)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.bookable, bookable) || other.bookable == bookable)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceProviderNameAr,serviceProviderNameEn,mobileNumber1,mobileNumber2,contactPersonName,notes,const DeepCollectionEquality().hash(image),lat,lng,state,status,createdAt,type,district,featured,bookable,distance);

@override
String toString() {
  return 'ProviderListModel(id: $id, serviceProviderNameAr: $serviceProviderNameAr, serviceProviderNameEn: $serviceProviderNameEn, mobileNumber1: $mobileNumber1, mobileNumber2: $mobileNumber2, contactPersonName: $contactPersonName, notes: $notes, image: $image, lat: $lat, lng: $lng, state: $state, status: $status, createdAt: $createdAt, type: $type, district: $district, featured: $featured, bookable: $bookable, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $ProviderListModelCopyWith<$Res>  {
  factory $ProviderListModelCopyWith(ProviderListModel value, $Res Function(ProviderListModel) _then) = _$ProviderListModelCopyWithImpl;
@useResult
$Res call({
 int id, String? serviceProviderNameAr, String? serviceProviderNameEn, String? mobileNumber1, String? mobileNumber2, String? contactPersonName, String? notes, Map<String, dynamic>? image, double? lat, double? lng, String state, String status, DateTime? createdAt, SpTypeModel? type, DistrictModel? district, bool? featured, bool? bookable, double? distance
});


$SpTypeModelCopyWith<$Res>? get type;$DistrictModelCopyWith<$Res>? get district;

}
/// @nodoc
class _$ProviderListModelCopyWithImpl<$Res>
    implements $ProviderListModelCopyWith<$Res> {
  _$ProviderListModelCopyWithImpl(this._self, this._then);

  final ProviderListModel _self;
  final $Res Function(ProviderListModel) _then;

/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceProviderNameAr = freezed,Object? serviceProviderNameEn = freezed,Object? mobileNumber1 = freezed,Object? mobileNumber2 = freezed,Object? contactPersonName = freezed,Object? notes = freezed,Object? image = freezed,Object? lat = freezed,Object? lng = freezed,Object? state = null,Object? status = null,Object? createdAt = freezed,Object? type = freezed,Object? district = freezed,Object? featured = freezed,Object? bookable = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceProviderNameAr: freezed == serviceProviderNameAr ? _self.serviceProviderNameAr : serviceProviderNameAr // ignore: cast_nullable_to_non_nullable
as String?,serviceProviderNameEn: freezed == serviceProviderNameEn ? _self.serviceProviderNameEn : serviceProviderNameEn // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber1: freezed == mobileNumber1 ? _self.mobileNumber1 : mobileNumber1 // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber2: freezed == mobileNumber2 ? _self.mobileNumber2 : mobileNumber2 // ignore: cast_nullable_to_non_nullable
as String?,contactPersonName: freezed == contactPersonName ? _self.contactPersonName : contactPersonName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SpTypeModel?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,featured: freezed == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool?,bookable: freezed == bookable ? _self.bookable : bookable // ignore: cast_nullable_to_non_nullable
as bool?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpTypeModelCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $SpTypeModelCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProviderListModel].
extension ProviderListModelPatterns on ProviderListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderListModel value)  $default,){
final _that = this;
switch (_that) {
case _ProviderListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? serviceProviderNameAr,  String? serviceProviderNameEn,  String? mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic>? image,  double? lat,  double? lng,  String state,  String status,  DateTime? createdAt,  SpTypeModel? type,  DistrictModel? district,  bool? featured,  bool? bookable,  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderListModel() when $default != null:
return $default(_that.id,_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.state,_that.status,_that.createdAt,_that.type,_that.district,_that.featured,_that.bookable,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? serviceProviderNameAr,  String? serviceProviderNameEn,  String? mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic>? image,  double? lat,  double? lng,  String state,  String status,  DateTime? createdAt,  SpTypeModel? type,  DistrictModel? district,  bool? featured,  bool? bookable,  double? distance)  $default,) {final _that = this;
switch (_that) {
case _ProviderListModel():
return $default(_that.id,_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.state,_that.status,_that.createdAt,_that.type,_that.district,_that.featured,_that.bookable,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? serviceProviderNameAr,  String? serviceProviderNameEn,  String? mobileNumber1,  String? mobileNumber2,  String? contactPersonName,  String? notes,  Map<String, dynamic>? image,  double? lat,  double? lng,  String state,  String status,  DateTime? createdAt,  SpTypeModel? type,  DistrictModel? district,  bool? featured,  bool? bookable,  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _ProviderListModel() when $default != null:
return $default(_that.id,_that.serviceProviderNameAr,_that.serviceProviderNameEn,_that.mobileNumber1,_that.mobileNumber2,_that.contactPersonName,_that.notes,_that.image,_that.lat,_that.lng,_that.state,_that.status,_that.createdAt,_that.type,_that.district,_that.featured,_that.bookable,_that.distance);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ProviderListModel implements ProviderListModel {
  const _ProviderListModel({required this.id, this.serviceProviderNameAr, this.serviceProviderNameEn, this.mobileNumber1, this.mobileNumber2, this.contactPersonName, this.notes, final  Map<String, dynamic>? image, this.lat, this.lng, required this.state, required this.status, this.createdAt, this.type, this.district, this.featured, this.bookable, this.distance}): _image = image;
  factory _ProviderListModel.fromJson(Map<String, dynamic> json) => _$ProviderListModelFromJson(json);

@override final  int id;
@override final  String? serviceProviderNameAr;
@override final  String? serviceProviderNameEn;
@override final  String? mobileNumber1;
@override final  String? mobileNumber2;
@override final  String? contactPersonName;
@override final  String? notes;
 final  Map<String, dynamic>? _image;
@override Map<String, dynamic>? get image {
  final value = _image;
  if (value == null) return null;
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  double? lat;
@override final  double? lng;
@override final  String state;
@override final  String status;
@override final  DateTime? createdAt;
@override final  SpTypeModel? type;
@override final  DistrictModel? district;
@override final  bool? featured;
@override final  bool? bookable;
@override final  double? distance;

/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderListModelCopyWith<_ProviderListModel> get copyWith => __$ProviderListModelCopyWithImpl<_ProviderListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceProviderNameAr, serviceProviderNameAr) || other.serviceProviderNameAr == serviceProviderNameAr)&&(identical(other.serviceProviderNameEn, serviceProviderNameEn) || other.serviceProviderNameEn == serviceProviderNameEn)&&(identical(other.mobileNumber1, mobileNumber1) || other.mobileNumber1 == mobileNumber1)&&(identical(other.mobileNumber2, mobileNumber2) || other.mobileNumber2 == mobileNumber2)&&(identical(other.contactPersonName, contactPersonName) || other.contactPersonName == contactPersonName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._image, _image)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.state, state) || other.state == state)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.district, district) || other.district == district)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.bookable, bookable) || other.bookable == bookable)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceProviderNameAr,serviceProviderNameEn,mobileNumber1,mobileNumber2,contactPersonName,notes,const DeepCollectionEquality().hash(_image),lat,lng,state,status,createdAt,type,district,featured,bookable,distance);

@override
String toString() {
  return 'ProviderListModel(id: $id, serviceProviderNameAr: $serviceProviderNameAr, serviceProviderNameEn: $serviceProviderNameEn, mobileNumber1: $mobileNumber1, mobileNumber2: $mobileNumber2, contactPersonName: $contactPersonName, notes: $notes, image: $image, lat: $lat, lng: $lng, state: $state, status: $status, createdAt: $createdAt, type: $type, district: $district, featured: $featured, bookable: $bookable, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$ProviderListModelCopyWith<$Res> implements $ProviderListModelCopyWith<$Res> {
  factory _$ProviderListModelCopyWith(_ProviderListModel value, $Res Function(_ProviderListModel) _then) = __$ProviderListModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? serviceProviderNameAr, String? serviceProviderNameEn, String? mobileNumber1, String? mobileNumber2, String? contactPersonName, String? notes, Map<String, dynamic>? image, double? lat, double? lng, String state, String status, DateTime? createdAt, SpTypeModel? type, DistrictModel? district, bool? featured, bool? bookable, double? distance
});


@override $SpTypeModelCopyWith<$Res>? get type;@override $DistrictModelCopyWith<$Res>? get district;

}
/// @nodoc
class __$ProviderListModelCopyWithImpl<$Res>
    implements _$ProviderListModelCopyWith<$Res> {
  __$ProviderListModelCopyWithImpl(this._self, this._then);

  final _ProviderListModel _self;
  final $Res Function(_ProviderListModel) _then;

/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceProviderNameAr = freezed,Object? serviceProviderNameEn = freezed,Object? mobileNumber1 = freezed,Object? mobileNumber2 = freezed,Object? contactPersonName = freezed,Object? notes = freezed,Object? image = freezed,Object? lat = freezed,Object? lng = freezed,Object? state = null,Object? status = null,Object? createdAt = freezed,Object? type = freezed,Object? district = freezed,Object? featured = freezed,Object? bookable = freezed,Object? distance = freezed,}) {
  return _then(_ProviderListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceProviderNameAr: freezed == serviceProviderNameAr ? _self.serviceProviderNameAr : serviceProviderNameAr // ignore: cast_nullable_to_non_nullable
as String?,serviceProviderNameEn: freezed == serviceProviderNameEn ? _self.serviceProviderNameEn : serviceProviderNameEn // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber1: freezed == mobileNumber1 ? _self.mobileNumber1 : mobileNumber1 // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber2: freezed == mobileNumber2 ? _self.mobileNumber2 : mobileNumber2 // ignore: cast_nullable_to_non_nullable
as String?,contactPersonName: freezed == contactPersonName ? _self.contactPersonName : contactPersonName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SpTypeModel?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,featured: freezed == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool?,bookable: freezed == bookable ? _self.bookable : bookable // ignore: cast_nullable_to_non_nullable
as bool?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpTypeModelCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $SpTypeModelCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of ProviderListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on
