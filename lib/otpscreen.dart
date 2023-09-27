import 'package:brew/welcomescreen.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  String enteredOTP = "";

  // Function to verify OTP
  void verifyOTP() {
    if (enteredOTP == "95318") {
      // Correct OTP, navigate to the next screen or perform your action.
      // Replace this with your desired logic.
      print("OTP Verified");
    } else {
      // Incorrect OTP, show an error message or perform any desired action.
      // Replace this with your desired logic.
      print("Invalid OTP");
    }

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => RegistrationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/arroe-left.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Verify mobile number",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Enter the OTP sent to +91 97654 32104",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildOTPTextField(0),
                      buildOTPTextField(1),
                      buildOTPTextField(2),
                      buildOTPTextField(3),
                      buildOTPTextField(4),
                    ],
                  ),
                ],
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: verifyOTP,
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
          ],
        ),
      ),
    ));
  }

  Widget buildOTPTextField(int index) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(5),

      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white

      ),
      child: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 35),
        child: TextField(
          controller: otpController,
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            // Hide the number suggestion bar
            enabled: false,
          ),
          style: TextStyle(
            fontSize: 24,
          ),
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                if (index < 4) {
                  FocusScope.of(context).nextFocus();
                }
                if (index == 4) {
                  // When the last digit is entered, verify OTP
                  enteredOTP = otpController.text;
                  FocusScope.of(context).unfocus();
                }
              }
            });
          },
        ),
      )),
    );
  }
}
