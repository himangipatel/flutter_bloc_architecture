import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const _postLimit = 20;

class PostRepository extends BaseRepository{


  final http.Client httpClient;

  Future<List<Post>> fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Post(
          id: json['id'] as int,
          title: json['title'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');

  }

  PostRepository(this.httpClient);
}