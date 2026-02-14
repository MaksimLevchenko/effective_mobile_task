import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/theme_cubit.dart';
import '../../../app/theme/theme_state.dart';
import '../domain/bloc/home_bloc.dart';
import '../domain/bloc/home_event.dart';
import '../domain/bloc/home_state.dart';
import 'widgets/characters_tab.dart';
import 'widgets/favorites_tab.dart';

class HomeShellPage extends StatelessWidget {
  const HomeShellPage({super.key});

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<HomeBloc>();
    bloc.add(const HomeRefreshRequested());
    await bloc.stream.firstWhere((state) => state.status != HomeStatus.loading);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        final hasBackgroundError =
            state.errorMessage != null && state.status == HomeStatus.success;
        if (!hasBackgroundError) {
          return;
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
      },
      builder: (context, state) {
        final title = state.activeTab == 0 ? 'Characters' : 'Favorites';

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: const [_ThemeToggleButton(), SizedBox(width: 8)],
          ),
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: state.activeTab,
              children: [
                CharactersTab(
                  state: state,
                  onRetry: () =>
                      context.read<HomeBloc>().add(const HomeStarted()),
                  onRefresh: () => _refresh(context),
                  onLoadMore: () {
                    context.read<HomeBloc>().add(const HomeNextPageRequested());
                  },
                  onFavoriteToggle: (id) {
                    context.read<HomeBloc>().add(HomeFavoriteToggled(id));
                  },
                ),
                FavoritesTab(
                  favorites: state.favorites,
                  onFavoriteToggle: (id) {
                    context.read<HomeBloc>().add(HomeFavoriteToggled(id));
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.activeTab,
            onDestinationSelected: (index) {
              context.read<HomeBloc>().add(HomeTabChanged(index));
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.people_alt_outlined),
                selectedIcon: Icon(Icons.people_alt_rounded),
                label: 'Characters',
              ),
              NavigationDestination(
                icon: Icon(Icons.star_border_rounded),
                selectedIcon: Icon(Icons.star_rounded),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.mode == ThemeMode.dark;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton.filledTonal(
            tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
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
