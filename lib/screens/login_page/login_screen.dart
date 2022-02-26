import 'package:flutter/material.dart';
import 'package:juice/screens/login_page/login_bloc.dart';


import '../create_new_accoun_page/create_new_account_screen.dart';

import '../forgot_password_page/forgot_screen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 var myBloc =LoginBloc();

  @override
    void initState() {
     myBloc. userNameController.text="aya";
     myBloc. passwordController.text="123";
      
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: 85,
            ),
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF747474),
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 102, left: 28, right: 28),
              child: TextField(
                controller: myBloc. userNameController,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(
                      color: Color(0xFF939393),
                      fontStyle: FontStyle.normal,
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 33.5, left: 28, right: 28),
              child: TextField(
                controller:myBloc. passwordController,
                obscureText: true,
                obscuringCharacter: '•',
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Color(0xFF939393),
                      fontStyle: FontStyle.normal,
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff808080))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            SizedBox(
              height: 50.5,
            ),
            Container(
              width: 319,
              height: 40,
              child: RaisedButton(
                onPressed: () {
               myBloc.validateLoginFeild( 
                       context
                       );
                setState(() {});
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                ),
                 color: Color(0xffF46186),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text(
            myBloc.  errorMsg,
              style: TextStyle(color: Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 35.2, top: 50.1),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Google",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffF05F5F)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 49.3),
                  child: Container(
                    height: 20,
                    width: 1.3,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 43.7, left: 21.2, top: 50.1),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Facebook",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff3884C6)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 49.3),
                  child: Container(
                    height: 20,
                    width: 1.3,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 21.5, top: 50.1),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Twitter",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff4CAAFC)),
                      )),
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text(
                      "Forgrot Password",
                      style: TextStyle(fontSize: 14, color: Color(0xff939393)),
                    )),
                SizedBox(
                  width: 101,
                ),
                TextButton(
                    onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CrateAccountScreen()),
                      );
                    },
                    child: Text(
                      "Create new account",
                      style: TextStyle(fontSize: 14, color: Color(0xff939393)),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
}
