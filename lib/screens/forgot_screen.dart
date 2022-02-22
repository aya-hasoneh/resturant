import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailPhoneController = TextEditingController();
  @override
  void initState() {
    emailPhoneController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:(){
      FocusScope.of(context).unfocus();
    } ,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(color: Color(0xff747474), fontSize: 16),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 102, left: 28, right: 28, bottom: 50.5),
                child: TextField(
                  controller: emailPhoneController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter Email ID / Phone Number",
                      hintStyle: TextStyle(
                        color: Color(0xFF939393),
                        fontStyle: FontStyle.normal,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff808080))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ), //0xffF46186
              ElevatedButton(
                  onPressed: validateForgotPasswordFeild() 
                  ? () {} 
                  : null,
                  child: Text("Submit"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffF46186)),
                  )),

                   ElevatedButton(
                  onPressed: 
                   () { Navigator.pop(context);} ,
                  child: Text("Back Button"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffF46186)),
                  )),


            ],
          ),
        ),
      ),
    );
  }

  bool validateForgotPasswordFeild() {
    if (emailPhoneController.text.isEmpty) {
      return false;
    } else {
      setState(() {});
      return true;
    }
  }
}
