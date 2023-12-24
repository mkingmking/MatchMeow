import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class InputBar extends StatelessWidget {
  const InputBar(this.placeholderText, this.barController, {super.key});

  final String placeholderText;
  final TextEditingController barController;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextField(
        controller: barController,
        decoration: InputDecoration(
          filled: true,
          fillColor: local_colors.whiteColor,
          isDense: true, // Added this
          contentPadding: const EdgeInsets.all(8), // Added this
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: placeholderText,
        ),
      ),
    );
  }
}
