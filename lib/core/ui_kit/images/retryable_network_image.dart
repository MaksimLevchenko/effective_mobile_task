import 'package:flutter/material.dart';

class RetryableNetworkImage extends StatefulWidget {
  const RetryableNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
    this.loadTimeout = const Duration(seconds: 10),
    this.emptyIcon = Icons.image_not_supported_outlined,
    this.timeoutIcon = Icons.cloud_off_rounded,
    this.errorIcon = Icons.broken_image_outlined,
    this.showRetryBadge = true,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final Duration loadTimeout;
  final IconData emptyIcon;
  final IconData timeoutIcon;
  final IconData errorIcon;
  final bool showRetryBadge;

  @override
  State<RetryableNetworkImage> createState() => _RetryableNetworkImageState();
}

class _RetryableNetworkImageState extends State<RetryableNetworkImage> {
  static final Map<String, ImageProvider<Object>> _providerCache =
      <String, ImageProvider<Object>>{};

  bool _isLoaded = false;
  bool _hasError = false;
  bool _timedOut = false;
  int _retryTick = 0;

  @override
  void initState() {
    super.initState();
    _armTimeout();
  }

  @override
  void didUpdateWidget(covariant RetryableNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _isLoaded = false;
      _hasError = false;
      _timedOut = false;
      _armTimeout();
    }
  }

  ImageProvider<Object> _providerFor(String url) {
    return _providerCache.putIfAbsent(url, () => NetworkImage(url));
  }

  void _armTimeout() {
    Future<void>.delayed(widget.loadTimeout, () {
      if (!mounted || _isLoaded || _hasError || _timedOut) {
        return;
      }
      setState(() {
        _timedOut = true;
      });
    });
  }

  void _retryLoad(String url) {
    if (url.isEmpty) {
      return;
    }
    final provider = _providerCache.remove(url) ?? NetworkImage(url);
    PaintingBinding.instance.imageCache.evict(provider);
    setState(() {
      _isLoaded = false;
      _hasError = false;
      _timedOut = false;
      _retryTick++;
    });
    _armTimeout();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final normalizedImageUrl = widget.imageUrl.trim();
    final imageProvider = normalizedImageUrl.isEmpty
        ? null
        : _providerFor(normalizedImageUrl);

    Widget fallbackIcon({required IconData icon, required bool retryable}) {
      final content = ColoredBox(
        color: colors.surfaceContainerHigh,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: colors.onSurfaceVariant),
            if (retryable && widget.showRetryBadge)
              Positioned(
                right: 6,
                bottom: 6,
                child: Icon(
                  Icons.refresh_rounded,
                  size: 13,
                  color: colors.onSurfaceVariant,
                ),
              ),
          ],
        ),
      );

      if (!retryable) {
        return content;
      }

      return InkWell(
        onTap: () => _retryLoad(normalizedImageUrl),
        child: content,
      );
    }

    final image = normalizedImageUrl.isEmpty
        ? fallbackIcon(icon: widget.emptyIcon, retryable: false)
        : _timedOut
        ? fallbackIcon(icon: widget.timeoutIcon, retryable: true)
        : Image(
            key: ValueKey('retryable_image_${widget.imageUrl}_$_retryTick'),
            image: imageProvider!,
            fit: widget.fit,
            gaplessPlayback: true,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                if (!_isLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted || _isLoaded) {
                      return;
                    }
                    setState(() {
                      _isLoaded = true;
                    });
                  });
                }
                return child;
              }
              return ColoredBox(
                color: colors.surfaceContainerHigh,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              if (!_hasError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted || _hasError) {
                    return;
                  }
                  setState(() {
                    _hasError = true;
                  });
                });
              }
              return fallbackIcon(icon: widget.errorIcon, retryable: true);
            },
          );

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: image,
      ),
    );
  }
}
