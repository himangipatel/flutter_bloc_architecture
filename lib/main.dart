import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_bloc/main_block.dart';
import 'model/simple_social_media_repository.dart';
import 'screen/screens.dart';

void main() {
  final UserRepository userRepository = new UserRepository();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(userRepository),
      ),
      BlocProvider(
          create: (context) => LoginBloc(
              userRepository: userRepository,
              authenticationBloc:
                  BlocProvider.of<AuthenticationBloc>(context))),
      BlocProvider(
          create: (context) =>
              SocialMediaListBloc()),
    ], child: App(userRepository: userRepository)),
  );
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthenticationBloc authenticationBloc;

  UserRepository get userRepository => widget.userRepository;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(userRepository);
    authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => authenticationBloc,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                return Stack(
                  children: [
                    if (state is AuthenticationUninitialized)
                      SplashPage()
                    else if (state is AuthenticationAuthenticated)
                      StartScreen()
                    else if (state is AuthenticationUnauthenticated)
                      LoginScreen(
                        authenticationBloc: authenticationBloc,
                      )
                  ],
                );
              },
            )));
  }
}
