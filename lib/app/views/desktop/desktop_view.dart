import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../layout/responsive_layout.dart';
import '../views.dart';

/// This [DesktopView] class will display the intro screen for the
/// desktop layout
///
class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/intro/desktop_intro_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Text(
              'Explore your Photo Gallery.',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Powered by',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('unsplash API'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.deepOrangeAccent,
                side: const BorderSide(
                  width: 2.0,
                  color: Colors.orangeAccent,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ResponsiveLayout(
                      mobileBody: MobileGallery(),
                      tabletBody: TabletGallery(),
                      desktopBody: DesktopGallery(),
                    ),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
