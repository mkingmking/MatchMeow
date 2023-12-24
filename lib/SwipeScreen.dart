import "./constants/colors.dart" as local_colors;
import './widgets/card_overlay.dart';
import './widgets/example_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

const _images = [
  './images/image_5.jpg',
  './images/image_3.jpg',
  './images/image_4.jpg',
];

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: local_colors.darkGrayColor,
      appBar: AppBar(
        title: const Text('Match Your Meow!'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SwipableStack(
                  controller: _controller,
                  stackClipBehaviour: Clip.none,
                  allowVerticalSwipe: false,
                  onWillMoveNext: (index, swipeDirection) {
                    // Return true for the desired swipe direction.
                    switch (swipeDirection) {
                      case SwipeDirection.left:
                      case SwipeDirection.right:
                        return true;
                      case SwipeDirection.up:
                      case SwipeDirection.down:
                        return false;
                    }
                  },
                  onSwipeCompleted: (index, direction) {
                    if (kDebugMode) {
                      print('$index, $direction');
                    }
                  },
                  horizontalSwipeThreshold: 0.8,
                  // Set max value to ignore vertical threshold.
                  verticalSwipeThreshold: 1,
                  overlayBuilder: (
                    context,
                    properties,
                  ) =>
                      CardOverlay(
                    swipeProgress: properties.swipeProgress,
                    direction: properties.direction,
                  ),
                  builder: (context, properties) {
                    final itemIndex = properties.index % _images.length;
                    return ExampleCard(
                      name: 'Sample No.${itemIndex + 1}',
                      sex: 'Erkek',
                      age: 4,
                      castrated: true,
                      healthProblems: true,
                      character: '',
                      info: '',
                      assetPath: _images[itemIndex],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
