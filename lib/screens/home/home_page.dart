import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/cubits/detail/detail_cubit.dart';
import 'package:posts_app/cubits/post/post_cubit.dart';
import 'package:posts_app/locator.dart';
import 'package:posts_app/screens/details/details_page.dart';
import 'package:posts_app/screens/home/widgets/home_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
            if (state is PostLoading) {
              const CircularProgressIndicator();
            } else if (state is PostSuccess) {
              final posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => DetailCubit(locator())..getPostsById(posts[i].id!),
                                    child: const DetailsPage(),
                                  ))),
                      child: HomeItems(post: posts[i]));
                },
              );
            }
            return const SizedBox.shrink();
          }),
        ));
  }
}
