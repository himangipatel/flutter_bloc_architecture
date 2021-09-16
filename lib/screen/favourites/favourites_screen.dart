
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/screen/list/bloc/social_media_list_bloc.dart';
import 'package:flutter_bloc_architecture/values/values.dart';

import 'bloc/favourites_list_bloc.dart';
import 'favourites_list_screen.dart';

class FavouritesScreen extends StatefulWidget {
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.favouritesSocialMediaTitle),
      ),
      body: BlocProvider(
          create: (context) => FavouritesListBloc(BlocProvider.of<SocialMediaListBloc>(context)),
          child: FavouritesListScreen()),
    );
  }
}
