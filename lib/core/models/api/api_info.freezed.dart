// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiInfo _$ApiInfoFromJson(Map<String, dynamic> json) {
  return _ApiInfo.fromJson(json);
}

/// @nodoc
mixin _$ApiInfo {
  int get count => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiInfoCopyWith<ApiInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiInfoCopyWith<$Res> {
  factory $ApiInfoCopyWith(ApiInfo value, $Res Function(ApiInfo) then) =
      _$ApiInfoCopyWithImpl<$Res, ApiInfo>;
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class _$ApiInfoCopyWithImpl<$Res, $Val extends ApiInfo>
    implements $ApiInfoCopyWith<$Res> {
  _$ApiInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiInfoCopyWith<$Res> implements $ApiInfoCopyWith<$Res> {
  factory _$$_ApiInfoCopyWith(
          _$_ApiInfo value, $Res Function(_$_ApiInfo) then) =
      __$$_ApiInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class __$$_ApiInfoCopyWithImpl<$Res>
    extends _$ApiInfoCopyWithImpl<$Res, _$_ApiInfo>
    implements _$$_ApiInfoCopyWith<$Res> {
  __$$_ApiInfoCopyWithImpl(_$_ApiInfo _value, $Res Function(_$_ApiInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$_ApiInfo(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiInfo implements _ApiInfo {
  const _$_ApiInfo({this.count = 0, this.pages = 0, this.next, this.prev});

  factory _$_ApiInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ApiInfoFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final int pages;
  @override
  final String? next;
  @override
  final String? prev;

  @override
  String toString() {
    return 'ApiInfo(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiInfo &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, pages, next, prev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiInfoCopyWith<_$_ApiInfo> get copyWith =>
      __$$_ApiInfoCopyWithImpl<_$_ApiInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiInfoToJson(
      this,
    );
  }
}

abstract class _ApiInfo implements ApiInfo {
  const factory _ApiInfo(
      {final int count,
      final int pages,
      final String? next,
      final String? prev}) = _$_ApiInfo;

  factory _ApiInfo.fromJson(Map<String, dynamic> json) = _$_ApiInfo.fromJson;

  @override
  int get count;
  @override
  int get pages;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  @JsonKey(ignore: true)
  _$$_ApiInfoCopyWith<_$_ApiInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
