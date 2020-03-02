import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/events_item.dart';

import '../Models/Event.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: ListView.builder(
        itemBuilder: (ctx, index) => EventScreenItem(
          index: index,
        ),
        itemCount: Provider.of<Events>(context).items.length,
      ),
    );
  }
}
