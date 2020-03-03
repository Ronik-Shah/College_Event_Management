import 'package:flutter/material.dart';

class EventDescriptionScreen extends StatelessWidget {
  static const routeName = "/EventScreenDescription";

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Description"),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: "eventScrenItem $index",
              child: Image.asset("assets/Images/eventOfflineImage.jpg"),
            ),
          ),
          Title(
            color: Colors.black,
            child: Text("Event Title"),
          ),
        ],
      ),
    );
  }
}
