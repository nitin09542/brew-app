import 'package:flutter/material.dart';

import 'age-verification.dart';
import 'custom_colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform your registration logic here
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      // Replace the print statements with your logic
      print("First Name: $firstName");
      print("Last Name: $lastName");
      print("Email: $email");
      print("Password: $password");
    }
    // Add your logic to navigate to the next screen or perform an action here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AgeVerificationScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
      child:  Padding(
          padding: EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              Form(
               key: _formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                     height: 20,
                   ),
                   Image.asset(
                     "assets/arroe-left.png",
                     height: 20,
                     width: 20,
                   ),
                  SizedBox(height: 20,),

                   Text(
                     "Welcome to Evening Brew",
                     style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.w600,
                         color: Colors.black),
                   ),
                   SizedBox(
                     height: 10,
                   ),

                   Text(
                     "Please provide us with few more details",
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w300,
                         color: Colors.black),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Expanded(
                        child:
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey), // Adjust the color as needed
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(labelText: "First Name",
                              border: InputBorder.none),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your first name";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                     SizedBox(width: 10,),
                     Expanded(child:
                     Container(
                       height: 50,
                       decoration: BoxDecoration(
                         border: Border.all(width: 1, color: Colors.grey), // Adjust the color as needed
                         borderRadius: BorderRadius.circular(5),
                         color: Colors.white,
                       ),
                       child:
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: TextFormField(
                           controller: lastNameController,
                           decoration: InputDecoration(labelText: "Last Name",
                           border: InputBorder.none),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "Please enter your last name";
                             }
                             return null;
                           },
                         ),
                       ),
                     ),)
                    ],
                  ),
                   SizedBox(height: 15,),
                   Container(
                     height: 50,
                     decoration: BoxDecoration(
                       border: Border.all(width: 1, color: Colors.grey), // Adjust the color as needed
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.white,
                     ),
                     child:
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextFormField(
                         controller: emailController,
                         decoration: InputDecoration(labelText: "Email Id",
                         border: InputBorder.none),
                         keyboardType: TextInputType.emailAddress,
                         validator: (value) {
                           if (value!.isEmpty) {
                             return "Please enter your email address";
                           }
                           // You can add more email validation logic here if needed.
                           return null;
                         },
                       ),
                     ),
                   ),
                   SizedBox(height: 15,),
                   Container(
                     height: 50,
                     decoration: BoxDecoration(
                       border: Border.all(width: 1, color: Colors.grey), // Adjust the color as needed
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.white,
                     ),
                     child:
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextFormField(
                         controller: passwordController,
                         decoration: InputDecoration(labelText: "Password",
                         border: InputBorder.none),
                         obscureText: true, // Hide the password
                         validator: (value) {
                           if (value!.isEmpty) {
                             return "Please enter a password";
                           }
                           return null;
                         },
                       ),
                     ),
                   ),
                   SizedBox(height: 20),
                 ],
               ),
             ),

             Align(
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
           ],
         ),
        ),
      )
    );
  }
}
