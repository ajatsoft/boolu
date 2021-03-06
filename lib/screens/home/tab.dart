import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/livescores/livescores.dart';
import 'package:boolu/screens/settings/settings.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Home(),
      LiveScores(),
      Settings(),
    ];

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Appcolors.ScaffoldColor,
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/images/balltab.png'),
                ),
                activeIcon: Image(
                  image: AssetImage('assets/images/balltab.png'),
                ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              new BottomNavigationBarItem(
                activeIcon: Image(
                  image: AssetImage('assets/images/downloadtab.png'),
                ),
                icon: Image(
                  image: AssetImage('assets/images/downloadtab.png'),
                ),
                title: Text('', style: TextStyle(color: Colors.white)),
              ),
              new BottomNavigationBarItem(
                  activeIcon: Image(
                    image: AssetImage('assets/images/settingstab.png'),
                  ),
                  icon: Image(
                    image: AssetImage('assets/images/settingstab.png'),
                  ),
                  title: Text('', style: TextStyle(color: Colors.white))),
            ],
          ),
        ));
  }
}
