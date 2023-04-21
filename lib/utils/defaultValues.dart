import 'package:flutter/material.dart';

class DefaultValues{
  List defaultNavigationList = [
    {
      "icon": Icon(Icons.drafts_outlined),
      "activeIcon": Icon(Icons.drafts_outlined),
      "label": 'Packages'
    },
    {
      "icon": const Icon(Icons.home),
      "activeIcon": const Icon(Icons.home),
      "label": 'Home',
    },
    {
      "icon": const Icon(Icons.person),
      "label": 'Account',
      "activeIcon": const Icon(Icons.person),
    },
  ];
}

class packageItems{
  String ? title;
  String ? mbpsTitle;
  bool? isActive;
  String? totalAmount;
  Color? color;

  packageItems({this.isActive,this.mbpsTitle,this.title,this.totalAmount, this.color});
}