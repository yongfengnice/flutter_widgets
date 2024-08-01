import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/net/custom_interceptors.dart';
import 'package:flutter_widgets/net/net_urls.dart';

/// @author：yongfeng
/// @data：2024/7/30 16:33
///
class NetUtils {
  NetUtils._internal() {
    configureDio();
    // initAdapter();
  }

  final _dio = Dio();

  void configureDio() {
    // Set default configs
    _dio.options.baseUrl = NetUrls.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    // final options = BaseOptions(
    //   baseUrl: 'https://api.pub.dev',
    //   connectTimeout: Duration(seconds: 10),
    //   receiveTimeout: Duration(seconds: 10),
    // );
    // final anotherDio = Dio(options);
    _dio.interceptors.add(CustomInterceptors());
    _dio.interceptors.add(LogInterceptor(logPrint: (o) => debugPrint(o.toString())));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // you can resolve a `Response` using `handler.resolve(response)`.
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
    );
  }

  void initAdapter() {
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          // Forward all request to proxy "localhost:8888".
          return 'PROXY localhost:8888';
        };
        return client;
      },
    );
  }

  void requestGet() async {
    Response response = await _dio.get(
      '/test',
      queryParameters: {'id': 12, 'name': 'dio'},
    );
    debugPrint(response.data.toString());
  }

  void requestPost() async {
    Response response = await _dio.post('/test?id=12&name=dio');
    debugPrint(response.data.toString());
  }
}
