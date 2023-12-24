import 'package:flutter/material.dart';
import 'constants/colors.dart' as local_colors;
import 'widgets/MatchMeowLogo.dart' as logo;
import 'widgets/NoticeAndSearchButtons.dart' as notice_buttons;
import 'widgets/LocationBars.dart' as location_bars;
import 'widgets/ExtrasButtons.dart' as extras_buttons;
import 'widgets/NavigationBar.dart' as nav_bar;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: local_colors.whiteColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: logo.Logo(true, true),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 350,
                  child: location_bars.LocationBars(),
                ),
                const SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Container(
                      height: 240,
                      color: local_colors.whiteColor,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const notice_buttons.NoticeAndSearchButtons(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: SizedBox(
                      height: 240,
                      child: extras_buttons.ExtrasButtons(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: nav_bar.NavigationBar(),
          ),
        ],
      ),
    );
  }
}
