import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:covidata/scoped_model/detail.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class TravelScreen extends StatefulWidget {
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
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
                  "TRAVEL DETAILS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
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
                    model.travel.start = place.placeName;

                    FocusScope.of(context).requestFocus(FocusNode());
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
                    model.travel.end = place.placeName;

                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  context: context,
                ),
                SizedBox(height: 10),
                Text(
                  "Date of Journey Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 73,
                    margin: EdgeInsets.only(right: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          model.travel?.startDate.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                        Icon(
                          LineIcons.calendar,
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
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    ).then((d) {
                      setState(() {
                        model.travel.startDate = d;
                      });

                      FocusScope.of(context).requestFocus(FocusNode());
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Date of Journey Ended",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.only(right: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          model.travel?.endDate.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                        Icon(
                          LineIcons.calendar,
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
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    ).then((d) {
                      setState(() {
                        model.travel.endDate = d;
                      });
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mode Of Transport",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
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
                    value: model.travel?.mode,
                    isExpanded: true,
                    items: <String>['Car', 'Bus', 'Train', 'Flight']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Icon(value == 'Car'
                                ? LineIcons.car
                                : value == 'Bus'
                                    ? LineIcons.bus
                                    : value == 'Train'
                                        ? LineIcons.train
                                        : LineIcons.plane),
                            SizedBox(width: 5),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (item) {
                      setState(() {
                        model.travel.mode = item;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Persons accompanied you",
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
                          model.travel?.accompanied.toString(),
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
                            maxValue: 100,
                            title: new Text("Select Number"),
                            initialIntegerValue: 1,
                          );
                        }).then((int value) {
                      if (value != null) {
                        setState(() => model.travel.accompanied = value);
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
                          model.travel?.comeAcross.toString(),
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
                            maxValue: 100,
                            title: new Text("Select Number"),
                            initialIntegerValue: 1,
                          );
                        }).then((int value) {
                      if (value != null) {
                        setState(() => model.travel.comeAcross = value);
                      }
                    });
                  },
                ),
              ],
            ),
          ));
    });
  }
}
