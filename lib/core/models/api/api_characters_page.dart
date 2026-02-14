import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_character.dart';
import 'api_info.dart';

part 'api_characters_page.freezed.dart';
part 'api_characters_page.g.dart';

@freezed
class ApiCharactersPage with _$ApiCharactersPage {
  const factory ApiCharactersPage({
    @Default(ApiInfo()) ApiInfo info,
    @Default(<ApiCharacter>[]) List<ApiCharacter> results,
  }) = _ApiCharactersPage;

  factory ApiCharactersPage.fromJson(Map<String, dynamic> json) =>
      _$ApiCharactersPageFromJson(json);
}
