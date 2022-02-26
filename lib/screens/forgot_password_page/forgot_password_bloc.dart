import 'package:flutter/material.dart';

class ForgotBloc {

  TextEditingController emailPhoneController = TextEditingController();

   bool validateForgotPasswordFeild() {
    if (emailPhoneController.text.isEmpty) {
      return false;
    } else {
     
      return true;
    }
  }
}