import 'package:flutter_app/core/model/news/news_model.dart';
import 'package:flutter_app/core/services/base/base_services.dart';

class NewsServices extends BaseServices {
  Future<List<NewsModel>> getHeadLine({Map<String, dynamic>? param}) async {
    var response = await getApi(api.getHeadline, param ?? {});

    List<NewsModel> news = [];

    if (response.containsKey('articles') && response['articles'] is List) {
      news = (response['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    }

    return news;
  }

  Future<List<NewsModel>> searchNews({Map<String, dynamic>? param}) async {
    var response = await getApi(api.searchNews, param ?? {});

    List<NewsModel> news = [];
    if (response.containsKey("articles") && response['articles'] is List) {
      news = (response['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    }
    return news;
  }
}
