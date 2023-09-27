import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_colors.dart';
import '../home-pages/items.dart';

class AddCartScreen extends StatefulWidget {
  @override
  MyAddCartScreen createState() => MyAddCartScreen();
}

class MyAddCartScreen extends State<AddCartScreen> {
  // List of items
  final List<Item> items_ = [
    Item(
      imagePath: 'assets/wishkey.png',
      title: 'Smirnoff Lemon Vodka',
      description: '375ml Can',
      alcoholContent: '5%',
      price: '2.98',
    ),

    Item(
      imagePath: 'assets/wishkey.png',
      title: 'Smirnoff Lemon Vodka',
      description: '375ml Can',
      alcoholContent: '5%',
      price: '2.98',
    ),

    Item(
      imagePath: 'assets/wishkey.png',
      title: 'Smirnoff Lemon Vodka',
      description: '375ml Can',
      alcoholContent: '5%',
      price: '2.98',
    ),
    Item(
      imagePath: 'assets/wishkey.png',
      title: 'Smirnoff Lemon Vodka',
      description: '375ml Can',
      alcoholContent: '5%',
      price: '2.98',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/arroe-left.png",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Cart",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: getVerticalView()))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.splashColor,
                      maximumSize: Size.infinite,
                      minimumSize: Size(double.maxFinite, 50)),
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getVerticalView() {
    return Container(
      child: ListView.builder(
        itemCount: items_.length,
        // Disable scrolling
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return getCards(items_[index]);
        },
      ),
    );
  }

  Widget getCards(Item item) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      child: Row(
        children: [
          // Left: Image

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Right: Text
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    item.description,
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.splashColor),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "1",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.splashColor),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '\$${item.price}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
