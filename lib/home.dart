import 'package:brew/cart-screens/add-cart.dart';
import 'package:brew/custom_colors.dart';
import 'package:brew/home-pages/HomeScreenView.dart';
import 'package:brew/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

import 'cart-screens/card-swpe-screen.dart';
import 'custom-bottom-naviigation.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CardSwipe(),
    AddCartScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.white,
        waterDropColor: CustomColors.splashColor,
        inactiveIconColor: Colors.grey,
        iconSize: 34,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          /* _widgetOptions.animateToPage(_selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);*/
        },
        selectedIndex: _selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home_outlined,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.quick_contacts_dialer_outlined,
            outlinedIcon: Icons.quick_contacts_dialer_outlined,
          ),
          BarItem(
              filledIcon: Icons.shopping_cart_outlined,
              outlinedIcon: Icons.shopping_cart_outlined),
          BarItem(
              filledIcon: Icons.person_outline,
              outlinedIcon: Icons.person_outline),
        ],
      ),

      /* bottomNavigationBar: CustomBottomNavigationBar(
        onItemSelected: (index) {
          // Callback function to handle item selection
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
*/

      /*  BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,

            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,

            ),
            label: _selectedIndex ==1  ? 'Search' : 'dsf',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey,

            ),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_off,
              color: Colors.grey,

            ),
            label: 'Profile',


          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.splashColor,
        onTap: _onItemTapped,
        iconSize: 33,
        elevation: 5,
        selectedLabelStyle: TextStyle(fontSize: 16.0), // Increase the font size
        unselectedLabelStyle: TextStyle(fontSize: 16.0),

      ),*/
    );
  }
}
