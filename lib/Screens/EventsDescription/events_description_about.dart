import 'package:flutter/material.dart';

class EventDescriptionAbout extends StatelessWidget {
  final String about;
  final String category;
  final DateTime occuranceDate;
  EventDescriptionAbout(
      {@required this.about,
      @required this.category,
      @required this.occuranceDate});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: Theme.of(context).cardTheme.margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      "Occuring on : ${occuranceDate.day}/${occuranceDate.month}/${occuranceDate.year}"),
                  Text(
                    "Category : Sports",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                about,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
