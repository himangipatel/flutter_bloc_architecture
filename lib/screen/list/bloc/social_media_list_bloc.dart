import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/model/model.dart';
import 'package:flutter_bloc_architecture/screen/list/social_list.dart';

class SocialMediaListBloc
    extends Bloc<SocialMediaListEvent, SocialMediaListState> {
  // final SocialMediaBloc mainBloc;

  SocialMediaListBloc(/*this.mainBloc*/)
      : super(SocialMediaListLoaded(SimpleSocialMediaRepository().getSocialMedia)) ;


  @override
  Stream<SocialMediaListState> mapEventToState(
      SocialMediaListEvent event) async* {
    switch (event.runtimeType) {
      case LoadSocialMediaList:
        yield SocialMediaListLoaded((event as LoadSocialMediaList).list);
        break;
      case FavouriteUnFavouriteCheck:
        final updatedList = (state as SocialMediaListLoaded).socialMedia;
        updatedList
            .firstWhere((item) => item.id == (event as FavouriteUnFavouriteCheck).itemId)
            .setFavourite((event as FavouriteUnFavouriteCheck).isChecked);
        yield SocialMediaListLoaded(updatedList);
        break;
    }
  }
}
