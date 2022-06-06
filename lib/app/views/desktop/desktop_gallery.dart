import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../controllers/dummy_data.dart';
import '../widgets/image_time.dart';

class DesktopGallery extends StatefulWidget {
  const DesktopGallery({Key? key}) : super(key: key);

  @override
  State<DesktopGallery> createState() => _DesktopGalleryState();
}

class _DesktopGalleryState extends State<DesktopGallery> {
  final ScrollController _scrollController = ScrollController();
  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desktop')),
      body: GridView.custom(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 8,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          //repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: pattern,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => ImageTile(
            index: index,
            width: pattern[index % pattern.length].crossAxisCount * 100,
            height: pattern[index % pattern.length].mainAxisCount * 100,
            imageUrl: breakingBadData[index].pictureUrl,
          ),
          childCount: breakingBadData.length,
        ),
      ),
    );
  }
}
