import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../controllers/dummy_controller.dart';
import '../widgets/widgets.dart';

/// This [MobileGallery] class will display a staggered grid view of all
/// the images from `https://unsplash.com/` API calls.
///
class MobileGallery extends StatefulWidget {
  const MobileGallery({Key? key}) : super(key: key);

  @override
  State<MobileGallery> createState() => _MobileGalleryState();
}

class _MobileGalleryState extends State<MobileGallery> {
  late final ScrollController _scrollController;
  bool _isConnected = false;
  bool _fabIsVisible = false;
  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        log(err.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _checkInternetConnection();
    }
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _fabIsVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(_isConnected);
    return Scaffold(
      body: SafeArea(
        child: (!kIsWeb)
            ? _isConnected
                ? StaggeredGridViewMobile(
                    scrollController: _scrollController,
                    pattern: pattern,
                  )
                : const NoInternetConnection(
                    iconSize: 60,
                    textSize: 20,
                  )
            : StaggeredGridViewMobile(
                scrollController: _scrollController,
                pattern: pattern,
              ),
      ),
      floatingActionButton: NormalFloatingActionButton(
        fabIsVisible: _fabIsVisible,
        scrollController: _scrollController,
      ),
    );
  }
}

/// this [StaggeredGridViewMobile] widget will execute
/// the fancy grid view of the IU
///
class StaggeredGridViewMobile extends StatelessWidget {
  final ScrollController _scrollController;
  final List<QuiltedGridTile> pattern;

  const StaggeredGridViewMobile({
    Key? key,
    required ScrollController scrollController,
    required this.pattern,
  })  : _scrollController = scrollController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
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
    );
  }
}
