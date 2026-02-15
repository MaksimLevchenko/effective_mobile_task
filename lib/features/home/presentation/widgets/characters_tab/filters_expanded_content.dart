import 'package:flutter/material.dart';

import '../../../domain/models/character_filters.dart';
import 'filter_chip_wrap.dart';

class FiltersExpandedContent extends StatelessWidget {
  const FiltersExpandedContent({
    super.key,
    required this.selectedStatus,
    required this.selectedGender,
    required this.statusOptions,
    required this.genderOptions,
    required this.hasActiveFilters,
    required this.onStatusSelected,
    required this.onGenderSelected,
    required this.onClearFilters,
  });

  final CharacterStatusFilter selectedStatus;
  final CharacterGenderFilter selectedGender;
  final List<CharacterStatusFilter> statusOptions;
  final List<CharacterGenderFilter> genderOptions;
  final bool hasActiveFilters;
  final ValueChanged<CharacterStatusFilter> onStatusSelected;
  final ValueChanged<CharacterGenderFilter> onGenderSelected;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CharacterFiltersText.statusTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 6),
          FilterChipWrap<CharacterStatusFilter>(
            options: statusOptions,
            selected: selectedStatus,
            labelBuilder: (value) => value.labelRu,
            onSelected: onStatusSelected,
          ),
          const SizedBox(height: 10),
          Text(
            CharacterFiltersText.genderTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 6),
          FilterChipWrap<CharacterGenderFilter>(
            options: genderOptions,
            selected: selectedGender,
            labelBuilder: (value) => value.labelRu,
            onSelected: onGenderSelected,
          ),
          if (hasActiveFilters) ...[
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: onClearFilters,
              icon: const Icon(Icons.filter_alt_off_rounded),
              label: const Text(CharacterFiltersText.resetFilters),
            ),
          ],
        ],
      ),
    );
  }
}
