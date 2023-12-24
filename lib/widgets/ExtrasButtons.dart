import 'package:flutter/material.dart';
import 'package:proje1/newsPage.dart';
import '../constants/colors.dart' as local_colors;

import "../DonationScreen.dart" as donation_screen;

class ExtrasButtons extends StatelessWidget {
  const ExtrasButtons({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: local_colors.lightPinkColor,
        border: Border.all(
          color: local_colors.lightPinkColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30),
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 300.0,
        height: 140.0,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Handle button tap

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsPage()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: local_colors.whiteColor),
                      color: local_colors.lightGrayColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Haberler',
                          style: TextStyle(color: local_colors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Icon(
                      Icons.volunteer_activism_rounded,
                      size: 70,
                      color: local_colors.notificationColor,
                    ),
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  donation_screen.DonationScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: local_colors.whiteColor),
                            color: local_colors.mainColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Bağış Kutusu',
                                style:
                                    TextStyle(color: local_colors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
