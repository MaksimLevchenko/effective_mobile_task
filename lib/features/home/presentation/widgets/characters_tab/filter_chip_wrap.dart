import 'package:flutter/material.dart';

class FilterChipWrap<T> extends StatelessWidget {
  const FilterChipWrap({
    super.key,
    required this.options,
    required this.selected,
    required this.labelBuilder,
    required this.onSelected,
  });

  final List<T> options;
  final T selected;
  final String Function(T value) labelBuilder;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options
          .map(
            (option) => ChoiceChip(
              label: Text(labelBuilder(option)),
              labelStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              selected: selected == option,
              showCheckmark: false,
              side: BorderSide(
                color: colors.outlineVariant.withValues(alpha: 0.55),
              ),
              onSelected: (_) => onSelected(option),
            ),
          )
          .toList(growable: false),
    );
  }
}
