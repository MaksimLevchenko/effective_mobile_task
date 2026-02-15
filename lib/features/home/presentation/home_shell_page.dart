import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/home_bloc.dart';
import '../domain/bloc/home_event.dart';
import '../domain/bloc/home_state.dart';
import '../domain/models/character_filters.dart';
import 'widgets/characters_tab/characters_tab.dart';
import 'widgets/favorites_tab/favorites_tab.dart';
import 'widgets/home_shell/theme_toggle_button.dart';

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<HomeBloc>();
    bloc.add(const HomeRefreshRequested());
    await bloc.stream.firstWhere((state) => state.status != HomeStatus.loading);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (_pageController.hasClients) {
          final currentPage = _pageController.page?.round();
          if (currentPage != state.activeTab) {
            _pageController.animateToPage(
              state.activeTab,
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
            );
          }
        }

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
        final title = state.activeTab == 0 ? 'Персонажи' : 'Избранное';

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: const [ThemeToggleButton(), SizedBox(width: 8)],
          ),
          body: SafeArea(
            top: false,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                if (state.activeTab != index) {
                  context.read<HomeBloc>().add(HomeTabChanged(index));
                }
              },
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
                  onFiltersChanged:
                      ({
                        required String name,
                        required CharacterStatusFilter status,
                        required CharacterGenderFilter gender,
                      }) {
                        context.read<HomeBloc>().add(
                          HomeFiltersUpdated(
                            name: name,
                            status: status,
                            gender: gender,
                          ),
                        );
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
            labelTextStyle: WidgetStateProperty.all(
              Theme.of(context).textTheme.labelMedium,
            ),
            onDestinationSelected: (index) {
              if (state.activeTab != index) {
                context.read<HomeBloc>().add(HomeTabChanged(index));
              }
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOutCubic,
                );
              }
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.people_alt_outlined),
                selectedIcon: Icon(Icons.people_alt_rounded),
                label: 'Персонажи',
              ),
              NavigationDestination(
                icon: Icon(Icons.star_border_rounded),
                selectedIcon: Icon(Icons.star_rounded),
                label: 'Избранное',
              ),
            ],
          ),
        );
      },
    );
  }
}
