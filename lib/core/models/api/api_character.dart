import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_location_ref.dart';

part 'api_character.freezed.dart';
part 'api_character.g.dart';

@freezed
class ApiCharacter with _$ApiCharacter {
  const factory ApiCharacter({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String status,
    @Default('') String species,
    @Default('') String type,
    @Default('') String gender,
    @Default(ApiLocationRef()) ApiLocationRef origin,
    @Default(ApiLocationRef()) ApiLocationRef location,
    @Default('') String image,
    @Default(<String>[]) List<String> episode,
    @Default('') String url,
    @Default('') String created,
  }) = _ApiCharacter;

  factory ApiCharacter.fromJson(Map<String, dynamic> json) =>
      _$ApiCharacterFromJson(json);
}
