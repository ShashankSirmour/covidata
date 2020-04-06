import 'package:covidata/lang/i18n/localizations.dart';
import 'package:covidata/pages/main/main.dart';
import 'package:covidata/pages/main/survey/survey.dart';
import 'package:covidata/scoped_model/detail.dart';
import 'package:covidata/scoped_model/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

Future<void> main() async {
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Detail model = Detail();

    return ScopedModel<Detail>(
      model: model,
      child: MaterialApp(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,

        theme: ThemeData(primaryColor: Colors.white, fontFamily: 'robotoSlab'),
        routes: {
          '/': (BuildContext context) => MainPage(),
          '/survey': (BuildContext context) => SurveyPage(),
        },
        onGenerateRoute: (RouteSettings setting) {
          final List<String> pathElement = setting.name.split('/');

          if (pathElement[0] != '') {
            return null;
          }

          //------------------------routes---------------------------

          // if (pathElement[1] == 'search') {
          //   return MaterialPageRoute(builder: (BuildContext context) {
          //     return SearchPage(searchText: pathElement[2].trim());
          //   });
          // }

          // if (pathElement[1] == 'library') {
          //   return MaterialPageRoute(builder: (BuildContext context) {
          //     return LibraryScreen();
          //   });
          // }

          return null; //deffault
        },

        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Flutter background Locator'),
        //   ),
        //   body: Container(
        //     width: double.maxFinite,
        //     padding: const EdgeInsets.all(22),
        //     child: SingleChildScrollView(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: <Widget>[start, stop, clear, status, log],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
