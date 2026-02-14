// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_characters_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCharactersPage _$$_ApiCharactersPageFromJson(Map<String, dynamic> json) =>
    _$_ApiCharactersPage(
      info: json['info'] == null
          ? const ApiInfo()
          : ApiInfo.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ApiCharacter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ApiCharacter>[],
    );

Map<String, dynamic> _$$_ApiCharactersPageToJson(
        _$_ApiCharactersPage instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
