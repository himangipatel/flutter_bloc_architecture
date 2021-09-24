import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

enum FormValidation { NotValid, Valid }

class FormValid extends LoginState {
  final FormValidation valid;

  const FormValid({this.valid = FormValidation.NotValid});
}

class LoginInitial extends LoginState {}

class EmailError extends LoginState {
  String error;

  EmailError(this.error);
}

class PasswordError extends LoginState {
  String error;

  PasswordError(this.error);
}

class LoginSuccess extends LoginState {}
