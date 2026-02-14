import '../models/api/api_character.dart';
import '../models/api/api_characters_page.dart';
import 'character_cache_service.dart';
import 'rick_and_morty_api_service.dart';

class CharacterPageResult {
  const CharacterPageResult({
    required this.page,
    required this.isOfflineFallback,
  });

  final ApiCharactersPage page;
  final bool isOfflineFallback;
}

class CharacterService {
  CharacterService({
    required RickAndMortyApiService apiService,
    required CharacterCacheService cacheService,
  })  : _apiService = apiService,
        _cacheService = cacheService;

  final RickAndMortyApiService _apiService;
  final CharacterCacheService _cacheService;

  Future<CharacterPageResult> getCharacters({
    int page = 1,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    try {
      final remotePage = await _apiService.fetchCharactersPage(
        page: page,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );
      await _cacheService.cacheCharacters(remotePage.results);
      return CharacterPageResult(
        page: remotePage,
        isOfflineFallback: false,
      );
    } on RickAndMortyApiException {
      final cachedPage = await _cacheService.getCharactersPage(
        page: page,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );
      if (cachedPage.results.isNotEmpty) {
        return CharacterPageResult(
          page: cachedPage,
          isOfflineFallback: true,
        );
      }
      rethrow;
    }
  }

  Future<List<ApiCharacter>> getFavorites() {
    return _cacheService.getFavoriteCharacters();
  }

  Future<bool> setFavorite({
    required int characterId,
    required bool isFavorite,
  }) {
    return _cacheService.setFavorite(characterId, isFavorite);
  }

  Future<bool> toggleFavorite(int characterId) {
    return _cacheService.toggleFavorite(characterId);
  }

  Future<void> dispose() async {
    _apiService.dispose();
    await _cacheService.close();
  }
}
