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
          style: Theme.of(context).textTheme.button,
        ),
      ),
      title: Text(
        rule,
      ),
    );
  }
}
