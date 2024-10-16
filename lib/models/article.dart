// lib/models/article.dart

class Article {
  final String id;
  final String title;
  final String summary;
  final String imageUrl;
  final String url;

  Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.url,
  });

  // Mengonversi objek Article ke dalam format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'imageUrl': imageUrl,
      'url': url,
    };
  }

  // Memudahkan debugging dengan mengembalikan representasi string dari objek
  @override
  String toString() {
    return 'Article{id: $id, title: $title, summary: $summary, imageUrl: $imageUrl, url: $url}';
  }
}
