import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/character_service.dart';
import '../features/home/presentation/home_feature_page.dart';
import 'theme/app_theme.dart';
import 'theme/theme_cubit.dart';
import 'theme/theme_state.dart';
import 'theme/theme_storage.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.characterService,
    required this.themeStorage,
    required this.initialThemeMode,
  });

  final CharacterService characterService;
  final ThemeStorage themeStorage;
  final ThemeMode initialThemeMode;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    unawaited(widget.characterService.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(
            storage: widget.themeStorage,
            initialMode: widget.initialThemeMode,
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeState.mode,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            home: HomeFeaturePage(characterService: widget.characterService),
          );
        },
      ),
    );
  }
}
