import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications Page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int number = Provider.of<_NotificationModel>(context, listen: false).numberNotifications;
        number++;
        Provider.of<_NotificationModel>(context, listen: false).numberNotifications = number;

        if(number >= 2) {
          AnimationController contoller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          contoller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pinkAccent,
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).numberNotifications;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: BounceInDown(
                  from: 10,
                  animate: number > 0 ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog',
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numberNotifications = 0;

  int get numberNotifications => this._numberNotifications;

  set numberNotifications(int numberNotifications) {
    this._numberNotifications = numberNotifications;
    notifyListeners();
  }

  AnimationController _bounceController;

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController bounceController) {
    this._bounceController = bounceController;
    //! Aqui no se tiene que colocar notifyListeners.
  }
}
