import 'package:flutter/material.dart';

import '../../../../core/models/api/api_character.dart';
import 'character_card.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({
    super.key,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  final List<ApiCharacter> favorites;
  final ValueChanged<int> onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_rounded,
                size: 46,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 10),
              Text(
                'No favorites yet',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Tap the star on characters to add them here.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 6, bottom: 16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final character = favorites[index];
        return CharacterCard(
          character: character,
          isFavorite: true,
          onFavoritePressed: () => onFavoriteToggle(character.id),
        );
      },
    );
  }
}
