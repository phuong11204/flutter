class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String content;
  final String url;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'Không có tiêu đề',
      description: json['description'] ?? 'Không có mô tả',
      urlToImage: json['urlToImage'] ?? 'https://via.placeholder.com/400',
      content: json['content'] ?? 'Không có nội dung',
      url: json['url'] ?? '',
    );
  }
}
