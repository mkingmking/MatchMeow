import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class Logo extends StatelessWidget {
  const Logo(this.isWhite, this.isBg, {super.key});

  final bool isWhite;
  final bool isBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isBg ? local_colors.darkGrayColor : null,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text(
        'MatchMeow',
        style: TextStyle(
          color: isWhite ? local_colors.whiteColor : local_colors.darkGrayColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
