import 'package:flutter/material.dart';

import '../Screens/Dashboard/admin_dashboard.dart';
import '../Screens/events_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isEventMenuOpen = false;

  Widget buildDrawerItem(IconData icon, String iconText, double initialSpacing,
      BuildContext context, MediaQueryData mediaQuery, Function onTapFunction) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          width: double.infinity,
          height: mediaQuery.size.height * 0.05,
          child: Row(
            children: <Widget>[
              SizedBox(width: initialSpacing),
              Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 30),
              Text(
                iconText,
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerMenu(
      IconData icon,
      String iconText,
      double initialSpacing,
      BuildContext context,
      MediaQueryData mediaQuery,
      bool checkMenuOpen,
      Function onTapFunction) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          width: double.infinity,
          height: mediaQuery.size.height * 0.05,
          child: Row(
            children: <Widget>[
              SizedBox(width: initialSpacing),
              Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 30),
              Text(
                iconText,
                style: Theme.of(context).textTheme.body2,
              ),
              Spacer(
                flex: 1,
              ),
              (checkMenuOpen)
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 0.1,
            width: double.infinity,
            child: Center(
              child: Text(
                "Hello, User!",
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ),
          Divider(),
          buildDrawerItem(Icons.home, "Home", 20, context, mediaQuery, () {
            Navigator.of(context).pushReplacementNamed(EventScreen.routeName);
          }),
          SizedBox(height: 5),
          buildDrawerMenu(
              Icons.event, "Events", 20, context, mediaQuery, _isEventMenuOpen,
              () {
            setState(() {
              _isEventMenuOpen = !_isEventMenuOpen;
            });
          }),
          if (_isEventMenuOpen)
            Column(
              children: <Widget>[
                buildDrawerItem(
                    Icons.photo, "Photography", 80, context, mediaQuery, () {}),
                buildDrawerItem(
                    Icons.music_note, "Music", 80, context, mediaQuery, () {}),
                buildDrawerItem(
                    Icons.code, "Coding", 80, context, mediaQuery, () {}),
                buildDrawerItem(Icons.directions_run, "Sports", 80, context,
                    mediaQuery, () {}),
              ],
            ),
          Divider(),
          buildDrawerItem(Icons.dashboard, "Dashboard", 20, context, mediaQuery,
              () {
            Navigator.of(context)
                .pushReplacementNamed(AdminDashboard.routeName);
          }),
          Divider(),
          buildDrawerItem(
              Icons.exit_to_app, "Logout", 20, context, mediaQuery, () {}),
          Divider(),
        ],
      ),
    );
  }
}
