import 'package:flutter/material.dart';
import 'package:login_application/Screens/Address/address_screen.dart';
import 'package:login_application/Screens/Home/home_screen.dart';
import 'package:login_application/Screens/Login/login_screen.dart';
import 'package:login_application/Screens/Profile/profile_screen.dart';
import 'package:login_application/Screens/Signup/signup_screen.dart';
import 'package:login_application/Screens/Welcome/welcome_screen.dart';
import 'package:login_application/Screens/test_screen.dart';
import 'package:login_application/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Application',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.blue[100]),
      initialRoute: "/WelcomeScreen",
      // initialRoute: "/HomeScreen",
      routes: {
        "/WelcomeScreen": (context) => WelcomeScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/SignupScreen": (context) => SignUpScreen(),
        "/HomeScreen": (context) => HomeScreen(),
        "/ProfileScreen": (context) => ProfileScreen(),
        "/AddressScreen": (context) => AddressScreen(),
        "/TestingScreen": (context) => TestingScreen(),
      },

      // home: WelcomeScreen(),
    );
  }
}
 //flutter run --no-sound-null-safety