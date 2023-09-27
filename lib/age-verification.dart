import 'package:brew/hello-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';
class AgeVerificationScreen extends StatefulWidget {
  @override
  _AgeVerificationScreenState createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  GlobalKey qrKey = GlobalKey();
 // late QRViewController controller;
  String result = "Scan a QR code to verify your age";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }
  void _submitForm() {
    // Add your logic to navigate to the next screen or perform an action here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Are you 21 or older ?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Please verfiy if you are above 21 or older.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                  Center(
                    child: Container(
                      color: Colors.black,
                      height: 469,
                      width: 319,
                      child:

                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child:
                        Center(
                          child: Stack(
                               children: [
                                 Expanded(
                                   child:Image(
                                     image: AssetImage('assets/rectangle.png'),
                                     width: 250, // Adjust the width as needed.
                                     height: 200, // Adjust the height as needed.
                                   ),
                                 ),
              // Image to be placed inside the background image
                 Positioned(
                top: 50, // Adjust the top position as needed.
                left: 0, // Adjust the left position as needed.
                child: Image.asset(
                  'assets/green-rec.png',
                  width: 250,
                  height: 100,
                ),
                 )
                ],
                              ),
                        )

                      ),
                    ),
                  ),
                SizedBox(height: 20.0),


              ],
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.splashColor
                      , maximumSize: Size.infinite,
                      minimumSize: Size(double.maxFinite, 50)),
                  child: Text("Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
