import 'package:flutter/material.dart';
import 'package:juice/moudles/productItem.dart';
import 'package:juice/shared_widget/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
 // String pageTitle;
  //int itemCount;
  List <ProductItemModel> listOfProduct;
  ProductItemModel product;
  ProductDetails(this.listOfProduct,this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourCustomAppBar(context, title: widget.product.name, showBackButton: true),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8),
            height: 366,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: widget.listOfProduct.length,
              onPageChanged: (index){},
              controller: PageController(initialPage: 0, viewportFraction: 0.8),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: widget.listOfProduct[index].color)
                    ),
                child:   Padding(
                  padding: const EdgeInsets.only(top: 50,left: 20),
                  child: Text(widget.listOfProduct[index].name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
