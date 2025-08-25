// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inet_endpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InetEndpoint {

 String get host; int get port;
/// Create a copy of InetEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InetEndpointCopyWith<InetEndpoint> get copyWith => _$InetEndpointCopyWithImpl<InetEndpoint>(this as InetEndpoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InetEndpoint&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,host,port);

@override
String toString() {
  return 'InetEndpoint(host: $host, port: $port)';
}


}

/// @nodoc
abstract mixin class $InetEndpointCopyWith<$Res>  {
  factory $InetEndpointCopyWith(InetEndpoint value, $Res Function(InetEndpoint) _then) = _$InetEndpointCopyWithImpl;
@useResult
$Res call({
 String host, int port
});




}
/// @nodoc
class _$InetEndpointCopyWithImpl<$Res>
    implements $InetEndpointCopyWith<$Res> {
  _$InetEndpointCopyWithImpl(this._self, this._then);

  final InetEndpoint _self;
  final $Res Function(InetEndpoint) _then;

/// Create a copy of InetEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = null,Object? port = null,}) {
  return _then(_self.copyWith(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InetEndpoint].
extension InetEndpointPatterns on InetEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InetEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InetEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InetEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _InetEndpoint():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InetEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _InetEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String host,  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InetEndpoint() when $default != null:
return $default(_that.host,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String host,  int port)  $default,) {final _that = this;
switch (_that) {
case _InetEndpoint():
return $default(_that.host,_that.port);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String host,  int port)?  $default,) {final _that = this;
switch (_that) {
case _InetEndpoint() when $default != null:
return $default(_that.host,_that.port);case _:
  return null;

}
}

}

/// @nodoc


class _InetEndpoint implements InetEndpoint {
  const _InetEndpoint({required this.host, required this.port});
  

@override final  String host;
@override final  int port;

/// Create a copy of InetEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InetEndpointCopyWith<_InetEndpoint> get copyWith => __$InetEndpointCopyWithImpl<_InetEndpoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InetEndpoint&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,host,port);

@override
String toString() {
  return 'InetEndpoint(host: $host, port: $port)';
}


}

/// @nodoc
abstract mixin class _$InetEndpointCopyWith<$Res> implements $InetEndpointCopyWith<$Res> {
  factory _$InetEndpointCopyWith(_InetEndpoint value, $Res Function(_InetEndpoint) _then) = __$InetEndpointCopyWithImpl;
@override @useResult
$Res call({
 String host, int port
});




}
/// @nodoc
class __$InetEndpointCopyWithImpl<$Res>
    implements _$InetEndpointCopyWith<$Res> {
  __$InetEndpointCopyWithImpl(this._self, this._then);

  final _InetEndpoint _self;
  final $Res Function(_InetEndpoint) _then;

/// Create a copy of InetEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = null,Object? port = null,}) {
  return _then(_InetEndpoint(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
