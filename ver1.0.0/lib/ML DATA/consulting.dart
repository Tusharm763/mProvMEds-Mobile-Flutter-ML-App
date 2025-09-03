import 'dart:async';

import 'package:diseases/ML%20DATA/ml.dart';
import 'package:diseases/main.dart';
import 'package:flutter/material.dart';
import 'Results.dart';

String disease = "";

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        Timer(
          const Duration(microseconds: 1),
          () {
            debugPrint("Timed Tapped");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RequestAndDisplay(),
              ),
            );
          },
        );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () async {
                colorselection = "B";
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            centerTitle: true,
            title: Text(
              disease,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 20.00,
                  ),
                  child: Card(
                    elevation: 5,
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      child: Center(
                        child: Text(
                          "Here are Some of the Home-Remedies and Some Medicine Suggested by General Chemists, which can solve the Precaution/ conquer the disease: $disease.",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                fontFamily: 'SourGummy',
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                                // color: Colors.deepPurple,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: Container(
                //     child: Text(
                //         "Here's some of  the Home-Remedies which can solve the Precaution/ conquer the disease: $disease"),
                //   ),
                // ),
                SingleChildScrollView(
                  // Expanded(
                  // padding: const EdgeInsets.only(right: 30.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 10 / 13.75,
                    // width: MediaQuery.of(context).size.width - 100.0,
                    child: ListView.builder(
                      itemCount: remdisplay.length,
                      itemBuilder: (context, idx) {
                        // if (allsymptoms[0] == "np") {
                        //   return ListTile(
                        //     leading: Text('Symptom:${idx + 1}'),
                        //     title: Text("gett"),
                        //   );
                        // } else {
                        //   return
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(
                            14.50,
                            2.5,
                            14.50,
                            7.50,
                          ),
                          child: Card(
                            elevation: 5.0,
                            color: Theme.of(context).colorScheme.surface,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: ListTile(
                                leading: Text(
                                  "${idx + 1}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontFamily: 'SourGummy',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        // color: Colors.deepPurple,
                                      ),
                                ),
                                title: Text(
                                  remdisplay[idx],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontFamily: 'SourGummy',
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        // color: Colors.deepPurple,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                        // }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     Navigator.pop(
          //       context,
          //       // MaterialPageRoute(builder: (context) => const Doctor()),
          //     );
          //   },
          //   label: Text(
          //     "View Doctors",
          //     style: TextStyle(
          //       fontStyle: FontStyle.normal,
          //       fontSize: 20.0,
          //       color: Colors.deepPurple[900],
          //     ),
          //     // style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),
        ),
      ),
    );
  }
}

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        Timer(
          const Duration(microseconds: 1),
          () {
            debugPrint("Timed Tapped");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RequestAndDisplay(),
              ),
            );
          },
        );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () async {
                colorselection = "B";
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            centerTitle: true,
            title: Text(
              disease,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.only(
                    top: 17.50,
                    left: 15.0,
                    right: 15.0,
                    bottom: 20.00,
                  ),
                  child: Card(
                    elevation: 5.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      child: Center(
                        child: Text(
                          "Consult a Doctor with expertise in the field of $disease about the Remedy.",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                fontFamily: 'SourGummy',
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                                // color: Colors.deepPurple,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                // Center(
                //   child: Container(
                //     child: const Text("Or Consult a Doctor about the Remedy."),
                //   ),
                // ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7125,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: docdisplay.length,
                        itemBuilder: (context, idx) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(
                              14.50,
                              2.5,
                              14.50,
                              2.5,
                            ),
                            child: Card(
                              elevation: 5.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              child: ListTile(
                                leading: Text(
                                  '${idx + 1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontFamily: 'SourGummy',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        // color: Colors.deepPurple,
                                      ),
                                ),
                                title: (docdisplay[idx] == "Loading...")
                                    ? Text(
                                        docdisplay[idx],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              // color: Colors.deepPurple,
                                            ),
                                      ) //LinearProgressIndicator()
                                    : Text(
                                        docdisplay[idx],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              // color: Colors.deepPurple,
                                            ),
                                      ),
                                trailing: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          );
                          // if (allsymptoms[0] == "np") {
                          //   return ListTile(
                          //     leading: Text('Symptom:${idx + 1}'),
                          //     title: Text("gett"),
                          //   );
                          // } else {
                          //   return ListTile(
                          //     leading: Text(idx as String),
                          //     title: const Text('Fetching-Doctor from Server'),
                          //   );
                          // }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const Medicine()),
          //     );
          //   },
          //   label: Text(
          //     "Medical Remedy",
          //     style: TextStyle(
          //       fontStyle: FontStyle.normal,
          //       fontSize: 20.0,
          //       color: Colors.deepPurple[900],
          //     ),
          //     // style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),
        ),
      ),
    );
  }
}
