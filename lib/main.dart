import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/theme/theme_storage.dart';
import 'core/services/character_cache_service.dart';
import 'core/services/character_service.dart';
import 'core/services/local_database_service.dart';
import 'core/services/rick_and_morty_api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbService = LocalDatabaseService();
  final cacheService = CharacterCacheService(dbService);
  final apiService = RickAndMortyApiService();
  final characterService = CharacterService(
    apiService: apiService,
    cacheService: cacheService,
  );
  final themeStorage = ThemeStorage();
  final initialThemeMode = await themeStorage.readThemeMode();

  runApp(
    App(
      characterService: characterService,
      themeStorage: themeStorage,
      initialThemeMode: initialThemeMode,
    ),
  );
}
