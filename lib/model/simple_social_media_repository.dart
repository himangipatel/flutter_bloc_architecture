
import 'package:flutter_bloc_architecture/values/values.dart';

import 'social_media.dart';

class SimpleSocialMediaRepository {

  List<SocialMedia> getSocialMedia = [
    SocialMedia(1, 'Facebook', Images.facebook,false),
    SocialMedia(2, 'Instagram', Images.instagram,false),
    SocialMedia(3, 'LinkedIn', Images.linkedin,false),
    SocialMedia(4, 'QZone', Images.qzone,false),
    SocialMedia(5, 'Reddit', Images.reddit,false),
    SocialMedia(6, 'Snapchat', Images.snapchat,false),
    SocialMedia(7, 'Youtube', Images.youtube,false),
    SocialMedia(8, 'Twitter', Images.twitter,false),
  ];
}