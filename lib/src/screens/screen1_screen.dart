import 'package:animate_do_app/src/screens/navigation_screen.dart';
import 'package:animate_do_app/src/screens/twitter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class Screen1Screen extends StatelessWidget {
  const Screen1Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            duration: Duration(milliseconds: 500), child: Text('Animate_do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (BuildContext context) {
                  return TwitterScreen();
                }));
              },
              icon: FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                    return Screen1Screen();
                  }));
                },
                icon: FaIcon(FontAwesomeIcons.angleRight)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(
                  Icons.new_releases,
                  size: 40,
                )),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Titulo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                'Soy un texto pequenio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                color: Colors.blue,
                height: 2,
                width: 220,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        duration: Duration(milliseconds: 1000),
        child: FloatingActionButton(
          onPressed: () {

            Navigator.push(context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                    return NavigationScreen();
                  }));

          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
