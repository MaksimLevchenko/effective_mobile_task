import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/character_service.dart';
import '../domain/bloc/home_bloc.dart';
import '../domain/bloc/home_event.dart';
import 'home_shell_page.dart';

class HomeFeaturePage extends StatelessWidget {
  const HomeFeaturePage({
    super.key,
    required this.characterService,
  });

  final CharacterService characterService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) =>
          HomeBloc(characterService: characterService)..add(const HomeStarted()),
      child: const HomeShellPage(),
    );
  }
}
