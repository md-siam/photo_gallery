import 'package:flutter/material.dart';

import '../static/static_values.dart';

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
        if (constraints.maxWidth <= StaticValues.mobileBreakPointWidth) {
          return mobileBody;
        } else if (constraints.maxWidth <= StaticValues.tabletBreakPointWidth) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
