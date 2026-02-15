import '../../../../core/models/api/api_character.dart';
import '../models/character_filters.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeState {
  const HomeState({
    this.status = HomeStatus.initial,
    this.characters = const <ApiCharacter>[],
    this.favorites = const <ApiCharacter>[],
    this.currentPage = 0,
    this.hasMore = true,
    this.activeTab = 0,
    this.isOfflineFallback = false,
    this.errorMessage,
    this.isLoadingMore = false,
    this.filterName = '',
    this.filterStatus = CharacterStatusFilter.any,
    this.filterGender = CharacterGenderFilter.any,
  });

  final HomeStatus status;
  final List<ApiCharacter> characters;
  final List<ApiCharacter> favorites;
  final int currentPage;
  final bool hasMore;
  final int activeTab;
  final bool isOfflineFallback;
  final String? errorMessage;
  final bool isLoadingMore;
  final String filterName;
  final CharacterStatusFilter filterStatus;
  final CharacterGenderFilter filterGender;

  bool get hasActiveFilters =>
      filterName.trim().isNotEmpty ||
      filterStatus != CharacterStatusFilter.any ||
      filterGender != CharacterGenderFilter.any;

  HomeState copyWith({
    HomeStatus? status,
    List<ApiCharacter>? characters,
    List<ApiCharacter>? favorites,
    int? currentPage,
    bool? hasMore,
    int? activeTab,
    bool? isOfflineFallback,
    String? errorMessage,
    bool clearError = false,
    bool? isLoadingMore,
    String? filterName,
    CharacterStatusFilter? filterStatus,
    CharacterGenderFilter? filterGender,
  }) {
    return HomeState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      favorites: favorites ?? this.favorites,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      activeTab: activeTab ?? this.activeTab,
      isOfflineFallback: isOfflineFallback ?? this.isOfflineFallback,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      filterName: filterName ?? this.filterName,
      filterStatus: filterStatus ?? this.filterStatus,
      filterGender: filterGender ?? this.filterGender,
    );
  }
}
