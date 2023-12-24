import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class LocationBars extends StatelessWidget {
  const LocationBars({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Icon(
            Icons.location_on,
            size: 30,
            color: local_colors.lightGrayColor,
          ),
        ),
        Expanded(
          flex: 5, // First field takes half the width
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: local_colors.whiteColor,
                isDense: true,
                contentPadding: EdgeInsets.only(left: 7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: local_colors.lightGrayColor,
                  ),
                ),
                hintText: 'Şehir',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7, // Second field takes full width
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: local_colors.whiteColor,
                isDense: true,
                contentPadding: EdgeInsets.only(left: 7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: local_colors.lightGrayColor,
                  ),
                ),
                hintText: 'İlçe',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
