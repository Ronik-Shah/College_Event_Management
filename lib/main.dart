import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/EventsDescription/events_description.dart';
import './Screens/events_screen.dart';

import './Models/Event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Events>(
      create: (ctx) => Events(),
      child: MaterialApp(
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
      ),
    );
  }
}
