// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

ApiCharacter _$ApiCharacterFromJson(Map<String, dynamic> json) {
  return _ApiCharacter.fromJson(json);
}

/// @nodoc
mixin _$ApiCharacter {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  ApiLocationRef get origin => throw _privateConstructorUsedError;
  ApiLocationRef get location => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get episode => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCharacterCopyWith<ApiCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCharacterCopyWith<$Res> {
  factory $ApiCharacterCopyWith(
    ApiCharacter value,
    $Res Function(ApiCharacter) then,
  ) = _$ApiCharacterCopyWithImpl<$Res, ApiCharacter>;
  @useResult
  $Res call({
    int id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    ApiLocationRef origin,
    ApiLocationRef location,
    String image,
    List<String> episode,
    String url,
    String created,
  });

  $ApiLocationRefCopyWith<$Res> get origin;
  $ApiLocationRefCopyWith<$Res> get location;
}

/// @nodoc
class _$ApiCharacterCopyWithImpl<$Res, $Val extends ApiCharacter>
    implements $ApiCharacterCopyWith<$Res> {
  _$ApiCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            species: null == species
                ? _value.species
                : species // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            origin: null == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as ApiLocationRef,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as ApiLocationRef,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            episode: null == episode
                ? _value.episode
                : episode // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            created: null == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiLocationRefCopyWith<$Res> get origin {
    return $ApiLocationRefCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiLocationRefCopyWith<$Res> get location {
    return $ApiLocationRefCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApiCharacterCopyWith<$Res>
    implements $ApiCharacterCopyWith<$Res> {
  factory _$$_ApiCharacterCopyWith(
    _$_ApiCharacter value,
    $Res Function(_$_ApiCharacter) then,
  ) = __$$_ApiCharacterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    ApiLocationRef origin,
    ApiLocationRef location,
    String image,
    List<String> episode,
    String url,
    String created,
  });

  @override
  $ApiLocationRefCopyWith<$Res> get origin;
  @override
  $ApiLocationRefCopyWith<$Res> get location;
}

/// @nodoc
class __$$_ApiCharacterCopyWithImpl<$Res>
    extends _$ApiCharacterCopyWithImpl<$Res, _$_ApiCharacter>
    implements _$$_ApiCharacterCopyWith<$Res> {
  __$$_ApiCharacterCopyWithImpl(
    _$_ApiCharacter _value,
    $Res Function(_$_ApiCharacter) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(
      _$_ApiCharacter(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        species: null == species
            ? _value.species
            : species // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        origin: null == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as ApiLocationRef,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as ApiLocationRef,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        episode: null == episode
            ? _value._episode
            : episode // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        created: null == created
            ? _value.created
            : created // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiCharacter implements _ApiCharacter {
  const _$_ApiCharacter({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const ApiLocationRef(),
    this.location = const ApiLocationRef(),
    this.image = '',
    final List<String> episode = const <String>[],
    this.url = '',
    this.created = '',
  }) : _episode = episode;

  factory _$_ApiCharacter.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCharacterFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String species;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final ApiLocationRef origin;
  @override
  @JsonKey()
  final ApiLocationRef location;
  @override
  @JsonKey()
  final String image;
  final List<String> _episode;
  @override
  @JsonKey()
  List<String> get episode {
    if (_episode is EqualUnmodifiableListView) return _episode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episode);
  }

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String created;

  @override
  String toString() {
    return 'ApiCharacter(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiCharacter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    status,
    species,
    type,
    gender,
    origin,
    location,
    image,
    const DeepCollectionEquality().hash(_episode),
    url,
    created,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiCharacterCopyWith<_$_ApiCharacter> get copyWith =>
      __$$_ApiCharacterCopyWithImpl<_$_ApiCharacter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCharacterToJson(this);
  }
}

abstract class _ApiCharacter implements ApiCharacter {
  const factory _ApiCharacter({
    final int id,
    final String name,
    final String status,
    final String species,
    final String type,
    final String gender,
    final ApiLocationRef origin,
    final ApiLocationRef location,
    final String image,
    final List<String> episode,
    final String url,
    final String created,
  }) = _$_ApiCharacter;

  factory _ApiCharacter.fromJson(Map<String, dynamic> json) =
      _$_ApiCharacter.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get species;
  @override
  String get type;
  @override
  String get gender;
  @override
  ApiLocationRef get origin;
  @override
  ApiLocationRef get location;
  @override
  String get image;
  @override
  List<String> get episode;
  @override
  String get url;
  @override
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$_ApiCharacterCopyWith<_$_ApiCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}
