import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Screens/Dashboard/admin_dashboard.dart';

import '../../Widgets/app_drawer.dart';

import '../../Models/Event.dart';

class CreateEventPage2 extends StatefulWidget {
  static String routeName = '-/CreateEventPage2';
  @override
  _CreateEventPage2State createState() => _CreateEventPage2State();
}

class _CreateEventPage2State extends State<CreateEventPage2> {
  var rulesNo;
  static const prizesNo = 3;
  List<TextEditingController> rulesTextEditingControllers = [];
  List<FocusNode> rulesFocusNodes = [];
  List<TextEditingController> prizesTextEditingControllers = [];
  List<FocusNode> prizesFocusNodes = [];
  var _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (int i = 0; i < rulesNo; i++) {
      rulesTextEditingControllers[i].dispose();
    }
    for (int i = 0; i < rulesNo; i++) {
      rulesFocusNodes[i].dispose();
    }
    for (int i = 0; i < rulesNo; i++) {
      prizesTextEditingControllers[i].dispose();
    }
    for (int i = 0; i < rulesNo; i++) {
      prizesFocusNodes[i].dispose();
    }
    super.dispose();
  }

  Event createEvent(String name, String description, List<String> rules,
      List<String> prizes, DateTime dateTime) {
    return Event(
      about: description,
      title: name,
      prizes: prizes,
      rules: rules,
      id: "c2",
      occuranceDate: dateTime,
    );
  }

  Widget buildTable(List<TableRow> tableRow) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        textDirection: TextDirection.ltr,
        columnWidths: {
          0: FixedColumnWidth(100),
          1: FixedColumnWidth(50),
          2: FixedColumnWidth(200),
        },
        children: tableRow,
      ),
    );
  }

  List<TableRow> buildRulesItem() {
    var tableRowList = List<TableRow>();
    for (var i = 0; i < rulesNo; i++) {
      rulesTextEditingControllers.add(TextEditingController());
    }
    for (var i = 0; i < rulesNo; i++) {
      rulesFocusNodes.add(FocusNode());
    }
    for (var i = 0; i < rulesNo - 1; i++) {
      tableRowList.add(
        TableRow(
          children: <Widget>[
            Align(
                alignment: Alignment.lerp(
                    Alignment.center, Alignment.centerRight, 0.8),
                child: Text("Rule ${i + 1}")),
            SizedBox(
              width: 50,
            ),
            TextFormField(
              focusNode: rulesFocusNodes[i],
              controller: rulesTextEditingControllers[i],
              decoration: InputDecoration(
                hintText: "Write rule here",
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty || value == null)
                  return "Please fill this field.";
                return null;
              },
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(rulesFocusNodes[i + 1]);
              },
            ),
          ],
        ),
      );
    }

    tableRowList.add(
      TableRow(
        children: <Widget>[
          Align(
              alignment:
                  Alignment.lerp(Alignment.center, Alignment.centerRight, 0.8),
              child: Text("Rule $rulesNo")),
          SizedBox(
            width: 50,
          ),
          TextFormField(
            focusNode: rulesFocusNodes[rulesNo - 1],
            controller: rulesTextEditingControllers[rulesNo - 1],
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty || value == null)
                return "Please fill this field.";
              return null;
            },
            decoration: InputDecoration(
              hintText: "Write rule here",
            ),
          ),
        ],
      ),
    );
    return tableRowList;
  }

  List<TableRow> buildPrizesItem() {
    var tableRowList = List<TableRow>();
    for (var i = 0; i < prizesNo; i++) {
      prizesTextEditingControllers.add(TextEditingController());
    }
    for (var i = 0; i < prizesNo; i++) {
      prizesFocusNodes.add(FocusNode());
    }
    for (var i = 0; i < prizesNo - 1; i++) {
      tableRowList.add(
        TableRow(
          children: <Widget>[
            Align(
                alignment: Alignment.lerp(
                    Alignment.center, Alignment.centerRight, 0.8),
                child: Text("Prize ${i + 1}")),
            SizedBox(
              width: 50,
            ),
            TextFormField(
              focusNode: prizesFocusNodes[i],
              controller: prizesTextEditingControllers[i],
              decoration: InputDecoration(
                hintText: "Write prize here",
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(prizesFocusNodes[i + 1]);
              },
              validator: (value) {
                if (value.isEmpty || value == null) {
                  return "Please fill this field.";
                }
                return null;
              },
            ),
          ],
        ),
      );
    }

    tableRowList.add(
      TableRow(
        children: <Widget>[
          Align(
              alignment:
                  Alignment.lerp(Alignment.center, Alignment.centerRight, 0.8),
              child: Text("Prize $prizesNo")),
          SizedBox(
            width: 50,
          ),
          TextFormField(
            focusNode: prizesFocusNodes[prizesNo - 1],
            controller: prizesTextEditingControllers[prizesNo - 1],
            validator: (value) {
              if (value.isEmpty || value == null) {
                return "Please fill this field.";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Write prize here",
            ),
          ),
        ],
      ),
    );
    return tableRowList;
  }

  List<String> createList(List<TextEditingController> list) {
    List<String> returnList = [];
    for (int i = 0; i < list.length; i++) {
      returnList.add(list[i].text);
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    var eventObject =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    rulesNo = int.parse(eventObject["rulesNo"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Rules",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTable(buildRulesItem()),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Prizes",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTable(buildPrizesItem()),
                SizedBox(
                  height: 30,
                ),
                IconButton(
                  icon: Icon(Icons.done_outline),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) return;
                    var rules = createList(rulesTextEditingControllers);
                    var prizes = createList(prizesTextEditingControllers);
                    Event event = createEvent(
                        eventObject["name"],
                        eventObject["description"],
                        rules,
                        prizes,
                        DateTime.parse(eventObject["date"]));
                    Provider.of<Events>(context, listen: false).addEvent(event);
                    Navigator.of(context).pushNamed(AdminDashboard.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
