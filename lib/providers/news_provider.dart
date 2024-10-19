import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/state/async_news_state.dart';


final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return NewsRepository(apiService: apiService);
});

class NewsNotifier extends StateNotifier<AsyncNewsState> {
  final NewsRepository newsRepository;

  NewsNotifier(this.newsRepository) : super(AsyncNewsState.loading());

  Future<void> loadNews({bool reset = false}) async {
    if (reset) {
      newsRepository.resetPagination();
      state = AsyncNewsState.loading();
    }

    try {
      final news = await newsRepository.getNewsList();

      if (reset) {
        state = AsyncNewsState.data(news);
      } else {
        state = AsyncNewsState.data([...state.articles, ...news]);  // Append the new articles to the current list
      }
    } catch (e) {
      state = AsyncNewsState.error('Failed to load news. Please try again.');
    }

  }
}

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, AsyncNewsState>((ref) {
  final newsRepository = ref.watch(newsRepositoryProvider);
  return NewsNotifier(newsRepository);
});
