import 'package:brew/otpscreen.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class EnterMobileNumberScreen extends StatefulWidget {
  @override
  _EnterMobileNumberScreenState createState() => _EnterMobileNumberScreenState();
}

class _EnterMobileNumberScreenState extends State<EnterMobileNumberScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void continuePressed() {
    String phoneNumber = phoneNumberController.text;
    // Handle the phone number (e.g., validate or proceed with the next step)
    print("Phone number: $phoneNumber");
    // Add your logic to navigate to the next screen or perform an action here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OTPScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child:
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      'Enter your phone number',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Login or sign up to place your order',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white), // Adjust the color as needed
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Row(

                                  children: [
                                    SizedBox(width: 7,),
                                    Image.asset(
                                      "assets/flag.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                    Image.asset(
                                      "assets/arrow-bottom.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ],
                                )


                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white), // Adjust the color as needed
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Text(
                                  '+91',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '7905302378',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),



                  ],
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: continuePressed,
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


      )

      );
  }
}
