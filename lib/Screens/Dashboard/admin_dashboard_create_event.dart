import 'package:flutter/material.dart';

import 'package:college_event_management/Widgets/app_drawer.dart';

class CreateEventPage1 extends StatefulWidget {
  static String routeName = "-/CreateEventPage1";

  @override
  _CreateEventPage1State createState() => _CreateEventPage1State();
}

class _CreateEventPage1State extends State<CreateEventPage1> {
  var nameTextEditingController = TextEditingController();
  var descriptionTextEditingController = TextEditingController();
  var focusNode;
  var categoryValue = "Sports";
  var rulesValue = "1";

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Event Name",
                  helperText: "Write the name of the Event",
                ),
                controller: nameTextEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusNode);
                },
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Event Description",
                  helperText: "Write the description of the Event",
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.newline,
                focusNode: focusNode,
                controller: descriptionTextEditingController,
                maxLines: 10,
              ),
              SizedBox(
                height: 100,
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
                      items: [
                        DropdownMenuItem(
                          value: "Sports",
                          child: Text("Sports"),
                        ),
                        DropdownMenuItem(
                          value: "Music",
                          child: Text("Music"),
                        ),
                        DropdownMenuItem(
                          value: "Photography",
                          child: Text("Photography"),
                        ),
                        DropdownMenuItem(
                          value: "Coding",
                          child: Text("Coding"),
                        ),
                      ],
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
                      items: [
                        DropdownMenuItem(
                          value: "1",
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          value: "2",
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          value: "3",
                          child: Text("3"),
                        ),
                        DropdownMenuItem(
                          value: "4",
                          child: Text("4"),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() {
                          rulesValue = v;
                        });
                      }),
                ],
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.navigate_next,
                ),
                label: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
