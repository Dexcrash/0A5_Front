import 'package:a05/assets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({
    this.index,
  });

  final int index;

  @override
  State<StatefulWidget> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    _getRoutes();
  }

  static int _selectedIndex;
  List<String> routes = new List<String>();

  _getRoutes() {
    routes.add('/home'); //0
    routes.add('/nel'); //1
    routes.add('/activity'); //2
    routes.add('/profile'); //3
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: $scaffoldBackground),
          title: new Text('Home', style: TextStyle(color: $scaffoldBackground)),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.show_chart, color: $colorSubtitle),
          title: new Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: $colorSubtitle),
          title: new Text('Activity'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: $colorSubtitle),
          title: new Text('Perfil'),
        ),
      ],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 3) {
      Navigator.pushNamed(context, '/profile');
    }
    if (_selectedIndex == 2) {
      Navigator.pushNamed(context, '/activity');
    }
  }
}
