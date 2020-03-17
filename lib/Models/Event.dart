import 'package:flutter/foundation.dart';

class Event {
  String title;
  DateTime occuranceDate;
  String about;
  List<String> rules;
  List<String> prizes;
  bool isFavourite;

  Event({
    @required this.occuranceDate,
    @required this.about,
    @required this.title,
    @required this.rules,
    @required this.prizes,
    this.isFavourite = false,
  });
}

class Events with ChangeNotifier {
  List<Event> _items = [
    Event(
      title: "Cerebro",
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae magna nec eros eleifend porta sed id tortor. Donec at nisl eu quam pretium pharetra. Maecenas mauris ante, faucibus non convallis sed, volutpat vel libero. Etiam pellentesque purus sed leo pellentesque, sit amet porta elit imperdiet. Duis dignissim dui nec turpis feugiat, id aliquet ligula sodales. Donec ac leo nec diam fermentum imperdiet. Suspendisse sed elementum magna. Nullam rutrum libero quam, eget feugiat elit interdum ut. Quisque fermentum tempor metus, at aliquam metus aliquet sed. In varius leo ipsum, ut ultrices libero aliquet id. Cras aliquet eleifend vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat.",
      prizes: [
        "2k",
        "1k",
      ],
      rules: [
        "Do not cheat",
        "Organizer's decision is final.",
      ],
      occuranceDate: DateTime(2020, 4, 1),
    ),
    Event(
      title: "Ventura",
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae magna nec eros eleifend porta sed id tortor. Donec at nisl eu quam pretium pharetra. Maecenas mauris ante, faucibus non convallis sed, volutpat vel libero. Etiam pellentesque purus sed leo pellentesque, sit amet porta elit imperdiet. Duis dignissim dui nec turpis feugiat, id aliquet ligula sodales. Donec ac leo nec diam fermentum imperdiet. Suspendisse sed elementum magna. Nullam rutrum libero quam, eget feugiat elit interdum ut. Quisque fermentum tempor metus, at aliquam metus aliquet sed. In varius leo ipsum, ut ultrices libero aliquet id. Cras aliquet eleifend vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat.",
      prizes: [
        "2k",
        "1k",
      ],
      rules: [
        "Do not cheat",
        "Organizer's decision is final.",
      ],
      occuranceDate: DateTime(2020, 4, 18),
    ),
    Event(
      title: "Krieva",
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae magna nec eros eleifend porta sed id tortor. Donec at nisl eu quam pretium pharetra. Maecenas mauris ante, faucibus non convallis sed, volutpat vel libero. Etiam pellentesque purus sed leo pellentesque, sit amet porta elit imperdiet. Duis dignissim dui nec turpis feugiat, id aliquet ligula sodales. Donec ac leo nec diam fermentum imperdiet. Suspendisse sed elementum magna. Nullam rutrum libero quam, eget feugiat elit interdum ut. Quisque fermentum tempor metus, at aliquam metus aliquet sed. In varius leo ipsum, ut ultrices libero aliquet id. Cras aliquet eleifend vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat.",
      prizes: [
        "2k",
        "1k",
      ],
      rules: [
        "Do not cheat",
        "Organizer's decision is final.",
      ],
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
