part of 'posts_bloc.dart';

@immutable
sealed class BlocEvent {}

abstract class PostsEvent {}

class PostsInitialFetchEvent extends PostsEvent {}

class PostAddEvent extends PostsEvent {}
