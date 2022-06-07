import 'package:flutter/material.dart';

import 'components/glass_box.dart';

class MyAppBar extends StatelessWidget {
  final double height;
  final String profileImage;
  const MyAppBar({
    Key? key,
    required this.height,
    required this.profileImage,
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
                      Text(
                        'Full Name:',
                        style: textStyle,
                      ),
                      Text(
                        'Location:',
                        style: textStyle.copyWith(color: Colors.grey),
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
                        profileImage,
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
