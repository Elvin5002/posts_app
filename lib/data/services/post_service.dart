import 'package:dio/dio.dart';
import 'package:posts_app/data/models/post_response.dart';
import 'package:posts_app/utilities/constants/endpoints.dart';

class PostService {
  final Dio dio = Dio();

  Future<List<PostsResponse>> getPosts() async{
    try {
      const endpoint = Endpoints.posts;
      final response = await dio.get(endpoint);
      final List data = response.data;

      if(response.statusCode == 200) {
        return data.map((e) => PostsResponse.fromJson(e)).toList();
      }

      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PostsResponse> getPostById(int id) async{
    try {
      final endpoint = '${Endpoints.posts}/${id}';
      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        return PostsResponse.fromJson(response.data);
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}