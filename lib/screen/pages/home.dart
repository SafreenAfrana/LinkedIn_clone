import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone/screen/pages/home_page/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,

              onTap: onTabTapped, // new
              currentIndex: _currentIndex, // new
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.home,
                  ),
                  label: ('Home'),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.userFriends,
                  ),
                  label: ('My network'),
                ),
                new BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.plusCircle,
                    ),
                    label: ('Post')),
                new BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.solidBell,
                    ),
                    label: ('Notifications')),
                new BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.briefcase,
                    ),
                    label: ('Jobs'))
              ],
            ),
            body: _children[_currentIndex],
          ),
        );
      },
    );
  }
}
