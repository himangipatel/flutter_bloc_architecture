import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/screen/login/bloc/login_state.dart';
import 'package:flutter_bloc_architecture/utils/validator.dart';
import 'package:flutter_bloc_architecture/values/values.dart';
import 'package:flutter_bloc_architecture/widget/widget.dart';

import 'bloc/login_state.dart';
import 'login.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key? key,
    required this.loginBloc,
    required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc get _loginBloc => widget.loginBloc;

  TextEditingController _phoneNumberController =
      new TextEditingController(text: "");
  TextEditingController _passwordController =
      new TextEditingController(text: "");
  FocusNode _phoneFocusNode = new FocusNode();
  FocusNode _passFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Widget _phoneNumberWidget() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return BoxTextField(
          keyboardType: TextInputType.number,
          controller: _phoneNumberController,
          focusNode: _phoneFocusNode,
          hintText: Strings.phoneNumber,
          errorText: state is EmailError ? state.error : '',
          onChanged: (text) {
            context.read<LoginBloc>().add(TextFieldChanged(text,_passwordController.text));
          },
          maxLength: 10,
          icon: Icons.phone_iphone);
    });
  }

  Widget _passwordWidget() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return BoxTextField(
          controller: _passwordController,
          focusNode: _passFocusNode,
          hintText: Strings.password,
          errorText: state is PasswordError ? state.error : '',
          obscureText: true,
          onChanged: (text) {
            context.read<LoginBloc>().add(TextFieldChanged(_phoneNumberController.text,text));
          },
          maxLength: 15,
          validator: (val) => validatePassword(val!),
          onFieldSubmitted: (String value) {},
          icon: Icons.lock_outline);
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if(state is FormValid && state.valid==FormValidation.Valid){
          return ElevatedButton(
              onPressed: _onLoginButtonPressed,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Text(
                  Strings.singIn,
                ),
              ));
      }
      else
        return Container();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.add(LoginButtonPressed(
      username: _phoneNumberController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.welcome,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 10),
                _phoneNumberWidget(),
                _passwordWidget(),
                SizedBox(height: 20),
                _loginButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
