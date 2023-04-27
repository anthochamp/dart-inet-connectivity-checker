// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_checker_endpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectivityCheckerEndpoint {
  dynamic get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectivityCheckerEndpointCopyWith<ConnectivityCheckerEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityCheckerEndpointCopyWith<$Res> {
  factory $ConnectivityCheckerEndpointCopyWith(
          ConnectivityCheckerEndpoint value,
          $Res Function(ConnectivityCheckerEndpoint) then) =
      _$ConnectivityCheckerEndpointCopyWithImpl<$Res,
          ConnectivityCheckerEndpoint>;
  @useResult
  $Res call({dynamic host, int port});
}

/// @nodoc
class _$ConnectivityCheckerEndpointCopyWithImpl<$Res,
        $Val extends ConnectivityCheckerEndpoint>
    implements $ConnectivityCheckerEndpointCopyWith<$Res> {
  _$ConnectivityCheckerEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = freezed,
    Object? port = null,
  }) {
    return _then(_value.copyWith(
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as dynamic,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectivityCheckerEndpointCopyWith<$Res>
    implements $ConnectivityCheckerEndpointCopyWith<$Res> {
  factory _$$_ConnectivityCheckerEndpointCopyWith(
          _$_ConnectivityCheckerEndpoint value,
          $Res Function(_$_ConnectivityCheckerEndpoint) then) =
      __$$_ConnectivityCheckerEndpointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic host, int port});
}

/// @nodoc
class __$$_ConnectivityCheckerEndpointCopyWithImpl<$Res>
    extends _$ConnectivityCheckerEndpointCopyWithImpl<$Res,
        _$_ConnectivityCheckerEndpoint>
    implements _$$_ConnectivityCheckerEndpointCopyWith<$Res> {
  __$$_ConnectivityCheckerEndpointCopyWithImpl(
      _$_ConnectivityCheckerEndpoint _value,
      $Res Function(_$_ConnectivityCheckerEndpoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = freezed,
    Object? port = null,
  }) {
    return _then(_$_ConnectivityCheckerEndpoint(
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as dynamic,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ConnectivityCheckerEndpoint implements _ConnectivityCheckerEndpoint {
  const _$_ConnectivityCheckerEndpoint(
      {required this.host, required this.port});

  @override
  final dynamic host;
  @override
  final int port;

  @override
  String toString() {
    return 'ConnectivityCheckerEndpoint(host: $host, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectivityCheckerEndpoint &&
            const DeepCollectionEquality().equals(other.host, host) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(host), port);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectivityCheckerEndpointCopyWith<_$_ConnectivityCheckerEndpoint>
      get copyWith => __$$_ConnectivityCheckerEndpointCopyWithImpl<
          _$_ConnectivityCheckerEndpoint>(this, _$identity);
}

abstract class _ConnectivityCheckerEndpoint
    implements ConnectivityCheckerEndpoint {
  const factory _ConnectivityCheckerEndpoint(
      {required final dynamic host,
      required final int port}) = _$_ConnectivityCheckerEndpoint;

  @override
  dynamic get host;
  @override
  int get port;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectivityCheckerEndpointCopyWith<_$_ConnectivityCheckerEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}
