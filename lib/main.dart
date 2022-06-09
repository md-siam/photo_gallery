// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/layout/responsive_layout.dart';
import 'app/providers/photo_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MultiPhotoProvider()),
      ],
      child: MaterialApp(
        title: 'Photo Gallery',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0B0B0A),
        ),
        home: const SplashView(),

        /// this is for `testing` purpose
        //home: const ResponsiveView(),
        
      ),
    );
  }
}

/// This [ResponsiveView] class is for skipping the [SplashView] screen
/// for a quick jump to the `intro` screen, for reducing the overall
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
