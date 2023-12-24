import 'package:flutter/material.dart';
import 'package:proje1/onboardingScreen.dart';
import 'colors.dart';

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsItem(
      {required this.title, required this.description, required this.imageUrl});
}

List<NewsItem> sampleNews = [
  NewsItem(
    title: "Yeni Evcil Hayvan Sahiplendirme Merkezi Açıldı",
    description:
        "Topluluk, evsiz hayvanların sevgi dolu yuvalar bulmalarına yardımcı olacak yeni bir evcil hayvan sahiplendirme merkezini karşılıyor.",
    imageUrl: 'kedi_resimleri/kedi1.jpeg',
  ),
  NewsItem(
    title: "Yerel Veteriner Ücretsiz Kontroller Sunuyor",
    description:
        "Bir yerel veteriner kliniği bu hafta sonu evcil hayvanlar için ücretsiz sağlık kontrolü sunuyor. Kaçırmayın!",
    imageUrl: 'kedi_resimleri/kedi2.jpeg',
  ),
  NewsItem(
    title: "Evcil Hayvan Bakımı Atölyesi",
    description:
        "Beslenme, egzersiz ve bakım konularını kapsayan evcil hayvan bakımı temelleri üzerine ücretsiz atölyemize katılın.",
    imageUrl: 'kedi_resimleri/kedi3.jpeg',
  ),
  NewsItem(
    title: "Kedi Parkı Yenileme Çalışması Tamamlandı",
    description:
        "Yenilenen şehir kedi parkı şimdi daha fazla alan ve tüylü dostlarınız için yeni tesisler ile açıldı.",
    imageUrl: 'kedi_resimleri/kedi4.jpeg',
  ),
  NewsItem(
    title: "Kedi Kafe'nin Büyük Açılışı",
    description:
        "Şehir merkezinde açılan yeni bir kedi kafe, kedi severler için rahat bir alan sunuyor ve kedi sahiplenmeyi teşvik ediyor.",
    imageUrl: 'kedi_resimleri/kedi5.jpeg',
  ),
];

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => OnboardingScreen()));
        return false; // Prevents default back action
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          backgroundColor: mainColor,
        ),
        body: ListView.builder(
          itemCount: sampleNews.length,
          itemBuilder: (context, index) {
            return Card(
              color: lightPinkColor,
              child: ListTile(
                title: Text(
                  sampleNews[index].title,
                  style: TextStyle(color: darkGrayColor),
                ),
                subtitle: Text(
                  sampleNews[index].description,
                  style: TextStyle(color: lightGrayColor),
                ),
                leading: Image.asset(sampleNews[index].imageUrl),
              ),
            );
          },
        ),
      ),
    );
  }
}
