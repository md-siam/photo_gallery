import 'package:flutter/material.dart';

/// this [NoInternetConnectionMobile] widget will only execute
/// when no internet `_isConnected` is false in
/// classes: [MobileGallery] & in [TabletGallery].
///
class NoInternetConnection extends StatelessWidget {
  final double iconSize;
  final double textSize;
  const NoInternetConnection({
    Key? key,
    required this.iconSize,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: iconSize,
            color: Colors.grey,
          ),
          const SizedBox(height: 30),
          Text(
            'No Internet Connection..',
            style: TextStyle(
              fontSize: textSize,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
