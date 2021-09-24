import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_architecture/model/model.dart';


enum Status { initial,loading ,success, failure }

class GithubSearchState extends Equatable {
  final Status status;
  final List<SearchResultItem> items;
  final String error;

  const GithubSearchState({this.status=Status.initial,this.items=const <SearchResultItem>[],this.error=""});

  @override
  List<Object> get props => [];

  GithubSearchState copyWith({
    Status? status,
    List<SearchResultItem>? items,
    String? error
  }) {
    return GithubSearchState(
      status: status ?? this.status,
      items: items ?? this.items,
      error: error??this.error
    );
  }
}

class SearchStateEmpty extends GithubSearchState {}

class SearchStateLoading extends GithubSearchState {

}

class SearchStateSuccess extends GithubSearchState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends GithubSearchState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
