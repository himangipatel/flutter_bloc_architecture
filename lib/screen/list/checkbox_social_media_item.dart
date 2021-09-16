import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/model/social_media.dart';
import 'package:flutter_bloc_architecture/values/values.dart';
import 'package:flutter_bloc_architecture/widget/social_media_item.dart';

class CheckboxSocialMediaItem extends StatelessWidget {
  final SocialMedia item;
  final ValueChanged<bool?> onCheckboxChanged;

  CheckboxSocialMediaItem(this.item, this.onCheckboxChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingDefault),
      child: Row(
        children: [
          Checkbox(value: item.isFavourite,onChanged: onCheckboxChanged,),
          SocialMediaItem(item,)
        ],
      ),
    );
  }
}