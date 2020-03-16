import 'package:flutter/material.dart';

class EventDescriptionRules extends StatelessWidget {
  final description;
  EventDescriptionRules({@required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(child: description);
  }
}
