import 'package:flutter/material.dart';

class DesktopGallery extends StatefulWidget {
  const DesktopGallery({Key? key}) : super(key: key);

  @override
  State<DesktopGallery> createState() => _DesktopGalleryState();
}

class _DesktopGalleryState extends State<DesktopGallery> {
  double? size;

  @override
  Widget build(BuildContext context) {
     setState(() {
      size = MediaQuery.of(context).size.width;
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Desktop')),
      body: Center(
        child: Text(
          '$size',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
