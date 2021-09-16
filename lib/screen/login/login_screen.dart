/*
*  login_widget.dart
*  Dietfast
*
*  Created by Himangi Patel.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/base/base_statefull_widget.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/widget/top_bar.dart';

import 'login.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  AuthenticationBloc authenticationBloc;

  LoginScreen({required this.authenticationBloc});

  @override
  _LoginState createState() => _LoginState(this.authenticationBloc);
}

class _LoginState extends BaseStateFullWidget<LoginBloc, LoginScreen> {
  late LoginBloc _loginBloc;

  _LoginState(AuthenticationBloc authenticationBloc){
    _loginBloc =  LoginBloc(
        userRepository: UserRepository(),
        authenticationBloc: authenticationBloc);
  }

  @override
  Widget stateWidgetBuilder(BuildContext context, Widget childrenHolder) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              LoginForm(
                authenticationBloc: widget.authenticationBloc,
                loginBloc: _loginBloc,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginBloc initBloc() {
    print('initBloc');
    return _loginBloc;
  }
}
