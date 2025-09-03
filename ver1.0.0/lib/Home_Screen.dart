import 'dart:io';

import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ML DATA/drop_down.dart';
import 'Sign-in/Setting_history.dart';
import 'Sign-in/details.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = "mProve Med's";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  submit() {
    setState(
      () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              "Confirm: Submission...?",
              style: TextStyle(
                fontFamily: 'SourGummy',
                letterSpacing: 1,
              ),
            ),
            content: Column(children: [
              const Text(
                "Are you sure to continue signing-In using:",
                style: TextStyle(
                  fontFamily: 'SourGummy',
                  letterSpacing: 1,
                ),
              ),
              Text(
                mail,
                style: TextStyle(
                  fontFamily: 'SourGummy',
                  letterSpacing: 1,
                ),
              ),
            ]),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                ),
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String Greet(String user) {
    if (DateTime.now().hour > 5 && DateTime.now().hour < 12) {
      return "Good Morning!! $user"; //Have a nice Day with mProv Med's";
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour <= 17) {
      return "Good Afternoon!! $user"; //Have a nice Day with mProv Med's";
    } else if (DateTime.now().hour >= 18 && DateTime.now().hour < 23) {
      return "Good Evening!! $user"; //Have a nice Day with mProv Med's";
    }
    return "Have a Great Sleep😴, $user";
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeader = buildingUserAccountsDrawerHeader(context);
    final drawerItems = buildingListView(drawerHeader, context);
    return WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        exit(0);
        //TODO: CLose App after back key pushed.
      },
      child: Placeholder(
        child: Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: const Text("mProve Med's"),
          //   elevation: 1.0,
          // ),

          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: Stack(
            children: [
              // Center(//// ListView
              //   child:
              Container(
                // height: MediaQuery.sizeOf(context).height * (1-),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Column(
                  //   children: [
                  //     // (agreed)
                  //     //     ?
                  //     SizedBox(
                  //       // height: MediaQuery.sizeOf(context).height * 0.15,
                  //       child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 105.0,
                  //               left: 15.0,
                  //               bottom: 8.0,
                  //               right: 0.0),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 Greet("tushankl jcnkfbwe fjihefiwbj $name"),
                  //                 textAlign: TextAlign.left,
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .titleLarge
                  //                     ?.copyWith(
                  //                       fontFamily: 'SourGummy',
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Theme.of(context)
                  //                           .colorScheme
                  //                           .primary,
                  //                       // color: Colors.deepPurple,
                  //                       letterSpacing: 1,
                  //                     ),
                  //               ),
                  //               // Text(
                  //               //   "Have a Nice Day...",
                  //               //   style: TextStyle(
                  //               // fontFamily: 'SourGummy',
                  //               //     fontWeight: FontWeight.bold,
                  //               //     color: Colors.deepPurple,
                  //               //     fontSize: 25.0,
                  //               //   ),
                  //               // ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //     // Card(
                  //     //   color: Colors.deepPurple,
                  //     //   child: TextButton(
                  //     //     onPressed: () async {
                  //     //       var inform = await Hive.openBox("naming");
                  //     //       inform.put("naming", "Tushar Mistry");
                  //     //
                  //     //       print(inform.get("naming"));
                  //     //     },
                  //     //     child: Text("hive"),
                  //     //   ),
                  //     // ),
                  //     // Card(
                  //     //   child: FutureBuilder(
                  //     //       future: Hive.openBox("naming"),
                  //     //       builder: (context, snapshot) {
                  //     //         return Text(snapshot.data!.get("naming") as String);
                  //     //       }),
                  //     // ),
                  //     //TODO
                  //     // : Container(
                  //     //     padding: const EdgeInsets.only(
                  //     //         top: 90.0,
                  //     //         left: 15.0,
                  //     //         bottom: 8.0,
                  //     //         right: 8.0),
                  //     //     child: GestureDetector(
                  //     //       onTap: () {
                  //     //         Navigator.push(
                  //     //           context,
                  //     //           MaterialPageRoute(
                  //     //             builder: (context) => const REGISTER(),
                  //     //           ),
                  //     //         );
                  //     //       },
                  //     //       child: Card(
                  //     //         color: Theme.of(context).colorScheme.primary,
                  //     //         // color: Colors.purpleAccent[50],
                  //     //
                  //     //         child: Padding(
                  //     //           padding: const EdgeInsets.symmetric(
                  //     //               vertical: 15.0, horizontal: 17.50),
                  //     //           child: Align(
                  //     //             alignment: Alignment.center,
                  //     //             child: SingleChildScrollView(
                  //     //               child: RichText(
                  //     //                 softWrap: false,
                  //     //                 text: TextSpan(
                  //     //                   children: [
                  //     //                     TextSpan(
                  //     //                       text: "Hey.!! ",
                  //     //                       style: Theme.of(context)
                  //     //                           .textTheme
                  //     //                           .titleMedium
                  //     //                           ?.copyWith(
                  //     //                             fontFamily: 'SourGummy',
                  //     //                             fontWeight:
                  //     //                                 FontWeight.bold,
                  //     //                             color: Theme.of(context)
                  //     //                                 .colorScheme
                  //     //                                 .onPrimary,
                  //     //                             // color: Colors.deepPurple,
                  //     //                             letterSpacing: 1,
                  //     //                           ),
                  //     //                     ),
                  //     //                     TextSpan(
                  //     //                       text: "Log - In",
                  //     //                       style: Theme.of(context)
                  //     //                           .textTheme
                  //     //                           .titleLarge
                  //     //                           ?.copyWith(
                  //     //                             fontFamily: 'SourGummy',
                  //     //                             fontWeight:
                  //     //                                 FontWeight.bold,
                  //     //                             letterSpacing: 1,
                  //     //                             color: Colors.white,
                  //     //                             // color: Colors.blue[900],
                  //     //                           ),
                  //     //                     ),
                  //     //                     TextSpan(
                  //     //                       text: " to know more from Us.",
                  //     //                       style: Theme.of(context)
                  //     //                           .textTheme
                  //     //                           .titleMedium
                  //     //                           ?.copyWith(
                  //     //                             fontFamily: 'SourGummy',
                  //     //                             fontWeight:
                  //     //                                 FontWeight.bold,
                  //     //                             color: Theme.of(context)
                  //     //                                 .colorScheme
                  //     //                                 .onPrimary,
                  //     //                             // color: Colors.deepPurple,
                  //     //                             letterSpacing: 1,
                  //     //                           ),
                  //     //                     ),
                  //     //                   ],
                  //     //                   style: TextStyle(
                  //     //                       fontFamily: 'SourGummy',
                  //     //                       color: Colors.grey[850],
                  //     //                       fontSize: 17.5),
                  //     //                 ),
                  //     //               ),
                  //     //             ),
                  //     //           ),
                  //     //         ),
                  //     //         // Column(
                  //     //         //   children: [
                  //     //         //     Container(
                  //     //         //       padding: const EdgeInsets.only(
                  //     //         //           top: 110.0,
                  //     //         //           left: 15.0,
                  //     //         //           bottom: 8.0,
                  //     //         //           right: 8.0),
                  //     //         //       alignment: Alignment.topLeft,
                  //     //         //       child: const Center(
                  //     //         //         child: Text(
                  //     //         //           'Hey.!! Log-In to know more from Us.',
                  //     //         //           softWrap: true,
                  //     //         //           textAlign: TextAlign.justify,
                  //     //         //           style: TextStyle(
                  //     //         // fontFamily: 'SourGummy',
                  //     //         //             fontSize: 16.5,
                  //     //         //           ),
                  //     //         //         ),
                  //     //         //       ),
                  //     //         //     ),
                  //     //         //     Padding(
                  //     //         //       padding: const EdgeInsets.fromLTRB(
                  //     //         //           8.0, 8.0, 8.0, 4.0),
                  //     //         //       child: Column(
                  //     //         //         children: [
                  //     //         //           Padding(
                  //     //         //             padding: const EdgeInsets.all(10.0),
                  //     //         //             child: Row(
                  //     //         //               mainAxisAlignment:
                  //     //         //                   MainAxisAlignment.end,
                  //     //         //               children: [
                  //     //         //                 OutlinedButton(
                  //     //         //                   style: OutlinedButton.styleFrom(
                  //     //         //                     backgroundColor: Colors.white,
                  //     //         //                     foregroundColor:
                  //     //         //                         Colors.deepPurple[900],
                  //     //         //                   ),
                  //     //         //                   onPressed: () {},
                  //     //         //                   child: const Text("Cancel"),
                  //     //         //                 ),
                  //     //         //                 const SizedBox(
                  //     //         //                   width: 25.0,
                  //     //         //                 ),
                  //     //         //                 FilledButton(
                  //     //         //                   onPressed: () {
                  //     //         //                     Navigator.push(
                  //     //         //                       context,
                  //     //         //                       MaterialPageRoute(
                  //     //         //                         builder: (context) =>
                  //     //         //                             const REGISTER(),
                  //     //         //                       ),
                  //     //         //                     );
                  //     //         //                   },
                  //     //         //                   child: const Text("Sign-In"),
                  //     //         //                 ),
                  //     //         //               ],
                  //     //         //             ),
                  //     //         //           ),
                  //     //         //         ],
                  //     //         //       ),
                  //     //         //     ),
                  //     //         //   ],
                  //     //         // ),
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //   ],
                  // ),

                  // Card(
                  //   margin: const EdgeInsets.all(15.0),
                  //   color: Colors.deepPurple[300],
                  //   // shape: const Border.symmetric(),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         padding:
                  //             const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
                  //         alignment: Alignment.topLeft,
                  //         child: const Center(
                  //           child: Text(
                  //                           'Our app is a machine learning-based application with a well-trained model that can predict 41 distinct diseases based on the input of 132 symptoms, covering approximately 5,000 combinations.',
                  //                           style: Theme.of(context).textTheme.bodyText1,
                  //                         ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding:
                  //             const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                  //         child: Column(
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   OutlinedButton(
                  //                     style: OutlinedButton.styleFrom(
                  //                         backgroundColor: Colors.white,
                  //                         foregroundColor:
                  //                             Colors.deepPurple[900]),
                  //                     //TODO: LEARN MORE Button
                  //                     onPressed: () {},
                  //                     child: const Text("Learn More"),
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 25.0,
                  //                   ),
                  //                   OutlinedButton(
                  //                     style: OutlinedButton.styleFrom(
                  //                         backgroundColor: Colors.white,
                  //                         foregroundColor:
                  //                         Colors.deepPurple[900]),
                  //                     //TODO: Direct Predict Button
                  //                     onPressed: () {
                  //                       Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               const DropDown(),
                  //                         ),
                  //                       );
                  //                     },
                  //                     child: const Text("Predict Disease"),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //   margin: const EdgeInsets.all(15.0),
                  //   color: Colors.deepPurple[300],
                  //   // shape: const Border.symmetric(),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         padding:
                  //             const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
                  //         alignment: Alignment.topLeft,
                  //         child: const Center(
                  //           child: Text(
                  //             'Throughout the App, You can make the list of Symptoms to be predicted by over 3 method with smooth Symptoms storing, which can be seen on the bottom of each page - Draggable Column. Also, You can also remove all the Symptoms if any one of them is wrongly added. Their is no need to check if any symptom is submitted more than one, as it will be counted Once only in the Prediction Server.',
                  //             softWrap: true,
                  //             textAlign: TextAlign.justify,
                  //             style: TextStyle(
                  // fontFamily: 'SourGummy',
                  //               fontSize: 20.0,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding:
                  //             const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                  //         child: Column(
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   GestureForRouting(
                  //                     context,
                  //                     "Predict by Searching the Symptoms",
                  //                     const Searchable(),
                  //                   ),
                  //                   GestureForRouting(
                  //                     context,
                  //                     "Predict by List Symptoms.(Recommended)",
                  //                     const DropDown(),
                  //                   ),
                  //                   // GestureForRouting(
                  //                   //   context,
                  //                   //   "Predict by Add one Symptoms at a time.(Professional)",
                  //                   //   const DropDownSingle(),
                  //                   // ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //TODO : Card slider
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).width * 0.7,
                  //   width: MediaQuery.sizeOf(context).width * 0.7,
                  //   // width: 325.0,
                  //   // height: MediaQuery.sizeOf(context).width * 0.7,
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     physics: ClampingScrollPhysics(),
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       SizedBox(
                  //         // width: 325.0,
                  //         height: MediaQuery.sizeOf(context).width * 0.8,
                  //         width: MediaQuery.sizeOf(context).width * 0.8,
                  //         // height: 275.0,
                  //         child: Card(
                  //           margin: const EdgeInsets.all(15.0),
                  //
                  //           color: Theme.of(context).colorScheme.primary,
                  //           // color: Colors.purpleAccent[50],
                  //           // shape: const Border.symmetric(),
                  //           child: Column(
                  //             children: [
                  //               Container(
                  //                 padding: const EdgeInsets.fromLTRB(
                  //                     10.0, 12.0, 20.0, 10.0),
                  //                 alignment: Alignment.topLeft,
                  //                 child: Center(
                  //                   child: SizedBox(
                  //                     // height: MediaQuery.sizeOf(context).width *
                  //                     //     0.6,
                  //                     // width: MediaQuery.sizeOf(context).width *
                  //                     //     0.4,
                  //                     child: ListView(
                  //                       physics: const ClampingScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       children: [
                  //                         Text(
                  //                           'Our app is a machine learning-based application with a well-trained model that can predict 41 distinct diseases based on the input of 132 symptoms, covering approximately 5,000 combinations.',
                  //                           textAlign: TextAlign.justify,
                  //                           style: Theme.of(context)
                  //                               .textTheme
                  //                               .labelLarge
                  //                               ?.copyWith(
                  //                                 fontFamily: 'SourGummy',
                  //                                 fontWeight: FontWeight.w900,
                  //                                 color: Theme.of(context)
                  //                                     .colorScheme
                  //                                     .onPrimary,
                  //                                 letterSpacing: 1,
                  //                                 fontSize:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width /
                  //                                         25,
                  //                               ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: MediaQuery.sizeOf(context).width * 0.8,
                  //         width: MediaQuery.sizeOf(context).width * 0.8,
                  //         // width: 325.0,
                  //         // height: 275.0,
                  //         child: Card(
                  //           margin: const EdgeInsets.all(15.0),
                  //
                  //           color: Theme.of(context).colorScheme.primary,
                  //           // color: Colors.purpleAccent[50],
                  //           // shape: const Border.symmetric(),
                  //           child: Column(
                  //             children: [
                  //               Container(
                  //                 padding: const EdgeInsets.fromLTRB(
                  //                     10.0, 12.0, 20.0, 10.0),
                  //                 alignment: Alignment.topLeft,
                  //                 child: Center(
                  //                   child: SizedBox(
                  //                     // height: MediaQuery.sizeOf(context).width *
                  //                     //     0.8,
                  //                     // width: MediaQuery.sizeOf(context).width *
                  //                     //     0.8,
                  //                     child: ListView(
                  //                       physics: const ClampingScrollPhysics(),
                  //                       shrinkWrap: true,
                  //                       children: [
                  //                         Text(
                  //                           'We achieved an accuracy of approximately 93.44% using a Voting Classifier M.L. Ensemble Model composed of Support Vector Machines, K-Nearest Neighbors, and Random Forest Classifiers.',
                  //                           textAlign: TextAlign.justify,
                  //                           style: Theme.of(context)
                  //                               .textTheme
                  //                               .labelLarge
                  //                               ?.copyWith(
                  //                                 fontFamily: 'SourGummy',
                  //                                 fontWeight: FontWeight.w900,
                  //                                 color: Theme.of(context)
                  //                                     .colorScheme
                  //                                     .onPrimary,
                  //                                 letterSpacing: 1,
                  //                                 fontSize:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width /
                  //                                         25,
                  //                               ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.1195, //110.0,
                      left: 15.0,
                      right: 0.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Greet(name), // + Greet(name),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontFamily: 'SourGummy',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              // color: Colors.deepPurple,
                              letterSpacing: 1,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * (0.8475),
                    // height: MediaQuery.sizeOf(context).height * (1 - 0.1525),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            15.0, 0, 15.0, 15.0,
                            // (MediaQuery.sizeOf(context).width * 0.075),
                            // (MediaQuery.sizeOf(context).height * 0.0),
                            // (MediaQuery.sizeOf(context).width * 0.075),
                            // (MediaQuery.sizeOf(context).height * 0.0),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  // style: OutlinedButton.styleFrom(
                                  //   backgroundColor:
                                  //       Theme.of(context).colorScheme.onSecondary,
                                  //   foregroundColor:
                                  //       Theme.of(context).colorScheme.secondary,
                                  //   // backgroundColor: Colors.white,
                                  //   // foregroundColor: Colors.deepPurple[900],
                                  // ),
                                  onTap: () async {
                                    if (fullname == "" &&
                                        mail == "" &&
                                        !agreed) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const REGISTER();
                                          },
                                        ),
                                      );
                                    } else {
                                      colorselection = "C";
                                      // Colorforeach =
                                      //     Theme.of(context).colorScheme.primary;
                                      // hinting = Text(
                                      //   'Choose',
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .titleLarge
                                      //       ?.copyWith(
                                      //         fontFamily: 'SourGummy',
                                      //         fontWeight: FontWeight.w900,
                                      //         color: Theme.of(context)
                                      //             .colorScheme
                                      //             .onPrimary,
                                      //       ),
                                      // );
                                      // arowicon = Icon(
                                      //   Icons.arrow_downward,
                                      //   size: 25.0,
                                      //   color: Theme.of(context).colorScheme.onPrimary,
                                      // );
                                      Colorforeach =
                                          Theme.of(context).colorScheme.primary;
                                      hinting = Text(
                                        ' Choose',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              // color: Colors.deepPurple,
                                            ),
                                      );
                                      arowicon = Icon(
                                        Icons.arrow_downward,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      );
                                      cardMargin = const EdgeInsets.fromLTRB(
                                        // MediaQuery.sizeOf(context).width * 0.005,
                                        // 10.0,
                                        // MediaQuery.sizeOf(context).width * 0.005,
                                        // 10.0,
                                        5.0, 1.0, 5.0, 12.50,
                                      );
                                      paddingCard = const EdgeInsets.only(
                                        right: 4.0,
                                        left: 4.0,
                                        top: 5.0,
                                        bottom: 4.0,
                                      );
                                      await symptom1();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DropDown(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Card(
                                    elevation: 5.0,
                                    margin: EdgeInsets.zero,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        15.0,
                                        22.50,
                                        15.0,
                                        22.50,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 8,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                (fullname == "" &&
                                                        mail == "" &&
                                                        !agreed)
                                                    ? "Create Account for Prediction"
                                                    : (historyListDatabase
                                                            .isNotEmpty)
                                                        ? 'Predict your Health Now'
                                                        : 'Get Your First Health Check-Up',
                                                textAlign: TextAlign.left,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontFamily: 'SourGummy',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                                      letterSpacing: 2.0,
                                                    ),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              (historyListDatabase.isNotEmpty && agreed)
                                  ? Center(
                                      child: GestureDetector(
                                        // style: OutlinedButton.styleFrom(
                                        //   backgroundColor:
                                        //       Theme.of(context).colorScheme.onSecondary,
                                        //   foregroundColor:
                                        //       Theme.of(context).colorScheme.secondary,
                                        //   // backgroundColor: Colors.white,
                                        //   // foregroundColor: Colors.deepPurple[900],
                                        // ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SettingsHistory(),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          elevation: 5.0,
                                          margin: EdgeInsets.zero,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15.0, 22.50, 15.0, 22.50),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    "Prediction History",
                                                    textAlign: TextAlign.left,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                          fontFamily:
                                                              'SourGummy',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onPrimary,
                                                          letterSpacing: 2.0,
                                                        ),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                            ],
                          ),
                        ),
                        // Divider(
                        //   color: Theme.of(context).colorScheme.onPrimary,
                        //   thickness: 2.50,
                        //   indent: 20.0,
                        //   endIndent: 20.0,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 10.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  7.50, 0.0, 15.0, 0.0),
                              child: Text(
                                "How This Works?",
                                // "Know More About This",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontFamily: 'SourGummy',
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      letterSpacing: 2.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            top: 15.0,
                            bottom: 0.0,
                          ),
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ScrollableCard(
                                  textToDisplay:
                                      "Our app is a machine learning-based application with a well-trained model that can predict 41 distinct diseases based on the input of 132 symptoms, covering around 5,000 combinations.",
                                ),
                                ScrollableCard(
                                  textToDisplay:
                                      'We achieved an accuracy of approximately 93.44% using a Voting Classifier M.L. Ensemble Model composed of Support Vector Machines, K-Nearest Neighbors, and Random Forest Classifiers.',
                                ),
                                // Card(
                                //   margin: const EdgeInsets.only(
                                //       left: 7.5, right: 7.5),
                                //   // margin: const EdgeInsets.all(7.50),
                                //   color: Theme.of(context).colorScheme.primary,
                                //   child: SizedBox(
                                //     height:
                                //         MediaQuery.sizeOf(context).width * 0.65,
                                //     width:
                                //         MediaQuery.sizeOf(context).width * 0.75,
                                //     // width:
                                //     //     MediaQuery.sizeOf(context).width * 0.7,
                                //     // height: MediaQuery.sizeOf(context).width * 0.675,
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(15.00),
                                //       child: SingleChildScrollView(
                                //         // physics: const ClampingScrollPhysics(),
                                //         // shrinkWrap: true,
                                //         // children: [
                                //         child: Text(
                                //           'We achieved an accuracy of approximately 93.44% using a Voting Classifier M.L. Ensemble Model composed of Support Vector Machines, K-Nearest Neighbors, and Random Forest Classifiers.',
                                //           textAlign: TextAlign.justify,
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .labelLarge
                                //               ?.copyWith(
                                //                 fontFamily: 'SourGummy',
                                //                 fontWeight: FontWeight.w900,
                                //                 color: Theme.of(context)
                                //                     .colorScheme
                                //                     .onPrimary,
                                //                 letterSpacing: 1,
                                //                 fontSize:
                                //                     MediaQuery.sizeOf(context)
                                //                             .width /
                                //                         25,
                                //               ),
                                //         ),
                                //         // ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // Divider(
                        //   color: Theme.of(context).colorScheme.onPrimary,
                        //   thickness: 3.0,
                        //   indent: 20.0,
                        //   endIndent: 20.0,
                        // ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: SizedBox(
                            // height: MediaQuery.sizeOf(context).height * 0.35,
                            // height: MediaQuery.sizeOf(context).height * (4.7 / 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                                  // spacing: MediaQuery.sizeOf(context).height * .012,
                                  // runSpacing:
                                  //     MediaQuery.sizeOf(context).height * .012,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          7.50, 0.0, 15.0, 12.50),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Key Features',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                letterSpacing: 2.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 7.50, bottom: 2.50),
                                        //   child: Card(
                                        //     child: SizedBox(
                                        //       width: double.infinity,
                                        //       child: Padding(
                                        //         padding:
                                        //             const EdgeInsets.symmetric(
                                        //           vertical: 17.50,
                                        //           horizontal: 10.0,
                                        //         ),
                                        //         child: SingleChildScrollView(
                                        //           child: Text(
                                        //             '2 Methods for Selecting Symptoms.',
                                        //             softWrap: true,
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .labelMedium
                                        //                 ?.copyWith(
                                        //                   fontFamily:
                                        //                       'SourGummy',
                                        //                   fontWeight:
                                        //                       FontWeight.w900,
                                        //                   color:
                                        //                       Theme.of(context)
                                        //                           .colorScheme
                                        //                           .primary,
                                        //                   letterSpacing: 1,
                                        //                 ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 2.50, bottom: 2.50),
                                        //   child: Card(
                                        //     child: SizedBox(
                                        //       width: double.infinity,
                                        //       child: Padding(
                                        //         padding:
                                        //             const EdgeInsets.symmetric(
                                        //           vertical: 17.50,
                                        //           horizontal: 10.0,
                                        //         ),
                                        //         child: SingleChildScrollView(
                                        //           scrollDirection:
                                        //               Axis.horizontal,
                                        //           child: Text(
                                        //             '',
                                        //             softWrap: true,
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .labelMedium
                                        //                 ?.copyWith(
                                        //                   fontFamily:
                                        //                       'SourGummy',
                                        //                   fontWeight:
                                        //                       FontWeight.w900,
                                        //                   color:
                                        //                       Theme.of(context)
                                        //                           .colorScheme
                                        //                           .primary,
                                        //                   letterSpacing: 1,
                                        //                 ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        EachFeature(
                                          textToDisplay:
                                              '2 Methods for Selecting Symptoms.',
                                        ),
                                        EachFeature(
                                          textToDisplay:
                                              'Smooth Symptom Storing (Draggable Sheet).',
                                        ),
                                        EachFeature(
                                          textToDisplay:
                                              'Easy Removal of Incorrect Symptoms.',
                                        ),
                                        EachFeature(
                                          textToDisplay:
                                              'No Worry for more than one Symptom Entry.',
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 2.50, bottom: 7.50),
                                        //   child: Card(
                                        //     child: SizedBox(
                                        //       width: double.infinity,
                                        //       child: Padding(
                                        //         padding:
                                        //             const EdgeInsets.symmetric(
                                        //           vertical: 17.50,
                                        //           horizontal: 10.0,
                                        //         ),
                                        //         child: SingleChildScrollView(
                                        //           child: Text(
                                        //             '',
                                        //             softWrap: true,
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .labelMedium
                                        //                 ?.copyWith(
                                        //                   fontFamily:
                                        //                       'SourGummy',
                                        //                   color:
                                        //                       Theme.of(context)
                                        //                           .colorScheme
                                        //                           .primary,
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   letterSpacing: 1.5,
                                        //                 ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 27.50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const SizedBox(height: 20.0),
                  //
                  //       // Action Button (Consider replacing with a more specific action)
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           // Navigate to the symptom selection or prediction page
                  //           // Navigator.pushNamed(context, '/symptoms');
                  //         },
                  //         child: const Text('Start Prediction'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
                // ),
              ),
              Builder(builder: (context) {
                return AppbarCard(
                  titleAppBar: "mProv Med's",
                  menu: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          // title: const Text('Trying...Still Loading...'),
                          title: Text(
                            'No Internet at this Time...',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontFamily: 'SourGummy',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  // color: Colors.deepPurple,
                                ),
                          ),
                          content: Text(
                            'Try again after some time. Try checking the Wifi Connection or Mobile Data and then try again',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontFamily: 'SourGummy',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  // color: Colors.deepPurple,
                                ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              clipBehavior: Clip.antiAlias,
                              child: Text(
                                "Ok",
                                // Sign-In "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      // color: Colors.deepPurple,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: ConnectionNotifierToggler(
                      loading: const SizedBox(height: 0, width: 0),
                      connected: const SizedBox(height: 0, width: 0),
                      disconnected: Card(
                        color: Theme.of(context).colorScheme.error,
                        child: SizedBox(
                          height: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.signal_wifi_connected_no_internet_4,
                                size: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.onError,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  menuChildren: const SizedBox(height: 0, width: 0),
                  showBackButton: false,
                  showMoreOption: true,
                );
                // return Padding(
                //   padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Align(
                //         alignment: Alignment.centerLeft,
                //         child: SizedBox(
                //           height: 60.0,
                //           child: ListView(
                //             shrinkWrap: true,
                //             scrollDirection: Axis.horizontal,
                //             children: [
                //               Card(
                //                 child: IconButton(
                //                   onPressed: () {
                //                     Scaffold.of(context).openDrawer();
                //                   },
                //                   icon: Icon(
                //                     Icons.menu,
                //                     color:
                //                         Theme.of(context).colorScheme.primary,
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(
                //                 width: 8.0,
                //               ),
                //               Card(
                //                 child: Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       vertical: 10.0, horizontal: 20.0),
                //                   child: Align(
                //                     alignment: Alignment.center,
                //                     child: Text(
                //                       "mProv Med's",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .titleMedium
                //                           ?.copyWith(
                //                             fontFamily: 'SourGummy',
                //                             letterSpacing: 1,
                //                             fontWeight: FontWeight.w600,
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .primary,
                //                             // color: Colors.deepPurple,
                //                           ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       // Padding(
                //       //   padding: const EdgeInsets.only(
                //       //     top: 8.0,
                //       //     left: 15.0,
                //       //     bottom: 8.0,
                //       //     right: 0.0,
                //       //   ),
                //       //   child: Align(
                //       //     alignment: Alignment.centerLeft,
                //       //     child: Text(
                //       //       Greet(name),
                //       //       textAlign: TextAlign.left,
                //       //       style: Theme.of(context)
                //       //           .textTheme
                //       //           .titleLarge
                //       //           ?.copyWith(
                //       //             fontFamily: 'SourGummy',
                //       //             fontWeight: FontWeight.bold,
                //       //             color: Theme.of(context).colorScheme.primary,
                //       //             // color: Colors.deepPurple,
                //       //             letterSpacing: 1,
                //       //           ),
                //       //     ),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // );
              }),
            ],
          ),
          drawer: Drawer(
            child: drawerItems,
          ),
        ),
      ),
    );
  }

  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: const Text("mProve Med's"),
  //       elevation: 1.0,
  //     ),
  //     body: Stack(
  //       children: [
  //         Center(
  //           child: ListView(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                     top: 75.0, left: 15.0, bottom: 8.0, right: 8.0),
  //                 child: Text(
  //                   Greet(name),
  //                   style: TextStyle(
  // fontFamily: 'SourGummy',
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.deepPurple,
  //                     fontSize: 25.0,
  //                   ),
  //                 ),
  //               ),
  //               if (!agreed) buildSignInCard(context), // Display Sign-in card only if not agreed
  //               buildAppDescriptionCard(),
  //               buildPredictionMethodCards(context), // Consolidated card for prediction methods
  //             ],
  //           ),
  //         ),
  //         Builder(builder: (context) {
  //           return Padding(
  //             padding: const EdgeInsets.only(top: 25.0, left: 10.0),
  //             child: Row(
  //               children: [
  //                 Card(
  //                   child: IconButton(
  //                       onPressed: () => Scaffold.of(context).openDrawer(),
  //                       icon: const Icon(Icons.menu)),
  //                 ),
  //                 const SizedBox(
  //                   width: 8.0,
  //                 ),
  //                 const Card(
  //                   child: Padding(
  //                     padding: EdgeInsets.symmetric(
  //                         vertical: 10.0, horizontal: 20.0),
  //                     child: Text(
  //                       "mProv Med's",
  //                       style: TextStyle(
  // fontFamily: 'SourGummy',
  //                         fontSize: 22.0,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.deepPurple,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }),
  //       ],
  //     ),
  //     drawer: Drawer(
  //       child: drawerItems, // Assuming drawerItems is built elsewhere
  //     ),
  //   );
  // }
  //
  // Widget buildAppDescriptionCard() {
  //   return Card(
  //     margin: const EdgeInsets.all(15.0),
  //     color: Colors.deepPurple[300],
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
  //           alignment: Alignment.topLeft,
  //           child: const Center(
  //             child: Text(
  //               'Our App is a Machine Learning-Based Application, having a well-Trained Model to Predict 41 Distinct Diseases based on the input of 132 Symptoms with about 5,000 combinations. We gained an Accuracy of About 93.44% by the Voting Classifier M.L.Ensemble Model - of Support Vector Machine, K-Nearest Neighbors, Random Forest Classifier.',
  //               softWrap: true,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(
  // fontFamily: 'SourGummy',
  //                 fontSize: 16.5,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     OutlinedButton(
  //                       style: OutlinedButton.styleFrom(
  //                           backgroundColor: Colors.white,
  //                           foregroundColor: Colors.deepPurple[900]),
  //                       onPressed: () {
  //                         // Handle "Learn More" button action (e.g., navigate to a separate page)
  //                       },
  //                       child: const Text("Learn More"),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget buildPredictionMethodCards(BuildContext context) {
  //   return Card(
  //     margin: const EdgeInsets.all(15.0),
  //     color: Colors.deepPurple[300],
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
  //           alignment: Alignment.topLeft,
  //           child: const Center(
  //             child: Text(
  //               'Throughout the App, You can make the list of Symptoms to be predicted by over 3 methods with smooth Symptoms storing, which can be seen on the bottom of each page - Draggable Column. Also, You can also remove all the Symptoms if any one of them is wrongly added. There is no need to check if any symptom is submitted more than once, as it will be counted Only Once in the Prediction Server.',
  //               softWrap: true,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(
  // fontFamily: 'SourGummy',
  //                 fontSize: 20.0,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     GestureDetector(
  //                       child: SizedBox(
  //                         width: 275.0,
  //                         height: 80.0,
  //                         child: Card(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Predict by Searching the Symptoms",
  //                               style: const TextStyle(
  //                                   color: Colors.deepPurple,
  //                                   fontWeight: FontWeight.bold),
  //                               textAlign: TextAlign.center,
  //                               softWrap: true,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       onTap: () => Navigator.push(
  //                           context, MaterialPageRoute(builder: (context) => const Searchable())),
  //                     ),
  //                     GestureDetector(
  //                       child: SizedBox(
  //                         width: 275.0,
  //                         height: 80.0,
  //                         child: Card(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Predict by List Symptoms.(Recommended)",
  //                               style: const TextStyle(
  //                                   color: Colors.deepPurple,
  //                                   fontWeight: FontWeight.bold),
  //                               textAlign: TextAlign.center,
  //                               softWrap: true,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       onTap: () => Navigator.push(
  //                           context, MaterialPageRoute(builder: (context) => const DropDown())),
  //                     ),
  //                     GestureDetector(
  //                       child: SizedBox(
  //                         width: 275.0,
  //                         height: 80.0,
  //                         child: Card(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Predict by Add one Symptoms at a time.(Professional)",
  //                               style: const TextStyle(
  //                                   color: Colors.deepPurple,
  //                                   fontWeight: FontWeight.bold),
  //                               textAlign: TextAlign.center,
  //                               softWrap: true,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       onTap: () => Navigator.push(
  //                           context, MaterialPageRoute(builder: (context) => const DropDownSingle())),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  //
  // Widget buildSignInCard(BuildContext context) {
  //   return Card(
  //     margin: const EdgeInsets.all(15.0),
  //     color: Colors.deepPurple[300],
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
  //           alignment: Alignment.topLeft,
  //           child: const Center(
  //             child: Text(
  //               'By Signing-In, You can manage and access your previous Prediction Results in App Database.',
  //               softWrap: true,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(
  // fontFamily: 'SourGummy',
  //                 fontSize: 16.5,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     OutlinedButton(
  //                       style: OutlinedButton.styleFrom(
  //                           backgroundColor: Colors.white,
  //                           foregroundColor: Colors.deepPurple[900]),
  //                       onPressed: () => Navigator.pop(context), // Close the dialog
  //                       child: const Text("Cancel"),
  //                     ),
  //                     const SizedBox(
  //                       width: 25.0,
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         // Handle Sign-in logic (e.g., navigate to Sign-in page)
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(builder: (context) => const REGISTER()), // Assuming SignInDetails is for Sign-in
  //                         );
  //                       },
  //                       child: const Text("Sign-In"),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  GestureDetector GestureForRouting(
      BuildContext context, String Message, dynamic Router) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 275.0,
          height: 80.0,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                Message,
                style: const TextStyle(
                  fontFamily: 'SourGummy',
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        symptom1;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Router),
        );
      },
    );
  }
}

class EachFeature extends StatelessWidget {
  const EachFeature({
    super.key,
    required this.textToDisplay,
  });
  final String textToDisplay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.50, bottom: 2.50),
      child: Card(
        elevation: 5.0,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 17.50,
              horizontal: 10.0,
            ),
            child: SingleChildScrollView(
              child: Text(
                textToDisplay,
                softWrap: true,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 1,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollableCard extends StatelessWidget {
  const ScrollableCard({super.key, required this.textToDisplay});
  final String textToDisplay;

  @override
  Widget build(BuildContext context) {
    ScrollController Sc = ScrollController();
    return Card(
      elevation: 10.0,
      margin: const EdgeInsets.only(left: 7.5, right: 7.5, bottom: 15.0),
      color: Theme.of(context).colorScheme.primary,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).width * 0.75,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.00),
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 5,
              interactive: true,
              controller: Sc,
              radius: const Radius.circular(5.0),
              child: ListView(
                controller: Sc,
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 7.5),
                    child: Text(
                      textToDisplay,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'SourGummy',
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onPrimary,
                            letterSpacing: 1.5,
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .fontSize! *
                                1.15,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
