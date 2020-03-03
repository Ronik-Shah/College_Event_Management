import 'package:flutter/material.dart';

import './Screens/events_description.dart';
import './Screens/events_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(),
        bannerTheme: MaterialBannerThemeData(
          contentTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: EventScreen(),
      routes: {
        EventDescriptionScreen.routeName: (ctx) => EventDescriptionScreen(),
      },
    );
  }
}
