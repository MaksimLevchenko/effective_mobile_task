import 'package:flutter/material.dart';

class FavoriteToggleButton extends StatefulWidget {
  const FavoriteToggleButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
  });

  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  State<FavoriteToggleButton> createState() => _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends State<FavoriteToggleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );
  }

  @override
  void didUpdateWidget(covariant FavoriteToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isFavorite = widget.isFavorite;
    final iconColor = isFavorite
        ? const Color(0xFFFFC329)
        : colors.onSurfaceVariant;

    return IconButton.filledTonal(
      onPressed: widget.onPressed,
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(40, 40),
      ),
      icon: SizedBox(
        width: 26,
        height: 26,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final progress = Curves.easeOutCubic.transform(_controller.value);
            final ringScale = 0.6 + (progress * 1.8);
            final ringOpacity = (1 - progress) * (isFavorite ? 0.45 : 0.3);

            return Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(
                  child: Transform.scale(
                    scale: ringScale,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: iconColor.withValues(alpha: ringOpacity),
                          width: isFavorite ? 2.2 : 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 420),
                  switchInCurve: Curves.easeOutBack,
                  switchOutCurve: Curves.easeInBack,
                  transitionBuilder: (child, animation) {
                    final turns = Tween<double>(
                      begin: isFavorite ? -0.17 : 0.17,
                      end: 0,
                    ).animate(animation);
                    final scale = Tween<double>(
                      begin: 0.72,
                      end: 1,
                    ).animate(animation);
                    return RotationTransition(
                      turns: turns,
                      child: ScaleTransition(scale: scale, child: child),
                    );
                  },
                  child: Icon(
                    isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                    key: ValueKey<bool>(isFavorite),
                    color: iconColor,
                    size: isFavorite ? 23 : 21,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
