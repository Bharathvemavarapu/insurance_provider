// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsuranceProvider {

 String get id; String get name; String get logoUrl; double get rating; double get claimRatio; String get description; String get officialWebsite;
/// Create a copy of InsuranceProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsuranceProviderCopyWith<InsuranceProvider> get copyWith => _$InsuranceProviderCopyWithImpl<InsuranceProvider>(this as InsuranceProvider, _$identity);

  /// Serializes this InsuranceProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsuranceProvider&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.claimRatio, claimRatio) || other.claimRatio == claimRatio)&&(identical(other.description, description) || other.description == description)&&(identical(other.officialWebsite, officialWebsite) || other.officialWebsite == officialWebsite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,rating,claimRatio,description,officialWebsite);

@override
String toString() {
  return 'InsuranceProvider(id: $id, name: $name, logoUrl: $logoUrl, rating: $rating, claimRatio: $claimRatio, description: $description, officialWebsite: $officialWebsite)';
}


}

/// @nodoc
abstract mixin class $InsuranceProviderCopyWith<$Res>  {
  factory $InsuranceProviderCopyWith(InsuranceProvider value, $Res Function(InsuranceProvider) _then) = _$InsuranceProviderCopyWithImpl;
@useResult
$Res call({
 String id, String name, String logoUrl, double rating, double claimRatio, String description, String officialWebsite
});




}
/// @nodoc
class _$InsuranceProviderCopyWithImpl<$Res>
    implements $InsuranceProviderCopyWith<$Res> {
  _$InsuranceProviderCopyWithImpl(this._self, this._then);

  final InsuranceProvider _self;
  final $Res Function(InsuranceProvider) _then;

/// Create a copy of InsuranceProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? rating = null,Object? claimRatio = null,Object? description = null,Object? officialWebsite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,claimRatio: null == claimRatio ? _self.claimRatio : claimRatio // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,officialWebsite: null == officialWebsite ? _self.officialWebsite : officialWebsite // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InsuranceProvider].
extension InsuranceProviderPatterns on InsuranceProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsuranceProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsuranceProvider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsuranceProvider value)  $default,){
final _that = this;
switch (_that) {
case _InsuranceProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsuranceProvider value)?  $default,){
final _that = this;
switch (_that) {
case _InsuranceProvider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  double rating,  double claimRatio,  String description,  String officialWebsite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsuranceProvider() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.rating,_that.claimRatio,_that.description,_that.officialWebsite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  double rating,  double claimRatio,  String description,  String officialWebsite)  $default,) {final _that = this;
switch (_that) {
case _InsuranceProvider():
return $default(_that.id,_that.name,_that.logoUrl,_that.rating,_that.claimRatio,_that.description,_that.officialWebsite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String logoUrl,  double rating,  double claimRatio,  String description,  String officialWebsite)?  $default,) {final _that = this;
switch (_that) {
case _InsuranceProvider() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.rating,_that.claimRatio,_that.description,_that.officialWebsite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsuranceProvider implements InsuranceProvider {
  const _InsuranceProvider({required this.id, required this.name, required this.logoUrl, required this.rating, required this.claimRatio, required this.description, required this.officialWebsite});
  factory _InsuranceProvider.fromJson(Map<String, dynamic> json) => _$InsuranceProviderFromJson(json);

@override final  String id;
@override final  String name;
@override final  String logoUrl;
@override final  double rating;
@override final  double claimRatio;
@override final  String description;
@override final  String officialWebsite;

/// Create a copy of InsuranceProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsuranceProviderCopyWith<_InsuranceProvider> get copyWith => __$InsuranceProviderCopyWithImpl<_InsuranceProvider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsuranceProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsuranceProvider&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.claimRatio, claimRatio) || other.claimRatio == claimRatio)&&(identical(other.description, description) || other.description == description)&&(identical(other.officialWebsite, officialWebsite) || other.officialWebsite == officialWebsite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,rating,claimRatio,description,officialWebsite);

@override
String toString() {
  return 'InsuranceProvider(id: $id, name: $name, logoUrl: $logoUrl, rating: $rating, claimRatio: $claimRatio, description: $description, officialWebsite: $officialWebsite)';
}


}

/// @nodoc
abstract mixin class _$InsuranceProviderCopyWith<$Res> implements $InsuranceProviderCopyWith<$Res> {
  factory _$InsuranceProviderCopyWith(_InsuranceProvider value, $Res Function(_InsuranceProvider) _then) = __$InsuranceProviderCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String logoUrl, double rating, double claimRatio, String description, String officialWebsite
});




}
/// @nodoc
class __$InsuranceProviderCopyWithImpl<$Res>
    implements _$InsuranceProviderCopyWith<$Res> {
  __$InsuranceProviderCopyWithImpl(this._self, this._then);

  final _InsuranceProvider _self;
  final $Res Function(_InsuranceProvider) _then;

/// Create a copy of InsuranceProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? rating = null,Object? claimRatio = null,Object? description = null,Object? officialWebsite = null,}) {
  return _then(_InsuranceProvider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,claimRatio: null == claimRatio ? _self.claimRatio : claimRatio // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,officialWebsite: null == officialWebsite ? _self.officialWebsite : officialWebsite // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
