import '../models/api/api_character.dart';
import '../models/api/api_characters_page.dart';
import '../models/api/api_info.dart';
import '../models/api/api_location_ref.dart';
import '../models/entities/character_entity.dart';
import 'local_database_service.dart';

class CharacterCacheService {
  CharacterCacheService(this._databaseService);

  final LocalDatabaseService _databaseService;
  static const int pageSize = 20;

  Future<void> close() {
    return _databaseService.close();
  }

  Future<void> cacheCharacters(List<ApiCharacter> characters) async {
    final box = await _databaseService.open();
    if (characters.isEmpty) {
      return;
    }

    final favoriteById = <int, bool>{};
    for (final character in characters) {
      final stored = box.get('${character.id}');
      if (stored == null) {
        continue;
      }
      final entity = CharacterEntity.fromMap(Map<String, dynamic>.from(stored));
      favoriteById[entity.id] = entity.isFavorite;
    }

    final updates = <String, Map>{};
    for (final character in characters) {
      final entity = CharacterEntity.fromApi(
        character,
        isFavorite: favoriteById[character.id] ?? false,
      );
      updates['${character.id}'] = entity.toMap();
    }
    await box.putAll(updates);
  }

  Future<ApiCharactersPage> getCharactersPage({
    int page = 1,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    final box = await _databaseService.open();
    final all = box.values
        .map(
          (value) => CharacterEntity.fromMap(Map<String, dynamic>.from(value)),
        )
        .toList(growable: false);

    final filtered = all.where((character) {
      return _contains(character.name, name) &&
          _equals(character.status, status) &&
          _contains(character.species, species) &&
          _contains(character.type ?? '', type) &&
          _equals(character.gender, gender);
    }).toList()..sort((a, b) => a.id.compareTo(b.id));

    final safePage = page < 1 ? 1 : page;
    final total = filtered.length;
    final pages = total == 0 ? 0 : (total / pageSize).ceil();
    final start = (safePage - 1) * pageSize;
    final items = start >= total
        ? const <CharacterEntity>[]
        : filtered.skip(start).take(pageSize).toList(growable: false);

    return ApiCharactersPage(
      info: ApiInfo(
        count: total,
        pages: pages,
        next: safePage < pages ? '${safePage + 1}' : null,
        prev: safePage > 1 && pages > 0 ? '${safePage - 1}' : null,
      ),
      results: items.map(_toApiCharacter).toList(growable: false),
    );
  }

  Future<List<ApiCharacter>> getFavoriteCharacters() async {
    final box = await _databaseService.open();
    final all = box.values
        .map(
          (value) => CharacterEntity.fromMap(Map<String, dynamic>.from(value)),
        )
        .toList(growable: false);
    final favorites = all.where((item) => item.isFavorite).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
    return favorites.map(_toApiCharacter).toList(growable: false);
  }

  Future<bool> setFavorite(int characterId, bool value) async {
    final box = await _databaseService.open();
    final raw = box.get('$characterId');
    if (raw == null) {
      return false;
    }

    final entity = CharacterEntity.fromMap(Map<String, dynamic>.from(raw));
    entity.isFavorite = value;
    entity.updatedAt = DateTime.now();
    await box.put('$characterId', entity.toMap());
    return true;
  }

  Future<bool> toggleFavorite(int characterId) async {
    final box = await _databaseService.open();
    final raw = box.get('$characterId');
    if (raw == null) {
      return false;
    }

    final entity = CharacterEntity.fromMap(Map<String, dynamic>.from(raw));
    entity.isFavorite = !entity.isFavorite;
    entity.updatedAt = DateTime.now();
    await box.put('$characterId', entity.toMap());
    return true;
  }

  static bool _contains(String value, String? query) {
    final normalized = query?.trim();
    if (normalized == null || normalized.isEmpty) {
      return true;
    }
    return value.toLowerCase().contains(normalized.toLowerCase());
  }

  static bool _equals(String value, String? query) {
    final normalized = query?.trim();
    if (normalized == null || normalized.isEmpty) {
      return true;
    }
    return value.toLowerCase() == normalized.toLowerCase();
  }

  static ApiCharacter _toApiCharacter(CharacterEntity entity) {
    return ApiCharacter(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type ?? '',
      gender: entity.gender,
      origin: ApiLocationRef(name: entity.originName),
      location: ApiLocationRef(name: entity.locationName),
      image: entity.image,
      episode: List<String>.from(entity.episodeUrls),
      url: entity.remoteUrl,
      created: entity.created,
    );
  }
}
