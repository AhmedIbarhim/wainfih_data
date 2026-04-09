// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

 int get id; String get categoryNameAr; String get categoryNameEn; Map<String, dynamic>? get image;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryNameAr, categoryNameAr) || other.categoryNameAr == categoryNameAr)&&(identical(other.categoryNameEn, categoryNameEn) || other.categoryNameEn == categoryNameEn)&&const DeepCollectionEquality().equals(other.image, image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryNameAr,categoryNameEn,const DeepCollectionEquality().hash(image));

@override
String toString() {
  return 'CategoryModel(id: $id, categoryNameAr: $categoryNameAr, categoryNameEn: $categoryNameEn, image: $image)';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String categoryNameAr, String categoryNameEn, Map<String, dynamic>? image
});




}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryNameAr = null,Object? categoryNameEn = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryNameAr: null == categoryNameAr ? _self.categoryNameAr : categoryNameAr // ignore: cast_nullable_to_non_nullable
as String,categoryNameEn: null == categoryNameEn ? _self.categoryNameEn : categoryNameEn // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryModel].
extension CategoryModelPatterns on CategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String categoryNameAr,  String categoryNameEn,  Map<String, dynamic>? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.categoryNameAr,_that.categoryNameEn,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String categoryNameAr,  String categoryNameEn,  Map<String, dynamic>? image)  $default,) {final _that = this;
switch (_that) {
case _CategoryModel():
return $default(_that.id,_that.categoryNameAr,_that.categoryNameEn,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String categoryNameAr,  String categoryNameEn,  Map<String, dynamic>? image)?  $default,) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.categoryNameAr,_that.categoryNameEn,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryModel implements CategoryModel {
  const _CategoryModel({required this.id, required this.categoryNameAr, required this.categoryNameEn, final  Map<String, dynamic>? image}): _image = image;
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override final  int id;
@override final  String categoryNameAr;
@override final  String categoryNameEn;
 final  Map<String, dynamic>? _image;
@override Map<String, dynamic>? get image {
  final value = _image;
  if (value == null) return null;
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryNameAr, categoryNameAr) || other.categoryNameAr == categoryNameAr)&&(identical(other.categoryNameEn, categoryNameEn) || other.categoryNameEn == categoryNameEn)&&const DeepCollectionEquality().equals(other._image, _image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryNameAr,categoryNameEn,const DeepCollectionEquality().hash(_image));

@override
String toString() {
  return 'CategoryModel(id: $id, categoryNameAr: $categoryNameAr, categoryNameEn: $categoryNameEn, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String categoryNameAr, String categoryNameEn, Map<String, dynamic>? image
});




}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryNameAr = null,Object? categoryNameEn = null,Object? image = freezed,}) {
  return _then(_CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryNameAr: null == categoryNameAr ? _self.categoryNameAr : categoryNameAr // ignore: cast_nullable_to_non_nullable
as String,categoryNameEn: null == categoryNameEn ? _self.categoryNameEn : categoryNameEn // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
