import 'package:diseases/ML%20DATA/drop_down.dart';
import 'package:diseases/ML%20DATA/drop_single_entry.dart';
import 'package:diseases/ML%20DATA/Results.dart';
import 'package:diseases/ML%20DATA/search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../Sign-in/Setting_history.dart';
import '../main.dart';


// class Two extends StatefulWidget {
//   const Two({super.key});
//   @override
//   State<Two> createState() => _TwoState();
// }
//
// class _TwoState extends State<Two> {
//
//   @override
//   Widget build(BuildContext context) {
//     var drawerHeader = buildingUserAccountsDrawerHeader();
//     final drawerItems = buildingListView(drawerHeader, context);
//     return Placeholder(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('HOME: About M.L.'),
//           elevation: 1.0,
//         ),
//         body: Center(
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Hey.. $name !!, Welcome to <appname> App.",
//                   ),
//                   Card(
//                     color: Colors.deepPurple[200],
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
                  //         Expanded(
                  //           child: Column(
                  //             T,
                  //             Text(
                  //               "By Signing-In, You can store and access the historical -Predictions Resullts in our Database.",softw
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin: const EdgeInsets.all(15.0),
                  //   color: Colors.deepPurple[300],
                  //   shape: const Border.symmetric(),
                    // child: Column(
                    //   children: [
                    //     Container(
                    //       padding:
                    //           const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
                    //       alignment: Alignment.topLeft,
                    //       child: const Center(
                    //         child: Text(
                    //           'By Signing-In, You can store and access the historical -Predictions Results in our Database.',
                    //           softWrap: true,

                              // style: Theme.of(context).textTheme.headlineMedium,
                              // style: TextStyle(
                              //   color: Colors.white,
                              // ),
                            // ),
                          // ),
                        // ),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                        //   child: Column(
                        //     children: [
                        //       TextField(
                        //         onChanged: null, () {
                        //           url = 'http://127.0.0.1:57858/api?query=$name';
                              //   },
                              // ),
                              // TextFormField(
                              //   keyboardType: TextInputType.text,
                              //   // initialValue: '91 ',
                              //   decoration: const InputDecoration(
                              //     prefixText: '',
                              //     border: UnderlineInputBorder(),
                              //     filled: true,
                              //     hintText: "Symptoms...",
                              //     // labelText: "Enter Patient's name...",
                              //     // icon: Icon(
                              //     //   Icons.add_call,
                              //     //   fill: 1.0,
                              //     // )
                              //   ),
                              //   // onChanged: (val) => _incrementCounter(val),
                              //   // onFieldSubmitted: (val) => _incrementCounter(val),
                              //   onChanged: (val1) => _sym(val1),
                              //   onFieldSubmitted: (val1) => _sym(val1),
                              // ),

                              // Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       OutlinedButton(
                              //         style: OutlinedButton.styleFrom(
                              //             backgroundColor: Colors.white,
                              //             foregroundColor:
                              //                 Colors.deepPurple[900]),
                              //         onPressed: () {},
                              //         child: const Text("Cancel"),
                              //       ),
                              //       FilledButton(
                              //         onPressed: () {},
                              //         child: const Text("Sign-In"),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Text(
                              //   output,
                              //   style: const TextStyle(
                              //       fontSize: 40, color: Colors.green),
                              // ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     GestureForRouting(
                              //         context, "Search", const Searchable()),
                              //     const VerticalDivider(),
                              //     GestureForRouting(context, "Recommended",
                              //         const DropDownSingle()),
                              //     const VerticalDivider(),
                              //     GestureForRouting(context, "Professional",
                              //         const DropDown()),
                              //   ],
                              // ),
                              // GestureDetector(
                              //   child: Container(
                              //     width: 100.0,
                              //     height: 100.0,
                              //     child: Card(
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //       child: Padding(
                              //         padding: EdgeInsets.all(8.0),
                              //         child: Text(
                              //           "NEXT - Search Page",
                              //           softWrap: true,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              //   onTap: () {
                              //     symptom1;
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //           const Searchable()),
                              //     );
                              //   },
                              // ),
                              // const Divider(),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     symptom1;
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => const DropDown()),
                              //     );
                              //   },
                              //   child: const Text(
                              //     "NEXT - DropDown Page",
                              //     softWrap: true,
                              //   ),
                              // ),
                              // const Divider(),
                              // MaterialButton(
                              //   onPressed: () {
                              //     symptom1;
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const DropDownSingle()),
                              //     );
                              //   },
                              //   child: const Text(
                              //     "NEXT - DropDown-Single Entry Page",
                              //     softWrap: true,
                              //   ),
                              // ),

                              // ListView.builder(
                              //   itemCount: allsymptoms.length,
                              //   itemBuilder: (context, idx) => ListTile(
                              //     title: Text(allsymptoms[idx]),
                              //   ),
                              // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     margin: const EdgeInsets.all(15.0),
