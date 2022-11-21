import 'package:dio/dio.dart';
import 'package:flutter_app/core/config/api.dart';
import 'package:flutter_app/core/config/config.dart';
import 'package:flutter_app/injector.dart';

class BaseServices {
  final api = getIt<Api>();

  final _dio = Dio();

  Future<Map<String, dynamic>> getApi(
      String url, Map<String, dynamic> param) async {
    param['apiKey'] = apiKey;

    Response response = await _dio.get(url, queryParameters: param);
    return response.data;
  }
}
