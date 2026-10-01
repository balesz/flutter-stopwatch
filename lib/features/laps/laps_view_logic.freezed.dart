// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laps_view_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LapsViewState {

 int get itemCount;
/// Create a copy of LapsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LapsViewStateCopyWith<LapsViewState> get copyWith => _$LapsViewStateCopyWithImpl<LapsViewState>(this as LapsViewState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LapsViewState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LapsViewState&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount));
}


@override
int get hashCode {
  final _this = this as LapsViewState;
  return Object.hash(runtimeType,_this.itemCount);
}

@override
String toString() {
  final _this = this as LapsViewState;
  return 'LapsViewState(itemCount: ${_this.itemCount})';
}


}

/// @nodoc
abstract mixin class $LapsViewStateCopyWith<$Res>  {
  factory $LapsViewStateCopyWith(LapsViewState value, $Res Function(LapsViewState) _then) = _$LapsViewStateCopyWithImpl;
@useResult
$Res call({
 int itemCount
});




}
/// @nodoc
class _$LapsViewStateCopyWithImpl<$Res>
    implements $LapsViewStateCopyWith<$Res> {
  _$LapsViewStateCopyWithImpl(this._self, this._then);

  final LapsViewState _self;
  final $Res Function(LapsViewState) _then;

/// Create a copy of LapsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemCount = null,}) {
  return _then(LapsViewState(
itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LapsViewState].
extension LapsViewStatePatterns on LapsViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LapsViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LapsViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LapsViewState value)  $default,){
final _that = this;
switch (_that) {
case _LapsViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LapsViewState value)?  $default,){
final _that = this;
switch (_that) {
case _LapsViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LapsViewState() when $default != null:
return $default(_that.itemCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemCount)  $default,) {final _that = this;
switch (_that) {
case _LapsViewState():
return $default(_that.itemCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemCount)?  $default,) {final _that = this;
switch (_that) {
case _LapsViewState() when $default != null:
return $default(_that.itemCount);case _:
  return null;

}
}

}

/// @nodoc


class _LapsViewState implements LapsViewState {
  const _LapsViewState({this.itemCount = 0});
  

@override@JsonKey() final  int itemCount;

/// Create a copy of LapsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LapsViewStateCopyWith<_LapsViewState> get copyWith => __$LapsViewStateCopyWithImpl<_LapsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LapsViewState&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,itemCount);
}

@override
String toString() {
    return 'LapsViewState(itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class _$LapsViewStateCopyWith<$Res> implements $LapsViewStateCopyWith<$Res> {
  factory _$LapsViewStateCopyWith(_LapsViewState value, $Res Function(_LapsViewState) _then) = __$LapsViewStateCopyWithImpl;
@override @useResult
$Res call({
 int itemCount
});




}
/// @nodoc
class __$LapsViewStateCopyWithImpl<$Res>
    implements _$LapsViewStateCopyWith<$Res> {
  __$LapsViewStateCopyWithImpl(this._self, this._then);

  final _LapsViewState _self;
  final $Res Function(_LapsViewState) _then;

/// Create a copy of LapsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemCount = null,}) {
  return _then(_LapsViewState(
itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