//                     color: Colors.deepPurple[300],
//                     // shape: const Border.symmetric(),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding:
//                               const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
//                           alignment: Alignment.topLeft,
//                           child: const Center(
//                             child: Text(
//                               'Our App is a Machine Learning Model- Based Appilication, has well-Trained Model to Predict - 41 Distinct Symptoms with the combination of 132 Symptoms included as 5000 combinations. It has an Accuracy of About 93.4% by the Voting Classifier Ensemble Model - of Support Vector Machine , K- Nearest Neighbors, Random Forest Classifier.',
//                               softWrap: true,
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     OutlinedButton(
//                                       style: OutlinedButton.styleFrom(
//                                           backgroundColor: Colors.white,
//                                           foregroundColor:
//                                               Colors.deepPurple[900]),
//                                       onPressed: () {},
//                                       child: const Text("Learn More"),
//                                     ),
//                                     FilledButton(
//                                       onPressed: () {},
//                                       child: const Text("Predict Your Disease"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     margin: const EdgeInsets.all(15.0),
//                     color: Colors.deepPurple[300],
//                     // shape: const Border.symmetric(),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding:
//                               const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
//                           alignment: Alignment.topLeft,
//                           child: const Center(
//                             child: Text(
//                               'In this App, You can find 3 different Ways to make the list of Symptoms to be predicted, which can be seen on the bottom of the Page. Also, You can remove all the Symptoms if ann one of them is wrongly added, their is no need to check if any symptom is submitted omore than one as, it will be counted Once only.',
//                               softWrap: true,
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     GestureForRouting(
//                                         context,
//                                         "Predict by Searching the Symptoms",
//                                         const Searchable()),
//                                     GestureForRouting(
//                                         context,
//                                         "Predict by List of MAX 20 Symptoms.(Recommended)",
//                                         const DropDown()),
//                                     GestureForRouting(
//                                         context,
//                                         "Predict by Add one Symptoms at a time.(Professional)",
//                                         const DropDownSingle()),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         drawer: Drawer(
//           child: drawerItems,
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           tooltip: 'Return to Home Page',
//           isExtended: true,
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const MyApp()),
//           ),
//           label: const Row(
//             children: [
//               Icon(Icons.home),
//               Text(" | "),
//               Text("HOME"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   GestureDetector GestureForRouting(
//       BuildContext context, String Message, dynamic Router) {
//     return GestureDetector(
//       child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Container(
//           width: 200.0,
//           height: 80.0,
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 Message,
//                 style: const TextStyle(
//                     color: Colors.deepPurple, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//                 softWrap: true,
//               ),
//             ),
//           ),
//         ),
//       ),
//       onTap: () {
//         // symptom1;
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Router),
//         );
//       },
//     );
//   }
// }
//
// ProcessOutput(String url)async{
//   http.Response response=await http.get(Uri.parse(url));
//   return response.body;
// }
// class MLhome extends StatefulWidget {
//   const MLhome({super.key});
//
//   @override
//   State<MLhome> createState() => _MLhomeState();
// }
//
// class _MLhomeState extends State<MLhome> {
//   String url = '';
//   var data , decode;
//   String Output ='null';
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("3rd Page ML"),
//         ),
//         body: ListView(
//           children: [
//             TextFormField(onChanged: (va){
//               url = "http://10.0.2.2:5000/?input_data=$va";
//             },),
//             OutlinedButton(
//                 onPressed: ()async {
//                   data = await ProcessOutput(url);
//                   decode = jsonDecode(data);
//                   setState(() {
//                     Output= decode['result'];
//                   });
//                 },
//                 child: const Text("Process the Result")
//             ),
//             Text("Output is $Output"),
//           ],
//         ),
//       )
//     );
//   }
// }

// void main() {
//   runApp(MyApp1());
// }
//
// class MyApp1 extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   MyApp1({super.key});
//
//   Future<void> processInputData(String inputData) async {
//     final response = await http.post(
//       Uri.parse('http://your-backend-url/process_data'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'input_data': inputData,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       print('Processed data from server: $data[\'result\']');
//     } else {
//       print('Failed to process data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Process Data with Python'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: _controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter data to process',
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   String inputData = _controller.text;
//                   await processInputData(inputData);
//                 },
//                 child: const Text('Process Data'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

// class DataProcessingScreen extends MaterialPageRoute<void> {
//   final TextEditingController textEditingController;
//
//   DataProcessingScreen({required this.textEditingController})
//       : super(builder: (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Process Data with Python'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: textEditingController,
//               decoration: InputDecoration(
//                 labelText: 'Enter data to process',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Call processInputData when the button is pressed
//                 processInputData(context);
//               },
//               child: Text('Process Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   });
//
//   Future<String> processInputData(BuildContext context) async {
//     String inputData = textEditingController.text;
//     final response = await http.post(
//       Uri.parse('http://your-backend-url/process_data'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'input_data': inputData,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       String out = data['result'];
//       print('Processed data from server:$out');
//       Navigator.pop(context, out); // Return processed data to previous screen
//     } else {
//       print('Failed to process data');
//     }
//     return '';
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// void main() {
//   runApp(MyApp1());
// }
//
// class MyApp1 extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   MyApp1({super.key});
//
//   Future<void> processInputData(String inputData) async {
//     final response = await http.post(
//       Uri.parse('http://your-backend-url/process_data'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'input_data': inputData,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       print('Processed data from server: $data[\'result\']');
//     } else {
//       print('Failed to process data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Process Data with Python'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: _controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter data to process',
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   String inputData = _controller.text;
//                   await processInputData(inputData);
//                 },
//                 child: const Text('Process Data'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:python/python.dart' as python;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Passing Data to Python'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               // Initialize Python interpreter
//               await python.Python.init();
//
//               // Define the input data from Dart
//               int inputData = 10;
//
//               // Call the Python script and pass the input data
//               var result = await python.Python.execute(
//                   'path/to/your/process_data.py', arguments: [inputData]);
//
//               // Print or process the result returned by the Python script
//               print('Processed data from Python:', result);
//
//               // Close the Python interpreter
//               await python.Python.exit();
//             },
//             child: Text('Process Data with Python'),
//           ),
//         ),
//       ),
//     );
//   }
// }
