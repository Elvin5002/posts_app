
import '../models/post_response.dart';

abstract class PostContract {

  Future<List<PostsResponse>> getPosts();
  Future<PostsResponse> getPostsById(int id);
}