import 'dart:async';

import 'package:diseases/ML%20DATA/drop_down.dart';
import 'package:diseases/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:marquee_text/marquee_text.dart';
import '../Home_Screen.dart';
import 'drop_single_entry.dart';

draglist() {
  return DraggableScrollableSheet(
    initialChildSize: 0.125,
    minChildSize: 0.125,
    maxChildSize: 0.8,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Scrollbar(
          child: ListView(
            controller: scrollController,
            children: [
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Divider(
                  indent: 175,
                  endIndent: 175,
                  thickness: 5,
                  color: Colors.grey,
                  height: 25.0,
                ),
              ),
              const SizedBox(height: 90.0),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Your Selected Symptoms",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourGummy',
                      letterSpacing: 2.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    '''It can take a bit of time to show them here.\nRe-opening the Page can solve the Problem.''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: submittingList.length,
                itemBuilder: (context, idx) {
                  if (submittingList[idx] != "np") {
                    return ListTile(
                      leading: Text(
                        'Symptom ${idx + 1}',
                        style: const TextStyle(
                          // fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        submittingList[idx],
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (idx == 0) {
                    return const ListTile(
                        title: Text("NO Symptoms to Display."));
                  } else {
                    return null;
                  }
                },
              ),
              const Divider(),
              const SizedBox(height: 90.0),
            ],
          ),
        ),
      );
    },
  );
}

class Searchable extends StatefulWidget {
  const Searchable({super.key});

  @override
  State<Searchable> createState() => _SearchableState();
}

class _SearchableState extends State<Searchable> {
  bool showMore = false;

  // final FlutterNetworkConnectivity _flutterNetworkConnectivity =
  //     FlutterNetworkConnectivity(
  //   isContinousLookUp:
  //       true, // optional, false if you cont want continous lookup
  //   lookUpDuration: const Duration(
  //       seconds: 1), // optional, to override default lookup duration
  //   lookUpUrl: 'example.com', // optional, to override default lookup url
  // );
  // bool? _isInternetAvailableOnCall;
  //
  // bool? _isInternetAvailableStreamStatus;

  // StreamSubscription<bool>? _networkConnectionStream;

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(search);
    //
    // _flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
    //   _isInternetAvailableStreamStatus = event;
    //   setState(() {});
    // });
    //
    // init();
  }
  //
  // @override
  // void dispose() async {
  //   _networkConnectionStream?.cancel();
  //   _flutterNetworkConnectivity.unregisterAvailabilityListener();
  //
  //   super.dispose();
  // }
  //
  // void init() async {
  //   await _flutterNetworkConnectivity.registerAvailabilityListener();
  // }
  //
  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> _checkInternetAvailability() async {
  //   Platform messages may fail, so we use a try/catch PlatformException.
  //   We also handle the message potentially returning null.
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

  List<String> search;
  late _MySearchDelegate _delegate;

  _SearchableState()
      : search = List.from(allsymptoms.toSet())
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

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
          //   title: const Text('Symptom Selection'),
          //   actions: <Widget>[
          //     IconButton(
          //       icon: const Icon(Icons.restart_alt),
          //       onPressed: () {
          //         (submittingList[0] != "np")
          //             ? setState(() {
          //                 submittingList = List.filled(96, "np");
          //                 // s = null;
          //                 i = 0;
          //               })
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
          //                   () {
          //                     submittingList = List.filled(96, "np");
          //                     // s = null;
          //                     i = 0;
          //                   },
          //                 )
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
          body: Stack(
            children: <Widget>[
              const GradientBackGround(),
              Card(
                margin:
                    bodyCardMargin.copyWith(top: (showMore) ? 100.0 : 100.0),
                // margin: EdgeInsets.only(
                //   top: (showMore) ? 185.0 : 100.0,
                //   left: 2.5,
                //   right: 2.5,
                //   bottom: 5.0,
                // ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // ClipRect(
                        //   child: Container(
                        //     padding: EdgeInsets.only(bottom: 10.0,left: 5.0,right: 5.0),
                        //     height: 80.0,
                        //     color: Colors.deepPurple[400],
                        //     child: Card(
                        //       color: Colorforeach,
                        //       child: const Column(
                        //         children: [
                        //           Padding(
                        //             padding: EdgeInsets.all(8.0),
                        //             child: Center(
                        //               child: Text(
                        //                 "You can Search the Symptom by \"Select by Search\" Button Or Select each Symptom from the list.",
                        //                 // softWrap: true,
                        //                 textAlign: TextAlign.justify,
                        //                 style: TextStyle(
                        //                     fontSize: 16.0
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(padding: EdgeInsets.only(top: 75.0)),
                        GestureDetector(
                          onTap: () async {
                            String? selected = await showSearch<String>(
                              context: context,
                              delegate: _delegate,
                            );
                            if (mounted && selected != null) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text('You have selected the word: $selected'),
                              //   ),
                              // );
                              // for (var i = 0; i < selectingsymp.length; i++) {
                              //   if (selectingsymp[i] == "None") {
                              //     selectingsymp[i] = selected;
                              //     print(selectingsymp[i]);
                              //     break;
                              //   }
                              selectionfordropdown += selected;
                              selectionfordropdown += ",";
                              // selectingsymp[i] = selected!;
                              setState(() {
                                // i++;
                              });
                              selectionfordropdown = selectionfordropdown
                                  .replaceAll(" ", "_")
                                  .toLowerCase();
                              print(selectionfordropdown);
                            }
                          },
                          child: Card(
                            elevation: 5.0,
                            color: Theme.of(context).colorScheme.primary,
                            margin: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 12.5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    // size: 25.0,
                                    Icons.search,
                                    size: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.fontSize,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  const VerticalDivider(),
                                  Text(
                                    "|",
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
                                  const VerticalDivider(),
                                  Text(
                                    "Select by Search",
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // const Divider(),
                        // const Card(
                        //   elevation: 7.5,
                        //   margin: EdgeInsets.symmetric(
                        //     horizontal: 50.0,
                        //   ),
                        //   child: Padding(
                        //     padding:
                        //         EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                        //     child: Center(
                        //       child: Text("You can also select Symptoms in the following list."),
                        //     ),
                        //   ),
                        // ),
                        Divider(
                          thickness: 3.0,
                          indent: MediaQuery.sizeOf(context).width * 0.025,
                          endIndent: MediaQuery.sizeOf(context).width * 0.025,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 20.0, 0),
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height, //450.0,
                              child: ListView.builder(
                                // shrinkWrap: true,
                                itemCount: allsymptoms.length + 1,
                                itemBuilder: (context, idx) {
                                  if (idx >= allsymptoms.length) {
                                    return SizedBox(
                                      height: 100.0,
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        var selected = allsymptoms[idx];
                                        showDialog<String>(
                                          context: context, //TODO: QWERTY
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                  title: Column(
                                                    children: [
                                                      Text(
                                                        "About $selected",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall
                                                            ?.copyWith(
                                                              fontFamily:
                                                                  'SourGummy',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimary,
                                                              // color: Colors.deepPurple,
                                                            ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.75,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary,
                                                      ),
                                                    ],
                                                  ),
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      // const Text(
                                                      //   "Description :\n",
                                                      //   style: TextStyle(
                                                      //       color: Colors.purpleAccent),
                                                      // ),
                                                      Text(
                                                        descriptionsList[idx],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall
                                                            ?.copyWith(
                                                              fontFamily:
                                                                  'SourGummy',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimary,
                                                              // color: Colors.deepPurple,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                // ElevatedButton(
                                                //   onPressed: () {
                                                //     setState(() {
                                                //       submittingList =
                                                //           List.filled(96, "np");
                                                //       // s = null;
                                                //       i = 0;
                                                //       Navigator.pop(
                                                //         context,
                                                //         '',
                                                //       );
                                                //     });
                                                //   },
                                                //   child: const Text(
                                                //     "Reset Field",
                                                //   ),
                                                // ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      submittingList[i] =
                                                          selected;
                                                      i += 1;
                                                      Navigator.pop(
                                                          context, '');
                                                    });
                                                  },
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Text(
                                                    "Add ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(
                                                          fontFamily:
                                                              'SourGummy',
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          // color: Colors.deepPurple,
                                                        ),
                                                  ),
                                                ),
                                              ]),
                                        );
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.only(
                                            bottom: 12.50, top: 0),
                                        elevation: 5.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.0675,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: ListTile(
                                              // leading: Text(
                                              //   (idx + 1 > 9)
                                              //       ? '${idx + 1}'
                                              //       : ' ${idx + 1}',
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .titleMedium
                                              //       ?.copyWith(
                                              //         fontFamily: 'SourGummy',
                                              //         letterSpacing: 1,
                                              //         fontWeight: FontWeight.w600,
                                              //         color: Theme.of(context)
                                              //             .colorScheme
                                              //             .onPrimary,
                                              //         // color: Colors.deepPurple,
                                              //       ),
                                              // ),
                                              title:
                                                  // MarqueeText(
                                                  //   text: TextSpan(
                                                  //     text:
                                                  //         'This is long long long text...',
                                                  //   ),
                                                  //   style: TextStyle(
                                                  //     fontSize: 24,
                                                  //     color: Colors.white,
                                                  //   ),
                                                  //   speed: 30,
                                                  // ),
                                                  SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  allsymptoms[idx],
                                                  softWrap: false,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        fontFamily: 'SourGummy',
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                        // color: Colors.deepPurple,
                                                      ),
                                                ),
                                              ),
                                              trailing:
                                                  // IconButton(
                                                  //   icon:
                                                  Icon(
                                                Icons.arrow_forward_ios,
                                                size: 27.5,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                              // onPressed: () {
                                              //   var selected = allsymptoms[idx];
                                              // },
                                              // ),
                                            ),
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
                        // const Divider(
                        //   thickness: 3.0,
                        // ),
                        // const SizedBox(
                        //   height: 110.0,
                        // ),
                      ],
                    ),
                    (loadingAnimation)
                        ? Center(
                            child: Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircularProgressIndicator(),
                            ),
                          ))
                        : const Center(
                            child: SizedBox(
                              height: 0,
                              width: 0,
                            ),
                          ),
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
              // draglist(),
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
                                              })
                                            : debugPrint("Already Removed....");
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .primary,
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
                //                       "Search Symptoms",
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
                //                         ? Theme.of(context)
                //                             .colorScheme
                //                             .onPrimary
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
                //                 color: Theme.of(context).colorScheme.primary,
                //                 child: Padding(
                //                   padding: const EdgeInsets.fromLTRB(
                //                     2.0,
                //                     2.5,
                //                     2.0,
                //                     2.5,
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
                //                         child: Container(),
                //                       ),
                //                       Card(
                //                         child: GestureDetector(
                //                           onTap: () {
                //                             // setState(() {
                //                             //   showMore = !showMore;
                //                             // });
                //                             Scaffold.of(context)
                //                                 .openEndDrawer();
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
            ],
          ),
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
}

class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>[symptom],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: IconButton(
        tooltip: 'Back',
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: () {
          // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
          close(context, query);
        },
      ),
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text('No Results for the Search:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      )),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Returns this.query as result to previous screen, c.f.
                  // `showSearch()` above.
                  close(context, query);
                },
                child: Text(
                  query,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = query.isEmpty
        ? List.from(allsymptoms)
        : _words.where(
            (word) => word.toLowerCase().startsWith(query.toLowerCase()));

    return _SuggestionList(
      query: query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        query = suggestion;
        _history.insert(0, suggestion);
        // showResults(context);
        //                              Show after slection view
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //TODO: SDFGH
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Column(
              children: [
                Text(
                  "Adding $suggestion",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                        // color: Colors.deepPurple,
                      ),
                ),
                Divider(
                  thickness: 2.75,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
            content: Text(
              "Description : \n${descriptionsList[allsymptoms.indexOf(suggestion.toUpperCase())]}",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
            actions: <Widget>[
              // TextButton
              //   onPressed: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const Searchable()),
              //   ),
              //   child: const Text("Cancel"),
              // ),
              // TextButton(
              //   onPressed: () => {
              //     Navigator.pop(context, 'Cancel'),
              //     close(context, suggestion),
              //     const Searchable()
              //   },
              //   child: const Text("Yes"),
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       submittingList.fillRange(0, submittingList.length, "np");
              //       // s = null;
              //       i = 0;
              //       Navigator.pop(context, '');
              //     },
              //     child: Text(
              //       "Reset Field",
              //       style: Theme.of(context).textTheme.titleLarge?.copyWith(
              //             fontFamily: 'SourGummy',
              //             fontWeight: FontWeight.w900,
              //             color: Theme.of(context).colorScheme.primary,
              //           ),
              //     )),
              ElevatedButton(
                onPressed: () {
                  submittingList[i] = suggestion;
                  i += 1;
                  Navigator.pop(context, '');
                },
                child: Text(
                  "Add ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                        // color: Colors.deepPurple,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        // IconButton(
        //   tooltip: 'Voice Search',
        //   icon: const Icon(Icons.mic),
        //   onPressed: () {
        //     query = 'None';
        //   },
        // )
        // else
        Container(
          color: Theme.of(context).colorScheme.secondary,
          child: IconButton(
            tooltip: 'Clear',
            icon: const Icon(Icons.clear),
            color: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              query = '';
              showSuggestions(context);
            },
          ),
        )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList(
      {required this.suggestions,
      required this.query,
      required this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        );
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Container(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.onSecondary,
              height: 3.0,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .9,
              child: ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(
                    //initialScrollOffset: (suggestions.length)? suggestions.length as double: suggestions.length as double,
                    ),
                itemCount: suggestions.length,
                itemBuilder: (BuildContext context, int i) {
                  final String suggestion = suggestions[i];
                  return ListTile(
                    leading: Icon(
                      query.isEmpty ? Icons.search : null,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    // Highlight the substring that matched the query.
                    title: RichText(
                      text: TextSpan(
                        text: suggestion.substring(0, query.length),
                        style: textTheme.copyWith(fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: suggestion.substring(query.length),
                            style: textTheme,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      onSelected(suggestion);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
