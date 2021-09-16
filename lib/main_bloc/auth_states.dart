import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}


/*
uninitialized — waiting to see if the user is authenticated or not on app start.
loading — waiting to persist/delete a token
authenticated — successfully authenticated
unauthenticated — not authenticated
* */