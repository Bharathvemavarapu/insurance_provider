// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsuranceCategory {

 String get id; String get name; String get iconUrl; String get description; bool get isPopular;
/// Create a copy of InsuranceCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsuranceCategoryCopyWith<InsuranceCategory> get copyWith => _$InsuranceCategoryCopyWithImpl<InsuranceCategory>(this as InsuranceCategory, _$identity);

  /// Serializes this InsuranceCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsuranceCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl,description,isPopular);

@override
String toString() {
  return 'InsuranceCategory(id: $id, name: $name, iconUrl: $iconUrl, description: $description, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class $InsuranceCategoryCopyWith<$Res>  {
  factory $InsuranceCategoryCopyWith(InsuranceCategory value, $Res Function(InsuranceCategory) _then) = _$InsuranceCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String iconUrl, String description, bool isPopular
});




}
/// @nodoc
class _$InsuranceCategoryCopyWithImpl<$Res>
    implements $InsuranceCategoryCopyWith<$Res> {
  _$InsuranceCategoryCopyWithImpl(this._self, this._then);

  final InsuranceCategory _self;
  final $Res Function(InsuranceCategory) _then;

/// Create a copy of InsuranceCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,Object? description = null,Object? isPopular = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InsuranceCategory].
extension InsuranceCategoryPatterns on InsuranceCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsuranceCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsuranceCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsuranceCategory value)  $default,){
final _that = this;
switch (_that) {
case _InsuranceCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsuranceCategory value)?  $default,){
final _that = this;
switch (_that) {
case _InsuranceCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String iconUrl,  String description,  bool isPopular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsuranceCategory() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl,_that.description,_that.isPopular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String iconUrl,  String description,  bool isPopular)  $default,) {final _that = this;
switch (_that) {
case _InsuranceCategory():
return $default(_that.id,_that.name,_that.iconUrl,_that.description,_that.isPopular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String iconUrl,  String description,  bool isPopular)?  $default,) {final _that = this;
switch (_that) {
case _InsuranceCategory() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl,_that.description,_that.isPopular);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsuranceCategory implements InsuranceCategory {
  const _InsuranceCategory({required this.id, required this.name, required this.iconUrl, required this.description, this.isPopular = false});
  factory _InsuranceCategory.fromJson(Map<String, dynamic> json) => _$InsuranceCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String iconUrl;
@override final  String description;
@override@JsonKey() final  bool isPopular;

/// Create a copy of InsuranceCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsuranceCategoryCopyWith<_InsuranceCategory> get copyWith => __$InsuranceCategoryCopyWithImpl<_InsuranceCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsuranceCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsuranceCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl,description,isPopular);

@override
String toString() {
  return 'InsuranceCategory(id: $id, name: $name, iconUrl: $iconUrl, description: $description, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class _$InsuranceCategoryCopyWith<$Res> implements $InsuranceCategoryCopyWith<$Res> {
  factory _$InsuranceCategoryCopyWith(_InsuranceCategory value, $Res Function(_InsuranceCategory) _then) = __$InsuranceCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String iconUrl, String description, bool isPopular
});




}
/// @nodoc
class __$InsuranceCategoryCopyWithImpl<$Res>
    implements _$InsuranceCategoryCopyWith<$Res> {
  __$InsuranceCategoryCopyWithImpl(this._self, this._then);

  final _InsuranceCategory _self;
  final $Res Function(_InsuranceCategory) _then;

/// Create a copy of InsuranceCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,Object? description = null,Object? isPopular = null,}) {
  return _then(_InsuranceCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
