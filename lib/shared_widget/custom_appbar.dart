import 'package:flutter/material.dart';

AppBar ourCustomAppBar(BuildContext context,
    {String title = "Jusbar", bool showBackButton = false, VoidCallback backButtonPressed}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Center(child: Text(title,style: TextStyle(color: Colors.grey),)),
    leading: showBackButton
        ? IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.grey,),
            onPressed: () {
              backButtonPressed();
              Navigator.pop(context);
            })
        : Container(),
    actions: [IconButton(icon: Icon(Icons.notifications,color: Colors.grey,), onPressed: () {})],
  );
}
