import 'package:flutter/material.dart';

import '../../../domain/bloc/home_state.dart';
import '../../../domain/models/character_filters.dart';
import '../character_card/character_card.dart';
import 'filters_section.dart';
import 'offline_mode_banner.dart';

class CharactersTabView extends StatelessWidget {
  const CharactersTabView({
    super.key,
    required this.state,
    required this.scrollController,
    required this.nameController,
    required this.nameFocusNode,
    required this.filtersExpanded,
    required this.onApplyName,
    required this.onStatusSelected,
    required this.onGenderSelected,
    required this.onClearFilters,
    required this.onToggleFilters,
    required this.onRefresh,
    required this.onFavoriteToggle,
  });

  final HomeState state;
  final ScrollController scrollController;
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final bool filtersExpanded;
  final VoidCallback onApplyName;
  final ValueChanged<CharacterStatusFilter> onStatusSelected;
  final ValueChanged<CharacterGenderFilter> onGenderSelected;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;
  final Future<void> Function() onRefresh;
  final ValueChanged<int> onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final favoriteIds = state.favorites.map((item) => item.id).toSet();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: FiltersSection(
            nameController: nameController,
            nameFocusNode: nameFocusNode,
            isExpanded: filtersExpanded,
            selectedStatus: state.filterStatus,
            selectedGender: state.filterGender,
            hasActiveFilters: state.hasActiveFilters,
            statusOptions: CharacterStatusFilter.values,
            genderOptions: CharacterGenderFilter.values,
            onApplyName: onApplyName,
            onStatusSelected: onStatusSelected,
            onGenderSelected: onGenderSelected,
            onClearFilters: onClearFilters,
            onToggleExpanded: onToggleFilters,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: state.isOfflineFallback
              ? const OfflineModeBanner()
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 6, bottom: 16),
              itemCount: state.characters.length + (state.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.characters.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final character = state.characters[index];
                return CharacterCard(
                  character: character,
                  isFavorite: favoriteIds.contains(character.id),
                  onFavoritePressed: () => onFavoriteToggle(character.id),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
