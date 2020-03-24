import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/EventsDescription/events_description.dart';
import '../Models/Event.dart';

class EventScreenItem extends StatefulWidget {
  final Event event;
  EventScreenItem({@required this.event});

  @override
  _EventScreenItemState createState() => _EventScreenItemState();
}

class _EventScreenItemState extends State<EventScreenItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: Card(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    EventDescriptionScreen.routeName,
                    arguments: widget.event);
              },
              child: Hero(
                tag: widget.event.id,
                child: Container(
                  width: double.infinity,
                  height: mediaQuery.size.height * 0.2,
                  child: Image.asset(
                    "assets/Images/images.jfif",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.event.title,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.title.color,
                    fontFamily: Theme.of(context).textTheme.title.fontFamily,
                    fontWeight: Theme.of(context).textTheme.title.fontWeight,
                    fontSize: Theme.of(context).textTheme.title.fontSize,
                  ),
                ),
                (widget.event.isFavourite)
                    ? IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          setState(
                            () {
                              Provider.of<Events>(context, listen: false)
                                  .changeFavouriteStatus(widget.event);
                              Provider.of<Events>(context, listen: false)
                                  .addToFavouritedItems(widget.event);
                            },
                          );
                        },
                      )
                    : IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(
                            () {
                              Provider.of<Events>(context, listen: false)
                                  .changeFavouriteStatus(widget.event);
                              Provider.of<Events>(context, listen: false)
                                  .removeFromFavouritedItems(widget.event);
                            },
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
