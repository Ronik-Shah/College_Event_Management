import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/events_item.dart';

import '../Models/Event.dart';

class EventScreen extends StatelessWidget {
  static const routeName = "/EventScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) => EventScreenItem(index: index),
        itemCount: 5,
      ),
    );
  }
}
