import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'items.dart';

class HomePage extends StatelessWidget {
  List<String> imageUrls = [
    "assets/img_slider.png",
    "assets/img_slider.png",
    "assets/img_slider.png"
  ];

  List<ItemsData> items = [
    ItemsData(text: 'Wishkey', imagePath: "assets/wishkey.png"),
    ItemsData(text: 'Rum', imagePath: "assets/wishkey.png"),
    ItemsData(text: 'Beer', imagePath: "assets/wishkey.png"),
    ItemsData(text: 'Alchole', imagePath: "assets/wishkey.png"),
    ItemsData(text: 'Pepsi', imagePath: "assets/wishkey.png"),
  ];

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
      body: SafeArea(child:
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location widget
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 17),
                    child: Image.asset(
                      "assets/location.png",
                      height: 20,
                      width: 17,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'DELIVER TO',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 7),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 10.0, bottom: 16.0, top: 4),
                        child: Text('Home-15/4 Roadwa..'),
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    // Adjust the color as needed
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for drink...',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
              ),

              SizedBox(height: 20),

            ],
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 120.0, // Adjust the height as needed
                    aspectRatio: 16 / 16,
// Adjust the aspect ratio as needed
                    autoPlay: true,
                    enlargeCenterPage: false,
                  ),
                  items: imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            imageUrl, // Use your image URLs here
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Explore Categories'),
                ),
                getHorzontalView(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Popular Liquor'),
                ),
                getVerticalView()
              ],
            ),
          ))
          ],

      ),




      ),
    );
  }

  Widget getHorzontalView() {
    return Container(
      height: 120,
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of items per row (1 for horizontal)
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16.0), // Adjust the radius as needed
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.asset(
                  items[index].imagePath, // Image path or URL
                  width: 24.0, // Adjust the width as needed
                  height: 65.0, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),

                // Text at the bottom
                Text(
                  items[index].text,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getVerticalView() {
    return Container(
      child: ListView.builder(
        itemCount: items_.length,
        // Disable scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    item.alcoholContent,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${item.price}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
