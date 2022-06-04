import 'package:flutter/material.dart';

import '../../layout/responsive_layout.dart';
import '../views.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0A),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/intro/mobile_intro_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Text(
              'Explore your\nPhoto Gallery.',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 150,
            left: 20,
            child: Text(
              'Powered by unsplash API.',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
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
                          )),
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
