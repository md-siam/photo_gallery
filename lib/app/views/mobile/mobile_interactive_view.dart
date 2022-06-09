import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../helper/web_image_download_helper.dart';
import '../widgets/widgets.dart';

/// This [MobileInteractiveView] class will display one image with
/// `zoom`, `share` & `download` functionality.
///
class MobileInteractiveView extends StatefulWidget {
  final String username;
  final String location;
  final String userImageUrl;
  final String regularImageUrl;
  const MobileInteractiveView({
    Key? key,
    required this.username,
    required this.location,
    required this.userImageUrl,
    required this.regularImageUrl,
  }) : super(key: key);

  @override
  State<MobileInteractiveView> createState() => _MobileInteractiveViewState();
}

class _MobileInteractiveViewState extends State<MobileInteractiveView>
    with TickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;

  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

  void _shareAPhoto() async {
    String url = widget.regularImageUrl;

    try {
      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/image.jpg';
      // Dio() will download the image in tempDir
      await Dio().download(url, path);

      Share.shareFiles(
        [path],
        text: 'Username: ${widget.username}, Location: ${widget.location}',
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void _downloadAPhotoOnMobile() async {
    String url = widget.regularImageUrl;

    try {
      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/imageUrl.jpg';
      await Dio().download(url, path);

      await GallerySaver.saveImage(path, toDcim: true);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white.withOpacity(0.4),
          content: const Text(
            'Downloaded to your Photo Gallery!',
            style: TextStyle(color: Colors.white),
          ),
          action: SnackBarAction(
            label: 'Close',
            textColor: Colors.orange,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: InteractiveViewer(
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    maxScale: 50,
                    transformationController: _transformationController,
                    child: InteractiveViewerImageTile(
                      widget: widget.regularImageUrl,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 85,
              width: double.infinity,
              child: MyAppBar(
                height: 85,
                username: widget.username,
                location: widget.location,
                userImageUrl: widget.userImageUrl,
              ),
            ),
            AnimatedFloatingActionButton(
              icon1: IcoFontIcons.refresh,
              icon2: IcoFontIcons.share,
              icon3: IcoFontIcons.download,
              icon1Background: Colors.green,
              icon2Background: Colors.orange,
              icon3Background: Colors.purple,
              icon1SnackBarMessage: 'Zoom Reset',
              icon2SnackBarMessage: (!kIsWeb)
                  ? 'Wait till the share dialog pop up!'
                  : 'File sharing does not support web',
              icon3SnackBarMessage: 'Wait till the download complete!',
              onIcon1Tap: () {
                _animateResetInitialize();
              },
              onIcon2Tap: () {
                (!kIsWeb)
                    ? _shareAPhoto()
                    : log('File sharing does not support web');
              },
              onIcon3Tap: () {
                (!kIsWeb)
                    ? _downloadAPhotoOnMobile()
                    : downloadAPhotoOnWeb(widget.regularImageUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
