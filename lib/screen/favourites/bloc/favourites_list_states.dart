import 'package:flutter_bloc_architecture/model/social_media.dart';

abstract class FavouritesListSate {}

class FavouritesListEmpty extends FavouritesListSate {}

class FavouritesListLoaded extends FavouritesListSate {
  final List<SocialMedia> favourites;

  FavouritesListLoaded(this.favourites);
}