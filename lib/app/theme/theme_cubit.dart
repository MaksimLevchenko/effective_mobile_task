import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';
import 'theme_storage.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required ThemeStorage storage,
    required ThemeMode initialMode,
  })  : _storage = storage,
        super(ThemeState(mode: initialMode));

  final ThemeStorage _storage;

  Future<void> toggleTheme() async {
    final nextMode =
        state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(mode: nextMode));
    await _storage.saveThemeMode(nextMode);
  }
}
