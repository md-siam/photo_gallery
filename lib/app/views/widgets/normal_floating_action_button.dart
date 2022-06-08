import 'package:flutter/material.dart';

/// This [NormalFloatingActionButton] class is custom Floating Action Button
/// class which will return two floating action buttons on left & right
/// to the photo gallery classes:
/// [DesktopGallery, MobileGallery, MobileGallery]
///
class NormalFloatingActionButton extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final GestureTapCallback onLeftIconTap;
  final GestureTapCallback onRightIconTap;
  final bool _fabIsVisible;
  //final ScrollController _scrollController;

  const NormalFloatingActionButton({
    Key? key,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeftIconTap,
    required this.onRightIconTap,
    required bool fabIsVisible,
    required ScrollController scrollController,
  })  : _fabIsVisible = fabIsVisible,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // method if for displaying snackBar
    snackBar() {
      return SnackBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        content: const Text(
          'Image Cache Cleaned!',
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.orange,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: _fabIsVisible ? 1 : 0,
            child: FloatingActionButton(
              heroTag: 'btn1',
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
                child: Icon(
                  leftIcon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              onPressed: () {
                onLeftIconTap();
                ScaffoldMessenger.of(context).showSnackBar(snackBar());
              },
            ),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _fabIsVisible ? 1 : 0,
          child: FloatingActionButton(
            heroTag: 'btn2',
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
              child: Icon(
                rightIcon,
                color: Colors.white,
                size: 30,
              ),
            ),
            onPressed: () => onRightIconTap(),
          ),
        ),
      ],
    );
  }
}
