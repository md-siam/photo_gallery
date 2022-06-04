import 'package:flutter/material.dart';

class MobileGallery extends StatefulWidget {
  const MobileGallery({Key? key}) : super(key: key);

  @override
  State<MobileGallery> createState() => _MobileGalleryState();
}

class _MobileGalleryState extends State<MobileGallery> {
  double? size;

  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size.width;
    });
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0A),
      appBar: AppBar(title: const Text('Mobile')),
      body: Center(
        child: Text(
          '$size',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
