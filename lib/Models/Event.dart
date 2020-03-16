import 'package:flutter/foundation.dart';

class Event {
  String title;
  DateTime occuranceDate;
  String description;
  bool isFavourite;

  Event({
    @required this.occuranceDate,
    @required this.description,
    @required this.title,
    this.isFavourite = false,
  });
}

class Events with ChangeNotifier {
  List<Event> _items = [
    Event(
      title: "Cerebro",
      description: "Come and show the gaming skills",
      occuranceDate: DateTime(2020, 4, 1),
    ),
    Event(
      title: "Ventura",
      description: "Come and show the sports skills",
      occuranceDate: DateTime(2020, 4, 18),
    ),
    Event(
      title: "Krieva",
      description: "Our cultural fest",
      occuranceDate: DateTime(2020, 3, 15),
    ),
  ];

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

  Event returnEventBasedOnIndex(int index) {
    return _items.elementAt(index);
  }
}
