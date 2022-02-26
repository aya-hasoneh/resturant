import 'package:flutter/material.dart';
import 'package:juice/screens/create_new_accoun_page/create_new_account_bloc.dart';

import '../login_page/login_screen.dart';





class CrateAccountScreen extends StatefulWidget {
  @override
  State<CrateAccountScreen> createState() => _CrateAccountScreenState();
}

class _CrateAccountScreenState extends State<CrateAccountScreen> {
  var myBloc = NewAccountBloc();

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),

                // IconButton(icon:Icon(Icons.arrow_back),color: Color(0xffF46186), onPressed: (){}),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Color(0xffF46186),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        "Register",
                        style:
                            TextStyle(color: Color(0xff747474), fontSize: 16),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 79.5, left: 28.5, right: 27),
                  child: TextField(
                    controller: myBloc. nameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle:
                          TextStyle(color: Color(0xff939393), fontSize: 16),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 33.5, left: 28.5, right: 27),
                  child: TextField(
                    controller:myBloc. emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: Color(0xff939393), fontSize: 16),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 33.5, left: 28.5, right: 27),
                  child: TextField(
                    controller: myBloc.mobileController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Mobile",
                        hintStyle:
                            TextStyle(color: Color(0xff939393), fontSize: 16),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 33.5, left: 28.5, right: 27),
                  child: TextField(
                    controller:myBloc. createPasswordController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Create Password",
                        hintStyle:
                            TextStyle(color: Color(0xff939393), fontSize: 16),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 39.5),
                  child: ElevatedButton(
                      onPressed: () {
                        myBloc.validateTextFeild() ;
                        setState(() {});
                        // validateTextFeild();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => MainScreen()),
                        // );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffF46186)),
                      )),
                ),
                Text(
                  myBloc.errorMsg,
                  style: TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Google",
                          style:
                              TextStyle(color: Color(0xffF05F5F), fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 35.2,
                      ),
                      Container(
                        height: 15,
                        width: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 21.2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Facebook",
                          style:
                              TextStyle(color: Color(0xff3884C6), fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 43.7,
                      ),
                      Container(
                        height: 15,
                        width: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 21.2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Twitter",
                          style:
                              TextStyle(color: Color(0xff4CAAFC), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(color: Color(0xff939393), fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
