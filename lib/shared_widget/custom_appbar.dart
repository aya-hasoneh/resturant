import 'package:flutter/material.dart';

AppBar ourCustomAppBar(BuildContext context,
    {String title = "Jusbar", bool showBackButton = false}) {
  return AppBar(
    backgroundColor: Colors.purpleAccent,
    title: Text(title),
    leading: showBackButton
        ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            })
        : Container(),
    actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
  );
}
