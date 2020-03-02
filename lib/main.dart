import 'package:college_event_management/Screens/events_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/events_screen.dart';

import './Models/Event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Events())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EventScreen(),
      ),
    );
  }
}
