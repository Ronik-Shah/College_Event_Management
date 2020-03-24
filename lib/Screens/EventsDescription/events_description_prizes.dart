import 'package:flutter/material.dart';

class EventDescriptionPrizes extends StatelessWidget {
  final List<String> prizes;
  EventDescriptionPrizes({@required this.prizes});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: prizes.length,
        itemBuilder: (ctx, i) => EventDescriptionPrizesListItem(
          prize: prizes[i],
          index: i,
        ),
      ),
    );
  }
}

class EventDescriptionPrizesListItem extends StatelessWidget {
  final String prize;
  final int index;
  EventDescriptionPrizesListItem({@required this.prize, @required this.index});
  @override
  Widget build(BuildContext context) {
    var indexString;
    if (index == 0)
      indexString = "${index + 1}ˢᵗ";
    else if (index == 1)
      indexString = "${index + 1}ⁿᵈ";
    else if (index == 2)
      indexString = "${index + 1}ʳᵈ";
    else
      indexString = "${index + 1}ᵗʰ";
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Text(
          indexString,
          style: TextStyle(
            color: Theme.of(context).textTheme.button.color,
            fontSize: Theme.of(context).textTheme.button.fontSize,
            fontFamily: Theme.of(context).textTheme.button.fontFamily,
            fontWeight: Theme.of(context).textTheme.button.fontWeight,
          ),
        ),
      ),
      title: Text(
        prize,
        style: TextStyle(
          color: Theme.of(context).textTheme.body2.color,
          fontSize: Theme.of(context).textTheme.body2.fontSize,
          fontFamily: Theme.of(context).textTheme.body2.fontFamily,
          fontWeight: Theme.of(context).textTheme.body2.fontWeight,
        ),
      ),
    );
  }
}
