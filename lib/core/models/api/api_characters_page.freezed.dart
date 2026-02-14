// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_characters_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCharactersPage _$ApiCharactersPageFromJson(Map<String, dynamic> json) {
  return _ApiCharactersPage.fromJson(json);
}

/// @nodoc
mixin _$ApiCharactersPage {
  ApiInfo get info => throw _privateConstructorUsedError;
  List<ApiCharacter> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCharactersPageCopyWith<ApiCharactersPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCharactersPageCopyWith<$Res> {
  factory $ApiCharactersPageCopyWith(
          ApiCharactersPage value, $Res Function(ApiCharactersPage) then) =
      _$ApiCharactersPageCopyWithImpl<$Res, ApiCharactersPage>;
  @useResult
  $Res call({ApiInfo info, List<ApiCharacter> results});

  $ApiInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$ApiCharactersPageCopyWithImpl<$Res, $Val extends ApiCharactersPage>
    implements $ApiCharactersPageCopyWith<$Res> {
  _$ApiCharactersPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ApiInfo,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ApiCharacter>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiInfoCopyWith<$Res> get info {
    return $ApiInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApiCharactersPageCopyWith<$Res>
    implements $ApiCharactersPageCopyWith<$Res> {
  factory _$$_ApiCharactersPageCopyWith(_$_ApiCharactersPage value,
          $Res Function(_$_ApiCharactersPage) then) =
      __$$_ApiCharactersPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiInfo info, List<ApiCharacter> results});

  @override
  $ApiInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_ApiCharactersPageCopyWithImpl<$Res>
    extends _$ApiCharactersPageCopyWithImpl<$Res, _$_ApiCharactersPage>
    implements _$$_ApiCharactersPageCopyWith<$Res> {
  __$$_ApiCharactersPageCopyWithImpl(
      _$_ApiCharactersPage _value, $Res Function(_$_ApiCharactersPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_ApiCharactersPage(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ApiInfo,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ApiCharacter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiCharactersPage implements _ApiCharactersPage {
  const _$_ApiCharactersPage(
      {this.info = const ApiInfo(),
      final List<ApiCharacter> results = const <ApiCharacter>[]})
      : _results = results;

  factory _$_ApiCharactersPage.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCharactersPageFromJson(json);

  @override
  @JsonKey()
  final ApiInfo info;
  final List<ApiCharacter> _results;
  @override
  @JsonKey()
  List<ApiCharacter> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ApiCharactersPage(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiCharactersPage &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiCharactersPageCopyWith<_$_ApiCharactersPage> get copyWith =>
      __$$_ApiCharactersPageCopyWithImpl<_$_ApiCharactersPage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCharactersPageToJson(
      this,
    );
  }
}

abstract class _ApiCharactersPage implements ApiCharactersPage {
  const factory _ApiCharactersPage(
      {final ApiInfo info,
      final List<ApiCharacter> results}) = _$_ApiCharactersPage;

  factory _ApiCharactersPage.fromJson(Map<String, dynamic> json) =
      _$_ApiCharactersPage.fromJson;

  @override
  ApiInfo get info;
  @override
  List<ApiCharacter> get results;
  @override
  @JsonKey(ignore: true)
  _$$_ApiCharactersPageCopyWith<_$_ApiCharactersPage> get copyWith =>
      throw _privateConstructorUsedError;
}
