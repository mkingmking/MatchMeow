import 'package:flutter/material.dart';
import 'package:proje1/AddPetPage.dart';
import '../constants/colors.dart' as local_colors;
import 'package:proje1/AddPetNoticeForm.dart' as add_pet_notice_screen;
import 'package:proje1/PetInformationForm.dart' as pet_form_screen;
import 'package:proje1/SwipeScreen.dart' as swipe_screen;
import 'package:proje1/PetListPage.dart';

class NoticeAndSearchButtons extends StatelessWidget {
  const NoticeAndSearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: _buildButton("İlan Ver", local_colors.mainColor,
                    local_colors.whiteColor, context, AddPetPage()),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: _buildButton(
                    "İlanlarım",
                    local_colors.mainColor,
                    local_colors.whiteColor,
                    context,
                    add_pet_notice_screen.MyFormScreen()),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Flexible(
            child: Column(
              children: [
                Expanded(
                  flex: 2, // This will make the first button twice as tall
                  child: _buildButton(
                    "İlan Ara",
                    local_colors.whiteColor,
                    local_colors.mainColor,
                    context,
                    swipe_screen.SwipeScreen(),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Expanded(
                  flex: 1, // This will make the first button twice as tall
                  child: _buildButton(
                    "Manuel Arama",
                    local_colors.whiteColor,
                    local_colors.mainColor,
                    context,
                    PetListPage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color borderColor, Color bgColor,
      BuildContext context, Widget screen) {
    return SizedBox(
      width: double.infinity, // Set a specific width for the button
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
          // Add your button click logic here
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              0, 8, 0, 0), // Adjust the padding as needed
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(text, style: TextStyle(color: borderColor)),
          ),
        ),
      ),
    );
  }
}
