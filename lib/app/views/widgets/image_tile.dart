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
          'assets/images/placeholder/image_coming_soon_transparent.png',
          width: width.toDouble(),
          height: height.toDouble(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
