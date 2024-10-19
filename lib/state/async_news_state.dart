import 'package:news_app/models/Article.dart';

class AsyncNewsState {
  final bool isLoading;
  final List<Article> articles;
  final String? errorMessage;

  AsyncNewsState({
    required this.isLoading,
    required this.articles,
    this.errorMessage,
  });

  factory AsyncNewsState.loading() => AsyncNewsState(isLoading: true, articles: []);
  factory AsyncNewsState.data(List<Article> articles) => AsyncNewsState(isLoading: false, articles: articles);
  factory AsyncNewsState.error(String errorMessage) => AsyncNewsState(isLoading: false, articles: [], errorMessage: errorMessage);
}
