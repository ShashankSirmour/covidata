import 'package:covidata/scoped_model/detail.dart';
import 'package:flutter/material.dart';
import 'package:gender_selector/gender_selector.dart';
import 'package:scoped_model/scoped_model.dart';

class GenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Detail>(
        builder: (BuildContext context, Widget child, Detail model) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Select Gender",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40),
          GenderSelector(
            onChanged: (gender) {
              model.gender = gender.toString();
            },
          )
        ],
      );
    });
  }
}
