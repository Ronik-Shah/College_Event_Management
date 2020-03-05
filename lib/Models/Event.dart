import 'package:flutter/foundation.dart';

class Event {
  String title;
  DateTime occuranceDate;
  String description;
  bool isFavourite;

  Event({occuranceDate, description, title, isFavourite});
}

class Events with ChangeNotifier {
  List<Event> _items = [];

  // Future<void> fetchAndSetEvents async(
  // String http = "http://3.15.204.39:8000/api/events";
  // )

  List<Event> get items {
    return [..._items];
  }

  void changeFavouriteStatus(int index) {
    _items.elementAt(index).isFavourite = !_items.elementAt(index).isFavourite;
    notifyListeners();
  }
}
