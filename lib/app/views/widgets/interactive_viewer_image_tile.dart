import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InteractiveViewerImageTile extends StatelessWidget {
  final String widget;

  const InteractiveViewerImageTile({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: CachedNetworkImage(
        key: UniqueKey(),
        imageUrl: widget,
        fit: BoxFit.contain,
        placeholder: (context, url) => Center(
          child: Image.asset(
            'assets/images/placeholder/image_coming_soon.png',
            fit: BoxFit.cover,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 25,
                color: Colors.red[400],
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Error occurred while\nloading..',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
