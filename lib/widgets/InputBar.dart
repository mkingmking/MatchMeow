import 'package:flutter/material.dart';

class InputBar extends StatelessWidget {
  const InputBar({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFBD1940)),
      child: const Center(
        child: Text('Hellooo World!'),
      ),
    );
  }
}
