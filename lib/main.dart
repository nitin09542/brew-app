import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'OnboardingScreen.dart';
import 'custom_colors.dart';
void main() {
  // Hide the status bar
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() =>MyAppState();


}
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }

}

class MySplashScreen extends StatefulWidget {
  @override
  SplashScreen createState() => SplashScreen();

}
class SplashScreen extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    // Hide the status bar when this screen is displayed
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Delay navigation to the next page by 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the next page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return OnboardingScreen(); // Replace with the name of your next page widget
          },
        ),
      );
    });

  }

  @override
  void dispose() {
    super.dispose();
    // Re-enable system UI overlays when the screen is disposed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image or color (if needed)
          Container(
            color: CustomColors.splashColor, // Change to your desired background color
          ),
          // Text image
          Center(
            child: Image.asset(
              'assets/splash.png', // Path to your text image
              width: 453, // Adjust the width and height as needed
              height: 453,
            ),
          ),
        ],
      ),
    );
  }
}

