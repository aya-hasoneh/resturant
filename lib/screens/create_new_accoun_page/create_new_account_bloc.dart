import 'package:flutter/material.dart';

class NewAccountBloc {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();

  String errorMsg = "";


   validateTextFeild() {
    if (nameController.text.isEmpty) {
      errorMsg = "Name Is Empty ";
    } else if (emailController.text.isEmpty) {
      errorMsg = "Email Is Empty ";
    } else if (mobileController.text.isEmpty) {
      errorMsg = "Mobile Is Empty ";
    } else if (createPasswordController.text.isEmpty) {
      errorMsg = "Password Is Empty ";
    } else {
      errorMsg = "";
    }
    
  }
}