import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './events_description_about.dart';
import './events_description_rules.dart';
import './events_description_prizes.dart';

import 'package:college_event_management/Models/Event.dart';

class EventDescriptionScreen extends StatelessWidget {
  static const routeName = "/EventScreenDescription";

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context).settings.arguments as int;
    var event = Provider.of<Events>(context, listen: false)
        .returnEventBasedOnIndex(index);
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
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
                body: TabBarView(
                  children: [
                    EventDescriptionAbout(
                      about: event.about,
                    ),
                    EventDescriptionRules(
                      rules: event.rules,
                    ),
                    EventDescriptionPrizes(
                      prizes: event.prizes,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Register Now"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
