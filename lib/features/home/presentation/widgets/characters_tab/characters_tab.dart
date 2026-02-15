import 'package:flutter/material.dart';

import '../../../../../core/ui_kit/states/error_state_view.dart';
import '../../../domain/bloc/home_state.dart';
import '../../../domain/models/character_filters.dart';
import 'characters_tab_view.dart';
import 'filters_changed.dart';

part 'characters_tab_state.dart';

class CharactersTab extends StatefulWidget {
  const CharactersTab({
    super.key,
    required this.state,
    required this.onRetry,
    required this.onRefresh,
    required this.onLoadMore,
    required this.onFavoriteToggle,
    required this.onFiltersChanged,
  });

  final HomeState state;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<int> onFavoriteToggle;
  final FiltersChanged onFiltersChanged;

  @override
  State<CharactersTab> createState() => _CharactersTabState();
}
