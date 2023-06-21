import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelperPayment {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "$baseUrl$version",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getPaymentData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postPaymentData({
    required String url,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
