import '../../../domain/models/character_filters.dart';

typedef FiltersChanged =
    void Function({
      required String name,
      required CharacterStatusFilter status,
      required CharacterGenderFilter gender,
    });
