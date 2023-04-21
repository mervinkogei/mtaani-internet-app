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