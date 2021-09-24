import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_bloc.dart';
import 'package:flutter_bloc_architecture/main_bloc/app_loader_event.dart';
import 'package:flutter_bloc_architecture/main_bloc/main_block.dart';
import 'package:flutter_bloc_architecture/screen/github_search/search.dart';
import 'package:flutter_bloc_architecture/screen/list/social_list.dart';
import 'package:flutter_bloc_architecture/screen/post/post.dart';
import 'package:flutter_bloc_architecture/screen/list/social_media_screen.dart';
import 'package:flutter_bloc_architecture/utils/utils.dart';
import 'package:flutter_bloc_architecture/values/values.dart';
import '../routes.dart';

class StartScreen extends StatefulWidget {
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    final SocialMediaListBloc mediaListBloc =
        BlocProvider.of<SocialMediaListBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: BlocProvider<SocialMediaListBloc>(
        create: (context) => mediaListBloc,
        child: BlocBuilder<SocialMediaListBloc, SocialMediaListState>(
            builder: (context, state) {
          if (state is SocialMediaListLoaded) {
            var favouriteList = state.socialMedia
                .where((element) => element.isFavourite == true)
                .toList();
            //return Text('Favourite Items ${favouriteList.length}');
            return Row(children: [
              Text('Home'),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, ScaleRoute(page: SearchScreen()));
                },
              )
            ]);
          } else
            return Text('Home');
        }),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 300, // <-- match_parent
                child: ElevatedButton(
                    child: Text(Strings.socialMediaListTitle),
                    onPressed: () => Navigator.push(
                        context, ScaleRoute(page: SocialMediaScreen())))),
            SizedBox(
                width: 300, // <-- match_parent
                child: ElevatedButton(
                    child: Text(Strings.posts),
                    onPressed: () => Navigator.push(
                        context, ScaleRoute(page: PostListScreen())))),
            Container(
              child: Center(
                  child: SizedBox(
                      width: 300, // <-- match_parent
                      child: ElevatedButton(
                        child: Text('logout'),
                        onPressed: () {
                          authenticationBloc.add(LoggedOut());
                          mediaListBloc.setLoading(true);
                        },
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
