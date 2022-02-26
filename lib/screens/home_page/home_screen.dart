import 'package:flutter/material.dart';
import 'package:juice/moudles/productItem.dart';
import 'package:juice/screens/home_page/home_bloc.dart';
import 'package:juice/utls/singleton.dart';

import '../product_details_page/product_screen.dart';

class HomeScreen extends StatelessWidget {
  var myBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: Singleton.prefrence. productList.length,
          itemBuilder: (cxt, index) {
            return myBloc. productCell(
             // productList:Singleton.prefrence. productList,
              product:Singleton.prefrence. productList[index],
              context: context,
              index: index,
            );
          }),
    );
  }

//   Widget productCell(
//       { 
//       ProductItemModel product,
//       BuildContext context,
//       int index,
//       }) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ProductDetails(product,index)));
//       },
//       child: Column(children: [
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(product.name),
//                     Text(product.price.toString()),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: product.color),
//                     //  color: product.color,
//                     // color: Colors.purple[(200)],
//                     //   Color:color,
//                     borderRadius: BorderRadius.circular(37.5)),
//                 height: 85,
//               ),
//             ),
//             Image.asset(
//               "assets/images/productimage"+product.imageNumber+".png",
//               height: 50,
//               width: 50,
//             )
//           ],
//         ),
//         SizedBox(
//           height: 12.3,
//         ),
//       ]),
//     );
//   }
 }
