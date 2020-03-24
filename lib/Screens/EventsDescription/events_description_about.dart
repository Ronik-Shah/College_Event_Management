import 'package:flutter/material.dart';

class EventDescriptionAbout extends StatelessWidget {
  final String about;
  EventDescriptionAbout({@required this.about});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: Theme.of(context).cardTheme.margin,
        child: Text(
          about,
          softWrap: true,
        ),
      ),
    );
  }
}
