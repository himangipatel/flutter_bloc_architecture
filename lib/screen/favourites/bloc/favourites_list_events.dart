
import 'package:flutter_bloc_architecture/model/social_media.dart';

abstract class FavouritesListEvent {}

class FavouritesScreenStart extends FavouritesListEvent {
  final List<SocialMedia> list;

  FavouritesScreenStart(this.list);
}