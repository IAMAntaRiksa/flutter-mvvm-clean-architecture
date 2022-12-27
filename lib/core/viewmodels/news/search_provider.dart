import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/model/news/filter_news_model.dart';
import 'package:flutter_app/core/model/news/news_model.dart';
import 'package:flutter_app/injector.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/core/services/news/news_services.dart';

class SearchProvider with ChangeNotifier {
  /// ===============================
  /// this is property field
  /// ===============================

  /// list of latest news
  List<NewsModel>? _search;
  List<NewsModel>? get search => _search;

  /// Event handling
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  /// Property to check mounted before notify
  bool isDisposed = false;

  /// Dependecy Injection

  final newsServices = getIt<NewsServices>();

  /// ================================
  /// This is function logic
  /// ================================

  /// Instance Provider
  static SearchProvider instance(BuildContext context) =>
      Provider.of(context, listen: false);

  /// search news by keyword
  void searchNews(String keyword) async {
    await Future.delayed(const Duration(milliseconds: 100));
    setOnSearch(true);

    var filter = FilterNewsModel();
    filter.query = keyword.toLowerCase().trim();
    filter.limit = 10;
    var response = await newsServices.searchNews(param: filter.toJson());
    _search = [];
    _search = response;

    setOnSearch(false);
    notifyListeners();
  }

  void setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }

  void clearSearch() {
    _search = null;
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
