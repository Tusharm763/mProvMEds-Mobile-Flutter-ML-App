import 'dart:async';
import 'dart:convert';

import 'package:diseases/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';

import '../Sign-in/Setting_history.dart';
import 'Results.dart';

class LoadingScreenForSubmit extends StatefulWidget {
  const LoadingScreenForSubmit({super.key});

  @override
  State<LoadingScreenForSubmit> createState() => _LoadingScreenForSubmitState();
}

class _LoadingScreenForSubmitState extends State<LoadingScreenForSubmit> {
  Future mainDelayer() async {
    print("\n\n\nStep  1\n\n\n");
    data = await fetch('https://tusharmistry.pythonanywhere.com/apps?input=$s');
    // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
    if (kDebugMode) {
      print(data);
    }
    dynamic decoded = jsonDecode(data);
    // print(Symptom+decoded);
    output = decoded['output'];
    List<String> splitting = output.split(",");
    // output = decoded['output'];
    for (int intt = 0; intt < splitting.length; intt++) {
      // setState(() {});
      each_output[intt] = splitting[intt];
    }
    return null;
  }

  Future hiveHandle() async {
    print("\n\n\nStep  2\n\n\n");
    String keyHistory = "";
    keyHistory +=
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ";
    if (DateTime.now().hour > 12) {
      // keyHistory += "${DateTime.now().hour - 12}";
      keyHistory += ((DateTime.now().hour - 12) > 9)
          ? "${DateTime.now().hour - 12}"
          : "0${DateTime.now().hour - 12}";
      keyHistory += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      keyHistory += (DateTime.now().second > 9)
          ? " : ${DateTime.now().second}"
          : " : 0${DateTime.now().second}";
      keyHistory += " PM";
    } else {
      keyHistory += ((DateTime.now().hour) > 9)
          ? "${DateTime.now().hour}"
          : "0${DateTime.now().hour}";
      keyHistory += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      keyHistory += (DateTime.now().second > 9)
          ? " : ${DateTime.now().second}"
          : " : 0${DateTime.now().second}";
      keyHistory += " AM";
    }

    List<String> historyEachSymptom = List.filled(submittingList.length, "ERR");
    for (int i = 0; i < submittingList.length; i++) {
      if (submittingList[i] == 'np') continue;
      var qw = submittingList[i].toUpperCase();
      historyEachSymptom[i] = qw;
      print(historyEachSymptom[i]);
    }
    List<String> historyEachResult = List.filled(each_output.length, "ERR");
    for (int j = 0; j < each_output.length; j++) {
      var qww = each_output[j].toUpperCase();
      historyEachResult[j] = qww;
      print(historyEachResult[j]);
    }

    // Map<String, dynamic> valueHistroy = {
    //   "Key": keyHistory,
    //   "Symptoms": historyEachSymptom,
    //   "Result": historyEachResult,
    // };
    // historyEntry.add(valueHistroy})
    historyListDatabase.add({
      "Key": keyHistory,
      "Symptoms": historyEachSymptom,
      "Result": historyEachResult,
    });
    //TODO: Hive: PUT: Prediction History
    var DB = await Hive.openBox("information");
    // DB.delete("PredictionHistory");
    DB.put("PredictHistory", historyListDatabase);

    var h = submittingList[0];
    for (int v = 1; v < submittingList.length; v++) {
      if (submittingList[v] != 'np') {
        h += """,\n${submittingList[v]}""";
      }
    }
    var o = each_output[0];
    for (int v = 1; v < each_output.length; v++) {
      if (each_output[v] != 'np') {
        o += """,\n${each_output[v]}""";
      }
    }
    histentry.add(manageList(h, o));

    return null;
  }

