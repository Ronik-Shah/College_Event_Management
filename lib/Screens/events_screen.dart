import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/events_screen_item.dart';

import '../Models/Event.dart';

class EventScreen extends StatefulWidget {
  static const routeName = "/EventScreen";
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Event> favouritedList = [];
  List<Event> eventList = [];
  bool favouriteMode = false;

  void buildFavouritedList() {
    favouritedList.clear();
    for (var event in eventList) {
      if (event.isFavourite) favouritedList.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    eventList = Provider.of<Events>(context, listen: false).items;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      appBar: AppBar(
        title: Text("Events"),
        actions: <Widget>[
          IconButton(
            icon: (favouriteMode)
                ? Icon(Icons.filter_1)
                : Icon(Icons.filter_list),
            tooltip: "Show only favourites",
            color: Theme.of(context).appBarTheme.actionsIconTheme.color,
            onPressed: () {
              setState(
                () {
                  favouriteMode = !favouriteMode;
                  buildFavouritedList();
                },
              );
            },
          ),
        ],
      ),
      body:
          ((favouriteMode) ? favouritedList.length == 0 : eventList.length == 0)
              ? Center(
                  child: (favouriteMode)
                      ? Text("No favourited events yet...")
                      : Text("No events yet..."),
                )
              : (!favouriteMode)
                  ? ListView.builder(
                      itemBuilder: (ctx, i) => EventScreenItem(
                        event: eventList[i],
                      ),
                      itemCount: eventList.length,
                    )
                  : ListView.builder(
                      itemBuilder: (ctx, i) => EventScreenItem(
                        event: favouritedList[i],
                      ),
                      itemCount: favouritedList.length,
                    ),
    );
  }
}
