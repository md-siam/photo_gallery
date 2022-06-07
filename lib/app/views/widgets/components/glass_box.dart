import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const GlassBox({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cornerCurve = 16;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(cornerCurve),
        bottomRight: Radius.circular(cornerCurve),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(),
            ),

            // gradient effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(cornerCurve),
                  bottomRight: Radius.circular(cornerCurve),
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
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
