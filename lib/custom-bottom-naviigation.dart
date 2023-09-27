import 'package:brew/custom_colors.dart';
import 'package:brew/home.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  final Function(int) onItemSelected; // Callback function

  CustomBottomNavigationBar({required this.onItemSelected});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with SingleTickerProviderStateMixin {

  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 80, // Adjust the height as needed
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the curve
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, 'Home'),
            _buildNavItem(1, Icons.search, 'Search'),
            _buildNavItem(2, Icons.local_offer, 'Discount'),
            _buildNavItem(3, Icons.person, 'Profile'),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData iconData, String label) {
    // Define the animation variables
    final isSelected = _selectedIndex == index;


    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;

        });

        // Invoke the callback function with the selected index
        widget.onItemSelected(index);


      },
      child:
      ClipPath(
        clipper: CurveClipper(),
        child: Container(
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.transparent,


          ),



    child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  color: _selectedIndex == index ? CustomColors.splashColor : Colors.grey,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: _selectedIndex == index ? CustomColors.splashColor : Colors.grey,
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Start at the bottom-left
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50); // Create a quadratic Bezier curve
    path.lineTo(size.width, 0); // End at the bottom-right
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
