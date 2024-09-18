part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

class PostsInitial extends PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostsFetchedSuccessfulState extends PostsState {
  final List<PostDataModel> posts;

  PostsFetchedSuccessfulState({
    required this.posts,
  });
}

class PostsAdditionSuccessState extends PostsActionState {}

class PostsAdditionErrorState extends PostsActionState {}
