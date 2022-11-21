import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/model/news/filter_news_model.dart';
import 'package:flutter_app/core/model/news/news_model.dart';
import 'package:flutter_app/core/services/news/news_services.dart';
import 'package:flutter_app/injector.dart';
import 'package:provider/provider.dart';

class NewsProvider with ChangeNotifier {
  /// ===============================
  /// this is property field
  /// ===============================

  /// list of headLine
  List<NewsModel>? _headlines;
  List<NewsModel>? get headlines => _headlines;

  /// list of latest news
  List<NewsModel>? _news;
  List<NewsModel>? get news => _news;

  /// page number latest of news
  int? _page = 1;
  int? get page => _page;

  /// Property to check mounted before notify
  bool isDisposed = false;

  /// Event handling
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  /// Dependecy Injection
  final newsServices = getIt<NewsServices>();

  /// ================================
  /// This is function logic
  /// ================================

  /// Instance Provider
  static NewsProvider instance(BuildContext context) =>
      Provider.of(context, listen: false);

  /// get list of headlines
  void getHeadLines() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setOnSearch(true);
    var filter = FilterNewsModel();
    filter.country = "id";

    var response = await newsServices.getHeadLine(param: filter.toJson());
    _headlines = response;

    setOnSearch(false);
    notifyListeners();
  }

  /// get latest news of pagination
  void getNews() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setOnSearch(true);
    var filter = FilterNewsModel();
    filter.page = page;
    filter.country = "id";

    var response = await newsServices.getHeadLine(param: filter.toJson());
    _headlines = response;

    if (_page == 1) {
      _news = [];
    }
    if (response.isNotEmpty) {
      for (var resp in response) {
        if (!_news!.any((element) => element.title == resp.title)) {
          _news!.add(resp);
        }
      }
      _page = _page! + 1;
    }
    setOnSearch(false);
    notifyListeners();
  }

  /// Set Event Search
  void setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }

  void clearHeadLine() {
    _headlines = null;
    notifyListeners();
  }

  void clearNews() {
    _page = 1;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
