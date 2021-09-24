import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/screen/post/bloc/post_event.dart';
import 'package:flutter_bloc_architecture/screen/post/bloc/post_state.dart';
import 'package:flutter_bloc_architecture/screen/post/post_repository.dart';
import 'package:http/http.dart' as http;

class PostBloc extends BaseBloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository(http.Client());

  PostBloc() : super(PostState(status: PostStatus.initial));

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await postRepository.fetchPosts();
        return state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        );
      }
      final posts = await postRepository.fetchPosts(state.posts.length);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }
}
