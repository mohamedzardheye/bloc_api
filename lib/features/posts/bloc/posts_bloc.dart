import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/features/posts/models/post_model.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    var client = http.Client();

    List<PostDataModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
        print(posts);
      }

      emit(PostsFetchedSuccessfulState(posts: posts));
    } catch (e) {
      log(e.toString() as num);
    }
  }
}
