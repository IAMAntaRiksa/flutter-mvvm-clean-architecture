class Api {
  // base endpoint
  static String baseUrl = 'https://newsapi.org/v2';

  // endpoint get headline
  String getHeadline = '$baseUrl/top-headlines';

  // endpoint search
  String searchNews = '$baseUrl/everything';
}
