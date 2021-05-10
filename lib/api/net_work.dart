import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Network {
  Future<Response> post(
      {String baseUrl, String path, Map<String, dynamic> data}) async {
    try {
      Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
      return await _dio.post(path,data: data);
    } on DioError catch (e) {
      Logger().e("DioError: ${e.toString()}");
      return null;
    }
  }
}
