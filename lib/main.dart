import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_bloc.dart';

import 'main_bloc/main_block.dart';
import 'model/simple_social_media_repository.dart';
import 'screen/github_search/search.dart';
import 'screen/screens.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => GithubSearchBloc(),
      ),
      BlocProvider(
        create: (context) => AuthenticationBloc(),
      ),
      BlocProvider(
        create: (context) => AppLoaderBloc(),
      ),
      BlocProvider(
          create: (context) => LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              appLoaderBloc: BlocProvider.of<AppLoaderBloc>(context))),
      BlocProvider(create: (context) => SocialMediaListBloc()),
    ], child: App()),
  );
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc();
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
                print('BlocBuilder');
                return Stack(
                  children: [
                    if (state is AuthenticationUninitialized)
                      SplashPage()
                    else if (state is AuthenticationAuthenticated)
                      StartScreen()
                    else if (state is AuthenticationUnauthenticated)
                      LoginScreen(
                        authenticationBloc: authenticationBloc,
                        appLoaderBloc: BlocProvider.of<AppLoaderBloc>(context),
                      )
                  ],
                );
              },
            )));
  }
}
