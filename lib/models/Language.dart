import 'package:flutter/cupertino.dart';

class Language {
  final String title;
  final String subTitle;
  IconData? icon;
  bool selected = false;

  Language(this.title, this.subTitle);
}