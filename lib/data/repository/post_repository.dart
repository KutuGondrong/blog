import 'package:blog/data/response/post.dart';

abstract class PostRepository {
  Future<List<Post>>? getListPost();
}
