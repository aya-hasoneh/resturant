import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../moudles/productItem.dart';
import '../product_details_page/product_screen.dart';

class HomeBloc {
    Widget productCell(
      { 
      ProductItemModel product,
      BuildContext context,
      int index,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product,index)));
      },
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(product.name),
                    Text(product.price.toString()),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: product.color),
                    //  color: product.color,
                    // color: Colors.purple[(200)],
                    //   Color:color,
                    borderRadius: BorderRadius.circular(37.5)),
                height: 85,
              ),
            ),
            Image.asset(
              "assets/images/productimage"+product.imageNumber+".png",
              height: 50,
              width: 50,
            )
          ],
        ),
        SizedBox(
          height: 12.3,
        ),
      ]),
    );
  }
}
