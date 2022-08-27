import 'package:blog/data/remote/post_service.dart';
import 'package:blog/data/remote/post_service_client.dart';
import 'package:blog/data/repository/post_repository.dart';
import 'package:blog/data/response/post.dart';

class PostRepositoryImpl extends PostRepository {
  late PostService _service;

  PostRepositoryImpl() {
    _service = PostServiceClient().getService();
  }

  @override
  Future<List<Post>>? getListPost() async {
    return _service.getListPost();
  }
}
