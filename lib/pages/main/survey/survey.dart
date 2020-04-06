import 'package:covidata/pages/main/survey/screen/gender.dart';
import 'package:covidata/pages/main/survey/screen/health.dart';
import 'package:covidata/pages/main/survey/screen/travel.dart';
import 'package:covidata/pages/main/survey/screen/travel_detail.dart';
import 'package:floating_action_row/floating_action_row.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _currentIndex;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox.expand(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          physics: new NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            GenderScreen(),
            TravelScreen(),
            TravelDetailScreen(),
            HealthScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionRow(
        color: Colors.blueAccent,
        children: <Widget>[
          FloatingActionRowButton(
              icon: Icon(LineIcons.angle_left),
              onTap: () {
                _currentIndex = _currentIndex - 1;
                _pageController.animateToPage(
                  _currentIndex,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 800),
                );
                FocusScope.of(context).requestFocus(FocusNode());
              }),
          FloatingActionRowDivider(),
          FloatingActionRowButton(
              icon: Icon(LineIcons.angle_right),
              onTap: () {
                _currentIndex = _currentIndex + 1;
                _pageController.animateToPage(
                  _currentIndex,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 800),
                );
                FocusScope.of(context).requestFocus(FocusNode());
              }),
        ],
      ),
    );
  }
}
