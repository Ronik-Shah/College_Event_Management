import 'package:flutter/material.dart';

import '../Screens/events_description.dart';

class EventScreenItem extends StatefulWidget {
  final int index;
  EventScreenItem({@required this.index});

  @override
  _EventScreenItemState createState() => _EventScreenItemState();
}

class _EventScreenItemState extends State<EventScreenItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      EventDescriptionScreen.routeName,
                      arguments: widget.index);
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: "eventScrenItem ${widget.index}",
                    child: Image.asset(
                      "assets/Images/eventOfflineImage.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "Event Name",
                    style: TextStyle(
                      fontSize: mediaQuery.textScaleFactor * 15,
                      fontWeight: Theme.of(context)
                          .bannerTheme
                          .contentTextStyle
                          .fontWeight,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
