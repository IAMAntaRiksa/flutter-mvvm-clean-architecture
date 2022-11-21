import 'package:flutter_app/core/config/api.dart';
import 'package:flutter_app/core/services/news/news_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerSingleton(Api());
  getIt.registerSingleton(NewsServices());
}
