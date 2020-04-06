import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:covidata/scoped_model/detail.dart';
import 'package:numberpicker/numberpicker.dart';

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  bool fever = false;
  bool cold = false;
  bool cough = false;
  bool bodyPain = false;
  bool soreThrote = false;
  bool breathingDifficulty = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Detail>(
        builder: (BuildContext context, Widget child, Detail model) {
      return Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "HEALTH DETAILS",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Are you suffering from fever",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: fever ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      fever = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (fever)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.fever.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.fever = value);
                            }
                          });
                        },
                      ),
                    ]),
              SizedBox(height: 10),
              Text(
                "Are you suffering from Cold",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: cold ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      cold = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (cold)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.cold.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.cold = value);
                            }
                          });
                        },
                      ),
                    ]),
              SizedBox(height: 10),
              Text(
                "Are you suffering from Cough",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: cough ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      cough = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (cough)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.cough.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.cough = value);
                            }
                          });
                        },
                      ),
                    ]),
              SizedBox(height: 10),
              Text(
                "Are you suffering from Body pain",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: bodyPain ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      bodyPain = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (bodyPain)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.bodyPain.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.bodyPain = value);
                            }
                          });
                        },
                      ),
                    ]),
              SizedBox(height: 10),
              Text(
                "Are you suffering Sore Throat",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: soreThrote == true ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      soreThrote = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (soreThrote)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.soreThrote.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.soreThrote = value);
                            }
                          });
                        },
                      ),
                    ]),
              SizedBox(height: 10),
              Text(
                "Are you suffering Diffiuclty in breathing",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26)),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  value: breathingDifficulty == true ? "Yes" : "No",
                  isExpanded: true,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      breathingDifficulty = item == "Yes" ? true : false;
                    });
                  },
                ),
              ),
              if (breathingDifficulty)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Since how many days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 73,
                          margin: EdgeInsets.only(right: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                model.breathingDifficulty.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                              Icon(
                                LineIcons.sort_numeric_asc,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26)),
                        ),
                        onPressed: () {
                          showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPickerDialog.integer(
                                  minValue: 1,
                                  maxValue: 60,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(() => model.breathingDifficulty = value);
                            }
                          });
                        },
                      ),
                    ]),
            ],
          ),
        ),
      );
    });
  }
}
