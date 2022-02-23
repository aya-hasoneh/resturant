import 'package:flutter/material.dart';
import 'package:juice/moudles/productItem.dart';

import 'product_screen.dart';

class HomeScreen extends StatelessWidget {
  List<ProductItemModel> productList = [
    ProductItemModel(
        name: "watermelon",
        price: 55.0,
        color: [
          const Color(0xffF45D7E),
          Color(0xffEC90E9),
        ],
        imageNumber: "1"),
    ProductItemModel(
        name: "mango",
        price: 15.0,
        color: [const Color(0xffFD9B8D), Color(0xffFBBE7E)], imageNumber: "2"),
    ProductItemModel(
        name: "blueburry",
        price: 20.0,
        color: [const Color(0xffA076E8), Color(0xffB1C4F8)], imageNumber: "4"),
    ProductItemModel(
        name: "avocado",
        price: 11.0,
        color: [const Color(0xff5CCD92), Color(0xffBFE89C)], imageNumber: "6"),
    ProductItemModel(
        name: "grape",
        price: 15.0,
        color: [const Color(0xffF5B9D5), Color(0xffF5B9D5)], imageNumber: "3"),
    ProductItemModel(
        name: "apple",
        price: 17.0,
        color: [const Color(0xffF4787C), Color(0xffFBA6C6)], imageNumber: "5"),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (cxt, index) {
            return productCell(
              productList: productList,
              product: productList[index],
              context: context,
              index: index,
            );
          }),
    );
  }

  Widget productCell(
      { List<ProductItemModel> productList,
      ProductItemModel product,
      BuildContext context,
      int index,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(productList, product,index)));
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
