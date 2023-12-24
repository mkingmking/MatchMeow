import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class NoticeAndSearchButtons extends StatelessWidget {
  const NoticeAndSearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
                "Button 1", local_colors.mainColor, Colors.transparent),
            _buildButton(
                "Button 2", local_colors.whiteColor, local_colors.mainColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
                "Button 3", local_colors.mainColor, Colors.transparent),
            _buildButton(
                "Button 4", local_colors.whiteColor, local_colors.mainColor),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color borderColor, Color bgColor) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          // Add your button click logic here
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        child: Text(text),
      ),
    );
  }
}
