import 'dart:async';

import 'package:connection_notifier/connection_notifier.dart';
import 'package:diseases/ML%20DATA/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Home_Screen.dart';
import '../Sign-in/Setting_history.dart';
import '../main.dart';
import 'dart:developer' as developer;
import 'drop_single_entry.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
//   List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
//   final Connectivity _connectivity = Connectivity();
//   late Future<StreamSubscription<List<ConnectivityResult>>>
//       _connectivitySubscription;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initConnectivity();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
//             _updateConnectionStatus as Future<void> Function(
//                 ConnectivityResult event)?)
//         as Future<StreamSubscription<List<ConnectivityResult>>>;
//   }
//
//   @override
//   Future<void> dispose() async {
//     // await _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   Future<void> initConnectivity() async {
//     late List<ConnectivityResult> result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result =
//           (await _connectivity.checkConnectivity()) as List<ConnectivityResult>;
//     } on PlatformException catch (e) {
//       developer.log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }
//
//     return _updateConnectionStatus(result);
//   }
//
//   Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
//     setState(() {
//       _connectionStatus = result;
//     });
//     // ignore: avoid_print
//     print('Connectivity changed: $_connectionStatus');
//   }
//   final FlutterNetworkConnectivity _flutterNetworkConnectivity =
//       FlutterNetworkConnectivity(
//     isContinousLookUp:
//         true, // optional, false if you cont want continous lookup
//     lookUpDuration: const Duration(
//         seconds: 1), // optional, to override default lookup duration
//     lookUpUrl: 'example.com', // optional, to override default lookup url
//   );
//   bool? _isInternetAvailableOnCall;
//
//   bool? _isInternetAvailableStreamStatus;
//
//   StreamSubscription<bool>? _networkConnectionStream;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
//       _isInternetAvailableStreamStatus = event;
//       setState(() {});
//     });
//
//     init();
//   }
//
//   @override
//   void dispose() async {
//     _networkConnectionStream?.cancel();
//     _flutterNetworkConnectivity.unregisterAvailabilityListener();
//
//     super.dispose();
//   }
//
//   void init() async {
//     await _flutterNetworkConnectivity.registerAvailabilityListener();
//   }
//
  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> _checkInternetAvailability() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  // We also handle the message potentially returning null.
  // try {
  //   _isInternetAvailableOnCall =
  //       await _flutterNetworkConnectivity.isInternetConnectionAvailable();
  // } on PlatformException {
  //   _isInternetAvailableOnCall = null;
  // }
  //
  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  // if (!mounted) return;
  //
  // setState(() {});
  // }
  bool showMore = false;

  final List<DropdownMenuItem<String>> _dropDownMenuItems = allsymptoms
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toSet()
      .toList();

  String? selectedVal1,
      selectedVal2,
      selectedVal3,
      selectedVal4,
      selectedVal5,
      selectedVal6,
      selectedVal7,
      selectedVal8,
      selectedVal9,
      selectedVal10,
      selectedVal11,
      selectedVal12,
      selectedVal13,
      selectedVal14,
      selectedVal15,
      selectedVal16,
      selectedVal17,
      selectedVal18,
      selectedVal19,
      selectedVal20;

  reset() {
    (submittingList[0] != "np")
        ? setState(() {
            submittingList = List.filled(96, "np");
            // s = null;
            i = 0;
            selectedVal1 = null;
            selectedVal2 = null;
            selectedVal3 = null;
            selectedVal4 = null;
            selectedVal5 = null;
            selectedVal6 = null;
            selectedVal7 = null;
            selectedVal8 = null;
            selectedVal9 = null;
            selectedVal10 = null;
            selectedVal11 = null;
            selectedVal12 = null;
            selectedVal13 = null;
            selectedVal14 = null;
            selectedVal15 = null;
            selectedVal16 = null;
            selectedVal17 = null;
            selectedVal18 = null;
            selectedVal19 = null;
            selectedVal20 = null;
          })
        : debugPrint("Already Removed....");
  }

  Widget cardDrop({
    required String? value,
    required ValueChanged<String?> onChange,
  }) {
    return Card(
      margin: cardMargin,
      elevation: 10.0,
      color: Colorforeach,
      child: ListTile(
        title: Padding(
          padding: paddingCard,
          child: Chip(
            label: DropdownButton(
                style: (value == null)
                    ? hinting.style?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      )
                    : hinting.style,
                dropdownColor: (value == null)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.background,
                icon: arowicon,
                value: value,
                isExpanded: true,
                focusColor: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15.0),
                menuMaxHeight: 450,
                hint: hinting,
                items: _dropDownMenuItems,
                onChanged: onChange),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeader = buildingUserAccountsDrawerHeader(context);
    final drawerItems = buildingListView(drawerHeader, context);
    final drawerSymp = buildingSymptomView(drawerHeader, context);
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
          // appBar: AppBar(
          //   foregroundColor: Colors.white,
          //   backgroundColor: Colors.deepPurple[400],
          //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   title: const Text("Symptom Selection"),
          //   actions: [
          //     IconButton(
          //       icon: const Icon(Icons.restart_alt),
          //       onPressed: () {
          //         (submittingList[0] != "np")
          //             ? setState(() {
          //           submittingList = List.filled(96, "np");
          //           // s = null;
          //           i = 0;
          //           selectedVal1 = null;
          //           selectedVal2 = null;
          //           selectedVal3 = null;
          //           selectedVal4 = null;
          //           selectedVal5 = null;
          //           selectedVal6 = null;
          //           selectedVal7 = null;
          //           selectedVal8 = null;
          //           selectedVal9 = null;
          //           selectedVal10 = null;
          //           selectedVal11 = null;
          //           selectedVal12 = null;
          //           selectedVal13 = null;
          //           selectedVal14 = null;
          //           selectedVal15 = null;
          //           selectedVal16 = null;
          //           selectedVal17 = null;
          //           selectedVal18 = null;
          //           selectedVal19 = null;
          //           selectedVal20 = null;
          //         })
          //             : debugPrint("Already Removed....");
          //       },
          //     ),
          //     PopupMenuButton<String>(
          //       onSelected: (String newValue) {
          //         if (newValue == "Search") {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => const Searchable()),
          //           );
          //         } else if (newValue == "Professional") {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const DropDownSingle()),
          //           );
          //         } else if (newValue == "Reset Symptoms") {
          //           (submittingList[0] != "np")
          //               ? setState(
          //                 () {
          //               submittingList = List.filled(96, "np");
          //               // s = null;
          //               i = 0;
          //               selectedVal1 = null;
          //               selectedVal2 = null;
          //               selectedVal3 = null;
          //               selectedVal4 = null;
          //               selectedVal5 = null;
          //               selectedVal6 = null;
          //               selectedVal7 = null;
          //               selectedVal8 = null;
          //               selectedVal9 = null;
          //               selectedVal10 = null;
          //               selectedVal11 = null;
          //               selectedVal12 = null;
          //               selectedVal13 = null;
          //               selectedVal14 = null;
          //               selectedVal15 = null;
          //               selectedVal16 = null;
          //               selectedVal17 = null;
          //               selectedVal18 = null;
          //               selectedVal19 = null;
          //               selectedVal20 = null;
          //             },
          //           )
          //               : debugPrint("Already Removed....");
          //         } else {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => const DropDown()),
          //           );
          //         }
          //       },
          //       itemBuilder: (BuildContext context) => popUpMenuItems,
          //     ),
          //   ],
          // ),
          body: Stack(children: [
            const GradientBackGround(),
            Card(
              margin: bodyCardMargin.copyWith(top: (showMore) ? 100.0 : 100.0),
              // margin: bodyCardMargin.copyWith(top: (showMore) ? 185.0 : 100.0),
              // EdgeInsets.only(
              //     top: (showMore) ? 185.0 : 100.0,
              //     left: 4,
              //     right: 4,
              //     bottom: 5.0,
              //   ),
              child: ListView(
                children: [
                  cardDrop(
                    value: selectedVal1,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal1 = newValue;
                          selectionfordropdown = selectedVal1!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal2,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal2 = newValue;
                          selectionfordropdown = selectedVal2!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal3,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal3 = newValue;
                          selectionfordropdown = selectedVal3!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal4,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal4 = newValue;
                          selectionfordropdown = selectedVal4!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal5,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal5 = newValue;
                          selectionfordropdown = selectedVal5!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal6,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal6 = newValue;
                          selectionfordropdown = selectedVal6!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal7,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal7 = newValue;
                          selectionfordropdown = selectedVal7!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal8,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal8 = newValue;
                          selectionfordropdown = selectedVal8!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal9,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal9 = newValue;
                          selectionfordropdown = selectedVal9!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal10,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal10 = newValue;
                          selectionfordropdown = selectedVal10!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal11,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal11 = newValue;
                          selectionfordropdown = selectedVal11!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal12,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal12 = newValue;
                          selectionfordropdown = selectedVal12!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal13,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal13 = newValue;
                          selectionfordropdown = selectedVal13!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal14,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal14 = newValue;
                          selectionfordropdown = selectedVal14!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal15,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal15 = newValue;
                          selectionfordropdown = selectedVal15!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal16,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal16 = newValue;
                          selectionfordropdown = selectedVal16!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal17,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal17 = newValue;
                          selectionfordropdown = selectedVal17!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal18,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal18 = newValue;
                          selectionfordropdown = selectedVal18!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal19,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal19 = newValue;
                          selectionfordropdown = selectedVal19!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  cardDrop(
                    value: selectedVal20,
                    onChange: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVal20 = newValue;
                          selectionfordropdown = selectedVal20!;
                          submittingList[i] = selectionfordropdown;
                          i++;
                          selectionfordropdown = "";
                        });
                      }
                    },
                  ),
                  // const SizedBox(
                  //   height: 250.0,
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: (selectedVal1 == null)
                  //               ? hinting.style?.copyWith(
                  //                   color: Theme.of(context)
                  //                       .colorScheme
                  //                       .onSecondary,
                  //                 )
                  //               : hinting.style,
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           value: selectedVal1,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight:
                  //               MediaQuery.sizeOf(context).height * 0.45,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal1 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal1!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal2,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal2 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal2!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal3,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal3 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal3!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal4,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal4 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal4!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal5,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal5 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal5!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal6,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal6 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal6!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal7,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal7 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal7!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           focusColor: Theme.of(context).colorScheme.secondary,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           hint: hinting,
                  //           value: selectedVal8,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal8 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal8!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal9,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal9 = newValue);
                  //               setState(
                  //                   () => selectionfordropdown = selectedVal9!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal10,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal10 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal10!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal11,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal11 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal11!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal12,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal12 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal12!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal13,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal13 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal13!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal14,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal14 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal14!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal15,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal15 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal15!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal16,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal16 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal16!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal17,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal17 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal17!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal18,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal18 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal18!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal19,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal19 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal19!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: cardmargin,
                  //   elevation: 10.0,
                  //   color: Colorforeach,
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: paddingCard,
                  //       child: Chip(
                  //         label: DropdownButton(
                  //           style: hinting.style?.copyWith(
                  //             color: Theme.of(context).colorScheme.onSecondary,
                  //           ),
                  //           dropdownColor:
                  //               Theme.of(context).colorScheme.secondary,
                  //           icon: arowicon,
                  //           isExpanded: true,
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           menuMaxHeight: 450,
                  //           value: selectedVal20,
                  //           hint: hinting,
                  //           onChanged: (String? newValue) {
                  //             if (newValue != null) {
                  //               setState(() => selectedVal20 = newValue);
                  //               setState(() =>
                  //                   selectionfordropdown = selectedVal20!);
                  //               setState(() =>
                  //                   submittingList[i] = selectionfordropdown);
                  //               setState(() => i++);
                  //               setState(() => selectionfordropdown = "");
                  //             }
                  //           },
                  //           items: _dropDownMenuItems,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 100.0)
                  // AppbarCard(),
                ],
              ),
            ),
            (showMore)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                    child: Container(
                      // height: MediaQuery.sizeOf(context).height * (1-),
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withOpacity(0.45),
                      // color: Colors.indigo[200]?.withOpacity(0.5),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            Builder(builder: (context) {
              return AppbarCard(
                showBackButton: false,
                showMoreOption: true,
                titleAppBar: "Select Symptoms",
                menu: Card(
                  elevation: 5.0,
                  color: (showMore)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                  child: SizedBox(
                    height: Theme.of(context).textTheme.displayMedium?.fontSize,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showMore = !showMore;
                        });
                        // Scaffold.of(context).openEndDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          (showMore)
                              ? Icons.keyboard_arrow_up
                              : Icons.more_vert,
                          size:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                          color: (showMore)
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                menuChildren: (showMore)
                    ? Card(
                        elevation: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                        child: SizedBox(
                          height: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .fontSize! *
                              1.25,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              2.0,
                              7.5,
                              2.0,
                              7.5,
                            ),
                            child: Row(
                              // runAlignment: WrapAlignment.spaceBetween,
                              // crossAxisAlignment: WrapCrossAlignment.end,
                              // alignment: WrapAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 5.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      (submittingList[0] != "np")
                                          ? setState(() {
                                              submittingList =
                                                  List.filled(96, "np");
                                              // s = null;
                                              i = 0;
                                              selectedVal1 = null;
                                              selectedVal2 = null;
                                              selectedVal3 = null;
                                              selectedVal4 = null;
                                              selectedVal5 = null;
                                              selectedVal6 = null;
                                              selectedVal7 = null;
                                              selectedVal8 = null;
                                              selectedVal9 = null;
                                              selectedVal10 = null;
                                              selectedVal11 = null;
                                              selectedVal12 = null;
                                              selectedVal13 = null;
                                              selectedVal14 = null;
                                              selectedVal15 = null;
                                              selectedVal16 = null;
                                              selectedVal17 = null;
                                              selectedVal18 = null;
                                              selectedVal19 = null;
                                              selectedVal20 = null;
                                            })
                                          : debugPrint("Already Removed....");
                                      Navigator.pop(context);
                                      setState(() {
                                        showMore = !showMore;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 5.0, 10.0),
                                          child: Text(
                                            "Reset All",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
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
                                        ),
                                        Card(
                                          elevation: 5.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5.0, 5.0, 5.0, 5.0),
                                            child: Icon(
                                              Icons.restart_alt,
                                              size: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.fontSize,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 8.0,
                                // ),
                                Expanded(
                                  child: Container(
                                    width: 7.5,
                                  ),
                                ),
                                Card(
                                  elevation: 5.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   showMore = !showMore;
                                      // });
                                      setState(() {
                                        showMore = !showMore;
                                      });
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 5.0, 10.0),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              "Selected Symptoms",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
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
                                          ),
                                        ),
                                        Card(
                                          elevation: 5.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5.0, 5.0, 5.0, 5.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.fontSize,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              );
              // return Padding(
              //   padding:
              //       const EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
              //   child: Align(
              //     // scrollDirection: Axis.horizontal,
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Card(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       Scaffold.of(context).openDrawer();
              //                     },
              //                     // borderRadius: BorderRadius.circular(25),
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(10.0),
              //                       child: Icon(
              //                         Icons.menu,
              //                         size: Theme.of(context)
              //                             .textTheme
              //                             .headlineSmall
              //                             ?.fontSize,
              //                         color:
              //                             Theme.of(context).colorScheme.primary,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(
              //                   width: 8.0,
              //                 ),
              //                 Card(
              //                   child: Padding(
              //                     padding: const EdgeInsets.fromLTRB(
              //                         18.0, 10.0, 15.0, 10.0),
              //                     child: Text(
              //                       "Select Symptoms",
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
              //               ],
              //             ),
              //             Expanded(
              //               // width: double.infinity,
              //               // width: (MediaQuery.sizeOf(context).width * 1 / 10) -
              //               //     15,
              //               child: SizedBox(),
              //             ),
              //             Card(
              //               color: (showMore)
              //                   ? Theme.of(context).colorScheme.primary
              //                   : Theme.of(context).colorScheme.background,
              //               child: GestureDetector(
              //                 onTap: () {
              //                   setState(() {
              //                     showMore = !showMore;
              //                   });
              //                   // Scaffold.of(context).openEndDrawer();
              //                 },
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: Icon(
              //                     (showMore)
              //                         ? Icons.keyboard_arrow_up
              //                         : Icons.more_vert,
              //                     size: Theme.of(context)
              //                         .textTheme
              //                         .titleLarge
              //                         ?.fontSize,
              //                     color: (showMore)
              //                         ? Theme.of(context).colorScheme.onPrimary
              //                         : Theme.of(context).colorScheme.primary,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         (showMore)
              //             ? const SizedBox(
              //                 height: 5.0,
              //               )
              //             : const SizedBox(
              //                 height: 0,
              //                 width: 0,
              //               ),
              //         (showMore)
              //             ? Card(
              //                 elevation: 5.0,
              //                 color: Theme.of(context).colorScheme.primary,
              //                 child: Padding(
              //                   padding: const EdgeInsets.fromLTRB(
              //                     2.0,
              //                     7.5,
              //                     2.0,
              //                     7.5,
              //                   ),
              //                   child: Row(
              //                     // runAlignment: WrapAlignment.spaceBetween,
              //                     // crossAxisAlignment: WrapCrossAlignment.end,
              //                     // alignment: WrapAlignment.spaceBetween,
              //                     mainAxisSize: MainAxisSize.min,
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     children: [
              //                       Card(
              //                         child: GestureDetector(
              //                           onTap: () {
              //                             (submittingList[0] != "np")
              //                                 ? setState(() {
              //                                     submittingList =
              //                                         List.filled(96, "np");
              //                                     // s = null;
              //                                     i = 0;
              //                                     selectedVal1 = null;
              //                                     selectedVal2 = null;
              //                                     selectedVal3 = null;
              //                                     selectedVal4 = null;
              //                                     selectedVal5 = null;
              //                                     selectedVal6 = null;
              //                                     selectedVal7 = null;
              //                                     selectedVal8 = null;
              //                                     selectedVal9 = null;
              //                                     selectedVal10 = null;
              //                                     selectedVal11 = null;
              //                                     selectedVal12 = null;
              //                                     selectedVal13 = null;
              //                                     selectedVal14 = null;
              //                                     selectedVal15 = null;
              //                                     selectedVal16 = null;
              //                                     selectedVal17 = null;
              //                                     selectedVal18 = null;
              //                                     selectedVal19 = null;
              //                                     selectedVal20 = null;
              //                                   })
              //                                 : debugPrint(
              //                                     "Already Removed....");
              //                           },
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.min,
              //                             children: [
              //                               Padding(
              //                                 padding:
              //                                     const EdgeInsets.fromLTRB(
              //                                         10.0, 10.0, 5.0, 10.0),
              //                                 child: Text(
              //                                   "Reset All",
              //                                   style: Theme.of(context)
              //                                       .textTheme
              //                                       .labelMedium
              //                                       ?.copyWith(
              //                                         fontFamily: 'SourGummy',
              //                                         letterSpacing: 1,
              //                                         fontWeight:
              //                                             FontWeight.w600,
              //                                         color: Theme.of(context)
              //                                             .colorScheme
              //                                             .primary,
              //                                         // color: Colors.deepPurple,
              //                                       ),
              //                                 ),
              //                               ),
              //                               Card(
              //                                 color: Theme.of(context)
              //                                     .colorScheme
              //                                     .primary,
              //                                 child: Padding(
              //                                   padding:
              //                                       const EdgeInsets.fromLTRB(
              //                                           5.0, 5.0, 5.0, 5.0),
              //                                   child: Icon(
              //                                     Icons.restart_alt,
              //                                     size: Theme.of(context)
              //                                         .textTheme
              //                                         .titleLarge
              //                                         ?.fontSize,
              //                                     color: Theme.of(context)
              //                                         .colorScheme
              //                                         .onPrimary,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                       // const SizedBox(
              //                       //   width: 8.0,
              //                       // ),
              //                       Expanded(
              //                         child: Container(
              //                           width: 7.5,
              //                         ),
              //                       ),
              //                       Card(
              //                         child: GestureDetector(
              //                           onTap: () {
              //                             // setState(() {
              //                             //   showMore = !showMore;
              //                             // });
              //                             Scaffold.of(context).openEndDrawer();
              //                           },
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.min,
              //                             children: [
              //                               Padding(
              //                                 padding:
              //                                     const EdgeInsets.fromLTRB(
              //                                         10.0, 10.0, 5.0, 10.0),
              //                                 child: Text(
              //                                   "View Selected Symptoms",
              //                                   style: Theme.of(context)
              //                                       .textTheme
              //                                       .labelMedium
              //                                       ?.copyWith(
              //                                         fontFamily: 'SourGummy',
              //                                         letterSpacing: 1,
              //                                         fontWeight:
              //                                             FontWeight.w600,
              //                                         color: Theme.of(context)
              //                                             .colorScheme
              //                                             .primary,
              //                                         // color: Colors.deepPurple,
              //                                       ),
              //                                 ),
              //                               ),
              //                               Card(
              //                                 color: Theme.of(context)
              //                                     .colorScheme
              //                                     .primary,
              //                                 child: Padding(
              //                                   padding:
              //                                       const EdgeInsets.fromLTRB(
              //                                           5.0, 5.0, 5.0, 5.0),
              //                                   child: Icon(
              //                                     Icons.arrow_forward_ios,
              //                                     size: Theme.of(context)
              //                                         .textTheme
              //                                         .titleLarge
              //                                         ?.fontSize,
              //                                     color: Theme.of(context)
              //                                         .colorScheme
              //                                         .onPrimary,
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             : SizedBox(
              //                 height: 0,
              //                 width: 0,
              //               ),
              //       ],
              //     ),
              //   ),
              // );
            }),
            // draglist(),
          ]),
          drawer: Drawer(
            child: drawerItems,
          ),
          endDrawer: Drawer(
            child: drawerSymp,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: buildingFloatingActionButton(
            context,
            // _isInternetAvailableStreamStatus,
            // _isInternetAvailableStreamStatus!,
          ),
        ),
      ),
    );
  }

  void dropDownOnChanged(String? newValue, selectWhat) {
    if (newValue != null) {
      setState(() => selectWhat = newValue);
      setState(() => selectionfordropdown = selectWhat!);
      setState(() => submittingList[i] = selectionfordropdown);
      setState(() => i++);
      setState(() => selectionfordropdown = "");
    }
  }
}
