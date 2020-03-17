import 'package:flutter/material.dart';

class EventDescriptionAbout extends StatelessWidget {
  final String about;
  EventDescriptionAbout({@required this.about});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Text(
          about,
          softWrap: true,
        ),
      ),
    );
  }
}
