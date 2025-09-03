import 'dart:async';

import 'package:diseases/Sign-in/about_us.dart';
import 'package:diseases/Sign-in/details_login.dart';
import 'package:diseases/Sign-in/doctor_symptom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:diseases/main.dart';
import 'package:hive/hive.dart';
import '../Home_Screen.dart';
import '../ML DATA/ml.dart';

List<String> docsymp = List.filled(allsymptoms.length, "__D__");

class REGISTER extends StatefulWidget {
  const REGISTER({super.key});

  @override
  State<REGISTER> createState() => _REGISTERState();
}

class _REGISTERState extends State<REGISTER> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mProve Med\'s',
      theme: ThemeData(
        // textTheme: TextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SignIn(title: 'Sign-In: Disease Prediction'),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.title});
  final String title;
  // String url = '';
  // var data , decode;
  // String Output ='null';

  @override
  State<SignIn> createState() => _SignInState();
}

// }

// ProcessOutput(String ur)async{
//127.0.0.1:5000//////10.0.2.2:5000
// return await Uri.http('127.0.0.1:5000', "/api",{'input': ur});//http.get(Uri.parse(url));
// http.Response response = await get(Uri.parse('http://10.0.2.2:5000/$ur'));//http.get(Uri.parse(url));
// }
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'HealthCure',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SignIn(title: 'HealthCure: Disease Predictor'),
//     );
//   }
// }

class _SignInState extends State<SignIn> {
  final GlobalKey signininfocus = GlobalKey();
  void _name(val) {
    setState(() {
      name = val;
    });
  }

  void _middlename(val) {
    setState(() {
      name1 = val;
    });
  }

  void _lastname(val) {
    setState(() {
      name2 = val;
    });
  }

  int _mobilenum(val1) {
    setState(() {
      mobile = val1;
    });
    return 0;
  }

  // int _agee(val2) {
  //   setState(() {
  //     age = val2;
  //   });
  //   return 0;
  // }

  void _mailset(val) {
    setState(() {
      mail = val;
    });
  }

  Future<void> signInSetState() async {
    //TODO: Hive db for person declaration.
    dateSign = "";
    dateSign +=
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} at ";
    if (DateTime.now().hour > 12) {
      // dateSign += "${DateTime.now().hour - 12}";
      dateSign += ((DateTime.now().hour - 12) > 9)
          ? "${DateTime.now().hour - 12}"
          : "0${DateTime.now().hour - 12}";
      dateSign += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      dateSign += " PM.";
    } else {
      dateSign += ((DateTime.now().hour) > 9)
          ? "${DateTime.now().hour}"
          : "0${DateTime.now().hour}";
      dateSign += (DateTime.now().minute > 9)
          ? " : ${DateTime.now().minute}"
          : " : 0${DateTime.now().minute}";
      dateSign += " AM.";
    }

    var person = await Hive.openBox("information");
    person.put("name0", name);
    person.put("name1", name1);
    person.put("name2", name2);
    person.put("fname", fullname);
    person.put("age", age);
    person.put("gender", gender);
    person.put("mail-id", mail);
    person.put("dob", dob);
    person.put("mobile", mobile);
    person.put("date", dateSign);

    print(person.get("fname"));
    print(person.get("age"));
    print(person.get("gender"));
    print(person.get("mail-id"));
    print(person.get("dob"));
    print(person.get("mobile"));
    print(person.get("date"));

