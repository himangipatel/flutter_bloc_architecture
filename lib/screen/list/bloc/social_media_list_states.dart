import 'package:flutter_bloc_architecture/model/social_media.dart';

abstract class SocialMediaListState {}

class SocialMediaListLoaded extends SocialMediaListState {
  final List<SocialMedia> socialMedia;

  SocialMediaListLoaded(this.socialMedia);
}

