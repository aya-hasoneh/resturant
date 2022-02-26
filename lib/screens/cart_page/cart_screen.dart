import 'package:flutter/material.dart';
import 'package:juice/screens/cart_page/cart_bloc.dart';
import 'package:juice/screens/payment_page/payment_screen.dart';
import 'package:juice/shared_widget/custom_appbar.dart';
import 'package:juice/utls/singleton.dart';

import '../../moudles/productItem.dart';

class CartScreen extends StatefulWidget {
  //final Function(List<ProductItemModel>) newList;

  VoidCallback refresh;
  bool comingFromTab;
  CartScreen(
      {@required this.refresh,
      // this.newList,
      this.comingFromTab = true});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var myBloc = CartBloc();
  
  @override
  void initState() {
    
    
       for(ProductItemModel item in Singleton.prefrence.productList){
         if(item.qty > 0){
     myBloc. filterList.add(item);
   }
     }
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.comingFromTab
          ? null
          : ourCustomAppBar(context, title: "My Cart", showBackButton: true,
              backButtonPressed: () {
              widget.refresh();
              // widget.newList(Singleton.prefrence.productList);
            }),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ListView.builder(
                  itemCount: myBloc.filterList.length,
                  itemBuilder: (context, index) {
                    return productTile(myBloc.filterList[index], index);
                  }),
            ),
          ),
        ),
        Expanded(
            child: Container(
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 28, left: 28),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Your Order ",
                style: TextStyle(
                    color: Color(0xff585858),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19),
                child: Row(
                  children: [
                    Text(
                      "Bill Total",
                      style: TextStyle(color: Color(0xff585858), fontSize: 18),
                    ),
                    SizedBox(width: 250),
                    Text(
                      "₹" + getBillTotal(),
                      style: TextStyle(color: Color(0xff585858), fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Row(
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(color: Color(0xff585858), fontSize: 18),
                    ),
                    SizedBox(width: 250),
                    Text(
                      "30%",
                      style: TextStyle(color: Color(0xff585858), fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Row(
                  children: [
                    Text(
                      "Grand Total",
                      style: TextStyle(
                          color: Color(0xff585858),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 200),
                    Text(
                      "₹" + grandTotal(getBillTotal()),
                      style: TextStyle(
                          color: Color(0xff585858),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, left: 120),
                child: Container(
                  height: 50,
                  width: 146,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0xffEC90E9), Color(0xffF45D7E)])),
                  child: TextButton(
                    child: Text(
                      "Proceed to pay",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentPage(
                                  grandTotal: () {
                                    setState(() {});
                                  },
                                )),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        )),
      ]),
    );
  }

  Widget productTile(ProductItemModel model, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 344,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
              spreadRadius: 0.5,
              offset: Offset(3.0, 3.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 14),
            child: Row(
              children: [
                Image.asset(
                    "assets/images/productimage" + model.imageNumber + ".png"),
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Column(
                    children: [
                      Text(
                        model.name,
                        style:
                            TextStyle(color: Color(0xff767676), fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.pink[300],
                            size: 18,
                          ),
                          Text(
                            "200ml, 1x ₹" + model.price.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 135,
                ),
                IconButton(
                  onPressed: () {
                    Singleton.prefrence.productList[index].qty = 0;
                    Singleton.prefrence.productList.removeAt(index);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 6,
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 33.7),
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        if (model.qty == 1) {
                          Singleton.prefrence.productList[index].qty = 0;
                          Singleton.prefrence.productList.removeAt(index);
                        } else {
                          model.qty--;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.grey,
                        size: 25,
                      )),
                  Text(
                    model.qty.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        model.qty++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.grey,
                        size: 25,
                      )),
                ]),
              ),
              SizedBox(
                width: 180,
              ),
              Text(
                "₹" + (model.qty * model.price).toStringAsFixed(2),
                style: TextStyle(color: Colors.grey[700], fontSize: 23),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  String getBillTotal() {
    double total = 0;
    for (ProductItemModel model in Singleton.prefrence.productList) {
      total = total + (model.qty * model.price);
    }
    return total.toStringAsFixed(2);
  }

  String grandTotal(String total) {
    var doubleToltl = double.parse(total);
    return (doubleToltl * 70 / 100).toStringAsFixed(2);
  }
}
