import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: local_colors.darkGrayColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationButton(
            icon: Icons.chat,
          ),
          BottomNavigationButton(
            icon: Icons.notifications,
          ),
          BottomNavigationButton(
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  final IconData icon;

  const BottomNavigationButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap
        // You can navigate to different screens or perform other actions here
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: local_colors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
