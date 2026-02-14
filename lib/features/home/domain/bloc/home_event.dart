abstract class HomeEvent {
  const HomeEvent();
}

class HomeStarted extends HomeEvent {
  const HomeStarted();
}

class HomeNextPageRequested extends HomeEvent {
  const HomeNextPageRequested();
}

class HomeRefreshRequested extends HomeEvent {
  const HomeRefreshRequested();
}

class HomeFavoriteToggled extends HomeEvent {
  const HomeFavoriteToggled(this.characterId);

  final int characterId;
}

class HomeTabChanged extends HomeEvent {
  const HomeTabChanged(this.tabIndex);

  final int tabIndex;
}
