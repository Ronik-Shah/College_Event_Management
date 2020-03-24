import 'package:flutter/material.dart';

class EventDescriptionRules extends StatelessWidget {
  final List<String> rules;
  EventDescriptionRules({@required this.rules});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: rules.length,
        itemBuilder: (ctx, i) => EventDescriptionRulesListItem(
          rule: rules[i],
          index: i,
        ),
      ),
    );
  }
}

class EventDescriptionRulesListItem extends StatelessWidget {
  final String rule;
  final int index;
  EventDescriptionRulesListItem({@required this.rule, @required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Text(
          "${index + 1}",
          style: TextStyle(
            color: Theme.of(context).textTheme.button.color,
            fontSize: Theme.of(context).textTheme.button.fontSize,
            fontFamily: Theme.of(context).textTheme.button.fontFamily,
            fontWeight: Theme.of(context).textTheme.button.fontWeight,
          ),
        ),
      ),
      title: Text(
        rule,
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
