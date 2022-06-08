import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../widgets/widgets.dart';

/// This [MobileInteractiveView] class will display one image with
/// `zoom`, `share` & `download` functionality.
///
class MobileInteractiveView extends StatefulWidget {
  final String imageUrl;
  const MobileInteractiveView({
    Key? key,
    required this.imageUrl,
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
      // appBar: AppBar(
      //   title: const Text('Mobile'),
      //   actions: [
      //     IconButton(
      //       onPressed: _animateResetInitialize,
      //       icon: const Icon(Icons.restart_alt),
      //     ),
      //   ],
      // ),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.contain,
                      ),
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
                profileImage: widget.imageUrl,
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
              icon2SnackBarMessage: 'Share Complete',
              icon3SnackBarMessage: 'Download Complete',
              onIcon1Tap: () {
                _animateResetInitialize();
              },
              onIcon2Tap: () {
                // TODO: Image share functionality
                debugPrint('Second Button');
              },
              onIcon3Tap: () {
                // TODO: Image download functionality
                debugPrint('Third Button');
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
