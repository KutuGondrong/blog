import 'package:dio/dio.dart';
import 'package:blog/data/remote/post_service.dart';

class PostServiceClient {
  late Dio _dio;
  late PostService _service;

  PostServiceClient() {
    _dio = Dio();
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _service = PostService(_dio);
  }

  PostService getService() {
    return _service;
  }
}
