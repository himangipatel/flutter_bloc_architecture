import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/model/social_media.dart';
import 'package:flutter_bloc_architecture/values/values.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaItem extends StatelessWidget {
  final SocialMedia item;

  SocialMediaItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: Dimens.paddingSmall),
            child: SvgPicture.asset(item.iconAsset)),
        Text(item.title),
      ],
    );
  }
}
