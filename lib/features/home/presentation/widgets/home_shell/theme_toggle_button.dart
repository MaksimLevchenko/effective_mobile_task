import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theme/theme_cubit.dart';
import '../../../../../app/theme/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.mode == ThemeMode.dark;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton.filledTonal(
            tooltip: isDark
                ? 'Переключить на светлую тему'
                : 'Переключить на темную тему',
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
          ),
        );
      },
    );
  }
}
