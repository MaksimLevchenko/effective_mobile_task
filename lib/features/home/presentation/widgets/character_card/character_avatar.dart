import 'package:flutter/material.dart';

import '../../../../../core/ui_kit/images/retryable_network_image.dart';

class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return RetryableNetworkImage(
      imageUrl: imageUrl,
      width: 94,
      height: 94,
      borderRadius: 16,
    );
  }
}
