// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpTypeModel {

 int get id; String get typeNameAr; String get typeNameEn; Map<String, dynamic>? get icon;
/// Create a copy of SpTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpTypeModelCopyWith<SpTypeModel> get copyWith => _$SpTypeModelCopyWithImpl<SpTypeModel>(this as SpTypeModel, _$identity);

  /// Serializes this SpTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.typeNameAr, typeNameAr) || other.typeNameAr == typeNameAr)&&(identical(other.typeNameEn, typeNameEn) || other.typeNameEn == typeNameEn)&&const DeepCollectionEquality().equals(other.icon, icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,typeNameAr,typeNameEn,const DeepCollectionEquality().hash(icon));

@override
String toString() {
  return 'SpTypeModel(id: $id, typeNameAr: $typeNameAr, typeNameEn: $typeNameEn, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SpTypeModelCopyWith<$Res>  {
  factory $SpTypeModelCopyWith(SpTypeModel value, $Res Function(SpTypeModel) _then) = _$SpTypeModelCopyWithImpl;
@useResult
$Res call({
 int id, String typeNameAr, String typeNameEn, Map<String, dynamic>? icon
});




}
/// @nodoc
class _$SpTypeModelCopyWithImpl<$Res>
    implements $SpTypeModelCopyWith<$Res> {
  _$SpTypeModelCopyWithImpl(this._self, this._then);

  final SpTypeModel _self;
  final $Res Function(SpTypeModel) _then;

/// Create a copy of SpTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? typeNameAr = null,Object? typeNameEn = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,typeNameAr: null == typeNameAr ? _self.typeNameAr : typeNameAr // ignore: cast_nullable_to_non_nullable
as String,typeNameEn: null == typeNameEn ? _self.typeNameEn : typeNameEn // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpTypeModel].
extension SpTypeModelPatterns on SpTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _SpTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _SpTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String typeNameAr,  String typeNameEn,  Map<String, dynamic>? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpTypeModel() when $default != null:
return $default(_that.id,_that.typeNameAr,_that.typeNameEn,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String typeNameAr,  String typeNameEn,  Map<String, dynamic>? icon)  $default,) {final _that = this;
switch (_that) {
case _SpTypeModel():
return $default(_that.id,_that.typeNameAr,_that.typeNameEn,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String typeNameAr,  String typeNameEn,  Map<String, dynamic>? icon)?  $default,) {final _that = this;
switch (_that) {
case _SpTypeModel() when $default != null:
return $default(_that.id,_that.typeNameAr,_that.typeNameEn,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpTypeModel implements SpTypeModel {
  const _SpTypeModel({required this.id, required this.typeNameAr, required this.typeNameEn, final  Map<String, dynamic>? icon}): _icon = icon;
  factory _SpTypeModel.fromJson(Map<String, dynamic> json) => _$SpTypeModelFromJson(json);

@override final  int id;
@override final  String typeNameAr;
@override final  String typeNameEn;
 final  Map<String, dynamic>? _icon;
@override Map<String, dynamic>? get icon {
  final value = _icon;
  if (value == null) return null;
  if (_icon is EqualUnmodifiableMapView) return _icon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SpTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpTypeModelCopyWith<_SpTypeModel> get copyWith => __$SpTypeModelCopyWithImpl<_SpTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.typeNameAr, typeNameAr) || other.typeNameAr == typeNameAr)&&(identical(other.typeNameEn, typeNameEn) || other.typeNameEn == typeNameEn)&&const DeepCollectionEquality().equals(other._icon, _icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,typeNameAr,typeNameEn,const DeepCollectionEquality().hash(_icon));

@override
String toString() {
  return 'SpTypeModel(id: $id, typeNameAr: $typeNameAr, typeNameEn: $typeNameEn, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SpTypeModelCopyWith<$Res> implements $SpTypeModelCopyWith<$Res> {
  factory _$SpTypeModelCopyWith(_SpTypeModel value, $Res Function(_SpTypeModel) _then) = __$SpTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String typeNameAr, String typeNameEn, Map<String, dynamic>? icon
});




}
/// @nodoc
class __$SpTypeModelCopyWithImpl<$Res>
    implements _$SpTypeModelCopyWith<$Res> {
  __$SpTypeModelCopyWithImpl(this._self, this._then);

  final _SpTypeModel _self;
  final $Res Function(_SpTypeModel) _then;

/// Create a copy of SpTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? typeNameAr = null,Object? typeNameEn = null,Object? icon = freezed,}) {
  return _then(_SpTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,typeNameAr: null == typeNameAr ? _self.typeNameAr : typeNameAr // ignore: cast_nullable_to_non_nullable
as String,typeNameEn: null == typeNameEn ? _self.typeNameEn : typeNameEn // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self._icon : icon // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
