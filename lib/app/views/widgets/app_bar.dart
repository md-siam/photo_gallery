import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import 'components/glass_box.dart';

/// This [MyAppBar] class is return a custom frosted glass app bar
/// for the interactive view classes, which are:
/// [DesktopInteractiveView, MobileInteractiveView, TabletInteractiveView]
///
class MyAppBar extends StatelessWidget {
  final double height;
  final String username;
  final String location;
  final String userImageUrl;
  const MyAppBar({
    Key? key,
    required this.height,
    required this.username,
    required this.location,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 21,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlassBox(
        height: height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.white,
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$username: ',
                            style: textStyle,
                          ),
                          const Icon(IcoFontIcons.infoCircle)
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Text(
                            '$location: ',
                            style: textStyle.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const Icon(
                            IcoFontIcons.locationPin,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 25.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        userImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
