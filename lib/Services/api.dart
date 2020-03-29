import 'package:flwitter/Models/post.dart';
import 'package:dio/dio.dart';
import './data.dart';

class PostRepository {
  Future<List<Post>> getAll() async {
    //var url = "https://api.balta.io/v1/posts";
    var url = "http://localhost:3001/posts?&_limit=10_page=$page";
    Response response = await Dio().get(url);
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<String> getPostBody(tag) async {
    try {
      Response response = await Dio().get("https://raw.githubusercontent.com/balta-io/artigos/master/${tag}.md");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}