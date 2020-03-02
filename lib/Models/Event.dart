import 'package:flutter/foundation.dart';

class Event {
  String title;
  DateTime occuranceDate;
  String description;
  bool isFavourite;

  Event({occuranceDate, description, title, isFavourite});
}

class Events with ChangeNotifier {
  List<Event> _items = [
    Event(
        occuranceDate: DateTime.now(),
        description: "This is the first Event",
        title: "First Event",
        isFavourite: false),
    Event(
        occuranceDate: DateTime.now(),
        description: "This is the second Event",
        title: "Second Event",
        isFavourite: false),
    Event(
        occuranceDate: DateTime.now(),
        description: "This is the third Event",
        title: "Third Event",
        isFavourite: false),
    Event(
        occuranceDate: DateTime.now(),
        description: "This is the fourth Event",
        title: "Fourth Event",
        isFavourite: false),
    Event(
        occuranceDate: DateTime.now(),
        description: "This is the fifth Event",
        title: "Fifth Event",
        isFavourite: false),
  ];

  List<Event> get items {
    return [..._items];
  }

  void changeFavouriteStatus(int index) {
    _items.elementAt(index).isFavourite = !_items.elementAt(index).isFavourite;
    notifyListeners();
  }
}
