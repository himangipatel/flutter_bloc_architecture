
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/base/base_stateless_widget.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/screen/list/social_list.dart';

class HomePage extends BaseStatelessWidget {
  @override
  Widget statelessWidgetBuilder(BuildContext context, Widget childrenHolder) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    final SocialMediaListBloc mediaListBloc =
        BlocProvider.of<SocialMediaListBloc>(context);

    return Scaffold(
      appBar: AppBar(title:
          BlocProvider<SocialMediaListBloc>(
            create: (context) => mediaListBloc,
            child: BlocBuilder<SocialMediaListBloc, SocialMediaListState>(
                builder: (context, state) {
                  if (state is SocialMediaListLoaded)
                    return Text('MainListLoaded');
                  else
                    return Text('Home');
                }),
          )),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            loader.setLoading(true);
            authenticationBloc.add(LoggedOut());
          },
        )),
      ),
    );
  }
}
