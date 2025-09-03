import 'dart:async';
import 'dart:io';

import 'package:diseases/Home_Screen.dart';
import 'package:diseases/ML%20DATA/drop_down.dart';
import 'package:diseases/Sign-in/details.dart';
import 'package:diseases/Sign-in/doctor_symptom.dart';
import 'package:flutter/material.dart';
import 'package:diseases/main.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import '../ML DATA/ml.dart';
import 'Setting_history.dart';
// import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Display extends StatefulWidget {
  const Display({super.key, required this.title});
  final String title;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  bool loadx = false;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        milliseconds: 1750,
      ),
      () async {
        setState(() {
          loadx = true;
        });
      },
    );
  }

  void deleteAccount() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        // title: const Text('Trying...Still Loading...'),
        title: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delete This Account?",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontFamily: 'SourGummy',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                      // color: Colors.deepPurple,
                    ),
              ),
            ),
            Divider(
              thickness: 2.75,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
        content: Text(
          'This Will Permanently Delete Your Account and All your Data Stored in this App.\n\nDo You Want To Delete Account?',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontFamily: 'SourGummy',
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondary,
                // color: Colors.deepPurple,
              ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Text(
                  "No",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSecondary,
                        // color: Colors.deepPurple,
                      ),
                ),
              ),
              // Expanded(
              //   child: Container(),
              // ),
              ElevatedButton(
                onPressed: () async {
                  var logout = await Hive.openBox("information");
                  setState(() {
                    logout.deleteFromDisk();
                    print(logout);
                    print("yes deleted");
                    // fullname = "";
                    // name = "";
                    // name1 = "";
                    // name2 = "";
                    // mail = "";
                    // age = "";
                    // gender = "";
                    // dob = "";
                    // mobile = "";
                    // agreed = false;
                    // isdoctor = false;
                    // dateSign = "";
                    // docsymp = List.filled(allsymptoms.length, "__D__");
                    // historyListDatabase.clear();
                    // await main();
                    print("All reset");
                  });
                  SystemNavigator.pop();
                  main();


                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaterialApp(
                        title: 'mProve Med\'s',
                        theme: ThemeData(
                          colorScheme:
                              ColorScheme.fromSeed(seedColor: Colors.indigo),
                          useMaterial3: true,
                        ).copyWith(
                          pageTransitionsTheme: const PageTransitionsTheme(
                            builders: <TargetPlatform, PageTransitionsBuilder>{
                              TargetPlatform.android:
                                  ZoomPageTransitionsBuilder(),
                            },
                          ),
                        ),
                        home: const IntroSplash(),
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                clipBehavior: Clip.antiAlias,
                child: Text(
                  "Yes, Delete",
                  // Sign-In "",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.error,
                        // color: Colors.deepPurple,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeader = buildingUserAccountsDrawerHeader(context);
    final drawerItems = buildingListView(drawerHeader, context);
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
          drawer: Drawer(
            child: drawerItems,
          ),
          // appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          // backgroundColor: Colors.deepPurple,
          // foregroundColor: Colors.white,
          // toolbarHeight: 100.0,
          // title: Text("$fullname\n$mail")
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          // ),
          body: Stack(
            children: [
              const GradientBackGround(),
              Card(
                margin: bodyCardMargin,
                // color: Theme.of(context).colorScheme.secondary,
                // margin: EdgeInsets.only(
                //     top: 100.0, left: 2.5, right: 2.5, bottom: 5.0),
                child: ListView(
                  // padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.0, bottom: 5.0),
                          child: Text(
                            "Predictions",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontFamily: 'SourGummy',
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: 5.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      // color: Colors.deepPurple,
                      child: Card(
                        elevation: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            // leading: Icon(
                            //   Icons.history,
                            //   color: Theme.of(context).colorScheme.onPrimary,
                            // ),
                            // title: const Text(
                            //   "Predictions",
                            //   textAlign: TextAlign.left,
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 25.0,
                            //   ),
                            // ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.history,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    "Prediction History",
                                    // "View Your Previously Predicted Disease",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontFamily: 'SourGummy',
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          letterSpacing: 1.5,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            // Text(
                            //   "  Prediction History",
                            //   // "View Your Previously Predicted Disease",
                            //   textAlign: TextAlign.left,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .titleMedium
                            //       ?.copyWith(
                            //         fontFamily: 'SourGummy',
                            //         fontWeight: FontWeight.w900,
                            //         color:
                            //             Theme.of(context).colorScheme.onPrimary,
                            //         letterSpacing: 1.5,
                            //       ),
                            // ),
                            // isThreeLine: true,
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios,
                            //   color: Theme.of(context).colorScheme.onPrimary,
                            // ),
                            onTap: () {
                              print(historyListDatabase.length);
                              print(historyListDatabase);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsHistory(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    (isdoctor)
                        ? Container(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            // color: Colors.deepPurple,
                            child: Card(
                              elevation: 5.0,
                              color: Theme.of(context).colorScheme.primary,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  // leading: Icon(
                                  //   Icons.view_list,
                                  //   color:
                                  //       Theme.of(context).colorScheme.onPrimary,
                                  // ),
                                  // title: const Text(
                                  //   "Predictions",
                                  //   textAlign: TextAlign.left,
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 25.0,
                                  //   ),
                                  // ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.view_list,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          "Specialised Diseases",
                                          // "View Your Previously Predicted Disease",
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                fontWeight: FontWeight.w900,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                                letterSpacing: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // isThreeLine: true,
                                  // trailing: Icon(
                                  //   Icons.arrow_forward_ios,
                                  //   color: Theme.of(context).colorScheme.onPrimary,
                                  // ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailsSympDoctor(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 12.50,
                    ),
                    // const Divider(
                    //   indent: 20,
                    //   endIndent: 20,
                    //   thickness: 2.5,
                    // ),
                    // const SizedBox(
                    //   height: 20.0,
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "Account Details",
                            // "Your Account Details",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontFamily: 'SourGummy',
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: 5.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        (!loadx)
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: 55.0, bottom: 55.0),
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      "Loading...",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontFamily: 'SourGummy',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            letterSpacing: 1.5,
                                          ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 0.0),
                                // height: MediaQuery.sizeOf(context).width *
                                //     1.3500, //1.3125,
                                // color: Colors.deepPurple,
                                child: Card(
                                  elevation: 5.0,
                                  color: Theme.of(context).colorScheme.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.50),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              "Name :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              // Hive.openBox("information").get("fname"),
                                              fullname,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            trailing: Icon(
                                              Icons.edit,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 10.0,
                                          thickness: 1.75,
                                          endIndent: 10.0,
                                        ),
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              (mail.length > 1)
                                                  ? "Mail-Id  : ${mail.substring(mail.indexOf("@") + 1, mail.indexOf(".")).toUpperCase()}"
                                                  : "Something went Wrong",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              (mail.length > 1)
                                                  ? mail.substring(
                                                      0, mail.indexOf("@"))
                                                  : "Something went Wrong",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            trailing: Icon(
                                              Icons.edit,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 10.0,
                                          thickness: 1.75,
                                          endIndent: 10.0,
                                        ),
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              "Phone Number :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              mobile,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            trailing: Icon(
                                              Icons.edit,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 10.0,
                                          thickness: 1.75,
                                          endIndent: 10.0,
                                        ),
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              "Date of Birth :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              dob,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            trailing: Icon(
                                              Icons.edit,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 10.0,
                                          thickness: 1.75,
                                          endIndent: 10.0,
                                        ),
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              "Age and Gender :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              "$age $gender",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            trailing: Icon(
                                              Icons.edit,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 10.0,
                                          thickness: 1.75,
                                          endIndent: 10.0,
                                        ),
                                        SizedBox(
                                          // width: double.infinity,
                                          child: ListTile(
                                            title: Text(
                                              "Logged - In Since:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              dateSign,
                                              // (DateTime.now().hour > 12)
                                              //     ? "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ${DateTime.now().hour - 12} : ${DateTime.now().minute} PM"
                                              //     : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ${DateTime.now().hour} : ${DateTime.now().minute} AM",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 1.5,
                                                  ),
                                            ),
                                            // trailing: const Icon(
                                            //   Icons.edit,
                                            //   size: 20.0,
                                            //   color: Colors.white,
                                            // ),
                                          ),
                                        ),
                                        // const Divider(
                                        //   indent: 10.0,
                                        //   thickness: 1.75,
                                        //   endIndent: 10.0,
                                        // ),
                                        // SizedBox(
                                        //   // width: double.infinity,
                                        //   child: Column(
                                        //     children: [
                                        //       (isdoctor)
                                        //           ? ListTile(
                                        //               title: Text(
                                        //                 "Specialised Diseases:",
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .titleMedium
                                        //                     ?.copyWith(
                                        //                       fontFamily:
                                        //                           'SourGummy',
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .w900,
                                        //                       color: Theme.of(
                                        //                               context)
                                        //                           .colorScheme
                                        //                           .onPrimary,
                                        //                       letterSpacing:
                                        //                           1.5,
                                        //                     ),
                                        //               ),
                                        //               trailing: Icon(
                                        //                 Icons.arrow_forward_ios,
                                        //                 color: Theme.of(context)
                                        //                     .colorScheme
                                        //                     .onPrimary,
                                        //               ),
                                        //               onTap: () {},
                                        //             )
                                        //           // trailing: Icon(Icons.edit),
                                        //           : const SizedBox(
                                        //               height: 0,
                                        //               width: 0,
                                        //             ),
                                        //     ],
                                        //   ),
                                        // ),
                                        //
                                        // SizedBox(width: double.infinity,
                                        //   child: ListView.builder(
                                        //       itemCount: 1,
                                        //       itemBuilder: (BuildContext context, int index) {
                                        //         if (isdoctor) {
                                        //           return ListTile(
                                        //               title: const Text(
                                        //                 "Specialised Diseases:",
                                        //                 style: TextStyle(
                                        //                   color: Colors.white,
                                        //                   fontSize: 20.0,
                                        //                   fontWeight: FontWeight.bold,
                                        //                 ),
                                        //               ),
                                        //               trailing: IconButton(
                                        //                   onPressed: () {
                                        //                     Navigator.push(
                                        //                       context,
                                        //                       MaterialPageRoute(
                                        //                           builder: (context) =>
                                        //                               const DetailsSympDoctor()),
                                        //                     );
                                        //                   },
                                        //                   icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,))
                                        //               // trailing: Icon(Icons.edit),
                                        //               );
                                        //         }
                                        //         return ListTile(
                                        //           title: const Text(
                                        //             "Date of Log-in on this Device :",
                                        //             style: TextStyle(
                                        //               color: Colors.white,
                                        //               fontWeight: FontWeight.bold,
                                        //             ),
                                        //           ),
                                        //           subtitle: Text(
                                        //             "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                                        //             style: const TextStyle(
                                        //               color: Colors.white,
                                        //               fontSize: 15.0,
                                        //               fontWeight: FontWeight.bold,
                                        //             ),
                                        //           ),
                                        //           trailing: const Icon(
                                        //             Icons.edit,
                                        //             size: 20.0,
                                        //             color: Colors.white,
                                        //           ),
                                        //         );
                                        //       },),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    // const Divider(
                    //   indent: 20,
                    //   endIndent: 20,
                    //   thickness: 2.5,
                    // ),
                    const SizedBox(
                      height: 12.50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "Account Actions",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontFamily: 'SourGummy',
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: 5.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        (!loadx)
                            ? const SpinKitDoubleBounce(
                                color: Colors.deepPurpleAccent,
                                size: 50.0,
                              )
                            // ? const Padding(
                            //     padding: EdgeInsets.only(top: 55.0,bottom: 55.0),
                            //     child: Column(
                            //       children: [
                            //         CircularProgressIndicator(),
                            //         SizedBox(
                            //           height: 15.0,
                            //         ),
                            //         Text(
                            //           "Loading...",
                            //           style: TextStyle(
                            //             color: Colors.deepPurple,
                            //             fontSize: 25.0,
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   )
                            : Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 0.0),
                                    // color: Colors.deepPurple,
                                    child: GestureDetector(
                                      onTap: deleteAccount,
                                      // onTap: () async {
                                      //   var logout =
                                      //       await Hive.openBox("information");
                                      //   setState(() {
                                      //     logout.deleteFromDisk();
                                      //     print(logout);
                                      //     print("yes deleted");
                                      //     fullname = "";
                                      //     name = "";
                                      //     name1 = "";
                                      //     name2 = "";
                                      //     mail = "";
                                      //     age = "";
                                      //     dob = "";
                                      //     mobile = "";
                                      //     agreed = false;
                                      //     dateSign = "";
                                      //     // await main();
                                      //   });
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => MaterialApp(
                                      //         title: 'mProve Med\'s',
                                      //         theme: ThemeData(
                                      //           colorScheme:
                                      //               ColorScheme.fromSeed(
                                      //                   seedColor:
                                      //                       Colors.indigo),
                                      //           useMaterial3: true,
                                      //         ).copyWith(
                                      //           pageTransitionsTheme:
                                      //               const PageTransitionsTheme(
                                      //             builders: <TargetPlatform,
                                      //                 PageTransitionsBuilder>{
                                      //               TargetPlatform.android:
                                      //                   ZoomPageTransitionsBuilder(),
                                      //             },
                                      //           ),
                                      //         ),
                                      //         home: const IntroSplash(),
                                      //       ),
                                      //     ),
                                      //   );
                                      //
                                      //   // runApp(
                                      //   //   MaterialApp(
                                      //   //     title: 'mProve Med\'s',
                                      //   //     theme: ThemeData(
                                      //   //       colorScheme:
                                      //   //           ColorScheme.fromSeed(
                                      //   //               seedColor:
                                      //   //                   Colors.indigo),
                                      //   //       useMaterial3: true,
                                      //   //     ).copyWith(
                                      //   //       pageTransitionsTheme:
                                      //   //           const PageTransitionsTheme(
                                      //   //         builders: <TargetPlatform,
                                      //   //             PageTransitionsBuilder>{
                                      //   //           TargetPlatform.android:
                                      //   //               ZoomPageTransitionsBuilder(),
                                      //   //         },
                                      //   //       ),
                                      //   //     ),
                                      //   //     home: const IntroSplash(),
                                      //   //   ),
                                      //   // );
                                      //
                                      //   // Navigator.push(
                                      //   //   context,
                                      //   //   MaterialPageRoute(
                                      //   //       builder: (context) =>
                                      //   //           const SettingsHistory()),
                                      //   // );
                                      // },
                                      child: Card(
                                        elevation: 5.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.logout,
                                              color: Colors.red[700],
                                            ),
                                            title: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                "Log-Out from this Device",
                                                textAlign: TextAlign.left,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontFamily: 'SourGummy',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                                      letterSpacing: 1.5,
                                                    ),
                                              ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                            onTap: deleteAccount,
                                            // onTap: () async {
                                            //   var logout = await Hive.openBox(
                                            //       "information");
                                            //   setState(() {
                                            //     logout.deleteFromDisk();
                                            //     print(logout);
                                            //     print("yes deleted");
                                            //     fullname = "";
                                            //     name = "";
                                            //     name1 = "";
                                            //     name2 = "";
                                            //     mail = "";
                                            //     age = "";
                                            //     dob = "";
                                            //     mobile = "";
                                            //     agreed = false;
                                            //     dateSign = "";
                                            //     // await main();
                                            //   });
                                            //   Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           MaterialApp(
                                            //         title: 'mProve Med\'s',
                                            //         theme: ThemeData(
                                            //           colorScheme:
                                            //               ColorScheme.fromSeed(
                                            //                   seedColor: Colors
                                            //                       .indigo),
                                            //           useMaterial3: true,
                                            //         ).copyWith(
                                            //           pageTransitionsTheme:
                                            //               const PageTransitionsTheme(
                                            //             builders: <TargetPlatform,
                                            //                 PageTransitionsBuilder>{
                                            //               TargetPlatform
                                            //                       .android:
                                            //                   ZoomPageTransitionsBuilder(),
                                            //             },
                                            //           ),
                                            //         ),
                                            //         home: const IntroSplash(),
                                            //       ),
                                            //     ),
                                            //   );
                                            //
                                            //   // runApp(
                                            //   //   MaterialApp(
                                            //   //     title: 'mProve Med\'s',
                                            //   //     theme: ThemeData(
                                            //   //       colorScheme:
                                            //   //           ColorScheme.fromSeed(
                                            //   //               seedColor:
                                            //   //                   Colors.indigo),
                                            //   //       useMaterial3: true,
                                            //   //     ).copyWith(
                                            //   //       pageTransitionsTheme:
                                            //   //           const PageTransitionsTheme(
                                            //   //         builders: <TargetPlatform,
                                            //   //             PageTransitionsBuilder>{
                                            //   //           TargetPlatform.android:
                                            //   //               ZoomPageTransitionsBuilder(),
                                            //   //         },
                                            //   //       ),
                                            //   //     ),
                                            //   //     home: const IntroSplash(),
                                            //   //   ),
                                            //   // );
                                            //
                                            //   // Navigator.push(
                                            //   //   context,
                                            //   //   MaterialPageRoute(
                                            //   //       builder: (context) =>
                                            //   //           const SettingsHistory()),
                                            //   // );
                                            // },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 0.0),
                                    // color: Colors.deepPurple,
                                    child: Card(
                                      elevation: 5.0,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.delete_forever,
                                            color: Colors.red[700],
                                          ),
                                          title: Text(
                                            "Delete Account",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  fontFamily: 'SourGummy',
                                                  fontWeight: FontWeight.w900,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                  letterSpacing: 1.5,
                                                ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                          onTap: deleteAccount,
                                          // onTap: () async {
                                          //   Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           MaterialApp(
                                          //         title: 'mProve Med\'s',
                                          //         theme: ThemeData(
                                          //           colorScheme:
                                          //               ColorScheme.fromSeed(
                                          //                   seedColor:
                                          //                       Colors.indigo),
                                          //           useMaterial3: true,
                                          //         ).copyWith(
                                          //           pageTransitionsTheme:
                                          //               const PageTransitionsTheme(
                                          //             builders: <TargetPlatform,
                                          //                 PageTransitionsBuilder>{
                                          //               TargetPlatform.android:
                                          //                   ZoomPageTransitionsBuilder(),
                                          //             },
                                          //           ),
                                          //         ),
                                          //         home: const IntroSplash(),
                                          //       ),
                                          //     ),
                                          //   );
                                          // },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),

                    // OutlinedButton(
                    //     style: const ButtonStyle(
                    //         // backgroundColor: Colors.deepPurple,
                    //         ),
                    //     onPressed: submit,
                    //     child: const Text("Submit"))
                    // Text(
                    //   'Your Age: $_age',
                    //   textAlign: TextAlign.left,
                    //   style: Theme.of(context).textTheme.headlineMedium,
                    // ),
                  ],
                ),
              ),

              Builder(builder: (context) {
                return const AppbarCard(
                  titleAppBar: "Settings",
                  menu: SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  menuChildren: SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  showBackButton: false,
                  showMoreOption: false,
                );
                //   Padding(
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
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 10.0, horizontal: 20.0),
                //           child: Text(
                //             "Settings",
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

              // Builder(builder: (context) {
              //   return Padding(
              //     padding: const EdgeInsets.only(top: 25.0, left: 10.0),
              //     child: Card(
              //       child: IconButton(
              //
              //     ),
              //   );
              // })
            ],
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   tooltip: 'Reset the value of NAME',
          //   isExtended: true,
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const MyApp()),
          //   ),
          //   label: const Row(
          //     children: [
          //       Icon(Icons.home),
          //       Text(" | "),
          //       Text("HOME"),
          //     ],
          //   ),
          // ), // This trailing kcomma maes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
