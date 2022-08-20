import 'package:flutter/material.dart';


Widget getItemList(String title, String subTitle, IconData data) {
  return Card(
    child: ListTile(
      leading: Icon(data),
      title: Text(title),
      subtitle: Text(subTitle),
    )
  );
}