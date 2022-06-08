import 'package:flutter/material.dart';

import 'components/circular_button.dart';

/// This [AnimatedFloatingActionButton] class is custom button class which
/// will return a floating action button for for the
/// interactive view classes:
/// [DesktopInteractiveView, MobileInteractiveView, TabletInteractiveView]
///

class AnimatedFloatingActionButton extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final Color icon1Background;
  final Color icon2Background;
  final Color icon3Background;
  final GestureTapCallback onIcon1Tap;
  final GestureTapCallback onIcon2Tap;
  final GestureTapCallback onIcon3Tap;
  final String icon1SnackBarMessage;
  final String icon2SnackBarMessage;
  final String icon3SnackBarMessage;

  const AnimatedFloatingActionButton({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon1Background,
    required this.icon2Background,
    required this.icon3Background,
    required this.onIcon1Tap,
    required this.onIcon2Tap,
    required this.onIcon3Tap,
    required this.icon1SnackBarMessage,
    required this.icon2SnackBarMessage,
    required this.icon3SnackBarMessage,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedFloatingActionButtonState createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Animation? degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  // method for Animated icon
  bool menuOpen = false;
  void _iconTapped() {
    if (menuOpen == false) {
      animationController.forward();
      menuOpen = true;
    } else {
      animationController.reverse();
      menuOpen = false;
    }
  }

  // method for displaying snackBar
  snackBar(String message) {
    return SnackBar(
      backgroundColor: Colors.white.withOpacity(0.4),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            right: 30,
            bottom: 30,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                IgnorePointer(
                  child: Container(
                    color: Colors.transparent,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degOneTranslationAnimation!.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation!.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      width: 50,
                      height: 50,
                      color: widget.icon1Background,
                      icon: Icon(widget.icon1, color: Colors.white),
                      onClick: () {
                        widget.onIcon1Tap();
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(widget.icon1SnackBarMessage),
                        );
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(225),
                      degTwoTranslationAnimation!.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation!.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      width: 50,
                      height: 50,
                      color: widget.icon2Background,
                      icon: Icon(widget.icon2, color: Colors.white),
                      onClick: () {
                        widget.onIcon2Tap();
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(widget.icon2SnackBarMessage),
                        );
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degThreeTranslationAnimation!.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degThreeTranslationAnimation!.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      width: 50,
                      height: 50,
                      color: widget.icon3Background,
                      icon: Icon(widget.icon3, color: Colors.white),
                      onClick: () {
                        widget.onIcon3Tap();
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(widget.icon3SnackBarMessage),
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _iconTapped,
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    elevation: 10,
                    child: Container(
                      width: 65,
                      height: 65,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          // gradient effect
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.grey.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                          // child
                          Center(
                            child: AnimatedIcon(
                              color: Colors.white,
                              icon: AnimatedIcons.menu_close,
                              size: 30,
                              progress: animationController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
