import 'dart:async';
import 'package:diseases/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart
class SettingsHistory extends StatefulWidget {
  const SettingsHistory({super.key});

  @override
  _SettingsHistoryState createState() => _SettingsHistoryState();
}

class _SettingsHistoryState extends State<SettingsHistory> {
  bool _loadx = false;
  bool showMore = false;
  bool reverseSorting = true;
  // int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        milliseconds: 1750,
      ),
      () async {
        setState(() {
          _loadx = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        // appBar: AppBar(
        //   backgroundColor: Colors.deepPurple,
        //   foregroundColor: Colors.white,
        //   title: Text('$fullname\n$mail'),
        //   toolbarHeight: 100.0,
        // ),
        body: Stack(
          children: [
            const GradientBackGround(),
            Card(
              margin: bodyCardMargin.copyWith(top: (showMore) ? 100.0 : 100.0),
              // margin: bodyCardMargin.copyWith(top: (showMore) ? 185.0 : 100.0),
              child: Padding(
                padding: const EdgeInsets.only(),
                // padding: const EdgeInsets.fromLTRB(10.0, 75.0, 10.0, 1.0),
                child: (!_loadx)
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 150.0),
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Loading...",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 25.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : (historyListDatabase.isEmpty)
                        ? SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0,
                                  MediaQuery.sizeOf(context).width),
                              child: Center(
                                child: Text(
                                  "No Prediction History Found.",
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
                              ),
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height * 1,
                            child: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child:
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   children: [
                                  ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                reverse: (!reverseSorting),
                                children: listChildview(context),
                              ),
                              // ],
                              // ),
                            )
                            // : Padding(
                            //     padding: const EdgeInsets.fromLTRB(
                            //         0.0, 45.0, 0.0, 45.0),
                            //     child: Text(
                            //       "No Prediction History Found.",
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .titleMedium
                            //           ?.copyWith(
                            //             fontFamily: 'SourGummy',
                            //             letterSpacing: 1,
                            //             fontWeight: FontWeight.w600,
                            //             color: Theme.of(context)
                            //                 .colorScheme
                            //                 .primary,
                            //             // color: Colors.deepPurple,
                            //           ),
                            //     ),
                            //   ),
                            ),

                // PaginatedDataTable(
                //         // header: const Text("Your Previous Predictions"),
                //         dataRowHeight: 185.0,
                //         rowsPerPage: _rowsPerPage,
                //         availableRowsPerPage: <int>[1, 5, _rowsPerPage],
                //         onRowsPerPageChanged: (int? value) {
                //           // if (value != null) {
                //           //   setState(() => _rowsPerPage = value);
                //           // }
                //         },
                //         columns: kTableColumns,
                //         source: DessertDataSource(),
                //       ),
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
                titleAppBar: "Prediction History",
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
                        (showMore) ? Icons.keyboard_arrow_up : Icons.more_vert,
                        size: Theme.of(context).textTheme.titleLarge?.fontSize,
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
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          // title: const Text('Trying...Still Loading...'),
                                          title: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Delete All History Reports?",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
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
                                              Divider(
                                                thickness: 2.75,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
                                              ),
                                            ],
                                          ),
                                          content: Text(
                                            'This Will Permanently Delete ALL the History Reports for this Account.\n\nDo You Want To Delete ALL the  Predictions?',
                                            textAlign: TextAlign.justify,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'SourGummy',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary,
                                                  // color: Colors.deepPurple,
                                                ),
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () => {
                                                    Navigator.pop(context),
                                                  },
                                                  child: Text(
                                                    "No",
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
                                                                  .onSecondary,
                                                          // color: Colors.deepPurple,
                                                        ),
                                                  ),
                                                ),
                                                // Expanded(
                                                //   child: Container(),
                                                // ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    if (historyListDatabase
                                                        .isNotEmpty) {
                                                      var DB =
                                                          await Hive.openBox(
                                                              "information");
                                                      setState(() {
                                                        historyListDatabase
                                                            .clear();
                                                        debugPrint(
                                                            "Deleted All History");
                                                        DB.put("PredictHistory",
                                                            historyListDatabase);
                                                        historyListDatabase =
                                                            DB.get(
                                                                "PredictHistory");
                                                      });
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        showMore = !showMore;
                                                      });
                                                    }
                                                  },
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Text(
                                                    "Yes, Delete ALL",
                                                    // Sign-In "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(
                                                          fontFamily:
                                                              'SourGummy',
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .error,
                                                          // color: Colors.deepPurple,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 5.0, 10.0),
                                          child: Text(
                                            "Delete All",
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
                                              .error,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5.0, 5.0, 5.0, 5.0),
                                            child: Icon(
                                              Icons.folder_delete_outlined,
                                              size: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.fontSize,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onError,
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
                                      setState(() {
                                        reverseSorting = !reverseSorting;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 5.0, 10.0),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              (reverseSorting)
                                                  ? "Sort by Time"
                                                  : "Reset Sorting",
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
                                              (reverseSorting)
                                                  ? Icons.filter_alt
                                                  : Icons.filter_alt_off,
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
                showBackButton: true,
                showMoreOption: true,
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
              //           padding: const EdgeInsets.symmetric(
              //               vertical: 10.0, horizontal: 20.0),
              //           child: Text(
              //             "Prediction History",
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
              //   // Row(
              //   //   children: [
              //   //     Card(
              //   //       child: IconButton(
              //   //           onPressed: () {
              //   //             Navigator.of(context).pop(
              //   //               context,
              //   //             );
              //   //           },
              //   //           icon: Icon(
              //   //             Icons.arrow_back,
              //   //             color: Theme.of(context).colorScheme.primary,
              //   //           )),
              //   //     ),
              //   //     const SizedBox(
              //   //       width: 8.0,
              //   //     ),
              //   //     Card(
              //   //       child: Padding(
              //   //         padding: EdgeInsets.symmetric(
              //   //             vertical: 10.0, horizontal: 20.0),
              //   //         child: Text(
              //   //           "Prediction History",
              //   //           style: Theme.of(context)
              //   //               .textTheme
              //   //               .headlineSmall
              //   //               ?.copyWith(
              //   //                   fontWeight: FontWeight.w600,
              //   //                   fontFamily: 'SourGummy',
              //   //                   color: Theme.of(context).colorScheme.primary),
              //   //         ),
              //   //       ),
              //   //     ),
              //   //   ],
              //   // ),
              // );
            }),

            // Builder(builder: (context) {
            //   return Padding(
            //     padding: const EdgeInsets.only(top: 25.0, left: 10.0),
            //     child: GestureDetector(
            //       onTap: () {
            //         Navigator.of(context).pop(
            //           context,
            //         );
            //       },
            //       child: Card(
            //
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               const Icon(Icons.arrow_back,size: 30.0,color: Colors.deepPurple,),
            //               SizedBox(width: 20.0,),
            //               Text("Your Previous Predictions",style: TextStyle(fontSize: 20.0,color: Colors.deepPurple),),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // })
          ],
        ),
      ),
    );
  }

  List<Widget> listChildview(BuildContext context) {
    return [
      for (int ii = historyListDatabase.length - 1; ii >= 0; ii--)
        // for (int ii = 1;
        //     ii < historyListDatabase.length;
        //     ii++)
        Card(
          elevation: 5.0,
          margin: const EdgeInsets.only(
            left: 12.5,
            right: 12.5,
            bottom: 10.0,
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child:
                  // ("${historyListDatabase[ii]["Key"]}" !=
                  //         "")
                  //     ?
                  ExpansionTile(
                title: Text(
                  "${historyListDatabase[ii]["Key"]}".substring(
                    0,
                    "${historyListDatabase[ii]["Key"]}".indexOf(
                      "at",
                    ),
                  ),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 5,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                        // color: Colors.deepPurple,
                      ),
                ),
                subtitle: Text(
                  "Time: ${"${historyListDatabase[ii]["Key"]}".substring(
                    "${historyListDatabase[ii]["Key"]}".indexOf(
                          "at ",
                        ) +
                        3,
                  )}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'SourGummy',
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                        // color: Colors.deepPurple,
                      ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                children: [
                  Divider(
                    color: Theme.of(context).colorScheme.onPrimary,
                    thickness: 2.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.50,
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              // title: const Text('Trying...Still Loading...'),
                              title: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Delete This History Report?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
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
                                  ),
                                  Divider(
                                    thickness: 2.75,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ],
                              ),
                              content: Text(
                                'This Will Permanently Delete This History Report.\n\nDo You Want To Delete This History?',
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      // color: Colors.deepPurple,
                                    ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () => {
                                        Navigator.pop(context),
                                      },
                                      child: Text(
                                        "No",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                              // color: Colors.deepPurple,
                                            ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: Container(),
                                    // ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var DB =
                                            await Hive.openBox("information");
                                        setState(() {
                                          historyListDatabase.removeAt(ii);
                                          debugPrint("Deleted : $ii");
                                          DB.put("PredictHistory",
                                              historyListDatabase);
                                          historyListDatabase =
                                              DB.get("PredictHistory");
                                        });
                                        Navigator.pop(context);
                                      },
                                      clipBehavior: Clip.antiAlias,
                                      child: Text(
                                        "Yes, Delete",
                                        // Sign-In "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                              // color: Colors.deepPurple,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 5.0, 10.0),
                              child: Text(
                                "Delete This Prediction Report",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      // color: Colors.deepPurple,
                                    ),
                              ),
                            ),
                            Card(
                              elevation: 5.0,
                              color: Theme.of(context).colorScheme.error,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.delete_forever,
                                  size: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.50,
                    ),
                    child: Card(
                      elevation: 5.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7.5,
                              bottom: 7.5,
                            ),
                            child: Text(
                              "Symptoms were:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: 'SourGummy',
                                    letterSpacing: 2.5,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    // color: Colors.deepPurple,
                                  ),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 2.5,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            children: [
                              for (int iii = 0;
                                  iii <
                                      historyListDatabase[ii]["Symptoms"]
                                          .length;
                                  iii++)
                                ("ERR" !=
                                        "${historyListDatabase[ii]["Symptoms"][iii]}")
                                    ? ListTile(
                                        leading: Text(
                                          "${iii + 1}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                letterSpacing: 2.5,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                // color: Colors.deepPurple,
                                              ),
                                        ),
                                        title: Text(
                                          "${historyListDatabase[ii]["Symptoms"][iii]}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                letterSpacing: 2.5,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                // color: Colors.deepPurple,
                                              ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Card(
                      elevation: 5.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7.5,
                              bottom: 7.5,
                            ),
                            child: Text(
                              "Disease Predicted were:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: 'SourGummy',
                                    letterSpacing: 2.5,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    // color: Colors.deepPurple,
                                  ),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 2.5,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            children: [
                              for (int iii = 0;
                                  iii <
                                      historyListDatabase[ii]["Result"].length;
                                  iii++)
                                ("ERR" !=
                                        "${historyListDatabase[ii]["Result"][iii]}")
                                    ? ListTile(
                                        leading: Text(
                                          "${iii + 1}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                letterSpacing: 2.5,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                // color: Colors.deepPurple,
                                              ),
                                        ),
                                        title: Text(
                                          "${historyListDatabase[ii]["Result"][iii]}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily: 'SourGummy',
                                                letterSpacing: 2.5,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                // color: Colors.deepPurple,
                                              ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
              // : Align(
              //     alignment:
              //         Alignment.center,
              //     child: Text(
              //       "No Prediction History found.",
              //       style: Theme.of(context)
              //           .textTheme
              //           .titleMedium
              //           ?.copyWith(
              //             fontFamily:
              //                 'SourGummy',
              //             letterSpacing: 1,
              //             fontWeight:
              //                 FontWeight
              //                     .w600,
              //             color: Theme.of(
              //                     context)
              //                 .colorScheme
              //                 .primary,
              //             // color: Colors.deepPurple,
              //           ),
              //     ),
              //   ),
              ),
        )
    ];
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Symptoms'),
    tooltip: 'You marked this as Symptom',
  ),
  DataColumn(
    label: Text('Predicted Disease'),
    tooltip: 'Predicted Disease',
  ),
];

////// Data class.
class manageList {
  manageList(
    this.S1,
    this.o1,
  );
  final String S1;
  final String o1;

  bool selected = false;
}

List<manageList> histentry = <manageList>[
  manageList(
    '''symptom 1,
symptom 2
symptom 3,
symptom 4
symptom 5,
symptom 6''',
    '''disease1
disease2
disease3
disease4
disease5
disease6''',
  ),
  // Dessert('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
  // Dessert('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
  // Dessert('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
  // Dessert('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
  // Dessert('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
  // Dessert('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
  // Dessert('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
  // Dessert('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
  // Dessert('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
  // Dessert('Frozen yogurt with sugar', 168, 6.0, 26, 4.0, 87, 14, 1),
  // Dessert('Ice cream sandwich with sugar', 246, 9.0, 39, 4.3, 129, 8, 1),
  // Dessert('Eclair with sugar', 271, 16.0, 26, 6.0, 337, 6, 7),
  // Dessert('Cupcake with sugar', 314, 3.7, 69, 4.3, 413, 3, 8),
  // Dessert('Gingerbread with sugar', 345, 16.0, 51, 3.9, 327, 7, 16),
  // Dessert('Jelly bean with sugar', 364, 0.0, 96, 0.0, 50, 0, 0),
  // Dessert('Lollipop with sugar', 401, 0.2, 100, 0.0, 38, 0, 2),
];

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= histentry.length) return null;
    final manageList dessert = histentry[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (bool? value) {
        if (value == null) return;
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(dessert.S1)),
        DataCell(Text(dessert.o1)),
        // DataCell(Text(dessert.S2.toStringAsFixed(1))),
        // DataCell(Text('${dessert.S3}')),
        // DataCell(Text(dessert.protein.toStringAsFixed(1))),
        // DataCell(Text('${dessert.sodium}')),
        // DataCell(Text('${dessert.calcium}%')),
        // DataCell(Text('${dessert.iron}%')),
      ],
    );
  }

  @override
  int get rowCount => histentry.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

// import 'package:flutter/material.dart';
//
// Map<String,String> hist = {"Symtpons1":"Output1","Symtpons2":"Output2"};
// class SettingsHistory extends StatefulWidget {
//   const SettingsHistory({super.key});
//
//   @override
//   State<SettingsHistory> createState() => _SettingsHistoryState();
// }
//
// class _SettingsHistoryState extends State<SettingsHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return  Placeholder(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("All Setting"),
//         ),
//         body: ListView.builder(shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: hist.length,
//           itemBuilder: (context, idx) {
//             // if (hist.keys != "np") {
//               return ListTile(
//                 leading: Text("Map Symptoms"),
//                 title: Text("Map Prediction"),
//               );
//             // } else {
//               // Handle null or "None" values gracefully
//               // return const ListTile();
//             // }
//           },),
//       ),
//     );
//   }
// }
