import 'package:brew/EnterMobilenumberScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_colors.dart';
import 'main.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _onboardingPages = [
    OnboardingPage("assets/onboard.png","assets/slider.png"),
    OnboardingPage("assets/onboardone.png","assets/slidertwo.png"),
    OnboardingPage("assets/onboardtwo.png","assets/sliderone.png"),
  ];

  @override
  void initState() {
    super.initState();
    // Change the status bar color to blue
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    if (_currentPage < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // You can handle what happens when the user reaches the last onboarding screen.
      // For example, navigate to the main app screen.
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EnterMobileNumberScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(


          children: [
            Expanded(

              child: PageView(
                controller: _pageController,
                children: _onboardingPages,
              ),

            ),
            SizedBox(height: 10),
            /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildDots(),
          ),*/

            _makeUi()[_currentPage],
            SizedBox(height: 10),

            if (_currentPage < _onboardingPages.length - 1)

                GestureDetector(
                  onTap: _navigateToNextPage,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: CustomColors.splashColor,
                    ),
                  ),

                )

            else

              ElevatedButton(
                  onPressed: _navigateToNextPage,

                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.splashColor
                      , maximumSize: Size.infinite,
                      minimumSize: Size(200, 40)),
                  child: Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

          ],
        ),
      )


    );
  }

  List<Widget> _makeUi(){
    List<Widget> dots = [];
    var title="";
    var des="";
    for (int i = 0; i < _onboardingPages.length; i++) {
      if(i==0){
        title="Choose Your Favorite Drink";
        des="Find your favorite drink anytime from your existing location easily";
      }
      else if(i==1){
        title="Refresh Yourself with a Drink";
        des="Be it a game night or long day after office we are always there to refresh you";
      }
      else{
        title="Fastest Delivery Ever";
        des="Because chilled drinks are always better";
      }
      dots.add(
        Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              des,
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        )
      );
    }
   return dots;
  }
  /*List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < _onboardingPages.length; i++) {
      dots.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return dots;
  }*/
}

class OnboardingPage extends StatelessWidget {
  final String url;
  final String sliider;

  OnboardingPage(this.url,this.sliider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.values.first,
        children: [
          // Background image
          Image.asset(
            'assets/onboard-back.png', // Replace with your image asset path
            fit: BoxFit.contain, // Cover the entire screen
          ),
      Padding(
      padding: EdgeInsets.all(20),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        // Background image

        children: [
          Image.asset(
            url,
            height: 270,
            width: 370,// Path to your text image
          ),
          SizedBox(height: 40),
          Image.asset(
            sliider,
              width: 40,
              height: 20,// Path to your text image
          ),

        ],
      ),
    )

        ],
      ),
    );



  }


}

