import 'package:posts_app/data/contracts/post_contract.dart';
import 'package:posts_app/data/models/post_response.dart';
import 'package:posts_app/data/services/post_service.dart';

class PostRepository implements PostContract{

  PostRepository(this._postService);

  final PostService _postService;
  @override
  Future<List<PostsResponse>> getPosts() => _postService.getPosts();
  
  @override
  Future<PostsResponse> getPostsById(int id) => _postService.getPostById(id);
  
}