import 'package:flutter/material.dart';

import './events_description_about.dart';
import './events_description_rules.dart';
import './events_description_prizes.dart';

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
            child: Text(
              "Event Title",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Rules",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Prizes",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                body: TabBarView(children: [
                  EventDescriptionAbout(),
                  EventDescriptionRules(),
                  EventDescriptionPrizes(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