    person.put("agrr", true);
    person.put("Is Doctor", isdoctor);
    setState(() {
      fullname = (person.get("fname"));
      name = (person.get("name0"));
      name1 = (person.get("name1"));
      name2 = (person.get("name2"));
      age = (person.get("age"));
      gender = (person.get("gender"));
      dob = (person.get("dob"));
      mail = (person.get("mail-id"));
      mobile = (person.get("mobile"));
      agreed = person.get("agrr");
      dateSign = person.get("date");
    });
    colorselection = "B";
  }

  String submits() {
    setState(
      () {
        if (name == "" || name2 == "" || name2 == "") {
          fullname = "";
        } else if (name1 == "") {
          fullname = "$name $name2";
        } else {
          fullname = "$name $name1 $name2";
        }
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign - In?",
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
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Continue with:\n",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'SourGummy',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                          // color: Colors.deepPurple,
                        ),
                  ),
                  TextSpan(
                    text: mail,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: 'SourGummy',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                          // color: Colors.deepPurple,
                        ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => {
                      colorselection = "A",
                      Navigator.pop(context),
                    },
                    child: Text(
                      "Edit",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontFamily: 'SourGummy',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                            // color: Colors.deepPurple,
                          ),
                    ),
                  ),
                  // Expanded(
                  //   child: Container(),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        colorselection = "B";
                        signInSetState();
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    clipBehavior: Clip.antiAlias,
                    child: Text(
                      "Continue",
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
            ],
          ),
        );
      },
    );
    return "";
  }

  String submitdoctor() {
    setState(
      () {
        if (name1 == "") {
          fullname = "Dr. $name $name2";
        } else {
          fullname = "Dr. $name $name1 $name2";
        }
        showDialog<String>(
          //TODO: Doctors make Register
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            content: Text(
              "Please Select the Disease, which you specialises to diagnosis.",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontFamily: 'SourGummy',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                            // color: Colors.deepPurple,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetSymptoms(),
                        ),
                      ),
                    },
                    child: Text(
                      "Proceed",
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
              )
            ],
          ),
        );
      },
    );
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // var drawerHeader = buildingUserAccountsDrawerHeader();
    // final drawerItems = buildingListView(drawerHeader, context);
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
        color: Colors.transparent,
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
              // Container(
              //   // height: MediaQuery.sizeOf(context).height * (1-),
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Theme.of(context).colorScheme.secondaryContainer,
              //         Theme.of(context).colorScheme.primary
              //       ],
              //     ),
              //   ),
              // ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 75.0,
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(
                        // top: 110.0,
                        left: 25.0,
                        bottom: 8.0,
                        right: 25.0),
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.25),
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: [
                            //TODO
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 8.0, 10.0, 0.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Full Name',
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
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 8.0, 25.0, 1.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
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
                                    hintText: "Enter Your First Name...",
                                    icon: const Icon(
                                      Icons.account_circle_outlined,
                                      fill: 1.0,
                                    )),
                                onChanged: (val) => _name(val),
                                onFieldSubmitted: (val) => _name(val),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 1.0, 25.0, 1.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1.5,
                                    ),
                                decoration: InputDecoration(
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
                                  hintText: "Middle Name...",
                                ),
                                onChanged: (val) => _middlename(val),
                                onFieldSubmitted: (val) => _middlename(val),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 1.0, 25.0, 8.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1.5,
                                    ),
                                decoration: InputDecoration(
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
                                  hintText: "Last Name...",
                                ),
                                onChanged: (val) => _lastname(val),
                                onFieldSubmitted: (val) => _lastname(val),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.25),
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
                                  bottom: 8.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      letterSpacing: 1.5,
                                    ),
                                // initialValue: '91 ',
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
                                  // labelText: "Enter Patient's name...",
                                  icon: const Icon(
                                    Icons.mail_outline,
                                    fill: 1.0,
                                  ),
                                ),
                                onChanged: (val1) => _mailset(val1),
                                onFieldSubmitted: (val1) => _mailset(val1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.25),
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
                                  bottom: 8.0),
                              child: TextFormField(
                                // textInputAction: TextInputAction.next,
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
                                  icon: Icon(
                                    Icons.add_call,
                                    fill: 1.0,
                                  ),
                                ),
                                onChanged: (val1) => _mobilenum(val1),
                                onFieldSubmitted: (val1) => _mobilenum(val1),
                              ),
                            ),
                            // TODO: OTP Part in next line comment.
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.25),
                        color: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 8.0, 10.0, 0.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Date of Birth',
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
                                  left: 48.0,
                                  right: 25.0,
                                  top: 8.0,
                                  bottom: 8.0),
                              child: ListTile(
                                title: Text(
                                  (dob == '')
                                      ? "Enter your D.O.B..."
                                      : "$dob  - $age Years",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SourGummy',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        letterSpacing: 1.5,
                                      ),
                                ),
                                // trailing: const Icon(
                                //   Icons.date_range,
                                // ),
                                tileColor: Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 4,
                                  ),
                                ),
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    helpText: "Select your Date of Birth:",
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime.utc(DateTime.now().year - 100),
                                    lastDate: DateTime.now(),
                                  ).then(
                                    (DateTime? value) {
                                      if (value != null) {
                                        setState(
                                          () {
                                            dynamic fromdate =
                                                DateTime.now().year;
                                            fromdate =
                                                "${value.day}/${value.month}/${value.year}";
                                            dob = fromdate;
                                            print(fromdate);
                                            print(
                                                "Age is : ${DateTime.now().year - value.year}");
                                            age =
                                                "${DateTime.now().year - value.year}";
                                            print(age);
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Theme.of(context).colorScheme.primary,
                        // shape: const Border.symmetric(),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  48.0, 8.0, 10.0, 0.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Gender',
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
                              padding: const EdgeInsets.fromLTRB(
                                  50.0, 8.0, 25.0, 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ToggleButtons(
                                      borderRadius:
                                          BorderRadius.circular(12.50),
                                      borderWidth: 2.0,
                                      focusColor: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      // bordercolor:Theme.of(context).colorScheme.tertiary,
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      fillColor: Colors.white,
                                      // selectedColor: Colors.white,
                                      selectedBorderColor: Colors.white,
                                      // disabledColor: Colors.purple,
                                      disabledBorderColor: Colors.white,
                                      isSelected: gen,
                                      onPressed: (ind) {
                                        setState(() {
                                          gen = [false, false, false];
                                          gen[ind] = !gen[ind];
                                          if (ind == 0) {
                                            gender = "Male";
                                          } else if (ind == 1) {
                                            gender = "Female";
                                          } else {
                                            gender = "Others";
                                          }
                                          print(gender);
                                        });
                                      },
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  4,
                                          // width: 90.0,
                                          child: Center(
                                            child: Text(
                                              "Male",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    color: (!gen[0])
                                                        ? Colors.grey[400]
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    fontWeight: FontWeight.bold,
                                                    // fontSize: 20.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  4,
                                          // width: 90.0,
                                          child: Center(
                                            child: Text(
                                              "Female",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    color: (!gen[1])
                                                        ? Colors.grey[400]
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    fontWeight: FontWeight.bold,
                                                    // fontSize: 20.0,
                                                  ),
                                              // TextStyle(
                                              //   color: (!gen[1])
                                              //       ? Colors.grey[400]
                                              //       : Colors.deepPurple,
                                              //   fontWeight: FontWeight.bold,
                                              // fontSize: 20.0,
                                              // ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  4,
                                          // width: 90.0,
                                          child: Center(
                                            child: Text(
                                              "Others",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontFamily: 'SourGummy',
                                                    color: (!gen[2])
                                                        ? Colors.grey[400]
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    fontWeight: FontWeight.bold,
                                                    // fontSize: 20.0,
                                                  ),
                                              // TextStyle(
                                              //   color: (!gen[2])
                                              //       ? Colors.grey[400]
                                              //       : Colors.deepPurple,
                                              //   fontWeight: FontWeight.bold,
                                              //   fontSize: 20.0,
                                              // ),
                                            ),
                                          ),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Divider(
                          color: Colors.deepPurple,
                          thickness: 2.5,
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 4.25),
                        color: Theme.of(context).colorScheme.primary,
                        child: ListTile(
                          // isThreeLine: true,
                          leading: const Icon(
                            Icons.group_add,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Are You a Doctor?",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  // fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourGummy',
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                          subtitle: Text(
                            "Connect with Us...Help us in improving Heath-Care.",
                            // softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  // fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourGummy',
                                  letterSpacing: 1.0,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                          trailing: Switch(
                            activeColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            onChanged: (bool newv) {
                              setState(
                                () {
                                  isdoctor = !isdoctor;
                                  debugPrint("$isdoctor");
                                },
                              );
                            },
                            value: isdoctor,
                          ),
                        ),
                      ),

                      // Text(
                      //   'Your Mobile number: $mobile, Your Age: $age',
                      //   textAlign: TextAlign.left,
                      //   style: Theme.of(context).textTheme.headlineMedium,
                      // ),

                      // OutlinedButton(
                      //     style: const ButtonStyle(
                      //         // backgroundColor: Colors.deepPurple,
                      //         ),
                      //     onPressed: submits,
                      //     child: const Text("Submit"))
                      // Text(
                      //   'Your Age: $_age',
                      //   textAlign: TextAlign.left,
                      //   style: Theme.of(context).textTheme.headlineMedium,
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Divider(
                          color: Colors.deepPurple,
                          thickness: 2.5,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Theme.of(context).colorScheme.onPrimary,
                          checkColor: Theme.of(context).colorScheme.primary,
                          value: agreed,
                          // tristate: true,
                          onChanged: (bool? check) {
                            setState(() {
                              agreed = !agreed;
                              print("CheckBox,");
                            });
                            // signininfocus.currentContext.;
                            Timer(const Duration(milliseconds: 100), () {
                              if (agreed) {
                                final con = signininfocus.currentContext;
                                if (con != null) {
                                  Scrollable.ensureVisible(
                                    con,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              }
                            });
                          },
                        ),
                        // isThreeLine: true,
                        subtitle: //Text(),
                            RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "By Continuing, You agree to our "),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const AboutUs(),
                                      ),
                                    );
                                  },
                                text: "TERMS AND CONDITIONS",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              const TextSpan(text: " and "),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const AboutUs(),
                                      ),
                                    );
                                  },
                                text: "PRIVACY POLICY",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourGummy',
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              const TextSpan(text: "."),
                            ],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontFamily: 'SourGummy',
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 17.5,
                                ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          (agreed && mail != "")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0, right: 50.0, top: 7.50),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    onPressed: () => {
                                      (agreed && mail != "")
                                          ? ((!isdoctor)
                                              ? submits()
                                              : submitdoctor())
                                          : null,
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sign - In",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SourGummy',
                                              letterSpacing: 1.5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 45.0,
                      ),
                      SizedBox(
                        key: signininfocus,
                        height: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
              Builder(builder: (context) {
                return AppbarCard(
                  titleAppBar: "Sign - In",
                  menu: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LOGIN()),
                      );
                    },
                    child: Card(
                      elevation: 5.0,
                      child: SizedBox(
                        height:
                            Theme.of(context).textTheme.displayMedium?.fontSize,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Log - In",
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
                              const SizedBox(
                                width: 5.5,
                              ),
                              Icon(
                                Icons.login,
                                size: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.fontSize,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  menuChildren: const SizedBox(height: 0, width: 0),
                  showBackButton: true,
                  showMoreOption: true,
                );
                // return Container(
                //   // color: Colors.white,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //       top: 35.0,
                //       left: 10.0,
                //       right: 10.0,
                //     ),
                //     child: SingleChildScrollView(
                //       // scrollDirection: Axis.horizontal,
                //       child: Row(
                //         children: [
                //           Card(
                //             child: GestureDetector(
                //               onTap: () {
                //                 Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => const MyApp()),
                //                 );
                //                 // Scaffold.of(context).openDrawer();
                //               },
                //               // borderRadius: BorderRadius.circular(25),
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
                //           Card(
                //             child: Padding(
                //               padding:
                //                   EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                //               child: Text(
                //                 "Sign - In",
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
                //           // const Card(
                //           //   child: Padding(
                //           //     padding: EdgeInsets.symmetric(
                //           //         vertical: 10.0, horizontal: 20.0),
                //           //     child: Text(
                //           //       "",
                //           //       style: TextStyle(
                //           //         fontSize: 22.0,
                //           //         fontWeight: FontWeight.w600,
                //           //         color: Colors.deepPurple,
                //           //       ),
                //           //     ),
                //           //   ),
                //           // ),
                //           Expanded(
                //             child: Container(),
                //           ),
                //           // const SizedBox(
                //           //   width: 8.0,
                //           // ),
                //           GestureDetector(
                //             onTap: () async {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => const LOGIN()),
                //               );
                //             },
                //             child: Card(
                //               child: Padding(
                //                 padding:
                //                     EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                //                 child: Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Text(
                //                       "Log - In",
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
                //                     const SizedBox(
                //                       width: 5.5,
                //                     ),
                //                     Icon(
                //                       Icons.login,
                //                       size: Theme.of(context)
                //                           .textTheme
                //                           .titleLarge
                //                           ?.fontSize,
                //                       color:
                //                           Theme.of(context).colorScheme.primary,
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //           // Card(
                //           //   child: Padding(
                //           //     padding: EdgeInsets.symmetric(
                //           //         vertical: 10.0, horizontal: 20.0),
                //           //     child: GestureDetector(
                //           //       onTap: () async {
                //           //         Navigator.push(
                //           //           context,
                //           //           MaterialPageRoute(
                //           //               builder: (context) => const LOGIN()),
                //           //         );
                //           //       },
                //           //       child: const Row(
                //           //         mainAxisAlignment:
                //           //             MainAxisAlignment.spaceBetween,
                //           //         children: [
                //           //           Text(
                //           //             "Log - In",
                //           //             style: TextStyle(
                //           //               fontSize: 22.0,
                //           //               fontWeight: FontWeight.w600,
                //           //               color: Colors.deepPurple,
                //           //             ),
                //           //           ),
                //           //           SizedBox(
                //           //             width: 5.5,
                //           //           ),
                //           //           Icon(
                //           //             Icons.login,
                //           //             color: Colors.deepPurple,
                //           //           ),
                //           //         ],
                //           //       ),
                //           //     ),
                //           //   ),
                //           // ),
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
  }
}
