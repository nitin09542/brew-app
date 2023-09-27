import 'package:brew/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child:
       Padding(
         padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
         child: 
         SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "Profile",
                 style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w600,
                     color: Colors.black),
               ),
               SizedBox(height: 10,),
               Center(
                 child:  Stack(
                     children: [
                       // Background Image
                       Image.asset(
                         "assets/profile_arpit.png",
                         height: 120,
                         width: 120,
                         fit: BoxFit.cover,
                       ),
                       // Overlay Image
                       Positioned(
                         bottom: 10, // Adjust the position from the top
                         right: 5, // Adjust the position from the left
                         child:
                         Container(
                           height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                             border: Border.all(width: 2, color: CustomColors.splashColor), // Adjust the color as needed
                             borderRadius: BorderRadius.circular(15),
                             color:  CustomColors.splashColor,
                           ),
                           child:
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Image.asset(
                               'assets/edit.png',
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                     ],
                   )
               ),
               SizedBox(height: 10,),
               Center(
                 child: Text(
                   "Hello",
                   style: TextStyle(
                       fontSize: 13,
                       fontWeight: FontWeight.w400,
                       color: Colors.black),
                 ),
               ),
               Center(
                 child: Text(
                   "Arpit Chandak",
                   style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w600,
                       color: Colors.black),
                 ),
               ),
               SizedBox(height: 20,),
               dynamicWidget(context),
               SizedBox(height: 20,),
               Text(
                 "MANAGEMENT",
                 style: TextStyle(
                     fontSize: 13,
                     fontWeight: FontWeight.w400,
                     color: Colors.black),
               ),
               SizedBox(height: 20,),
               dynamicWidget(context),
               SizedBox(height: 20,),
               dynamicWidget(context),
               SizedBox(height: 20,),
               dynamicWidget(context),
               SizedBox(height: 20,),
               Text(
                 "SUPPORT",
                 style: TextStyle(
                     fontSize: 13,
                     fontWeight: FontWeight.w400,
                     color: Colors.black),
               ),
               SizedBox(height: 20,),
               dynamicWidget(context),
               SizedBox(height: 20,),
               dynamicWidget(context),
             ],
           ),
         ),
       ),
     ),
   );
  }
  Widget dynamicWidget(BuildContext context){
    return   Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.1, color:Colors.grey), // Adjust the color as needed
          borderRadius: BorderRadius.circular(15),
          color:  Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/bag.png"),
                    SizedBox(width: 15,),
                    Center(
                      child: Text("My Order"
                        , style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),),

                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    _showBottomSheet(context);
                  },
                    child: Icon(Icons.arrow_forward_ios_sharp)),
              ],
            ),
          ),
        )

    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true to make it occupy 80% of the screen
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8, // Set the height factor to 0.8 (80% of the screen)
          child: Container(
            // Define the content of your bottom sheet dialog here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Take a Photo'),
                  onTap: () {
                    // Handle the action when 'Take a Photo' is tapped
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choose from Gallery'),
                  onTap: () {
                    // Handle the action when 'Choose from Gallery' is tapped
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}