import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/api/api_character.dart';
import '../../../../core/services/character_service.dart';
import '../../../../core/services/rick_and_morty_api_service.dart';
import '../models/character_filters.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CharacterService characterService,
  }) : _characterService = characterService,
       super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeNextPageRequested>(_onNextPageRequested);
    on<HomeRefreshRequested>(_onRefreshRequested);
    on<HomeFavoriteToggled>(_onFavoriteToggled);
    on<HomeTabChanged>(_onTabChanged);
    on<HomeFiltersUpdated>(_onFiltersUpdated);
  }

  final CharacterService _characterService;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    await _loadFirstPage(emit);
  }

  Future<void> _onRefreshRequested(
    HomeRefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    await _loadFirstPage(emit);
  }

  Future<void> _onNextPageRequested(
    HomeNextPageRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.isLoadingMore ||
        !state.hasMore ||
        state.status == HomeStatus.loading) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true, clearError: true));
    try {
      final nextPage = state.currentPage + 1;
      final result = await _characterService.getCharacters(
        page: nextPage,
        name: _effectiveOrNull(state.filterName),
        status: state.filterStatus.apiValue,
        gender: state.filterGender.apiValue,
      );
      final favorites = await _characterService.getFavorites();
      final mergedCharacters = _mergeUniqueById(
        state.characters,
        result.page.results,
      );

      emit(
        state.copyWith(
          status: HomeStatus.success,
          characters: mergedCharacters,
          favorites: favorites,
          currentPage: nextPage,
          hasMore: result.page.info.next != null,
          isOfflineFallback: result.isOfflineFallback,
          isLoadingMore: false,
          clearError: true,
        ),
      );
    } on RickAndMortyApiException catch (error) {
      emit(state.copyWith(isLoadingMore: false, errorMessage: error.message));
    } catch (error) {
      emit(
        state.copyWith(
          isLoadingMore: false,
          errorMessage: 'Непредвиденная ошибка: $error',
        ),
      );
    }
  }

  Future<void> _onFavoriteToggled(
    HomeFavoriteToggled event,
    Emitter<HomeState> emit,
  ) async {
    final changed = await _characterService.toggleFavorite(event.characterId);
    if (!changed) {
      return;
    }

    final favorites = await _characterService.getFavorites();
    emit(state.copyWith(favorites: favorites, clearError: true));
  }

  void _onTabChanged(HomeTabChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(activeTab: event.tabIndex, clearError: true));
  }

  Future<void> _onFiltersUpdated(
    HomeFiltersUpdated event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        filterName: event.name,
        filterStatus: event.status,
        filterGender: event.gender,
        clearError: true,
      ),
    );
    await _loadFirstPage(emit);
  }

  Future<void> _loadFirstPage(Emitter<HomeState> emit) async {
    final previousCharacters = state.characters;
    final previousFavorites = state.favorites;
    final previousPage = state.currentPage;

    emit(
      state.copyWith(
        status: HomeStatus.loading,
        currentPage: 0,
        hasMore: true,
        isOfflineFallback: false,
        isLoadingMore: false,
        clearError: true,
      ),
    );

    try {
      final result = await _characterService.getCharacters(
        page: 1,
        name: _effectiveOrNull(state.filterName),
        status: state.filterStatus.apiValue,
        gender: state.filterGender.apiValue,
      );
      final favorites = await _characterService.getFavorites();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          characters: result.page.results,
          favorites: favorites,
          currentPage: 1,
          hasMore: result.page.info.next != null,
          isOfflineFallback: result.isOfflineFallback,
          isLoadingMore: false,
          clearError: true,
        ),
      );
    } on RickAndMortyApiException catch (error) {
      if (previousCharacters.isNotEmpty) {
        emit(
          state.copyWith(
            status: HomeStatus.success,
            characters: previousCharacters,
            favorites: previousFavorites,
            currentPage: previousPage,
            errorMessage: error.message,
            isLoadingMore: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          characters: const <ApiCharacter>[],
          favorites: const <ApiCharacter>[],
          errorMessage: error.message,
          isLoadingMore: false,
        ),
      );
    } catch (error) {
      if (previousCharacters.isNotEmpty) {
        emit(
          state.copyWith(
            status: HomeStatus.success,
            characters: previousCharacters,
            favorites: previousFavorites,
            currentPage: previousPage,
            errorMessage: 'Непредвиденная ошибка: $error',
            isLoadingMore: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          characters: const <ApiCharacter>[],
          favorites: const <ApiCharacter>[],
          errorMessage: 'Непредвиденная ошибка: $error',
          isLoadingMore: false,
        ),
      );
    }
  }

  static List<ApiCharacter> _mergeUniqueById(
    List<ApiCharacter> current,
    List<ApiCharacter> incoming,
  ) {
    final byId = <int, ApiCharacter>{
      for (final character in current) character.id: character,
    };
    for (final character in incoming) {
      byId[character.id] = character;
    }

    final merged = byId.values.toList(growable: false)
      ..sort((a, b) => a.id.compareTo(b.id));
    return merged;
  }

  static String? _effectiveOrNull(String value) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      return null;
    }
    return normalized;
  }
}
