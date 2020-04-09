import 'package:flutter/material.dart';

import './events_description_about.dart';
import './events_description_rules.dart';
import './events_description_prizes.dart';

import '../../Widgets/app_drawer.dart';

import '../../Models/Event.dart';

class EventDescriptionScreen extends StatelessWidget {
  static const routeName = "/EventScreenDescription";

  @override
  Widget build(BuildContext context) {
    var event = ModalRoute.of(context).settings.arguments as Event;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(event.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: event.id,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/Images/images.jfif",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: TabBar(
                    indicatorColor: Theme.of(context).indicatorColor,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Description",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Rules",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Prizes",
                        ),
                      ),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      EventDescriptionAbout(
                        about: event.about,
                        category: "Sports",
                        occuranceDate: event.occuranceDate,
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
      ),
    );
  }
}
