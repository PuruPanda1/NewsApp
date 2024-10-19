import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/views/widgets/news_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    ref.read(newsNotifierProvider.notifier).loadNews();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(newsNotifierProvider.notifier).loadNews();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Global News'),
      ),
      body: newsState.isLoading && newsState.articles.isEmpty
          ? const Center(
              child: CircularProgressIndicator()) // Initial loading spinner
          : newsState.errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(newsState.errorMessage!,
                          style: const TextStyle(color: Colors.red)),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(newsNotifierProvider.notifier)
                              .loadNews(reset: true);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      newsState.articles.length + (newsState.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < newsState.articles.length) {
                      final article = newsState.articles[index];
                      return NewsTile(article: article);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
    );
  }
}
