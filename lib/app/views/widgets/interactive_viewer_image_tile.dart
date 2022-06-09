import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class InteractiveViewerImageTile extends StatelessWidget {
  final String imageUrl;
  final String blurHash;

  const InteractiveViewerImageTile({
    Key? key,
    required this.imageUrl,
    required this.blurHash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: BlurHash(
        hash: blurHash,
        image: imageUrl,
        imageFit: BoxFit.contain,
      ),
    );
  }
}
