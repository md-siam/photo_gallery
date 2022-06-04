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
        //backgroundColor: Colors.black26,
        //secondaryHeaderColor: Colors.white10,
        //cardColor: Colors.black12,
      ),
      //home: const HomeView(),
      home: const SplashView(),
    );
  }
}

/// This [HomeView] widget is for testing
///  
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
