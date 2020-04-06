import 'package:covidata/model/travel.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:covidata/scoped_model/detail.dart';

class TravelDetailScreen extends StatefulWidget {
  @override
  _TravelDetailScreenState createState() => _TravelDetailScreenState();
}

class _TravelDetailScreenState extends State<TravelDetailScreen> {
  bool shareTravelInfo = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Detail>(
        builder: (BuildContext context, Widget child, Detail model) {
      return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, bottom: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "TRAVEL DETAILS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Did you travel anywhere after coming home",
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
                    value: model.travelComingHome == true ? "Yes" : "No",
                    isExpanded: true,
                    items: <String>['Yes', 'No'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (item) {
                      setState(() {
                        model.travelComingHome = item == "Yes" ? true : false;
                      });
                    },
                  ),
                ),
                if (model.travelComingHome == true)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "Number of Place You Travel",
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
                                model.placesTravelComingHome.toString(),
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
                                  maxValue: 10,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(
                                  () => model.placesTravelComingHome = value);
                            }
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Number of persons you came across (approximately)",
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
                                model.peopleAcrossComingHome.toString(),
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
                                  maxValue: 10000,
                                  title: new Text("Scroll To Select Number"),
                                  initialIntegerValue: 1,
                                );
                              }).then((int value) {
                            if (value != null) {
                              setState(
                                  () => model.peopleAcrossComingHome = value);
                            }
                          });
                        },
                      ),
                      if (model.placesTravelComingHome > 0)
                        Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              "Do you want to share travel info",
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
                                value: shareTravelInfo ? "Yes" : "No",
                                isExpanded: true,
                                items:
                                    <String>['Yes', 'No'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  if (item == "Yes") {
                                    model.comingHomeTravel = List<Travel>();
                                    for (int i = 0;
                                        i < model.peopleAcrossComingHome;
                                        i++)
                                      model.comingHomeTravel.add(Travel());

                                    setState(() {
                                      shareTravelInfo = true;
                                    });
                                  } else {
                                    model.comingHomeTravel = List<Travel>();
                                    setState(() {
                                      shareTravelInfo = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      if (shareTravelInfo == true)
                        for (int j = 0; j < model.placesTravelComingHome; j++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Divider(),
                              Center(
                                  child: Text(
                                "Adress ${j + 1}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              SizedBox(height: 10),
                              Text(
                                "Select Starting Location",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 10),
                              MapBoxPlaceSearchWidget(
                                popOnSelect: false,
                                apiKey:
                                    "pk.eyJ1Ijoic3VwZXJtYW5zaXIiLCJhIjoiY2s4bjAyZnN0MGtieDNnbzI2azlxbDNyMyJ9.U7YwX3xxa-8xrGFKoYPODw",
                                limit: 3,
                                searchHint: 'Search Place',
                                onSelected: (place) {
                                  model.comingHomeTravel[j].start =
                                      place.placeName;

                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                context: context,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Select Ending Location",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 10),
                              MapBoxPlaceSearchWidget(
                                popOnSelect: false,
                                apiKey:
                                    "pk.eyJ1Ijoic3VwZXJtYW5zaXIiLCJhIjoiY2s4bjAyZnN0MGtieDNnbzI2azlxbDNyMyJ9.U7YwX3xxa-8xrGFKoYPODw",
                                limit: 3,
                                searchHint: 'Search Place',
                                onSelected: (place) {
                                  model.comingHomeTravel[j].end =
                                      place.placeName;

                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                context: context,
                              ),
                            ],
                          )
                    ],
                  ),
              ],
            ),
          ));
    });
  }
}
