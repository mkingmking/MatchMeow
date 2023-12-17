import 'package:flutter/material.dart';
import 'colors.dart';

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsItem(
      {required this.title, required this.description, required this.imageUrl});
}

// istek dahilinde duzenlenebilir...
List<NewsItem> sampleNews = [
  NewsItem(
    title: "Pet News",
    description: "Pet news will be here!.",
    imageUrl: 'kedi_resimleri/kedi1.jpeg',
  ),
  NewsItem(
    title: "Pet News",
    description: "Pet news will be here!.",
    imageUrl: 'kedi_resimleri/kedi2.jpeg',
  ),
  NewsItem(
    title: "Pet News",
    description: "Pet news will be here!.",
    imageUrl: 'kedi_resimleri/kedi3.jpeg',
  ),
  NewsItem(
    title: "Pet News",
    description: "Pet news will be here!.",
    imageUrl: 'kedi_resimleri/kedi4.jpeg',
  ),
  NewsItem(
    title: "Pet News",
    description: "Pet news will be here!.",
    imageUrl: 'kedi_resimleri/kedi5.jpeg',
  ),
];

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              leading: Image.asset(sampleNews[index]
                  .imageUrl), // Replace with actual image widget
            ),
          );
        },
      ),
    );
  }
}
