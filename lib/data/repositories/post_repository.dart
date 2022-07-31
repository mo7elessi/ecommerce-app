import 'dart:async';
import 'dart:convert';
import 'package:bloc_state_managment/data/model/post_model.dart';
import 'package:http/http.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}

class PostsRepositoryImplementation extends PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<PostModel>((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception("404");
    }
  }

}
