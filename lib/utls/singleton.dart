import 'package:flutter/material.dart';

import '../moudles/productItem.dart';

class Singleton {
 static final  Singleton prefrence = Singleton();

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
}