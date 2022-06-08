import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/photo_provider.dart';
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
    final photoModel = Provider.of<MultiPhotoProvider>(context, listen: false);
    photoModel.getPhotoData();
    
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
                ? Consumer<MultiPhotoProvider>(
                    builder: (context, photoModel, child) {
                    return photoModel.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : StaggeredGridViewTablet(
                            scrollController: _scrollController,
                            pattern: pattern,
                            photoModel: photoModel,
                          );
                  })
                : const NoInternetConnection(
                    iconSize: 60,
                    textSize: 30,
                  )
            : Consumer<MultiPhotoProvider>(
                builder: (context, photoModel, child) {
                return photoModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : StaggeredGridViewTablet(
                        scrollController: _scrollController,
                        pattern: pattern,
                        photoModel: photoModel,
                      );
              }),
      ),
      floatingActionButton: NormalFloatingActionButton(
        leftIcon: IcoFontIcons.uiDelete,
        rightIcon: IcoFontIcons.arrowUp,
        fabIsVisible: _fabIsVisible,
        scrollController: _scrollController,
        onLeftIconTap: () {
          cleanCacheMobile();
        },
        onRightIconTap: () {
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
      ),
    );
  }

  /// methods for cleaning `Image Cache files`
  ///
  void cleanCacheMobile() {
    DefaultCacheManager().emptyCache();
    imageCache.clear();
    imageCache.clearLiveImages();
    setState(() {});
  }
}

/// this [StaggeredGridViewTablet] widget will execute
/// the fancy grid view of the IU
///
class StaggeredGridViewTablet extends StatelessWidget {
  final ScrollController _scrollController;
  final List<QuiltedGridTile> pattern;
  final MultiPhotoProvider photoModel;

  const StaggeredGridViewTablet({
    Key? key,
    required ScrollController scrollController,
    required this.pattern,
    required this.photoModel,
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
          username:
              '${photoModel.photoList?[index].user?.firstName ?? ''} ${photoModel.photoList?[index].user?.lastName ?? ''}',
          location:
              // ignore: unnecessary_string_interpolations
              '${photoModel.photoList?[index].user?.location ?? 'Unknown'}',
          userImageUrl:
              '${photoModel.photoList?[index].user?.profileImage?.large}',
          thumbnailUrl: '${photoModel.photoList?[index].urls?.thumb}',
          fullResolutionImageUrl: '${photoModel.photoList?[index].urls?.full}',
        ),
        childCount: photoModel.photoList!.length,
      ),
    );
  }
}
