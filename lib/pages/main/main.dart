import 'package:covidata/pages/main/screen/home.dart';
import 'package:covidata/pages/main/screen/information.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String projectCode = '2';

  Color iconcolor = Colors.black54;

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mainPageBuilder();
  }

  Widget mainPageBuilder() {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;

          _pageController.jumpToPage(_currentIndex);
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        elevation: 8,
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.home,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.indigo,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.map,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.map,
                color: Colors.indigo,
              ),
              title: Text("Map")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.local_hospital,
                color: iconcolor,
              ),
              activeIcon: Icon(
                Icons.local_hospital,
                color: Colors.indigo,
              ),
              title: Text("Care"))
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: new NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            InformationScreen(),
            InformationScreen(),
          ],
        ),
      ),
    );
  }
}
