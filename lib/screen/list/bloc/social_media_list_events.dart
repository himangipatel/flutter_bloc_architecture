import 'package:flutter_bloc_architecture/model/social_media.dart';

abstract class SocialMediaListEvent {}

class LoadSocialMediaList extends SocialMediaListEvent {
  final List<SocialMedia> list;

  LoadSocialMediaList(this.list);
}

class FavouriteUnFavouriteCheck extends SocialMediaListEvent {
  final bool isChecked;
  final int itemId;

  FavouriteUnFavouriteCheck(this.isChecked, this.itemId);
}
