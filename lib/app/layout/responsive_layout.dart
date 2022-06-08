import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// This [ResponsiveLayout] is for maintaining the responsive
/// behavior of the overall application. It will do this by using
/// three Widget properties: `mobileBody`, `tabletBody`, & `desktopBody`
///
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= mobileWidth) {
          return mobileBody;
        } else if (constraints.maxWidth <= tabletWidth) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
