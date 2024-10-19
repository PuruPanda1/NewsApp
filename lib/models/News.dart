import 'Article.dart';

class News {
  final String status;
  final int totalResults;
  final List<Article> articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  News copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) =>
      News(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory News.fromJson(Map<String, dynamic> json) => News(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}