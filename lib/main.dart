import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/EventsDescription/events_description.dart';
import './Screens/events_screen.dart';
import './Screens/Dashboard/admin_dashboard.dart';
import './Screens/Dashboard/admin_dashboard_create_event.dart';

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
          canvasColor: Color.fromRGBO(33, 33, 33, 1),
          scaffoldBackgroundColor: Color.fromRGBO(33, 33, 33, 1),
          dividerColor: Colors.white30,
          indicatorColor: Color.fromRGBO(245, 245, 245, 1),
          splashColor: Colors.white,
          cursorColor: Color.fromRGBO(245, 245, 245, 1),
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(66, 66, 66, 1),
            actionsIconTheme: IconThemeData(
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            textTheme: TextTheme(
              title: TextStyle(
                color: Color.fromRGBO(245, 245, 245, 1),
                fontFamily: "Ubuntu",
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          cardTheme: CardTheme(
            color: Color.fromRGBO(97, 97, 97, 1),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(5),
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Color.fromRGBO(250, 250, 250, 1),
              fontFamily: "Playfair_Display",
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            body1: TextStyle(
              color: Color.fromRGBO(250, 250, 250, 1),
              fontFamily: "Playfair_Display",
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            body2: TextStyle(
              color: Color.fromRGBO(250, 250, 250, 1),
              fontFamily: "Playfair_Display",
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            button: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Ubuntu",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            subtitle: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Ubuntu",
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            subhead: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Playfair_Display",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            display1: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Ubuntu",
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Color.fromRGBO(245, 245, 245, 1),
            labelStyle: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Ubuntu",
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(255, 160, 0, 1),
            splashColor: Color.fromARGB(0, 95, 255, 1),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(0, 0, 0, 1),
            hintStyle: TextStyle(
              color: Color.fromRGBO(245, 245, 245, 1),
              fontFamily: "Ubuntu",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            labelStyle: TextStyle(
              color: Color.fromRGBO(00, 145, 234, 1),
              fontFamily: "Ubuntu",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            helperStyle: TextStyle(
              color: Color.fromRGBO(212, 225, 87, 1),
              fontFamily: "Playfair_Display",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(245, 245, 245, 1),
            textTheme: ButtonTextTheme.accent,
          ),
        ),
        home: EventScreen(),
        routes: {
          EventDescriptionScreen.routeName: (ctx) => EventDescriptionScreen(),
          AdminDashboard.routeName: (ctx) => AdminDashboard(),
          CreateEventPage1.routeName: (ctx) => CreateEventPage1(),
        },
      ),
    );
  }
}
