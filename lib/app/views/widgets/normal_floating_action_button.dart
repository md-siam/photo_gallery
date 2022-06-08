import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

/// This [NormalFloatingActionButton] class is custom Floating Action Button
/// class which will return a floating action button to the
/// photo gallery classes:
/// [DesktopGallery, MobileGallery, MobileGallery]
///
class NormalFloatingActionButton extends StatelessWidget {
  final bool _fabIsVisible;
  final ScrollController _scrollController;

  const NormalFloatingActionButton({
    Key? key,
    required bool fabIsVisible,
    required ScrollController scrollController,
  })  : _fabIsVisible = fabIsVisible,
        _scrollController = scrollController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: _fabIsVisible ? 1 : 0,
      child: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey,
                Colors.blueGrey,
              ],
            ),
          ),
          child: const Icon(
            IcoFontIcons.arrowUp,
            color: Colors.white,
            size: 30,
          ),
        ),
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
