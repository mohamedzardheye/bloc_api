part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

class PostsInitial extends PostsState {}

class PostsFetchedSuccessfulState extends PostsState {
  final List<PostDataModel> posts;

  PostsFetchedSuccessfulState({
    required this.posts,
  });
}
