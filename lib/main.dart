// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
import 'package:flutter/material.dart';

import 'app/layout/responsive_layout.dart';
import 'app/splash/splash_view.dart';
import 'app/views/views.dart';

void main() {
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B0A),
      ),
      home: const ResponsiveView(), ///for `testing` purpose
      //home: const SplashView(),
    );
  }
}

/// This [ResponsiveView] widget is for skipping the
/// [SplashView] screen, hence it will reduce the overall
/// development time.
///
class ResponsiveView extends StatelessWidget {
  const ResponsiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileView(),
        tabletBody: TabletView(),
        desktopBody: DesktopView(),
      ),
    );
  }
}
