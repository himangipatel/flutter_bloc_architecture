import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/utils/validator.dart';
import 'package:flutter_bloc_architecture/values/values.dart';
import 'package:flutter_bloc_architecture/widget/widget.dart';


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

  TextEditingController _phoneNumberController = new TextEditingController(
      text: "987654321");
  TextEditingController _passwordController = new TextEditingController(
      text: "123456");
  FocusNode _phoneFocusNode = new FocusNode();
  FocusNode _passFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  BoxTextField _phoneNumberWidget() {
    return BoxTextField(
        keyboardType: TextInputType.number,
        controller: _phoneNumberController,
        focusNode: _phoneFocusNode,
        hintText: Strings.phoneNumber,
        onChanged: (text) {},
        maxLength: 10,
        icon: Icons.phone_iphone);
  }

  BoxTextField _passwordWidget() {
    return BoxTextField(
        controller: _passwordController,
        focusNode: _passFocusNode,
        hintText: Strings.password,
        obscureText: true,
        onChanged: (text) {},
        maxLength: 15,
        validator: (val) => validatePassword(val!),
        onFieldSubmitted: (String value) {},
        icon: Icons.lock_outline);
  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
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
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context,
          LoginState state,) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Stack(
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
                  ElevatedButton(
                      onPressed: state is! LoginLoading
                          ? _onLoginButtonPressed
                          : null,
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text(
                          Strings.singIn,
                        ),
                      )),

                ],
              ),
            ),
            Center(
              child: state is LoginLoading
                  ? LoadingIndicator()
                  : null,
            ),
          ],
        );
      },
    );
  }

}
