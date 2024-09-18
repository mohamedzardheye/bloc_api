import 'dart:convert';

import 'package:bloc_api/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataModel>> fetchPosts() async {
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
      }
      // ignore: avoid_print
      print(posts);

      return posts;
    } catch (e) {
      return [];
      //   log(e.toString());
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    // try {
    var response = await client
        .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
      "title": "Mohamed Mohamud Mohamed",
      "body": "Mohamed is a Professional Full Stack Developer",
      "user_id": "34"
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      return false;
    }
    // } catch (e) {

    //    ///  log(e.toString());
    // }
  }
}
