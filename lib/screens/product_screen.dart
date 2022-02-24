import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:juice/moudles/productItem.dart';
import 'package:juice/screens/cart_screen.dart';
import 'package:juice/shared_widget/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  // String pageTitle;
  //int itemCount;
  List<ProductItemModel> listOfProduct;
  ProductItemModel product;
  int selectedIndex;
  ProductDetails(this.listOfProduct, this.product, this.selectedIndex);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var selectedItemtitle = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourCustomAppBar(
        context,
        title:
            selectedItemtitle == "" ? widget.product.name : selectedItemtitle,
        showBackButton: true,
        backButtonPressed: () {},
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 8),
          height: 700,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemCount: widget.listOfProduct.length,
            onPageChanged: (index) {
              selectedItemtitle = widget.listOfProduct[index].name;
              setState(() {});
            },
            controller: PageController(
                initialPage: widget.selectedIndex, viewportFraction: 0.8),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    // height: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: widget.listOfProduct[index].color)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 53),
                        child: Image.asset(
                          "assets/images/productimage" +
                              widget.listOfProduct[index].imageNumber +
                              ".png",
                          scale: 0.4,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        widget.listOfProduct[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "200ml, 1x ₹" +
                                widget.listOfProduct[index].price.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.5, left: 30, right: 30),
                        child: Divider(
                          height: 6,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 33.7),
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {
                                    if (widget.listOfProduct[index].qty < 1) {
                                      return;
                                    } else {
                                      widget.listOfProduct[index].qty--;
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                              Text(
                                widget.listOfProduct[index].qty.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () {
                                    widget.listOfProduct[index].qty++;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                            ]),
                          ),
                          Text(
                            "\$" +
                                (widget.listOfProduct[index].price *
                                        widget.listOfProduct[index].qty)
                                    .toStringAsFixed(2),
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: Column(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.listOfProduct[index].rate,
                          minRating: 1,
                          direction: Axis.horizontal,
                          // allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            widget.listOfProduct[index].rate = rating;
                            setState(() {});
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("You have saved  " +
                            widget.listOfProduct[index].rate.toString()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 50,
                    width: 146,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: widget.listOfProduct[index].color)),
                    child: TextButton(
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        List<ProductItemModel> newList = [];
                        for (ProductItemModel model in widget.listOfProduct) {
                          if (model.qty > 0) {
                            newList.add(model);
                          }
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                  listOfProuct: newList,
                                  comingFromTab: false,
                                  newList: (list) {
                                    for (ProductItemModel mainList
                                        in widget.listOfProduct) {
                                      for (ProductItemModel subList
                                          in widget.listOfProduct) {
                                        if (mainList.name == subList.name) {
                                          mainList.qty == subList.qty;
                                        }
                                      }
                                    }
                                    setState(() {});

                                    // widget.listOfProduct = list;
                                  })),
                        );
                      },
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ]),
    );
  }
}
