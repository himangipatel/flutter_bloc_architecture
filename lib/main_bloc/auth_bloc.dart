import 'dart:async';

import 'package:flutter_bloc_architecture/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/screen/login/login.dart';
import 'auth_events.dart';
import 'main_block.dart';


class AuthenticationBloc
    extends BaseBloc<AuthenticationEvent, AuthenticationState> {

  final LoginRepository repository = LoginRepository();

  AuthenticationBloc() : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    if (event is AppStarted) {
      final bool hasToken = await repository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      print('Auth LoggedIn');
      await repository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      // yield AuthenticationLoading();
      setLoading(true);
      await repository.deleteToken();
      setLoading(false);
      yield AuthenticationUnauthenticated();
    }
  }

}