  Future navig() async {
    print("\n\n\nStep  3\n\n\n");
    s = "";
    submittingList = List.filled(96, "np");
    i = 0;
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
      print("Popped");
      colorselection = "B";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MaterialApp(
            title: 'mProve Med\'s',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              useMaterial3: true,
            ).copyWith(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                },
              ),
            ),
            home: const RequestAndDisplay(),
          ),
        ),
      );
    });

    return null;
  }

  void init() async {
    var s = submittingList[0].replaceAll(" ", "_").toLowerCase();
    for (int a = 1; a < 96; a++) {
      if (submittingList[a] != "np") {
        var synt = submittingList[a];
        synt = synt.replaceAll(" ", "_").toLowerCase();
        s += ",$synt";
      }
    }
    print(s);

    mainDelayer().then(
      (value) => hiveHandle().then(
        (value) => navig(),
      ),
      onError: (e) => Navigator.pop(context),
    );

    //TODO: old code
    Future<void> old() async {
      try {
        data = await fetch(
            'https://tusharmistry.pythonanywhere.com/apps?input=$s');
        // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
        if (kDebugMode) {
          print(data);
        }
        dynamic decoded = jsonDecode(data);
        // print(Symptom+decoded);
        output = decoded['output'];
        List<String> splitting = output.split(",");
        // output = decoded['output'];
        for (int intt = 0; intt < splitting.length; intt++) {
          // setState(() {});
          each_output[intt] = splitting[intt];
        }
        // for (int j = 0; j < each_output.length; j++) {
        //   each_output = output.split(",");
        // }
        //TODO: creating Database Entry.
        String keyHistory = "";
        keyHistory +=
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ";
        if (DateTime.now().hour > 12) {
          // keyHistory += "${DateTime.now().hour - 12}";
          keyHistory += ((DateTime.now().hour - 12) > 9)
              ? "${DateTime.now().hour - 12}"
              : "0${DateTime.now().hour - 12}";
          keyHistory += (DateTime.now().minute > 9)
              ? " : ${DateTime.now().minute}"
              : " : 0${DateTime.now().minute}";
          keyHistory += (DateTime.now().second > 9)
              ? " : ${DateTime.now().second}"
              : " : 0${DateTime.now().second}";
          keyHistory += " PM";
        } else {
          keyHistory += ((DateTime.now().hour) > 9)
              ? "${DateTime.now().hour}"
              : "0${DateTime.now().hour}";
          keyHistory += (DateTime.now().minute > 9)
              ? " : ${DateTime.now().minute}"
              : " : 0${DateTime.now().minute}";
          keyHistory += (DateTime.now().second > 9)
              ? " : ${DateTime.now().second}"
              : " : 0${DateTime.now().second}";
          keyHistory += " AM";
        }

        List<String> historyEachSymptom =
            List.filled(submittingList.length, "ERR");
        for (int i = 0; i < submittingList.length; i++) {
          if (submittingList[i] == 'np') continue;
          var qw = submittingList[i].toUpperCase();
          historyEachSymptom[i] = qw;
          print(historyEachSymptom[i]);
        }
        List<String> historyEachResult = List.filled(each_output.length, "ERR");
        for (int j = 0; j < each_output.length; j++) {
          var qww = each_output[j].toUpperCase();
          historyEachResult[j] = qww;
          print(historyEachResult[j]);
        }

        // Map<String, dynamic> valueHistroy = {
        //   "Key": keyHistory,
        //   "Symptoms": historyEachSymptom,
        //   "Result": historyEachResult,
        // };
        // historyEntry.add(valueHistroy})
        historyListDatabase.add({
          "Key": keyHistory,
          "Symptoms": historyEachSymptom,
          "Result": historyEachResult,
        });
        //TODO: Hive: PUT: Prediction History
        var DB = await Hive.openBox("information");
        // DB.delete("PredictionHistory");
        DB.put("PredictHistory", historyListDatabase);

        var h = submittingList[0];
        for (int v = 1; v < submittingList.length; v++) {
          if (submittingList[v] != 'np') {
            h += """,\n${submittingList[v]}""";
          }
        }
        var o = each_output[0];
        for (int v = 1; v < each_output.length; v++) {
          if (each_output[v] != 'np') {
            o += """,\n${each_output[v]}""";
          }
        }
        histentry.add(manageList(h, o));
        // debugPrint(historyListDatabase[0]?["Key"] as String);
        //TODO:REset Symptoms
        s = "";
        submittingList = List.filled(96, "np");
        i = 0;
        Navigator.pop(context);
        print("Popped");
        colorselection = "B";

        // Timer(
        //     const Duration(seconds: 0),
        //     () =>
        Future<void> nav() async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MaterialApp(
                title: 'mProve Med\'s',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                  useMaterial3: true,
                ).copyWith(
                  pageTransitionsTheme: const PageTransitionsTheme(
                    builders: <TargetPlatform, PageTransitionsBuilder>{
                      TargetPlatform.android: ZoomPageTransitionsBuilder(),
                    },
                  ),
                ),
                home: const RequestAndDisplay(),
              ),
            ),
          );
        }

        await nav();
        //TODO: Navigation
        // Navigator.pop(context);
        //             // print("Popped");
        //             // colorselection = "B";
        //             // Navigator.pushReplacement(
        //             //   context,
        //             //   MaterialPageRoute(
        //             //     builder: (context) => MaterialApp(
        //             //       title: 'mProve Med\'s',
        //             //       theme: ThemeData(
        //             //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        //             //         useMaterial3: true,
        //             //       ).copyWith(
        //             //         pageTransitionsTheme: const PageTransitionsTheme(
        //             //           builders: <TargetPlatform, PageTransitionsBuilder>{
        //             //             TargetPlatform.android: ZoomPageTransitionsBuilder(),
        //             //           },
        //             //         ),
        //             //       ),
        //             //       home: const RequestAndDisplay(),
        //             //     ),
        //             //   ),
        //             // );
        // );
        //TODO: Reset all field to initial.
        // submittingList = List.filled(96, "np");
        // each_output = List.filled(12, "__disease__");
      } catch (e) {
        print(e);
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            // title: const Text('Trying...Still Loading...'),
            title: Text(
              'Ahh Oh!! Something went Wrong...',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
            content: Text(
              'We are under process to make this possible, but it\'s taking too much time for your device.\n\nFor now, \n\n📶  Try to turning OFF WiFi,\n⏳  Wait for some time, Our Server might be running its Down time.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
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
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        // color: Colors.deepPurple,
                      ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void initState() {
    setState(() {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Timer(const Duration(seconds: 1), () {});
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          body: Stack(
            children: [
              const GradientBackGround(),
              Center(
                child: SpinKitPulse(
                  size: MediaQuery.sizeOf(context).height * 1.5,
                  color: Theme.of(context).colorScheme.primary,
                  // waveColor: Theme.of(context)
                  //     .colorScheme
                  //     .secondaryContainer
                  //     .withOpacity(0.75),
                  // trackColor: Theme.of(context)
                  //     .colorScheme
                  //     .secondaryContainer
                  //     .withOpacity(0.75),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitPouringHourGlassRefined(
                      size: 100.0,
                      // waveColor: Theme.of(context)
                      //     .colorScheme
                      //     .secondaryContainer
                      //     .withOpacity(0.75),
                      // trackColor: Theme.of(context)
                      //     .colorScheme
                      //     .secondaryContainer
                      //     .withOpacity(0.75),
                      strokeWidth: 5.0,
                      duration: const Duration(milliseconds: 1800),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    // SpinKitSpinningCircle(
                    //   color: Theme.of(context).colorScheme.primary,
                    // ),

                    Text(
                      "\n\nPlease Wait...\n\nWhile Fetching Data from the Server",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: 'SourGummy',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                            // color: Colors.deepPurple,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
