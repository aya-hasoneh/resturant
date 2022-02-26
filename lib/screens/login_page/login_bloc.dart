import 'package:flutter/material.dart';
import 'package:juice/screens/main.dart';

class LoginBloc {
 TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMsg = " ";

   validateLoginFeild(BuildContext context ) {
    if (userNameController.text.isEmpty) {
      errorMsg = "User Name Is Empty";
    } else if (userNameController.text != "aya") {
      errorMsg = "User Name Is Not Correct";
    } else if (passwordController.text.isEmpty) {
      errorMsg = "Password Is Empty";
    } else if (passwordController.text != "123") {
      errorMsg = "Password Is Not Correct";
    } else {
      errorMsg = " ";
        Navigator.push( 
                        context,
                       MaterialPageRoute(
                builder: (context) => MainContainer()),
                       );
    }

   
  }
}