import 'package:diseases/ML%20DATA/search.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'drop_down.dart';

class DropDownSingle extends StatefulWidget {
  const DropDownSingle({super.key});
  @override
  State<DropDownSingle> createState() => _DropDownSingleState();
}

class _DropDownSingleState extends State<DropDownSingle> {
  final List<DropdownMenuItem<String>> _dropDownMenuItems = allsymptoms
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String? _SelectedVal;
  @override
  Widget build(BuildContext context) {
    var drawerHeader = buildingUserAccountsDrawerHeader(context);
    final drawerItems = buildingListView(drawerHeader, context);
    return WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple[400],
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Professional"),
            actions: [
              IconButton(
                icon: const Icon(Icons.restart_alt),
                onPressed: () {
                  (submittingList[0] != "np")
                      ? setState(() {
                          submittingList = List.filled(96, "np");
                          // s = null;
                          i = 0;
                        })
                      : debugPrint("Already Removed....");
                },
              ),
              PopupMenuButton<String>(
                onSelected: (String newValue) {
                  if (newValue == "Search") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Searchable()),
                    );
                  } else if (newValue == "Professional") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DropDownSingle()),
                    );
                  } else if (newValue == "Reset Symptoms") {
                    (submittingList[0] != "np")
                        ? setState(
                            () {
                              submittingList = List.filled(96, "np");
                              // s = null;
                              i = 0;
                            },
                          )
                        : debugPrint("Already Removed....");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DropDown()),
                    );
                  }
                },
                itemBuilder: (BuildContext context) => popUpMenuItems,
              ),
            ],
          ),
          body: Stack(
            children: [
              ListView(
                // physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 5.0, right: 5.0),
                    height: 94.0,
                    color: Colors.deepPurple[400],
                    child: Card(
                      color: Colorforeach,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  "You can Search the Symptom- by \"Select by Search\" Button. And you can also Select each Symptom Below by \">\" Button."),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    elevation: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(
                                right: 35.0,
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                borderRadius: BorderRadius.circular(15.0),
                                menuMaxHeight: 450,
                                icon: arowicon,
                                value: _SelectedVal,
                                hint: const Text(
                                  'Symptom Selection',
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  bool alreadyin = false;
                                  for (int t = 0;
                                      t < submittingList.length;
                                      t++) {
                                    if (submittingList[t] == newValue) {
                                      alreadyin = true;
                                    }
                                  }
                                  if (newValue != null && !alreadyin) {
                                    setState(() => _SelectedVal = newValue);
                                    setState(() =>
                                        selectionfordropdown += _SelectedVal!);
                                    setState(() => selectionfordropdown += ",");
                                    setState(() => print(selectionfordropdown));
                                    setState(
                                      () => print(selectionfordropdown
                                          .replaceAll(" ", "_")
                                          .toLowerCase()),
                                    );
                                  } else {
                                    setState(() {});
                                  }
                                },
                                items: _dropDownMenuItems,
                              ),
                            ),
                          ),
                          const Divider(
                            indent: 750.0,
                            endIndent: 75.0,
                            thickness: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      submittingList.fillRange(
                                          0, submittingList.length, "np");
                                      _SelectedVal = null;
                                      i = 0;
                                    });
                                  },
                                  child: const Text("Reset Field")),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      submittingList[i] = _SelectedVal!;
                                      i += 1;
                                    });
                                  },
                                  child: const Text("Add to List"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 20.0, 0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 460.0,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: allsymptoms.length,
                        itemBuilder: (context, idx) {
                          return Card(
                            elevation: 5.0,
                            child: ListTile(
                              leading: Text('Symptom ${idx + 1}'),
                              title: Text(allsymptoms[idx]),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  var selected = allsymptoms[idx];
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                        "Adding $selected",
                                      ),
                                      content: Text(
                                          "Description : \n${descriptionsList[idx]}"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              submittingList =
                                                  List.filled(96, "np");
                                              // s = null;
                                              i = 0;
                                              Navigator.pop(
                                                context,
                                                '',
                                              );
                                            });
                                          },
                                          child: const Text(
                                            "Reset Field",
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              submittingList[i] = selected;
                                              i += 1;
                                              Navigator.pop(context, '');
                                            });
                                          },
                                          child: const Text(
                                            "Add ",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                ],
              ),
              draglist(),
            ],
          ),
          drawer: Drawer(
            child: drawerItems,
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: buildingFloatingActionButton(context
          //   context,
          //   _isInternetAvailableStreamStatus,
          //   _isInternetAvailableStreamStatus!,),
        ),
      ),
    );
  }
}
