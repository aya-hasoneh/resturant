import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juice/screens/home_page/home_screen.dart';
import 'package:juice/screens/payment_page/payment_bloc.dart';
import 'package:juice/shared_widget/custom_appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class PaymentPage extends StatefulWidget {
 VoidCallback grandTotal;
 PaymentPage({@required this.grandTotal});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  var myBloc =PaymentBloc();
  
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: ourCustomAppBar(
        context,
        showBackButton: true,
        backButtonPressed: (){},
        title: "Payment",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 13.9,
            ),
            child: Container(
              height: 190,
              child: PageView.builder(
                  controller:myBloc. pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return cardView(index);
                  }),
            ),
          ),
          SmoothPageIndicator(
            controller: myBloc.pageController,
            count: 3,
            effect: JumpingDotEffect(
              dotHeight: 16,
              dotWidth: 16,
              jumpScale: .7,
              verticalOffset: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 13),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 0.8,
                    // offset: Offset(3.0, 3.0), // shadow direction: bottom right
                  )
                ],
              ),
              height: 350,
              width: 330,
              child: Column(children: [
                SizedBox(
                  height: 38,
                ),
                Text(
                  "Payment Options",
                  style: TextStyle(
                      color: Color(0xff888888),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24.9,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Credit / Debit Card",
                      style: TextStyle(color: Color(0xff939393), fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 29.3),
                  child: Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Payment Gateways",
                      style: TextStyle(color: Color(0xff939393), fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 29.3),
                  child: Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cash On Delivery",
                      style: TextStyle(color: Color(0xff939393), fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 29.3),
                  child: Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 52,
                ),
                Container(
                  height: 61,
                  width: 331,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 41),
                      child: TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Text(
                                "Payment Amount",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              Text(
                         "35.00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 61,
                      width: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 39),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )),
                    )
                  ]),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardView(int index) {
    if (index == 0) {
      return card(Color(0xff40536F), "assets/images/mastercard.png");
    } else if (index == 1) {
      return card(Color(0xff2A98FF), "assets/images/visa.png");
    } else {
      return card(Color(0xffE1AC58), "assets/images/visa.png");
    }
  }

  Widget card(Color color, String image) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(18)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, right: 17),
              child: Image.asset(image),
            ),
          ]),
        ));
  }
}
