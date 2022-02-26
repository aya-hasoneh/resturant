import 'package:flutter/material.dart';
import 'package:juice/screens/forgot_password_page/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var myBloc = ForgotBloc();
  @override
  void initState() {
  myBloc.emailPhoneController.addListener(() {
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
                  controller: myBloc.emailPhoneController,
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
                  onPressed: myBloc.validateForgotPasswordFeild() 
                  ? () {setState(() {});} 
                  : null,
                  child: Text("Submit"),
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffF46186)),
                  )
                   
                  ),

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

 
}
