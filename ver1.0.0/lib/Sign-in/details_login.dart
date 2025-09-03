import 'package:diseases/Sign-in/doctor_symptom.dart';
import 'package:flutter/material.dart';
import 'package:diseases/main.dart';
import 'package:hive/hive.dart';
import '../Home_Screen.dart';
import '../ML DATA/ml.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  int _mobilenum(val1) {
    setState(() {
      mobile = val1;
    });
    return 0;
  }

  void _mailset(val) {
    setState(() {
      mail = val;
    });
  }

  String loginn() {
    setState(
      () {
        debugPrint("Tapped button");
        // showDialog<String>(
        //   context: context,
        //   builder: (BuildContext context) => AlertDialog(
        //     title: const Text(
        //       "Sign - In?",
        //     ),
        //     content: Text(
        //       "Continue with:\n\n$mail",
        //     ),
        //     actions: <Widget>[
        //       TextButton(
        //         onPressed: () => {
        //           colorselection = "A",
        //           Navigator.pop(context),
        //         },
        //         child: const Text("Edit"),
        //       ),
        //       TextButton(
        //         onPressed: () async {
        //           //TODO: Hive db for person declaration.
        //           var person = await Hive.openBox("information");
        //           person.put("name0", name);
        //           person.put("name1", name1);
        //           person.put("name2", name2);
        //           person.put("fname", fullname);
        //           person.put("age", age);
        //           person.put("mail-id", mail);
        //           person.put("dob", dob);
        //           person.put("mobile", mobile);
        //           print(person.get("fname"));
        //           print(person.get("age"));
        //           print(person.get("mail-id"));
        //           print(person.get("dob"));
        //           print(person.get("mobile"));
        //           person.put("agrr", true);
        //           setState(() {
        //             fullname = (person.get("fname"));
        //             name = (person.get("name0"));
        //             name1 = (person.get("name1"));
        //             name2 = (person.get("name2"));
        //             age = (person.get("age"));
        //             dob = (person.get("dob"));
        //             mail = (person.get("mail-id"));
        //             mobile = (person.get("mobile"));
        //             agreed = person.get("agrr");
        //           });
        //           colorselection = "B";
        //           Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(builder: (context) => MyHomePage()),
        //           );
        //         },
        //         child: const Text("Sign-In"),
        //       )
        //     ],
        //   ),
        // );
      },
    );
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // colorselection = "B";
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const MyApp()),
        // );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          // appBar: AppBar(
          //   foregroundColor: Colors.white,
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   title: Text(
          //     widget.title,
          //     style: TextStyle(
          //       color: Colors.grey[600],
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          body: Stack(
            children: [
              const GradientBackGround(),
              Container(
                // height: MediaQuery.sizeOf(context).height * (1-),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.primary
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 110.0,
                    // top: 135.0,
                    left: 25.0,
                    bottom: 8.0,
                    right: 25.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.25,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 8.0, 10.0, 0.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'E-Mail',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      // fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 25.0,
                                  top: 8.0,
                                  bottom: 20.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                // initialValue: '91 ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1.5,
                                    ),
                                decoration: InputDecoration(
                                  iconColor: Colors.white,
                                  prefixText: '',
                                  border: const UnderlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      width: 5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 4,
                                    ),
                                  ),
                                  filled: true,
                                  hintText: "Enter Your E-Mail Id...",
                                  icon: const Icon(
                                    Icons.mail_outline,
                                    fill: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 8.0, 10.0, 0.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Mobile Number',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      // fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 25.0,
                                  top: 8.0,
                                  bottom: 20.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1.5,
                                    ),
                                decoration: InputDecoration(
                                  iconColor: Colors.white,
                                  prefixText: '',
                                  border: const UnderlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      width: 5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 4,
                                    ),
                                  ),
                                  filled: true,
                                  hintText: "Enter Your Mobile Number...",
                                  // labelText: "Enter Patient's name...",
                                  icon: const Icon(
                                    Icons.add_call,
                                    fill: 1.0,
                                  ),
                                ),
                                // onChanged: (val1) => _mobilenum(val1),
                                // onFieldSubmitted: (val1) => _mobilenum(val1),
                              ),
                            ),
                            // TODO: OTP Part in next line comment.
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50.0, top: 7.50),
                        child: FilledButton(
                          onPressed: () => {loginn()},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Text(
                              "Log - In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45.0,
                      ),
                    ],
                  ),
                ),
              ),
              Builder(builder: (context) {
                return AppbarCard(
                  titleAppBar: 'Log - In',
                  showBackButton: true,
                  showMoreOption: false,
                  menu: SizedBox(height: 0, width: 0),
                  menuChildren: SizedBox(height: 0, width: 0),
                );
                // return Container(
                //   color: Colors.transparent,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 35.0, left: 10.0),
                //     child: SingleChildScrollView(
                //       // scrollDirection: Axis.horizontal,
                //       child: Row(
                //         children: [
                //           Card(elevation:5.0,
                //             child: GestureDetector(
                //               onTap: () {
                //                 // Navigator.pushReplacement(
                //                 //   context,
                //                 //   MaterialPageRoute(
                //                 //       builder: (context) => const MyApp()),
                //                 // );
                //                 Navigator.pop(
                //                   context,
                //                 );
                //                 // Scaffold.of(context).openDrawer();
                //               },
                //               child: Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Icon(
                //                   Icons.arrow_back,
                //                   size: Theme.of(context)
                //                       .textTheme
                //                       .headlineSmall
                //                       ?.fontSize,
                //                   color: Theme.of(context).colorScheme.primary,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           // Card(
                //           //   child: IconButton(
                //           //       onPressed: () {
                //           //       },
                //           //       icon: const Icon(Icons.arrow_back)),
                //           // ),
                //           const SizedBox(
                //             width: 8.0,
                //           ),
                //           Card(elevation:5.0,
                //             child: Padding(
                //               padding:
                //                   EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                //               child: Text(
                //                 "Log - In",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .titleMedium
                //                     ?.copyWith(
                //                       fontFamily: 'SourGummy',
                //                       letterSpacing: 1,
                //                       fontWeight: FontWeight.w600,
                //                       color:
                //                           Theme.of(context).colorScheme.primary,
                //                       // color: Colors.deepPurple,
                //                     ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              }),
            ],
          ),
        ),
      ),
    );
    // Placeholder(
    // child: MaterialApp(
    //   title: 'mProve Med\'s',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const LogIn.LogIn(title: 'Sign-In: Disease Prediction'),
    // ),
    // );
  }
}

