import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/model/search_result.dart';
import 'package:flutter_bloc_architecture/model/search_result_error.dart';

class GitHubRepository extends BaseRepository{

  final String baseUrl="https://api.github.com/search/repositories?q=";

  Future<SearchResult> search(String term) async {
    try{
      final response = await super.getDio().get("$baseUrl$term");
      if (response.statusCode == 200) {
        return SearchResult.fromJson(response.data);
      } else {
        throw SearchResultError.fromJson(response.data);
      }
    }on DioError catch (e) {
      return Future.error(e);
    }
  }

}