import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../controllers/dummy_controller.dart';
import '../widgets/widgets.dart';

/// This [TabletGallery] class will display a staggered grid view of all
/// the images from `https://unsplash.com/` API calls.
///
class TabletGallery extends StatefulWidget {
  const TabletGallery({Key? key}) : super(key: key);

  @override
  State<TabletGallery> createState() => _TabletGalleryState();
}

class _TabletGalleryState extends State<TabletGallery> {
  late final ScrollController _scrollController;
  bool _isConnected = false;
  bool _fabIsVisible = false;
  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
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
    return Scaffold(
      body: SafeArea(
        child: (!kIsWeb)
            ? _isConnected
                ? StaggeredGridViewTablet(
                    scrollController: _scrollController,
                    pattern: pattern,
                  )
                : const NoInternetConnection(
                    iconSize: 60,
                    textSize: 30,
                  )
            : StaggeredGridViewTablet(
                scrollController: _scrollController,
                pattern: pattern,
              ),
      ),
      floatingActionButton: NormalFloatingActionButton(
        leftIcon: IcoFontIcons.uiDelete,
        rightIcon: IcoFontIcons.arrowUp,
        fabIsVisible: _fabIsVisible,
        scrollController: _scrollController,
        onLeftIconTap: () {
          //TODO: Delete cache files
          print('Cache clean');
        },
        onRightIconTap: () {
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}

/// this [StaggeredGridViewTablet] widget will execute
/// the fancy grid view of the IU
///
class StaggeredGridViewTablet extends StatelessWidget {
  final ScrollController _scrollController;
  final List<QuiltedGridTile> pattern;

  const StaggeredGridViewTablet({
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
        crossAxisCount: 6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
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
