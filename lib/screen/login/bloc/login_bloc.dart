
import 'package:flutter_bloc_architecture/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/screen/login/login.dart';


class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.userRepository,required this.authenticationBloc}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      setLoading(true);
      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        setLoading(false);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();

      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}