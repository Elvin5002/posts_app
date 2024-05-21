part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccess extends PostState {
  PostSuccess(this.posts);

  final List<PostsResponse> posts;
}

final class PostFailure extends PostState {}
