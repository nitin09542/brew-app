import 'package:brew/custom_colors.dart';
import 'package:brew/home.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello, Arpit",
              style: TextStyle(fontSize: 46,
              fontWeight: FontWeight.w600,
              color: CustomColors.splashColor),
            ),
            SizedBox(height: 20),
            Text(
              "Thanks for joining",
              style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.splashColor),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyNavigationBar()));

              },
              child: Text(
                "Evening Brew!",
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.splashColor),
              ),
            ),

          ],
        ),

      ),
    );
  }

}
