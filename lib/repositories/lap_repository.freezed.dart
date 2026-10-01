// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lap_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LapEntity {

 Duration get duration;
/// Create a copy of LapEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LapEntityCopyWith<LapEntity> get copyWith => _$LapEntityCopyWithImpl<LapEntity>(this as LapEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LapEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LapEntity&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}


@override
int get hashCode {
  final _this = this as LapEntity;
  return Object.hash(runtimeType,_this.duration);
}

@override
String toString() {
  final _this = this as LapEntity;
  return 'LapEntity(duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $LapEntityCopyWith<$Res>  {
  factory $LapEntityCopyWith(LapEntity value, $Res Function(LapEntity) _then) = _$LapEntityCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class _$LapEntityCopyWithImpl<$Res>
    implements $LapEntityCopyWith<$Res> {
  _$LapEntityCopyWithImpl(this._self, this._then);

  final LapEntity _self;
  final $Res Function(LapEntity) _then;

/// Create a copy of LapEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? duration = null,}) {
  return _then(LapEntity(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [LapEntity].
extension LapEntityPatterns on LapEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LapEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LapEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LapEntity value)  $default,){
final _that = this;
switch (_that) {
case _LapEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LapEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LapEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LapEntity() when $default != null:
return $default(_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration duration)  $default,) {final _that = this;
switch (_that) {
case _LapEntity():
return $default(_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _LapEntity() when $default != null:
return $default(_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _LapEntity implements LapEntity {
  const _LapEntity(this.duration);
  

@override final  Duration duration;

/// Create a copy of LapEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LapEntityCopyWith<_LapEntity> get copyWith => __$LapEntityCopyWithImpl<_LapEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LapEntity&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,duration);
}

@override
String toString() {
    return 'LapEntity(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$LapEntityCopyWith<$Res> implements $LapEntityCopyWith<$Res> {
  factory _$LapEntityCopyWith(_LapEntity value, $Res Function(_LapEntity) _then) = __$LapEntityCopyWithImpl;
@override @useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$LapEntityCopyWithImpl<$Res>
    implements _$LapEntityCopyWith<$Res> {
  __$LapEntityCopyWithImpl(this._self, this._then);

  final _LapEntity _self;
  final $Res Function(_LapEntity) _then;

/// Create a copy of LapEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_LapEntity(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
