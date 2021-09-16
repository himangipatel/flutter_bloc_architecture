import 'package:flutter/cupertino.dart';

class SocialMedia extends ChangeNotifier{
  int id;
  String title;
  String iconAsset;
  bool isFavourite=false;

  SocialMedia(this.id, this.title,this.iconAsset,this.isFavourite);

  void setFavourite(bool isFavourite) {
    this.isFavourite = isFavourite;
  }

  @override
  String toString() {
    return '$title " " $isFavourite';
    }
}