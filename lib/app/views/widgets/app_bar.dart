import 'package:flutter/material.dart';

import 'components/glass_box.dart';

class MyAppBar extends StatelessWidget {
  final bool userPicAvailable;
  final bool backNavAvailable;
  const MyAppBar({
    Key? key,
    required this.userPicAvailable,
    required this.backNavAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        // clipBehavior helps to display profile pic like that
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          GlassBox(
            height: 85,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backNavAvailable
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.grey,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          userPicAvailable
              ? Positioned(
                  top: 20,
                  child: Container(
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
                      child: Image.asset(
                        'assets/images/default/user.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
