import 'package:demo_task/core/strings.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static final Dio _dio = Dio();
  Future<Response> getRequest(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      throw Exception('${Strings.exception}$e');
    }
  }
}
