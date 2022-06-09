import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

import '../../notifier/fab_visibility_notifier.dart';
import '../../providers/photo_provider.dart';
import '../widgets/widgets.dart';

/// This [DesktopGallery] class will display a staggered grid view of all
/// the images from `https://unsplash.com/` API calls.
///
class DesktopGallery extends StatefulWidget {
  const DesktopGallery({Key? key}) : super(key: key);

  @override
  State<DesktopGallery> createState() => _DesktopGalleryState();
}

class _DesktopGalleryState extends State<DesktopGallery> {
  late final ScrollController _scrollController;
  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    final photoModel = Provider.of<MultiPhotoProvider>(context, listen: false);
    photoModel.getPhotoData();

    /// This listener will listen to the scroll position and will be
    /// triggered at the end of the scroll for fetching more photos
    /// Hence, provide the feel of `unlimited` photo scrolling,
    ///
    _scrollController.addListener(() {
      //print('addListener');
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        photoModel.getMorePhotoData();

        fabVisibleState.isFabVisible.value = false;
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        fabVisibleState.isFabVisible.value = true;
      } else {
        fabVisibleState.isFabVisible.value = false;
      }
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
      appBar: AppBar(title: const Text('Desktop')),
      body: Consumer<MultiPhotoProvider>(builder: (context, photoModel, child) {
        return photoModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : StaggeredGridViewDesktop(
                scrollController: _scrollController,
                pattern: pattern,
                photoModel: photoModel,
              );
      }),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: fabVisibleState.isFabVisible,
        builder: (BuildContext context, dynamic notifiedValue, Widget? child) {
          return NormalFloatingActionButton(
            leftIcon: IcoFontIcons.uiDelete,
            rightIcon: IcoFontIcons.arrowUp,
            fabIsVisible: notifiedValue,
            scrollController: _scrollController,
            onLeftIconTap: () {
              cleanCacheDesktop();
            },
            onRightIconTap: () {
              _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
          );
        },
      ),
    );
  }

  /// methods for cleaning `Image Cache files`
  ///
  void cleanCacheDesktop() {
    DefaultCacheManager().emptyCache();
    imageCache.clear();
    imageCache.clearLiveImages();
    setState(() {});
  }
}

/// this [StaggeredGridViewDesktop] widget will always execute
///
class StaggeredGridViewDesktop extends StatelessWidget {
  final ScrollController _scrollController;
  final List<QuiltedGridTile> pattern;
  final MultiPhotoProvider photoModel;

  const StaggeredGridViewDesktop({
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
        crossAxisCount: 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
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
          thumbnailUrl: '${photoModel.photoList?[index].urls?.regular}',
          fullResolutionImageUrl: '${photoModel.photoList?[index].urls?.full}',
        ),
        childCount: photoModel.photoList!.length,
      ),
    );
  }
}
