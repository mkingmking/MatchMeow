import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int _counter = 2456;

  void _incrementCounter() {
    setState(() {
      _counter += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: local_colors.mainColor,
        title: Text('Bağış Kutusu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Küçük bir bağış, patili dostlarımızın hayatına çok büyük katkıda bulunabilir.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Column(children: [
              const Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  'Şu ana kadar',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: local_colors.mainColor,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: local_colors.mainColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      '${_counter} ₺',
                      style: TextStyle(
                          fontSize: 40, color: local_colors.whiteColor),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  'toplanmıştır',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'assets/gifs/cat-donation.gif',
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                color: local_colors.mainColor,
                child: InkWell(
                  onTap: () {
                    _incrementCounter();
                    // Uncomment and update the following line if navigation is intended
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => YourNextScreen()));
                  },
                  borderRadius: BorderRadius.circular(30.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: local_colors.mainColor),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Center(
                        child: Text(
                          "Bağış Yap",
                          style: TextStyle(
                              color: local_colors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
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
    );
  }
}
