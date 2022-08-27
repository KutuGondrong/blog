import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:blog/data/response/post.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostService {
  factory PostService(Dio dio, {String baseUrl}) = _PostService;

  @GET("/posts")
  Future<List<Post>> getListPost();
}
