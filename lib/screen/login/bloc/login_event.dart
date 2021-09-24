import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    required this.username,
    required this.password,
  });
}

class TextFieldChanged extends LoginEvent {
  String email;
  String password;
  TextFieldChanged(this.email,this.password);
}
