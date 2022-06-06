import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final int index;
  final int width;
  final int height;
  final String imageUrl;

  const ImageTile({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.cover,
    );
  }
}
