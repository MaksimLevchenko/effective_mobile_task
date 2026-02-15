import 'package:flutter/material.dart';

import '../../../domain/models/character_filters.dart';
import 'filters_expanded_content.dart';
import 'filters_search_field.dart';

class FiltersSection extends StatelessWidget {
  const FiltersSection({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.isExpanded,
    required this.selectedStatus,
    required this.selectedGender,
    required this.hasActiveFilters,
    required this.statusOptions,
    required this.genderOptions,
    required this.onApplyName,
    required this.onStatusSelected,
    required this.onGenderSelected,
    required this.onClearFilters,
    required this.onToggleExpanded,
  });

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final bool isExpanded;
  final CharacterStatusFilter selectedStatus;
  final CharacterGenderFilter selectedGender;
  final bool hasActiveFilters;
  final List<CharacterStatusFilter> statusOptions;
  final List<CharacterGenderFilter> genderOptions;
  final VoidCallback onApplyName;
  final ValueChanged<CharacterStatusFilter> onStatusSelected;
  final ValueChanged<CharacterGenderFilter> onGenderSelected;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FiltersSearchField(
            nameController: nameController,
            nameFocusNode: nameFocusNode,
            isExpanded: isExpanded,
            hasActiveFilters: hasActiveFilters,
            onApplyName: onApplyName,
            onToggleExpanded: onToggleExpanded,
          ),
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeInOutCubic,
            tween: Tween<double>(begin: 0, end: isExpanded ? 1 : 0),
            child: FiltersExpandedContent(
              selectedStatus: selectedStatus,
              selectedGender: selectedGender,
              statusOptions: statusOptions,
              genderOptions: genderOptions,
              hasActiveFilters: hasActiveFilters,
              onStatusSelected: onStatusSelected,
              onGenderSelected: onGenderSelected,
              onClearFilters: onClearFilters,
            ),
            builder: (context, value, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: value,
                  child: Opacity(
                    opacity: value,
                    child: IgnorePointer(ignoring: value == 0, child: child),
                  ),
                ),
              );
            },
          ),
          if (!isExpanded && hasActiveFilters) ...[
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                CharacterFiltersText.filtersApplied,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
