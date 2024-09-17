
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_app/registration/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
  PageViewModel(
  title: "First Page",
  body: 'Description',
  footer: Container(
  padding: EdgeInsets.only(top: 24.0),
  alignment: Alignment.center,
  child: ElevatedButton(
  onPressed: () {

   },
  child: const Text("Let’s Go"),
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  shape: StadiumBorder(),
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  textStyle: TextStyle(fontSize: 16), // Text style
  ),
  ),
  ),
  image: Center(
  child: Image.network(
  'https://images.unsplash.com/photo-1535303311164-664fc9ec6532?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  height: 250,
  width: 250,
  fit: BoxFit.cover,
  ),
  ),
  decoration: PageDecoration(
  titleTextStyle: TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  ),
  bodyTextStyle: TextStyle(
  fontSize: 18,
  ),
  contentMargin: EdgeInsets.symmetric(horizontal: 16),
  ),
  ),
  PageViewModel(
  title: "Second Page",
  body: 'Description',
  footer: Container(
  padding: EdgeInsets.only(top: 24.0),
  alignment: Alignment.center,
  child: ElevatedButton(
  onPressed: () {

  },
  child: const Text("Let’s Go"),
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  shape: StadiumBorder(),
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  textStyle: TextStyle(fontSize: 16),
  ),
  ),
  ),
  image: Center(
  child: Image.network(
  'https://plus.unsplash.com/premium_photo-1683488869706-4152826ca919?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  height: 250,
  width: 250,
  fit: BoxFit.cover,
  ),
  ),
  decoration: PageDecoration(
  titleTextStyle: TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  ),
  bodyTextStyle: TextStyle(
  fontSize: 18,
  ),
  contentMargin: EdgeInsets.symmetric(horizontal: 16), // Add horizontal margin
  ),
  ),
  PageViewModel(
  title: "Third Page",
  body: 'Description',
  footer: Container(
  padding: EdgeInsets.only(top: 24.0),
  alignment: Alignment.center,
  child: ElevatedButton(
  onPressed: () {

  },
    child: const Text("Let’s Go"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      textStyle: TextStyle(fontSize: 16),
    ),
  ),
  ),
    image: Center(
      child: Image.network(
        'https://plus.unsplash.com/premium_photo-1683583961441-511f9498e6ed?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        height: 250,
        width: 250,
        fit: BoxFit.cover,
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
      ),
      contentMargin: EdgeInsets.symmetric(horizontal: 16),
    ),
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeSize: Size.square(15),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: Text("Done", style: TextStyle(fontSize: 20)),
          showSkipButton: true,
          skip: Text("Skip", style: TextStyle(fontSize: 20)),
          showNextButton: true,
          next: Icon(Icons.arrow_forward, size: 30),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }
}

