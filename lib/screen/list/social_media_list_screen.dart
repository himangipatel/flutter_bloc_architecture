import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/screen/list/checkbox_social_media_item.dart';
import 'package:flutter_bloc_architecture/values/values.dart';

import 'bloc/social_media_list_bloc.dart';
import 'bloc/social_media_list_events.dart';
import 'bloc/social_media_list_states.dart';


class SocialMediaListScreen extends StatefulWidget {
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaListBloc, SocialMediaListState>(
      builder: (context, state) {
        if (state is SocialMediaListLoaded) {
          print(state.socialMedia.first.isFavourite);
          state.socialMedia
              .map((e) => {print('SocialMediaListBlocInit'+e.toString())});
          return ListView(
            children: state.socialMedia
                .map((item) => CheckboxSocialMediaItem(item, (isChecked) =>
                  BlocProvider.of<SocialMediaListBloc>(context)
                      .add(FavouriteUnFavouriteCheck(isChecked!, item.id)),
            ))
                .toList(),
          );
        } else {
          return Center(child: Text(Strings.emptyList));
        }
      },
    );
  }
}
