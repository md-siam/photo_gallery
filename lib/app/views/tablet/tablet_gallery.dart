import 'package:flutter/material.dart';

class TabletGallery extends StatefulWidget {
  const TabletGallery({Key? key}) : super(key: key);

  @override
  State<TabletGallery> createState() => _TabletGalleryState();
}

class _TabletGalleryState extends State<TabletGallery> {
  double? size;
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size.width;
    });
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0A),
      appBar: AppBar(title: const Text('Tablet')),
      body: Center(
        child: Text(
          '$size',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
