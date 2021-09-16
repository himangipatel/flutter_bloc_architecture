import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/screen/favourites/favourite_list.dart';
import 'package:flutter_bloc_architecture/screen/list/social_list.dart';
import 'package:flutter_bloc_architecture/utils/utils.dart';
import 'package:flutter_bloc_architecture/values/values.dart';

class SocialMediaScreen extends StatefulWidget {
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Strings.socialMediaListTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {
                Navigator.push(context, SizeRoute(page:FavouritesScreen()));
              },
            )
          ],
        ),
        body: SocialMediaListScreen(),
      ),
    );
  }
}