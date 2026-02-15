import 'package:flutter/material.dart';

import '../../../../../core/models/api/api_character.dart';
import '../../../../../core/ui_kit/states/empty_state_view.dart';
import 'animated_favorite_item.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({
    super.key,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  final List<ApiCharacter> favorites;
  final ValueChanged<int> onFavoriteToggle;

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  static const Duration _removeDuration = Duration(milliseconds: 360);
  final Set<int> _removingIds = <int>{};

  @override
  void didUpdateWidget(covariant FavoritesTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_removingIds.isEmpty) {
      return;
    }

    final currentIds = widget.favorites.map((item) => item.id).toSet();
    _removingIds.removeWhere((id) => !currentIds.contains(id));
  }

  void _removeWithAnimation(int id) {
    if (_removingIds.contains(id)) {
      return;
    }
    setState(() {
      _removingIds.add(id);
    });

    Future<void>.delayed(_removeDuration, () {
      if (!mounted) {
        return;
      }
      widget.onFavoriteToggle(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favorites.isEmpty) {
      return const EmptyStateView(
        icon: Icons.star_border_rounded,
        title: 'Пока нет избранных',
        subtitle:
            'Нажмите на звезду в карточке, чтобы добавить персонажа сюда.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 6, bottom: 16),
      itemCount: widget.favorites.length,
      itemBuilder: (context, index) {
        final character = widget.favorites[index];
        return AnimatedFavoriteItem(
          key: ValueKey<int>(character.id),
          character: character,
          isRemoving: _removingIds.contains(character.id),
          removeDuration: _removeDuration,
          onRemovePressed: () => _removeWithAnimation(character.id),
        );
      },
    );
  }
}
