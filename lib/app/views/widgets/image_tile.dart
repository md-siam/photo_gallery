import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../layout/responsive_layout.dart';
import '../views.dart';

/// This [ImageTile] class will return an custom image card
/// of specific dimensions `width x height` - provided from the
/// class [DesktopGallery, MobileGallery, TabletGallery] classes.
/// If tapped on the image it will re-direct the user to their respected class(depends on ``ResponsiveLayout`` class):
/// [DesktopInteractiveView, MobileInteractiveView, & TabletInteractiveView]
///
/// In addition to that it is using `cached_network_image` package for
/// network image caching.
///
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ResponsiveLayout(
              mobileBody: MobileInteractiveView(imageUrl: imageUrl),
              tabletBody: TabletInteractiveView(imageUrl: imageUrl),
              desktopBody: DesktopInteractiveView(imageUrl: imageUrl),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: buildImage(),
      ),
    );
  }

  /// Implementation of `image cache` for Android, iOS & web
  ///
  Widget buildImage() {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: imageUrl,
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: Image.asset(
          'assets/images/placeholder/image_coming_soon.png',
          width: width.toDouble(),
          height: height.toDouble(),
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
    );
  }
}
