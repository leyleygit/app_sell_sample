import 'package:app_sell/package/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'addToCard.dart';
import 'favorite.dart';
import 'homeScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
var bottomItem = [
  BottomNavigationBarItem(
    label: '',
    icon: LineIcon(
      LineIcons.home,
      color: MyTheme.iconBlack,
    ),
  ),
  BottomNavigationBarItem(
    label: '',
    icon: LineIcon(
      LineIcons.heartAlt,
      color: Colors.red,
    ),
  ),
  BottomNavigationBarItem(
    label: '',
    icon: LineIcon(
      LineIcons.shoppingBag,
      color: Colors.pink,
    ),
  ),
];

int _selectedIndex = 0;

PageController? _pageController;
class _HomePageState extends State<HomePage> {
  void initState() {
    _pageController = PageController(initialPage: 0,keepPage: true);
    super.initState();
  }
  void _onTapBottomNavigationBar (int value){
    setState(() {
      _selectedIndex = value;
    });
    _pageController!.jumpToPage(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.red),
        elevation: 0,
        onTap: _onTapBottomNavigationBar,
        selectedItemColor: Color(0xff6CC617),
        items: bottomItem),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: [MyHomeScreen(), Favorite(), AddToCard()],
      ),
    );
  }
}