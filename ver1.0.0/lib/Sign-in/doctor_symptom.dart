import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../ML DATA/ml.dart';
import '../main.dart';
import 'details.dart';

class GetSymptoms extends StatefulWidget {
  const GetSymptoms({super.key});

  @override
  State<GetSymptoms> createState() => _GetSymptomsState();
}

class _GetSymptomsState extends State<GetSymptoms> {
  Future<void> signInSetState() async {
    //TODO: Hive db for person declaration.
    dateSign = "";
    dateSign +=
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ";
    if (DateTime.now().hour > 12) {
      // dateSign += "${DateTime.now().hour - 12}";
      dateSign += ((DateTime.now().hour - 12) > 9)
          ? "${DateTime.now().hour - 12}"
          : "0${DateTime.now().hour - 12}";
      dateSign += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      dateSign += " PM.";
    } else {
      dateSign += ((DateTime.now().hour) > 9)
          ? "${DateTime.now().hour}"
          : "0${DateTime.now().hour}";
      dateSign += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      dateSign += " AM.";
    }

    var person = await Hive.openBox("information");
    person.put("name0", name);
    person.put("name1", name1);
    person.put("name2", name2);
    person.put("fname", fullname);
    person.put("age", age);
    person.put("gender", gender);
    person.put("mail-id", mail);
    person.put("dob", dob);
    person.put("mobile", mobile);
    person.put("date", dateSign);
    person.put("Specialised Diseases", docsymp);

    debugPrint(person.get("fname"));
    debugPrint(person.get("age"));
    debugPrint(person.get("gender"));
    debugPrint(person.get("mail-id"));
    debugPrint(person.get("dob"));
    debugPrint(person.get("mobile"));
    debugPrint(person.get("date"));
    debugPrint("${person.get("Specialised Diseases")[0]}");

    person.put("agrr", true);
    person.put("Is Doctor", isdoctor);
    setState(() {
      fullname = (person.get("fname"));
      name = (person.get("name0"));
      name1 = (person.get("name1"));
      name2 = (person.get("name2"));
      age = (person.get("age"));
      gender = (person.get("gender"));
      dob = (person.get("dob"));
      mail = (person.get("mail-id"));
      mobile = (person.get("mobile"));
      agreed = person.get("agrr");
      isdoctor = person.get("Is Doctor");
      dateSign = person.get("date");
      docsymp = (person.get("Specialised Diseases"));
    });
    colorselection = "B";
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Select Symptoms:"),
        // ),
        body: Stack(
          children: [
            const GradientBackGround(),
            Padding(
              padding: EdgeInsets.zero,
              // padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 5.0),
              child: Card(
                elevation: 5.0, margin: bodyCardMargin,
                // margin: const EdgeInsets.only(
                //   top: 100.0,
                //   left: 2.5,
                //   right: 2.5,
                //   bottom: 5.0,
                // ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20.0, 0),
                  child: ListView.builder(
                    itemCount: alldisease.length,
                    itemBuilder: (context, idx) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12.50, top: 0),
                        elevation: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                        child: ListTile(
                            // leading: Text('Disease ${idx + 1}'),
                            title: Text(
                              alldisease[idx],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: 'SourGummy',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    // color: Colors.deepPurple,
                                  ),
                            ),
                            trailing: Checkbox(
                              value: ((docsymp[idx] == "__D__") ? false : true),
                              splashRadius: 75.0,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (bool? selected) {
                                setState(() {
                                  (docsymp[idx] == alldisease[idx])
                                      ? docsymp[idx] = "__D__"
                                      : docsymp[idx] = alldisease[idx];
                                  debugPrint(docsymp[idx]);
                                });
                              },
                            )),
                      );
                    },
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              return const AppbarCard(
                titleAppBar: "Select Symptoms",
                menu: SizedBox(
                  height: 0,
                  width: 0,
                ),
                menuChildren: SizedBox(
                  height: 0,
                  width: 0,
                ),
                showBackButton: true,
                showMoreOption: false,
              );
              // return Padding(
              //   padding: const EdgeInsets.only(top: 35.0, left: 10.0),
              //   child: Row(
              //     children: [
              //       Card(
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.pop(context);
              //           },
              //           // borderRadius: BorderRadius.circular(25),
              //           child: Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: Icon(
              //               Icons.arrow_back,
              //               color: Theme.of(context).colorScheme.primary,
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 8.0,
              //       ),
              //       Card(
              //         child: Padding(
              //           padding: EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
              //           child: Text(
              //             "Select Symptoms",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .titleMedium
              //                 ?.copyWith(
              //                   fontFamily: 'SourGummy',
              //                   letterSpacing: 1,
              //                   fontWeight: FontWeight.w600,
              //                   color: Theme.of(context).colorScheme.primary,
              //                   // color: Colors.deepPurple,
              //                 ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // );
            }),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          label: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.34,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Submit",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.50,
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontFamily: 'SourGummy',
                      ),
                  // style: Theme.of(context).textTheme.titleMedium,
                ),
                // const Icon(Icons.arrow_forward)
              ],
            ),
          ),
          onPressed: () {
            for (int d = 0; d < docsymp.length; d++) {
              if (docsymp[d] == "__D__") {
                break;
              } else {
                debugPrint("$d :");
                debugPrint(docsymp[d]);
              }
            }
            setState(() {
              signInSetState();
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
      ),
    );
  }
}

class DetailsSympDoctor extends StatefulWidget {
  const DetailsSympDoctor({super.key});

  @override
  State<DetailsSympDoctor> createState() => _DetailsSympDoctorState();
}

class _DetailsSympDoctorState extends State<DetailsSympDoctor> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Specialised Disease:"),
        //   backgroundColor: Colors.deepPurple,
        //   foregroundColor: Colors.white,
        // ),
        body: Stack(
          children: [
            const GradientBackGround(),
            // Padding(
            // padding: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 5.0),
            Card(
              margin: bodyCardMargin,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.50),
                child: ListView.builder(
                  itemCount: docsymp.length,
                  itemBuilder: (context, idx) {
                    if (docsymp[idx] != "__D__") {
                      return Card(
                        elevation: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.25, horizontal: 5.0,),
                          child: ListTile(
                            // leading: Text('Disease ${idx + 1}'),
                            title: Text(
                              docsymp[idx],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: 'SourGummy',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    // color: Colors.deepPurple,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
            Builder(builder: (context) {
              return const AppbarCard(
                titleAppBar: "Specialised Disease",
                menu: SizedBox(
                  height: 0,
                  width: 0,
                ),
                menuChildren: SizedBox(
                  height: 0,
                  width: 0,
                ),
                showBackButton: true,
                showMoreOption: false,
              );
              // return Padding(
              //   padding: const EdgeInsets.only(top: 35.0, left: 10.0),
              //   child: Row(
              //     children: [
              //       Card(
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.pop(context);
              //           },
              //           // borderRadius: BorderRadius.circular(25),
              //           child: Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: Icon(
              //               Icons.arrow_back,
              //               color: Theme.of(context).colorScheme.primary,
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 8.0,
              //       ),
              //       Card(
              //         child: Padding(
              //           padding: EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
              //           child: Text(
              //             "Specialised Disease",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .titleMedium
              //                 ?.copyWith(
              //                   fontFamily: 'SourGummy',
              //                   letterSpacing: 1,
              //                   fontWeight: FontWeight.w600,
              //                   color: Theme.of(context).colorScheme.primary,
              //                   // color: Colors.deepPurple,
              //                 ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // );
            }),
          ],
        ),
      ),
    );
  }
}