// class LogIn extends StatefulWidget {
//   const LogIn.LogIn({super.key, required this.title});
//   final String title;
//   // String url = '';
//   // var data , decode;
//   // String Output ='null';
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   int _mobilenum(val1) {
//     setState(() {
//       mobile = val1;
//     });
//     return 0;
//   }
//
//   void _mailset(val) {
//     setState(() {
//       mail = val;
//     });
//   }
//
//   String loginn() {
//     setState(
//       () {
//         debugPrint("Tapped button");
//         // showDialog<String>(
//         //   context: context,
//         //   builder: (BuildContext context) => AlertDialog(
//         //     title: const Text(
//         //       "Sign - In?",
//         //     ),
//         //     content: Text(
//         //       "Continue with:\n\n$mail",
//         //     ),
//         //     actions: <Widget>[
//         //       TextButton(
//         //         onPressed: () => {
//         //           colorselection = "A",
//         //           Navigator.pop(context),
//         //         },
//         //         child: const Text("Edit"),
//         //       ),
//         //       TextButton(
//         //         onPressed: () async {
//         //           //TODO: Hive db for person declaration.
//         //           var person = await Hive.openBox("information");
//         //           person.put("name0", name);
//         //           person.put("name1", name1);
//         //           person.put("name2", name2);
//         //           person.put("fname", fullname);
//         //           person.put("age", age);
//         //           person.put("mail-id", mail);
//         //           person.put("dob", dob);
//         //           person.put("mobile", mobile);
//         //           print(person.get("fname"));
//         //           print(person.get("age"));
//         //           print(person.get("mail-id"));
//         //           print(person.get("dob"));
//         //           print(person.get("mobile"));
//         //           person.put("agrr", true);
//         //           setState(() {
//         //             fullname = (person.get("fname"));
//         //             name = (person.get("name0"));
//         //             name1 = (person.get("name1"));
//         //             name2 = (person.get("name2"));
//         //             age = (person.get("age"));
//         //             dob = (person.get("dob"));
//         //             mail = (person.get("mail-id"));
//         //             mobile = (person.get("mobile"));
//         //             agreed = person.get("agrr");
//         //           });
//         //           colorselection = "B";
//         //           Navigator.pushReplacement(
//         //             context,
//         //             MaterialPageRoute(builder: (context) => MyHomePage()),
//         //           );
//         //         },
//         //         child: const Text("Sign-In"),
//         //       )
//         //     ],
//         //   ),
//         // );
//       },
//     );
//     return "";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // var drawerHeader = buildingUserAccountsDrawerHeader();
//     // final drawerItems = buildingListView(drawerHeader, context);
//     return WillPopScope(
//       onWillPop: () async {
//         // colorselection = "B";
//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => const MyApp()),
//         // );
//         return false;
//       },
//       child: Placeholder(
//         child: Scaffold(
//           // appBar: AppBar(
//           //   foregroundColor: Colors.white,
//           //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           //   title: Text(
//           //     widget.title,
//           //     style: TextStyle(
//           //       color: Colors.grey[600],
//           //       fontWeight: FontWeight.w500,
//           //     ),
//           //   ),
//           // ),
//           body: Stack(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 135.0,
//                     left: 25.0,
//                     bottom: 8.0,
//                     right: 25.0,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       Card(
//                         margin: const EdgeInsets.symmetric(
//                           vertical: 4.25,
//                         ),
//                         color: Colors.deepPurple[300],
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.fromLTRB(
//                                   48.0, 8.0, 10.0, 0.0),
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 'E-Mail',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium
//                                     ?.copyWith(
//                                       // fontSize: 20.0,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'SourGummy',
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onPrimary,
//                                     ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8.0,
//                                   right: 25.0,
//                                   top: 8.0,
//                                   bottom: 20.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.emailAddress,
//                                 // initialValue: '91 ',
//                                 decoration: InputDecoration(
//                                   iconColor: Colors.white,
//                                   prefixText: '',
//                                   border: const UnderlineInputBorder(),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: const BorderSide(
//                                       color: Colors.purpleAccent,
//                                       width: 2.5,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: const BorderSide(
//                                       color: Colors.deepPurple,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   filled: true,
//                                   hintText: "Enter Your E-Mail Id...",
//                                   // labelText: "Enter Patient's name...",
//                                   icon: const Icon(
//                                     Icons.mail_outline,
//                                     fill: 1.0,
//                                   ),
//                                 ),
//                                 // onChanged: (val1) => _mailset(val1),
//                                 // onFieldSubmitted: (val1) => _mailset(val1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                         margin: const EdgeInsets.symmetric(vertical: 15.0),
//                         color: Colors.deepPurple[300],
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.fromLTRB(
//                                   48.0, 8.0, 10.0, 0.0),
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 'Mobile Number',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium
//                                     ?.copyWith(
//                                       // fontSize: 20.0,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'SourGummy',
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onPrimary,
//                                     ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8.0,
//                                   right: 25.0,
//                                   top: 8.0,
//                                   bottom: 20.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.phone,
//                                 decoration: InputDecoration(
//                                   iconColor: Colors.white,
//                                   prefixText: '',
//                                   border: const UnderlineInputBorder(),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: const BorderSide(
//                                       color: Colors.purpleAccent,
//                                       width: 2.5,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: const BorderSide(
//                                       color: Colors.deepPurple,
//                                       width: 2,
//                                     ),
//                                   ),
//                                   filled: true,
//                                   hintText: "Enter Your Mobile Number...",
//                                   // labelText: "Enter Patient's name...",
//                                   icon: const Icon(
//                                     Icons.add_call,
//                                     fill: 1.0,
//                                   ),
//                                 ),
//                                 // onChanged: (val1) => _mobilenum(val1),
//                                 // onFieldSubmitted: (val1) => _mobilenum(val1),
//                               ),
//                             ),
//                             // TODO: OTP Part in next line comment.
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 50.0, right: 50.0, top: 7.50),
//                         child: FilledButton(
//                           onPressed: () => {loginn()},
//                           child: const Padding(
//                             padding: EdgeInsets.only(left: 30.0, right: 30.0),
//                             child: Text(
//                               "Log - In",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 20.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 45.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Builder(builder: (context) {
//                 return const AppbarCard(
//                   titleAppBar: "Log - In",
//                   menu: SizedBox(
//                     height: 0,
//                     width: 0,
//                   ),
//                   menuChildren: SizedBox(
//                     height: 0,
//                     width: 0,
//                   ),
//                   showBackButton: true,
//                   showMoreOption: false,
//                 );
//                 // return Container(
//                 //   color: Colors.white,
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.only(top: 35.0, left: 10.0),
//                 //     child: Row(
//                 //       children: [
//                 //         Card(
//                 //           child: IconButton(
//                 //               onPressed: () {
//                 //                 // Navigator.pushReplacement(
//                 //                 //   context,
//                 //                 //   MaterialPageRoute(
//                 //                 //       builder: (context) => const MyApp()),
//                 //                 // );
//                 //                 Navigator.pop(
//                 //                   context,
//                 //                 );
//                 //                 // Scaffold.of(context).openDrawer();
//                 //               },
//                 //               icon: const Icon(Icons.arrow_back)),
//                 //         ),
//                 //         const SizedBox(
//                 //           width: 8.0,
//                 //         ),
//                 //         const Card(
//                 //           child: Padding(
//                 //             padding: EdgeInsets.symmetric(
//                 //                 vertical: 10.0, horizontal: 20.0),
//                 //             child: Text(
//                 //               "Log - In",
//                 //               style: TextStyle(
//                 //                 fontSize: 22.0,
//                 //                 fontWeight: FontWeight.w600,
//                 //                 color: Colors.deepPurple,
//                 //               ),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
