import 'package:flutter/material.dart';

import './admin_dashboard_create_event.dart';

import 'package:college_event_management/Widgets/app_drawer.dart';

class AdminDashboard extends StatelessWidget {
  static String routeName = "/AdminDashBoard";

  Widget buildDashBoardItem(String eventName, BuildContext context,
      MediaQueryData mediaQuery, Function onTapFunction) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          height: mediaQuery.size.height * 0.1,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(eventName),
              Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: Column(
          children: <Widget>[
            buildDashBoardItem("Edit Events", context, mediaQuery, () {}),
            Divider(),
            buildDashBoardItem("Create Event", context, mediaQuery, () {
              Navigator.of(context).pushNamed(CreateEventPage1.routeName);
            }),
            Divider(),
            buildDashBoardItem("Analyze Event", context, mediaQuery, () {}),
            Divider(),
          ],
        ),
      ),
    );
  }
}
