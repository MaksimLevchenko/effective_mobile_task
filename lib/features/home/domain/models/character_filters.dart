enum CharacterStatusFilter { any, alive, dead, unknown }

enum CharacterGenderFilter { any, female, male, genderless, unknown }

extension CharacterStatusFilterApi on CharacterStatusFilter {
  String? get apiValue {
    switch (this) {
      case CharacterStatusFilter.any:
        return null;
      case CharacterStatusFilter.alive:
        return 'alive';
      case CharacterStatusFilter.dead:
        return 'dead';
      case CharacterStatusFilter.unknown:
        return 'unknown';
    }
  }
}

extension CharacterGenderFilterApi on CharacterGenderFilter {
  String? get apiValue {
    switch (this) {
      case CharacterGenderFilter.any:
        return null;
      case CharacterGenderFilter.female:
        return 'female';
      case CharacterGenderFilter.male:
        return 'male';
      case CharacterGenderFilter.genderless:
        return 'genderless';
      case CharacterGenderFilter.unknown:
        return 'unknown';
    }
  }
}

extension CharacterStatusFilterPresentation on CharacterStatusFilter {
  String get labelRu {
    switch (this) {
      case CharacterStatusFilter.any:
        return 'Любой';
      case CharacterStatusFilter.alive:
        return 'Жив';
      case CharacterStatusFilter.dead:
        return 'Мертв';
      case CharacterStatusFilter.unknown:
        return 'Неизвестно';
    }
  }
}

extension CharacterGenderFilterPresentation on CharacterGenderFilter {
  String get labelRu {
    switch (this) {
      case CharacterGenderFilter.any:
        return 'Любой';
      case CharacterGenderFilter.female:
        return 'Женщина';
      case CharacterGenderFilter.male:
        return 'Мужчина';
      case CharacterGenderFilter.genderless:
        return 'Без пола';
      case CharacterGenderFilter.unknown:
        return 'Неизвестно';
    }
  }
}

class CharacterFiltersText {
  static const String searchHint = 'Поиск по имени';
  static const String applyFiltersTooltip = 'Применить фильтры';
  static const String showFiltersTooltip = 'Показать фильтры';
  static const String hideFiltersTooltip = 'Скрыть фильтры';
  static const String statusTitle = 'Статус';
  static const String genderTitle = 'Пол';
  static const String resetFilters = 'Сбросить фильтры';
  static const String filtersApplied = 'Фильтры применены';
}
