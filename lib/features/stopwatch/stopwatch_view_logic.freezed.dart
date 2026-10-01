// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_view_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StopwatchViewState {

 bool get isPauseButtonVisible; bool get isResetButtonVisible; String get digitalText;
/// Create a copy of StopwatchViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopwatchViewStateCopyWith<StopwatchViewState> get copyWith => _$StopwatchViewStateCopyWithImpl<StopwatchViewState>(this as StopwatchViewState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StopwatchViewState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopwatchViewState&&(identical(other.isPauseButtonVisible, _this.isPauseButtonVisible) || other.isPauseButtonVisible == _this.isPauseButtonVisible)&&(identical(other.isResetButtonVisible, _this.isResetButtonVisible) || other.isResetButtonVisible == _this.isResetButtonVisible)&&(identical(other.digitalText, _this.digitalText) || other.digitalText == _this.digitalText));
}


@override
int get hashCode {
  final _this = this as StopwatchViewState;
  return Object.hash(runtimeType,_this.isPauseButtonVisible,_this.isResetButtonVisible,_this.digitalText);
}

@override
String toString() {
  final _this = this as StopwatchViewState;
  return 'StopwatchViewState(isPauseButtonVisible: ${_this.isPauseButtonVisible}, isResetButtonVisible: ${_this.isResetButtonVisible}, digitalText: ${_this.digitalText})';
}


}

/// @nodoc
abstract mixin class $StopwatchViewStateCopyWith<$Res>  {
  factory $StopwatchViewStateCopyWith(StopwatchViewState value, $Res Function(StopwatchViewState) _then) = _$StopwatchViewStateCopyWithImpl;
@useResult
$Res call({
 bool isPauseButtonVisible, bool isResetButtonVisible, String digitalText
});




}
/// @nodoc
class _$StopwatchViewStateCopyWithImpl<$Res>
    implements $StopwatchViewStateCopyWith<$Res> {
  _$StopwatchViewStateCopyWithImpl(this._self, this._then);

  final StopwatchViewState _self;
  final $Res Function(StopwatchViewState) _then;

/// Create a copy of StopwatchViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPauseButtonVisible = null,Object? isResetButtonVisible = null,Object? digitalText = null,}) {
  return _then(StopwatchViewState(
isPauseButtonVisible: null == isPauseButtonVisible ? _self.isPauseButtonVisible : isPauseButtonVisible // ignore: cast_nullable_to_non_nullable
as bool,isResetButtonVisible: null == isResetButtonVisible ? _self.isResetButtonVisible : isResetButtonVisible // ignore: cast_nullable_to_non_nullable
as bool,digitalText: null == digitalText ? _self.digitalText : digitalText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StopwatchViewState].
extension StopwatchViewStatePatterns on StopwatchViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StopwatchViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopwatchViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StopwatchViewState value)  $default,){
final _that = this;
switch (_that) {
case _StopwatchViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StopwatchViewState value)?  $default,){
final _that = this;
switch (_that) {
case _StopwatchViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPauseButtonVisible,  bool isResetButtonVisible,  String digitalText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopwatchViewState() when $default != null:
return $default(_that.isPauseButtonVisible,_that.isResetButtonVisible,_that.digitalText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPauseButtonVisible,  bool isResetButtonVisible,  String digitalText)  $default,) {final _that = this;
switch (_that) {
case _StopwatchViewState():
return $default(_that.isPauseButtonVisible,_that.isResetButtonVisible,_that.digitalText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPauseButtonVisible,  bool isResetButtonVisible,  String digitalText)?  $default,) {final _that = this;
switch (_that) {
case _StopwatchViewState() when $default != null:
return $default(_that.isPauseButtonVisible,_that.isResetButtonVisible,_that.digitalText);case _:
  return null;

}
}

}

/// @nodoc


class _StopwatchViewState implements StopwatchViewState {
  const _StopwatchViewState({this.isPauseButtonVisible = false, this.isResetButtonVisible = false, this.digitalText = '00:00:00'});
  

@override@JsonKey() final  bool isPauseButtonVisible;
@override@JsonKey() final  bool isResetButtonVisible;
@override@JsonKey() final  String digitalText;

/// Create a copy of StopwatchViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopwatchViewStateCopyWith<_StopwatchViewState> get copyWith => __$StopwatchViewStateCopyWithImpl<_StopwatchViewState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopwatchViewState&&(identical(other.isPauseButtonVisible, isPauseButtonVisible) || other.isPauseButtonVisible == isPauseButtonVisible)&&(identical(other.isResetButtonVisible, isResetButtonVisible) || other.isResetButtonVisible == isResetButtonVisible)&&(identical(other.digitalText, digitalText) || other.digitalText == digitalText));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isPauseButtonVisible,isResetButtonVisible,digitalText);
}

@override
String toString() {
    return 'StopwatchViewState(isPauseButtonVisible: $isPauseButtonVisible, isResetButtonVisible: $isResetButtonVisible, digitalText: $digitalText)';
}


}

/// @nodoc
abstract mixin class _$StopwatchViewStateCopyWith<$Res> implements $StopwatchViewStateCopyWith<$Res> {
  factory _$StopwatchViewStateCopyWith(_StopwatchViewState value, $Res Function(_StopwatchViewState) _then) = __$StopwatchViewStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPauseButtonVisible, bool isResetButtonVisible, String digitalText
});




}
/// @nodoc
class __$StopwatchViewStateCopyWithImpl<$Res>
    implements _$StopwatchViewStateCopyWith<$Res> {
  __$StopwatchViewStateCopyWithImpl(this._self, this._then);

  final _StopwatchViewState _self;
  final $Res Function(_StopwatchViewState) _then;

/// Create a copy of StopwatchViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPauseButtonVisible = null,Object? isResetButtonVisible = null,Object? digitalText = null,}) {
  return _then(_StopwatchViewState(
isPauseButtonVisible: null == isPauseButtonVisible ? _self.isPauseButtonVisible : isPauseButtonVisible // ignore: cast_nullable_to_non_nullable
as bool,isResetButtonVisible: null == isResetButtonVisible ? _self.isResetButtonVisible : isResetButtonVisible // ignore: cast_nullable_to_non_nullable
as bool,digitalText: null == digitalText ? _self.digitalText : digitalText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
