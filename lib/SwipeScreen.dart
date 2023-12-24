import "./constants/colors.dart" as local_colors;
import './widgets/card_overlay.dart';
import './widgets/example_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'EvcilHayvan.dart';
import 'AddPetPage.dart';

import 'package:firebase_database/firebase_database.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  late final SwipableStackController _controller;
  List<EvcilHayvan> pets = []; // List of pets

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
    _fetchPets();
  }

  void _fetchPets() async {
    DatabaseReference petsRef =
        FirebaseDatabase.instance.reference().child('evcilHayvanlar');
    DatabaseEvent event = await petsRef.once();
    List<EvcilHayvan> fetchedPets = [];

    if (event.snapshot.value != null && event.snapshot.value is Map) {
      Map<String, dynamic> values =
          Map<String, dynamic>.from(event.snapshot.value as Map);
      fetchedPets = values.values
          .map((e) => EvcilHayvan.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    }

    setState(() {
      pets = fetchedPets;
    });
  }

  void _listenController() {
    // Example: Print the current index of the swiped card
    print('Current index: ${_controller.currentIndex}');
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
                    if (direction == SwipeDirection.right) {
                      // User swiped right, add pet to their list
                      // add to database
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
                    if (pets.isEmpty) {
                      return Center(child: Text("No pets available"));
                    }

                    final itemIndex = properties.index % pets.length;
                    final currentPet = pets[itemIndex];

                    return ExampleCard(
                      name: currentPet.name,
                      sex: currentPet.sex,
                      age: currentPet.age,
                      castrated: currentPet.castrated,
                      specialNeed: currentPet.specialNeed,
                      characteristics: [], // TODO
                      imageUrl: currentPet.imageUrl,
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
