import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/events_screen_item.dart';

import '../Models/Event.dart';

class EventScreen extends StatelessWidget {
  static const routeName = "/EventScreen";
  @override
  Widget build(BuildContext context) {
    List<Event> eventList = Provider.of<Events>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: (eventList.length == 0)
          ? Center(
              child: Text("No events yet..."),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => EventScreenItem(
                index: i,
                event: eventList[i],
              ),
              itemCount: eventList.length,
            ),
    );
  }
}
