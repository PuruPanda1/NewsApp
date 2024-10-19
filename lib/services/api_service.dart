import 'package:http/http.dart' as http;
import 'package:news_app/utils/constant.dart';

class ApiService {
  Future<http.Response> getNewsList({required int pageNo}) async {
    final response = await http.get(
      Uri.parse("$BASE_URL&page=$pageNo"),
    );

    return response;
  }
}
