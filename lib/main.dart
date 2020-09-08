import 'package:animate_do_app/src/screens/navigation_screen.dart';
import 'package:animate_do_app/src/screens/screen1_screen.dart';
import 'package:animate_do_app/src/screens/twitter_screen.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Screen1Screen(),
      // home: TwitterScreen(),
      // home: NavigationScreen(),
    );
  }
}