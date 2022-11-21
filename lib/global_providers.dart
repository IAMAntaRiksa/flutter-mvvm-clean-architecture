import 'package:flutter_app/core/viewmodels/news/news_provider.dart';
import 'package:provider/provider.dart';

class GlobalProviders {
  static Future register() async => [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        )
      ];
}
