import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Event.dart';

class EventScreenItem extends StatefulWidget {
  final int index;
  EventScreenItem({@required this.index});

  @override
  _EventScreenItemState createState() => _EventScreenItemState();
}

class _EventScreenItemState extends State<EventScreenItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    List<Event> events = Provider.of<Events>(context).items;
    debugPrint(events[widget.index].title);
    bool isFavourite =
        Provider.of<Events>(context).items[widget.index].isFavourite;
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                child: Image.asset(
                  "assets/Images/eventOfflineImage.jpg",
                ),
                alignment: Alignment.center,
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: mediaQuery.size.width * 0.8,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                      vertical: mediaQuery.size.height * 0.008,
                      horizontal: mediaQuery.size.width * 0.002),
                  child: Text(
                    "Event",
                    style: TextStyle(
                      fontSize: mediaQuery.textScaleFactor * 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
                icon: (isFavourite)
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  Provider.of<Events>(context, listen: false)
                      .changeFavouriteStatus(widget.index);
                }),
          )
        ],
      ),
    );
  }
}
