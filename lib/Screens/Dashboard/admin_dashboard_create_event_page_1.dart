import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../Widgets/app_drawer.dart';
import './admin_dashboard_create_event_page_2.dart';

class CreateEventPage1 extends StatefulWidget {
  static String routeName = "-/CreateEventPage1";

  @override
  _CreateEventPage1State createState() => _CreateEventPage1State();
}

class _CreateEventPage1State extends State<CreateEventPage1> {
  var nameTextEditingController = TextEditingController();
  var descriptionTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var focusNode;
  var categoryValue = "Sports";
  var rulesValue = "1";
  var date = DateTime.now();

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  List<DropdownMenuItem> buildDropDown(List<String> text) {
    List<DropdownMenuItem> returnList = [];
    for (int i = 0; i < text.length; i++) {
      returnList.add(DropdownMenuItem(
        child: Text(text[i]),
        value: text[i],
      ));
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Event"),
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Event Name",
                  ),
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focusNode);
                  },
                  validator: (input) {
                    if (input.length == 0 || input == null) {
                      return "Please enter a name.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Date"),
                    Row(
                      children: <Widget>[
                        Text("${date.day} - ${date.month} - ${date.year}"),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime:
                                    DateTime.now().add(Duration(days: 365 * 5)),
                                onChanged: (date) {
                              this.date = date;
                            }, onConfirm: (date) {
                              setState(() {
                                this.date = date;
                              });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Category"),
                    DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: categoryValue,
                        hint: Text(
                          "Select Category",
                          style: Theme.of(context).textTheme.body1,
                        ),
                        items: buildDropDown(
                            ['Sports', 'Coding', 'Music', 'Photography']),
                        onChanged: (v) {
                          setState(() {
                            categoryValue = v;
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("No. of Rules"),
                    DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: rulesValue,
                        hint: Text(
                          "Select Category",
                          style: Theme.of(context).textTheme.body1,
                        ),
                        focusNode: focusNode,
                        items: buildDropDown([
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12',
                          '13',
                          '14',
                          '15'
                        ]),
                        onChanged: (v) {
                          setState(() {
                            rulesValue = v;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Event Description",
                  ),
                  keyboardType: TextInputType.multiline,
                  focusNode: focusNode,
                  controller: descriptionTextEditingController,
                  maxLines: 10,
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                ),
                FlatButton.icon(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Finialize the content!"),
                          content:
                              Text("Do you really want to save the changes"),
                          actions: <Widget>[
                            IconButton(
                                icon: Icon(Icons.done),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(
                                    CreateEventPage2.routeName,
                                    arguments: {
                                      "name": nameTextEditingController.text,
                                      "description":
                                          descriptionTextEditingController.text,
                                      "rulesNo": rulesValue,
                                      "category": categoryValue,
                                      "date": date.toIso8601String()
                                    },
                                  );
                                }),
                            IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.navigate_next,
                  ),
                  label: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
