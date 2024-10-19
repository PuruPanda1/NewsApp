import 'dart:convert';
import 'package:news_app/models/Article.dart';
import 'package:news_app/models/News.dart';
import 'package:news_app/services/api_service.dart';

class NewsRepository{
  final ApiService apiService;
  int currentPage = 1;
  bool hasMoreNews = true;

  NewsRepository({required this.apiService});

  Future<List<Article>> getNewsList() async {

    if(!hasMoreNews){
      return [];
    }

    final response = await apiService.getNewsList(pageNo: currentPage);

    if(response.body.isEmpty){
      hasMoreNews = false;
    }else{
      currentPage++;
    }

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return News.fromJson(jsonResponse).articles;
    } else {
      throw Exception('Failed to load News');
    }
  }

  void resetPagination() {
    currentPage = 1;
    hasMoreNews = true;
  }

}