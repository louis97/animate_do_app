import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificacionModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Screen'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BarraInferior(),
        body: Center(
          child: Text('hello there'),
        ),
      ),
    );
  }
}

class BarraInferior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), title: Text('Bone')),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                    right: 0,
                    top: 0,
                    child: BounceInDown(
                      from: 15,
                      animate:
                          (Provider.of<_NotificacionModel>(context).num > 0)
                              ? true
                              : false,
                      child: Bounce(
                        from: 15,
                        controller: (AnimationController controller) {
                          Provider.of<_NotificacionModel>(context)
                              .animationController = controller;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                          child: Text(
                            Provider.of<_NotificacionModel>(context)
                                .num
                                .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                    // Icon(
                    //   Icons.brightness_1,
                    //   color: Colors.redAccent,
                    //   size: 10,
                    // )
                    )
              ],
            ),
            title: Text('Notification')),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), title: Text('Dog')),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        var notiModel= Provider.of<_NotificacionModel>(context, listen: false);
        notiModel.num++;
        if(notiModel.num>2){
          notiModel.animationController.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificacionModel extends ChangeNotifier {
  int _num = 0;
  AnimationController _animationController;
  get num => this._num;
  set num(int n) {
    this._num = n;
    notifyListeners();
  }

  get animationController => this._animationController;
  set animationController(AnimationController a) {
    this._animationController = a;
  }
}
