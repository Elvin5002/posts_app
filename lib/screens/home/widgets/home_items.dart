import 'package:flutter/material.dart';
import 'package:posts_app/data/models/post_response.dart';

class HomeItems extends StatelessWidget {
const HomeItems({ Key? key, required this.post }) : super(key: key);

  final PostsResponse post;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        children: [
          Text(post.id.toString()),
          const SizedBox(height: 5,),
          Text(post.title!),
          const SizedBox(height: 5,),
          Text(post.body!),
        ],
      ),
    );
  }
}