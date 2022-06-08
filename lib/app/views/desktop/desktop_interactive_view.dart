import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../widgets/animated_floating_action_button.dart';
import '../widgets/app_bar.dart';

class DesktopInteractiveView extends StatefulWidget {
  final String imageUrl;
  const DesktopInteractiveView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<DesktopInteractiveView> createState() => _DesktopInteractiveViewState();
}

class _DesktopInteractiveViewState extends State<DesktopInteractiveView>
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
              onIcon1Tap: () {
                _animateResetInitialize();
              },
              onIcon2Tap: () {
                debugPrint('Second Button');
              },
              onIcon3Tap: () {
                debugPrint('Third Button');
              },
            ),
          ],
        ),
      ),
    );
  }
}
