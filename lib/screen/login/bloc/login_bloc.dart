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
        final token = await repository.authenticate(
          username: event.username,
          password: event.password,
        );
        setLoading(false);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginSuccess();
      } catch (error) {
        // yield LoginFailure(error: error.toString());
      }
    }

    if (event is TextFieldChanged) {
      if (validatePhone(event.email) != null) {
        yield EmailError(validatePhone(event.email).toString());
        return;
      } else if (validatePassword(event.password) != null) {
        yield PasswordError(validatePassword(event.password).toString());
        return;
      } else if (validatePhone(event.email) == null &&
          validatePassword(event.password) == null) {
        yield FormValid(valid: FormValidation.Valid);
      } else {
        yield FormValid(valid: FormValidation.NotValid);
      }
    }
    // if (event is PasswordChanged) {
    //   if (validatePassword(event.text) != null) {
    //     yield PasswordError(validatePassword(event.text).toString());
    //     return;
    //   } else if (validatePhone(event.text) == null &&
    //       validatePassword(event.text) == null) {
    //     yield FormValid(valid: FormValidation.Valid);
    //   } else {
    //     yield FormValid(valid: FormValidation.NotValid);
    //   }
    // }
  }
}
