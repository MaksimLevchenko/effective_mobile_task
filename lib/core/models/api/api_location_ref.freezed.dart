// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_location_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiLocationRef _$ApiLocationRefFromJson(Map<String, dynamic> json) {
  return _ApiLocationRef.fromJson(json);
}

/// @nodoc
mixin _$ApiLocationRef {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiLocationRefCopyWith<ApiLocationRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiLocationRefCopyWith<$Res> {
  factory $ApiLocationRefCopyWith(
          ApiLocationRef value, $Res Function(ApiLocationRef) then) =
      _$ApiLocationRefCopyWithImpl<$Res, ApiLocationRef>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$ApiLocationRefCopyWithImpl<$Res, $Val extends ApiLocationRef>
    implements $ApiLocationRefCopyWith<$Res> {
  _$ApiLocationRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiLocationRefCopyWith<$Res>
    implements $ApiLocationRefCopyWith<$Res> {
  factory _$$_ApiLocationRefCopyWith(
          _$_ApiLocationRef value, $Res Function(_$_ApiLocationRef) then) =
      __$$_ApiLocationRefCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_ApiLocationRefCopyWithImpl<$Res>
    extends _$ApiLocationRefCopyWithImpl<$Res, _$_ApiLocationRef>
    implements _$$_ApiLocationRefCopyWith<$Res> {
  __$$_ApiLocationRefCopyWithImpl(
      _$_ApiLocationRef _value, $Res Function(_$_ApiLocationRef) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_ApiLocationRef(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiLocationRef implements _ApiLocationRef {
  const _$_ApiLocationRef({this.name = '', this.url = ''});

  factory _$_ApiLocationRef.fromJson(Map<String, dynamic> json) =>
      _$$_ApiLocationRefFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'ApiLocationRef(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiLocationRef &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiLocationRefCopyWith<_$_ApiLocationRef> get copyWith =>
      __$$_ApiLocationRefCopyWithImpl<_$_ApiLocationRef>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiLocationRefToJson(
      this,
    );
  }
}

abstract class _ApiLocationRef implements ApiLocationRef {
  const factory _ApiLocationRef({final String name, final String url}) =
      _$_ApiLocationRef;

  factory _ApiLocationRef.fromJson(Map<String, dynamic> json) =
      _$_ApiLocationRef.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ApiLocationRefCopyWith<_$_ApiLocationRef> get copyWith =>
      throw _privateConstructorUsedError;
}
