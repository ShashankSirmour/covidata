import 'package:flutter/material.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double size = width > height ? height : width;
    return Scaffold(
      body: Center(
        child: NeuomorphicContainer(
          width: size / 2,
          height: size / 2,
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Press To",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "START",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, "/survey");
            },
          ),
        ),
      ),
    );
  }
}
