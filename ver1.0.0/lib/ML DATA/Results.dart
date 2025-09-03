import 'dart:async';
import 'dart:convert';
import 'package:diseases/Home_Screen.dart';
import 'package:diseases/ML%20DATA/consulting.dart';
import 'package:diseases/ML%20DATA/drop_single_entry.dart';
import 'package:diseases/ML%20DATA/search.dart';
import 'package:diseases/Sign-in/Setting_history.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:diseases/ML DATA/ml.dart';
import 'package:flutter/services.dart';

import '../main.dart';

String strtolist(sendstr) {
  var s = sendstr[0].toString().replaceAll(" ", "_");
  for (int a = 1; a < sendstr.length(); a++) {
    s += ",${sendstr[a]}";
    print(s);
  }
  return s;
}

class RequestAndDisplay extends StatefulWidget {
  Future<Future<String>> _loadText() async {
    await Future.delayed(const Duration(seconds: 3));
    return rootBundle.loadString(decode['output']);
  }

  const RequestAndDisplay({super.key});

  @override
  State<RequestAndDisplay> createState() => _RequestAndDisplayState();
}

class _RequestAndDisplayState extends State<RequestAndDisplay> {
  String sendd = "";
  _RequestAndDisplayState();

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        // onWillPop: () async {
        //   Timer(const Duration(microseconds: 1), () {
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) => AlertDialog(
        //         backgroundColor: Theme.of(context).colorScheme.secondary,
        //         title: const Text('Trying...Still Loading...'),
        // title: Text(
        //   'Back to Home Page...?',
        //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //         fontFamily: 'SourGummy',
        //         letterSpacing: 1,
        //         fontWeight: FontWeight.w600,
        //         color: Theme.of(context).colorScheme.onPrimary,
        //         color: Colors.deepPurple,
        // ),
        // ),
        // content: Text(
        //   'Are you Sure You Want to go back to Home Page?',
        //   textAlign: TextAlign.justify,
        //   style: Theme.of(context).textTheme.labelMedium?.copyWith(
        //         fontFamily: 'SourGummy',
        //         letterSpacing: 1,
        //         fontWeight: FontWeight.w600,
        //         color: Theme.of(context).colorScheme.onPrimary,
        //         color: Colors.deepPurple,
        // ),
        // ),
        // actions: [
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       TextButton(
        //         onPressed: () => {
        //           Navigator.pop(context),
        //         },
        //         child: Text(
        //           "Cancel",
        //           style: Theme.of(context)
        //               .textTheme
        //               .titleMedium
        //               ?.copyWith(
        //                 fontFamily: 'SourGummy',
        //                 letterSpacing: 1,
        //                 fontWeight: FontWeight.w600,
        //                 color: Theme.of(context).colorScheme.onPrimary,
        //                 color: Colors.deepPurple,
        // ),
        // ),
        // ),
        // Expanded(
        //   child: Container(),
        // ),
        // ElevatedButton(
        //   onPressed: () async {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => const MyHomePage()),
        //     );
        //   },
        //   clipBehavior: Clip.antiAlias,
        //   child: Text(
        //     "Yes",
        //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //           fontFamily: 'SourGummy',
        //           letterSpacing: 1,
        //           fontWeight: FontWeight.bold,
        //           color: Theme.of(context).colorScheme.primary,
        //           color: Colors.deepPurple,
        // ),
        // ),
        // ),
        // ],
        // ),
        // ],
        // ),
        // );
        // });
        // Future.delayed(const Duration(seconds: 1));
        // return false;
        //   //   colorselection = "B";
        //   //   Navigator.pushReplacement(
        //   //     context,
        //   //     MaterialPageRoute(
        //   //       builder: (context) => const MyApp(),
        //   //     ),
        //   //   );
        //   Future.delayed(
        //     const Duration(seconds: 2),
        //     () {
        //       if (kDebugMode) {
        //         print("abc");
        //       }
        //       return true;
        //     },
        //   );
        // },
        // child:
        WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        Timer(
          const Duration(microseconds: 1),
          () {
            debugPrint("Timed Tapped");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          },
        );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   automaticallyImplyLeading: false,
          //   actions: [
          //     IconButton(
          //       onPressed: () async {
          //         var s = submittingList[0].replaceAll(" ", "_").toLowerCase();
          //         for (int a = 1; a < 96; a++) {
          //           if (submittingList[a] != "np") {
          //             var synt = submittingList[a];
          //             synt = synt.replaceAll(" ", "_").toLowerCase();
          //             s += ",$synt";
          //           }
          //         }
          //         print(s);
          //         try {
          //           data = await fetch(
          //               'https://tusharmistry.pythonanywhere.com/apps?input=$s');
          //           // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
          //           if (kDebugMode) {
          //             print(data);
          //           }
          //           dynamic decoded = jsonDecode(data);
          //           // print(Symptom+decoded);
          //           output = decoded['output'];
          //
          //           // output = decoded['output'];
          //           // for (int j = 0; j < 6; j++) {
          //           each_output = output.split(",");
          //           // }
          //           var h = submittingList[0];
          //           for (int v = 1; v < submittingList.length; v++) {
          //             if (submittingList[v] != 'np') {
          //               h += ",\n${submittingList[v]}";
          //             }
          //           }
          //           var o = each_output[0];
          //           for (int vv = 1; vv < each_output.length; vv++) {
          //             if (each_output[vv] != 'np') {
          //               o += ",\n${each_output[vv]}";
          //             }
          //           }
          //           print(o);
          //           histentry.add(manageList(h, output));
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const RequestAndDisplay()),
          //           );
          //
          //           submittingList = List.filled(96, "np");
          //         } catch (e) {
          //           showDialog(
          //             context: context,
          //             builder: (BuildContext context) => AlertDialog(
          //               title: const Text('Trying...Still Loading...'),
          //               content: const Text(
          //                   'We are under process to make this faster, but it\'s taking too much time for your device.\n\nFor now, \n\n📶  Try to turning OFF WiFi,\n⏳  Wait for some time, Our Server might be running its Down time.'),
          //               actions: [
          //                 ButtonBar(
          //                   children: <Widget>[
          //                     TextButton(
          //                       onPressed: () => Navigator.pop(context),
          //                       child: const Text('OK'),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           );
          //         }
          //       },
          //       icon: const Icon(Icons.refresh),
          //     ),
          //   ],
          //   title: const Text('Predicted Diseases'),
          //   elevation: 4.0,
          //   centerTitle: true,
          // ),
          body: Stack(
            children: [
              const GradientBackGround(),
              // Column(
              //   children: [
              //     const Padding(padding: EdgeInsets.only(top: 75.0)),
              // const SizedBox(
              //   height: 12.5,
              // ),
              // Card(
              //   elevation: 5.0,
              //   shadowColor: Colors.deepPurpleAccent,
              //   margin: const EdgeInsets.symmetric(horizontal: 15.0),
              //   color: Colors.deepPurple[300],
              //   child: const Padding(
              //     padding: EdgeInsets.all(12.0),
              //     child: Center(
              //       child: Text(
              //         style: TextStyle(
              //           fontSize: 15.0,
              //           color: Colors.white,
              //         ),
              //         textAlign: TextAlign.justify,
              //         "Displaying the Results based of the Default Sorting Order as highest Probability first and lowest chances disease at Last",
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 12.5,
              // ),
              // const Divider(),
              // const SizedBox(
              //   height: 12.5,
              // ),
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: SizedBox(
                  // height: 300.0,
                  height: MediaQuery.of(context).size.height, //- 285.0,
                  child: Card(
                    elevation: 2.9,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: each_output.length + 2,
                      itemBuilder: (context, idx) {
                        if (idx == 0) {
                          return Card(
                            elevation: 5.0,
                            // shadowColor: Colors.deepPurpleAccent,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            color: Theme.of(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Here are the Results based of the Default Sorting Order as highest Probability first and lowest chances disease at Last.",
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            fontFamily: 'SourGummy',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            letterSpacing: 1,
                                          ),
                                    ),
                                    Divider(
                                      thickness: 2.5,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                    // Text(
                                    //   "<<< Swipe Each for More >>>",
                                    //   textAlign: TextAlign.center,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .labelSmall
                                    //       ?.copyWith(
                                    //         fontFamily: 'SourGummy',
                                    //         fontWeight: FontWeight.w900,
                                    //         color: Theme.of(context)
                                    //             .colorScheme
                                    //             .onPrimary,
                                    //         letterSpacing: 1,
                                    //       ),
                                    // ),
                                    // Card(
                                    //   child: ExpansionTile(
                                    //     title: Text(
                                    //         "${idx}  ${each_output[idx]}"),
                                    //     trailing:
                                    //         Icon(Icons.keyboard_arrow_down),
                                    //     children: [
                                    //       Align(
                                    //         alignment: Alignment.centerLeft,
                                    //         child: ElevatedButton(
                                    //           onPressed: () {},
                                    //           child: const Text(
                                    //               "Consult a Doctors"),
                                    //         ),
                                    //       ),
                                    //       Align(
                                    //         alignment: Alignment.centerLeft,
                                    //         child: ElevatedButton(
                                    //             onPressed: () {},
                                    //             child: const Text(
                                    //                 "View Remedies and Medicines")),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Card(
                                    //   child: ExpansionTile(
                                    //     title: Text(
                                    //         "${idx + 1}  ${each_output[idx + 1]}"),
                                    //     trailing:
                                    //         Icon(Icons.keyboard_arrow_down),
                                    //     children: [
                                    //       Align(
                                    //         alignment: Alignment.centerLeft,
                                    //         child: ElevatedButton(
                                    //           onPressed: () {},
                                    //           child: const Text(
                                    //               "Consult a Doctors"),
                                    //         ),
                                    //       ),
                                    //       Align(
                                    //         alignment: Alignment.centerLeft,
                                    //         child: ElevatedButton(
                                    //             onPressed: () {},
                                    //             child: const Text(
                                    //                 "View Remedies and Medicines")),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (idx == each_output.length + 1) {
                          return SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05);
                        } else {
                          return
                              //   Padding(
                              //   padding: const EdgeInsets.fromLTRB(
                              //     7.0,
                              //     1.5,
                              //     7.0,
                              //     1.5,
                              //   ),
                              //   child: Slidable(
                              //     startActionPane: ActionPane(
                              //       motion: BehindMotion(),
                              //       extentRatio: 0.4,
                              //       children: [
                              //         FilledButton(
                              //           // style: ButtonStyle(
                              //           //     backgroundColor: Theme.of(context)
                              //           //         .colorScheme
                              //           //         .primary),
                              //           style: ButtonStyle(
                              //             backgroundColor: MaterialStateProperty
                              //                 .resolveWith<Color?>(
                              //               (Set<MaterialState> states) {
                              //                 if (states.contains(
                              //                     MaterialState.pressed)) {
                              //                   return Theme.of(context)
                              //                       .colorScheme
                              //                       .primary
                              //                       .withOpacity(0.5);
                              //                 }
                              //                 return Theme.of(context)
                              //                     .colorScheme
                              //                     .primary; // Use the component's default.
                              //               },
                              //             ),
                              //           ),
                              //           onPressed: () async {
                              //             //TODO: request for  Remedy as onPressed content: modified as function is not awaited
                              //             //
                              //             disease = each_output[idx - 1];
                              //             data = await fetch(
                              //                 'https://tusharmistry.pythonanywhere.com/predicted-is-$disease-and-get-remedy');
                              //             // data = await fetch(
                              //             //     'https://tusharmistry.pythonanywhere.com/get/api_tushar_mistry/RemedyandDoctor?=$dis');
                              //             // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
                              //             if (kDebugMode) {
                              //               print(data);
                              //             }
                              //             dynamic decoded = jsonDecode(data);
                              //             output = decoded['remedy'];
                              //             var splitting = output.split(":split:");
                              //             print(
                              //                 "Length of splitting: ${splitting.length}");
                              //             print(
                              //                 "Length of display: ${remdisplay.length}");
                              //             for (int inttt = 0;
                              //                 inttt <= remdisplay.length - 1;
                              //                 inttt++) {
                              //               remdisplay[inttt] = splitting[inttt];
                              //               print(remdisplay[inttt]);
                              //             }
                              //
                              //             // setState(() {
                              //             //   reqformeds(disease);
                              //             print("Done");
                              //             //   reqmeds = !reqmeds;
                              //             // });
                              //             Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     const Medicine(),
                              //               ),
                              //             );
                              //           },
                              //           child: Text(
                              //             "Refer Remedies",
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .labelSmall
                              //                 ?.copyWith(
                              //                   fontFamily: 'SourGummy',
                              //                   letterSpacing: 1,
                              //                   fontWeight: FontWeight.w600,
                              //                   color: Theme.of(context)
                              //                       .colorScheme
                              //                       .onPrimary,
                              //                   // color: Colors.deepPurple,
                              //                 ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     endActionPane: ActionPane(
                              //       motion: const BehindMotion(),
                              //       extentRatio: 0.35,
                              //       children: [
                              //         FilledButton(
                              //           onPressed: () async {
                              //             disease = each_output[idx - 1];
                              //             //TODO: request for Doctors as onPressed content: modified as function is not awaited
                              //             //
                              //             disease = each_output[idx - 1];
                              //             data = await fetch(
                              //                 'https://tusharmistry.pythonanywhere.com/predicted-is-$disease-and-get-doctors');
                              //             // data = await fetch(
                              //             //     'https://tusharmistry.pythonanywhere.com/get/api_tushar_mistry/RemedyandDoctor?=$dis');
                              //             // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
                              //             if (kDebugMode) {
                              //               print(data);
                              //             }
                              //             dynamic decoded = jsonDecode(data);
                              //             output = decoded['doctors'];
                              //             var splitting = output.split(":split:");
                              //             print(
                              //                 "Length of splitting: ${splitting.length}");
                              //             print(
                              //                 "Length of display: ${docdisplay.length}");
                              //             for (int inttt = 0;
                              //                 inttt <= docdisplay.length - 1;
                              //                 inttt++) {
                              //               (inttt >= splitting.length)
                              //                   ? docdisplay[inttt] =
                              //                       docdisplay[inttt]
                              //                   : docdisplay[inttt] =
                              //                       splitting[inttt];
                              //               print(docdisplay[inttt]);
                              //             }
                              //             Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     const Doctor(),
                              //               ),
                              //             );
                              //           },
                              //           child: Text(
                              //             "View Doctors",
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .labelSmall
                              //                 ?.copyWith(
                              //                   fontFamily: 'SourGummy',
                              //                   letterSpacing: 1,
                              //                   fontWeight: FontWeight.w600,
                              //                   color: Theme.of(context)
                              //                       .colorScheme
                              //                       .onPrimary,
                              //                   // color: Colors.deepPurple,
                              //                 ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     child: Card(
                              //       color: Theme.of(context).colorScheme.primary,
                              //       child: ListTile(
                              //         // isThreeLine: true,
                              //         leading: Text(
                              //           "${idx}",
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleMedium
                              //               ?.copyWith(
                              //                 fontFamily: 'SourGummy',
                              //                 letterSpacing: 1,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Theme.of(context)
                              //                     .colorScheme
                              //                     .onPrimary,
                              //                 // color: Colors.deepPurple,
                              //               ),
                              //         ),
                              //         title: Text(
                              //           each_output[idx - 1],
                              //           softWrap: true,
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleMedium
                              //               ?.copyWith(
                              //                 fontFamily: 'SourGummy',
                              //                 letterSpacing: 1,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Theme.of(context)
                              //                     .colorScheme
                              //                     .onPrimary,
                              //                 // color: Colors.deepPurple,
                              //               ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                            padding: const EdgeInsets.fromLTRB(
                              7.0,
                              1.5,
                              7.0,
                              1.5,
                            ),
                            child: Card(
                              elevation: 5.0,
                              color: Theme.of(context).colorScheme.primary,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 8.0, 15.0, 8.0),
                                child: ExpansionTile(
                                  trailing: Icon(
                                    Icons.keyboard_arrow_down,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  leading: Text(
                                    "${idx}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontFamily: 'SourGummy',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          // color: Colors.deepPurple,
                                        ),
                                  ),
                                  title: Text(
                                    each_output[idx - 1],
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontFamily: 'SourGummy',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          // color: Colors.deepPurple,
                                        ),
                                  ),
                                  children: [
                                    Divider(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      thickness: 2.5,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      // alignment: WrapAlignment.spaceAround,
                                      // crossAxisAlignment:
                                      //     WrapCrossAlignment.start,
                                      children: [
                                        GestureDetector(
                                          // style: ButtonStyle(
                                          //     backgroundColor: Theme.of(context)
                                          //         .colorScheme
                                          //         .primary),
                                          // style: ButtonStyle(
                                          //   backgroundColor: MaterialStateProperty
                                          //       .resolveWith<Color?>(
                                          //     (Set<MaterialState> states) {
                                          //       if (states.contains(
                                          //           MaterialState.pressed)) {
                                          //         return Theme.of(context)
                                          //             .colorScheme
                                          //             .primary
                                          //             .withOpacity(0.5);
                                          //       }
                                          //       return Theme.of(context)
                                          //           .colorScheme
                                          //           .primary; // Use the component's default.
                                          //     },
                                          //   ),
                                          // ),
                                          onTap: () async {
                                            //TODO: request for  Remedy as onPressed content: modified as function is not awaited
                                            //
                                            disease = each_output[idx - 1];
                                            data = await fetch(
                                                'https://tusharmistry.pythonanywhere.com/predicted-is-$disease-and-get-remedy');
                                            // data = await fetch(
                                            //     'https://tusharmistry.pythonanywhere.com/get/api_tushar_mistry/RemedyandDoctor?=$dis');
                                            // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
                                            if (kDebugMode) {
                                              print(data);
                                            }
                                            dynamic decoded = jsonDecode(data);
                                            output = decoded['remedy'];
                                            var splitting =
                                                output.split(":split:");
                                            print(
                                                "Length of splitting: ${splitting.length}");
                                            print(
                                                "Length of display: ${remdisplay.length}");
                                            for (int inttt = 0;
                                                inttt <= remdisplay.length - 1;
                                                inttt++) {
                                              remdisplay[inttt] =
                                                  splitting[inttt];
                                              print(remdisplay[inttt]);
                                            }

                                            // setState(() {
                                            //   reqformeds(disease);
                                            print("Done");
                                            //   reqmeds = !reqmeds;
                                            // });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Medicine(),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            elevation: 5.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 12.50,
                                                horizontal: 17.50,
                                              ),
                                              child: Text(
                                                "Refer Remedies",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                      fontFamily: 'SourGummy',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      // color: Colors.deepPurple,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            disease = each_output[idx - 1];
                                            //TODO: request for Doctors as onPressed content: modified as function is not awaited
                                            //
                                            disease = each_output[idx - 1];
                                            data = await fetch(
                                                'https://tusharmistry.pythonanywhere.com/predicted-is-$disease-and-get-doctors');
                                            // data = await fetch(
                                            //     'https://tusharmistry.pythonanywhere.com/get/api_tushar_mistry/RemedyandDoctor?=$dis');
                                            // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
                                            if (kDebugMode) {
                                              print(data);
                                            }
                                            dynamic decoded = jsonDecode(data);
                                            output = decoded['doctors'];
                                            var splitting =
                                                output.split(":split:");
                                            print(
                                                "Length of splitting: ${splitting.length}");
                                            print(
                                                "Length of display: ${docdisplay.length}");
                                            for (int inttt = 0;
                                                inttt <= docdisplay.length - 1;
                                                inttt++) {
                                              (inttt >= splitting.length)
                                                  ? docdisplay[inttt] =
                                                      docdisplay[inttt]
                                                  : docdisplay[inttt] =
                                                      splitting[inttt];
                                              print(docdisplay[inttt]);
                                            }
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Doctor(),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            elevation: 5.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 12.50,
                                                horizontal: 17.50,
                                              ),
                                              child: Text(
                                                "View Doctors",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                      fontFamily: 'SourGummy',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      // color: Colors.deepPurple,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 60.0,
              //   // child: TextButton(
              //   //   onPressed: () async {
              //   // showDialog(
              //   //   context: context,
              //   //   builder: (BuildContext context) {
              //   //     if (each_output[0]==""){
              //   //       return const Dialog(
              //   //         child: Padding(
              //   //           padding: EdgeInsets.all(20.0),
              //   //           child: Column(
              //   //             mainAxisSize: MainAxisSize.min,
              //   //             children: [
              //   //               CircularProgressIndicator(),
              //   //               SizedBox(height: 10),
              //   //               Text('Fetching data...'),
              //   //             ],
              //   //           ),
              //   //         ),
              //   //       );
              //   //     }
              //   //     else{
              //   //       return Navigator.pop(context, 'Cancel');
              //   //     }
              //   //   },
              //   // );
              //
              //   // var s = submittingList[0].replaceAll(" ", "_").toLowerCase();
              //   // for (int a = 1; a < 96; a++) {
              //   //   if (submittingList[a] != "None"|| submittingList[a] != "symptom") {
              //   //     var synt = submittingList[a];
              //   //     synt = synt.replaceAll(" ", "_").toLowerCase();
              //   //     s += ",$synt";
              //   //   }
              //   // }
              //   // print(s);
              //   // data = await fetch('https://tusharmistry.pythonanywhere.com/apps?input=$s');
              //   // // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
              //   // if (kDebugMode) {
              //   //   print(data);
              //   // }
              //   // dynamic decoded = jsonDecode(data);
              //   // print(Symptom+decoded);
              //   // setState(()  {
              //   //   output = decoded['output'];
              //   //   // output = decoded['output'];
              //   //   for (int j = 0; j < 6; j++) {
              //   //     each_output = output.split(",");
              //   //   }
              //   // });
              //   //     },
              //   //     child: const Text(
              //   //       'If encountered any Error... You can Refresh the Prediction',
              //   //       style: TextStyle(fontSize: 20),
              //   //     ),
              //   //   ),
              // ),
              // ],
              // ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                  child: Row(
                    children: [
                      Card(
                        elevation: 5.0,
                        child: SizedBox(
                          height: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()),
                              );
                            },
                            // borderRadius: BorderRadius.circular(25),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Icon(
                                  Icons.home,
                                  size: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.fontSize,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Card(
                        elevation: 5.0,
                        child: SizedBox(
                          height: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Center(
                              child: Text(
                                "Predicted Diseases",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      // color: Colors.deepPurple,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
