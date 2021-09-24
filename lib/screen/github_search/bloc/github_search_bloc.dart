import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/screen/github_search/search.dart';

class GithubSearchBloc extends BaseBloc<GithubSearchEvent, GithubSearchState> {
  final GitHubRepository githubRepository = GitHubRepository();

  GithubSearchBloc() : super(GithubSearchState(status: Status.initial));

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is TextChanged) {
      GithubSearchState(status: Status.success);
      final searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield state.copyWith(status: Status.loading);
        yield SearchStateLoading();
        try {
          var response = await githubRepository.search(searchTerm);
          print(response.items.toString());
          yield GithubSearchState(status: Status.success,items: response.items);
          yield SearchStateSuccess(response.items);
        } catch (error) {
          yield error is SearchStateError
              ? SearchStateError(error.error)
              : SearchStateError('something went wrong');
        }
      }
    }
   // yield await _mapSearchStateToState(event);
  }

  // Future<GithubSearchState> _mapSearchStateToState(GithubSearchEvent event) async {
  //   try{
  //     if (event is TextChanged) {
  //       final searchTerm = event.text;
  //       if (searchTerm.isEmpty) {
  //        return state.copyWith(status: Status.initial);
  //       } else {
  //         try {
  //           var response = await githubRepository.search(searchTerm);
  //           print(response.items.toString());
  //          // return state.copyWith(status: Status.success,items: response.items);
  //           // return SearchStateSuccess(response.items);
  //         } catch (error) {
  //           return state.copyWith(status: Status.failure);
  //         }
  //       }
  //     }else{
  //      return state.copyWith(status: Status.success);
  //     }
  //   }on Exception{
  //     return state.copyWith(status: Status.failure);
  //   }
  // }
}
