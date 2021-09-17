import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_architecture/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_event.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_state.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/screen/login/login.dart';
import 'package:flutter_bloc_architecture/screen/login/login_repositoty.dart';
import 'package:flutter_bloc_architecture/utils/utils.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final AppLoaderBloc appLoaderBloc;
  final LoginRepository repository = LoginRepository();

  LoginBloc({required this.authenticationBloc, required this.appLoaderBloc})
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      setLoading(true);
      try {
        final token = await repository.authenticate(username: event.username, password: event.password,);
        setLoading(false);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }

}
