// lib/screens/article_list_screen.dart
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widgets/article_card.dart';
import 'webview_screen.dart';

class ArticleListScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      id: '1',
      title: 'Tips Memasak Nasi Goreng Sempurna',
      summary: 'Pelajari rahasia membuat nasi goreng yang lezat...',
      imageUrl: 'assets/nasi_goreng.jpg',
      url: 'https://cookpad.com/id/cari/nasi%20goreng',
    ),
    // Tambahkan artikel lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog Resep')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(
            article: articles[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                    url: articles[index].url,
                    title: articles[index].title,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}