import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    required this.name,
    required this.sex,
    required this.age,
    required this.castrated,
    required this.healthProblems,
    required this.character,
    required this.info,
    required this.assetPath,
    super.key,
  });

  final String name;
  final String sex;
  final int age;
  final bool castrated;
  final bool healthProblems;
  final String character;
  final String info;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var isCastrated = castrated ? "Evet" : "Hayır";
    var isHealthProblems = healthProblems ? "Var" : "Yok";
    return ClipRRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage(assetPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 26,
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, Colors.white, Colors.white],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Cinsiyet: $sex",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    Text("Yaş: $age",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    Text("Kısır: $isCastrated",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    Text("Sağlık Problemi: $isHealthProblems",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    Text("Kişilik: $character",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.only(bottom: 10),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(info,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
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
