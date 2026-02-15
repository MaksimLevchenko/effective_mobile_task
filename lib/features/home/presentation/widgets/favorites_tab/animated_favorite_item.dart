import 'package:flutter/material.dart';

import '../../../../../core/models/api/api_character.dart';
import '../character_card/character_card.dart';

class AnimatedFavoriteItem extends StatelessWidget {
  const AnimatedFavoriteItem({
    super.key,
    required this.character,
    required this.isRemoving,
    required this.removeDuration,
    required this.onRemovePressed,
  });

  final ApiCharacter character;
  final bool isRemoving;
  final Duration removeDuration;
  final VoidCallback onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: removeDuration,
      curve: Curves.easeInCubic,
      offset: isRemoving ? const Offset(0.12, 0) : Offset.zero,
      child: AnimatedOpacity(
        duration: removeDuration,
        curve: Curves.easeInCubic,
        opacity: isRemoving ? 0 : 1,
        child: TweenAnimationBuilder<double>(
          duration: removeDuration,
          curve: Curves.easeInOutCubic,
          tween: Tween<double>(begin: 1, end: isRemoving ? 0 : 1),
          child: CharacterCard(
            character: character,
            isFavorite: true,
            onFavoritePressed: onRemovePressed,
          ),
          builder: (context, value, child) {
            final heightFactor = value.clamp(0.0, 1.0);
            return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: heightFactor,
                child: IgnorePointer(
                  ignoring: isRemoving,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
