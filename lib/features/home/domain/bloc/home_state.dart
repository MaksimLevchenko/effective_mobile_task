import '../../../../core/models/api/api_character.dart';

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
    );
  }
}
