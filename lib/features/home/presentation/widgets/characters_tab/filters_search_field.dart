import 'package:flutter/material.dart';

import '../../../domain/models/character_filters.dart';

class FiltersSearchField extends StatelessWidget {
  const FiltersSearchField({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.isExpanded,
    required this.hasActiveFilters,
    required this.onApplyName,
    required this.onToggleExpanded,
  });

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final bool isExpanded;
  final bool hasActiveFilters;
  final VoidCallback onApplyName;
  final VoidCallback onToggleExpanded;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      focusNode: nameFocusNode,
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => onApplyName(),
      decoration: InputDecoration(
        hintText: CharacterFiltersText.searchHint,
        isDense: true,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: SizedBox(
          width: 96,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                tooltip: CharacterFiltersText.applyFiltersTooltip,
                onPressed: onApplyName,
                icon: const Icon(Icons.check_rounded),
              ),
              IconButton(
                tooltip: isExpanded
                    ? CharacterFiltersText.hideFiltersTooltip
                    : CharacterFiltersText.showFiltersTooltip,
                onPressed: onToggleExpanded,
                icon: Icon(
                  isExpanded
                      ? Icons.tune_rounded
                      : (hasActiveFilters
                            ? Icons.filter_alt_rounded
                            : Icons.filter_alt_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
