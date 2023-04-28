// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inet_endpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InetEndpoint {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InetEndpointCopyWith<InetEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InetEndpointCopyWith<$Res> {
  factory $InetEndpointCopyWith(
          InetEndpoint value, $Res Function(InetEndpoint) then) =
      _$InetEndpointCopyWithImpl<$Res, InetEndpoint>;
  @useResult
  $Res call({String host, int port});
}

/// @nodoc
class _$InetEndpointCopyWithImpl<$Res, $Val extends InetEndpoint>
    implements $InetEndpointCopyWith<$Res> {
  _$InetEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InetEndpointCopyWith<$Res>
    implements $InetEndpointCopyWith<$Res> {
  factory _$$_InetEndpointCopyWith(
          _$_InetEndpoint value, $Res Function(_$_InetEndpoint) then) =
      __$$_InetEndpointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, int port});
}

/// @nodoc
class __$$_InetEndpointCopyWithImpl<$Res>
    extends _$InetEndpointCopyWithImpl<$Res, _$_InetEndpoint>
    implements _$$_InetEndpointCopyWith<$Res> {
  __$$_InetEndpointCopyWithImpl(
      _$_InetEndpoint _value, $Res Function(_$_InetEndpoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
  }) {
    return _then(_$_InetEndpoint(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_InetEndpoint implements _InetEndpoint {
  const _$_InetEndpoint({required this.host, required this.port});

  @override
  final String host;
  @override
  final int port;

  @override
  String toString() {
    return 'InetEndpoint(host: $host, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InetEndpoint &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(runtimeType, host, port);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InetEndpointCopyWith<_$_InetEndpoint> get copyWith =>
      __$$_InetEndpointCopyWithImpl<_$_InetEndpoint>(this, _$identity);
}

abstract class _InetEndpoint implements InetEndpoint {
  const factory _InetEndpoint(
      {required final String host, required final int port}) = _$_InetEndpoint;

  @override
  String get host;
  @override
  int get port;
  @override
  @JsonKey(ignore: true)
  _$$_InetEndpointCopyWith<_$_InetEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}
