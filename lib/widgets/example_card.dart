import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    required this.name,
    required this.sex,
    required this.age,
    required this.castrated,
    required this.specialNeed,
    required this.characteristics,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String sex;
  final int age;
  final bool castrated;
  final String specialNeed;
  final List<String> characteristics;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var isCastrated = castrated ? "Evet" : "Hayır";

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160, // Adjust this height as needed
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black.withOpacity(0.7)
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text("Cinsiyet: $sex",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Text("Yaş: $age",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Text("Kısır: $isCastrated",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Text("Sağlık Problemi: $specialNeed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Text("Kişilik: ${characteristics.join(", ")}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
