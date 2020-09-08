import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key key}) : super(key: key);

  @override
  _TwitterScreenState createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool activate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activate = true;
          });
        },
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
            duration: Duration(milliseconds: 1000),
            animate: activate,
            from: 30,
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            )),
      ),
    );
  }
}
