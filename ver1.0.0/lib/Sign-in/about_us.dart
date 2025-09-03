import 'package:diseases/Sign-in/abouteachphoto.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
// import 'package:mail_sender/mail_sender.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server/gmail.dart';

import '../main.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var drawerHeader = buildingUserAccountsDrawerHeader(context);
    final drawerItems = buildingListView(drawerHeader, context);
    return WillPopScope(
      onWillPop: () async {
        colorselection = "B";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
        return false;
      },
      child: Placeholder(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text("About Us"),
          // ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: Stack(
            children: [
              const GradientBackGround(),
              Card(
                margin: bodyCardMargin,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: Card(
                            elevation: 5.0,
                            margin: const EdgeInsets.fromLTRB(
                              12.50,
                              12.50,
                              12.50,
                              15.0,
                            ),
                            color: Theme.of(context)
                                .colorScheme
                                .primary, //Colors.deepPurple[300],
                            // shape: const Border.symmetric(),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 12.00, 15.0, 5.0),
                                  alignment: Alignment.topLeft,
                                  child: Center(
                                    child: Text(
                                      'mProv Med\'s is a Flutter-Based Application, of which Vision is to Provide some Improvements and Easy to access One\'s (Patient\'s) Health Check-Up, and take some Reviews on the basis of Prediction from some Symptoms helping them to make an Easily Accessible, Convenient, as well as a TIME saving Task for both the Doctor\'s as well as Patient (Users) to take a General Check-Up of Chronic Diseases.',
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                      // style: Theme.of(context).textTheme.headlineMedium,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            fontFamily: 'SourGummy',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            letterSpacing: 1,
                                          ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  thickness: 2.50,
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 6.00, 15.0, 10.0),
                                  alignment: Alignment.topLeft,
                                  child: Center(
                                    child: Text(
                                      "It can take a bit of time to show in Selected Symptoms. Re-opening the 'Select Symptom' can solve the Problem. In response to any Failures, Crashes, We will try to Solve them respectively.",
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                      // style: Theme.of(context).textTheme.headlineMedium,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            fontFamily: 'SourGummy',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            letterSpacing: 1,
                                          ),
                                    ),
                                  ),
                                ),
                                // const Padding(
                                //   padding:
                                //   EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                //   child: Column(
                                //     children: [
                                // TextField(
                                //   onChanged: null, () {
                                //     url = 'http://127.0.0.1:57858/api?query=$name';
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
                                // )
                                // Padding(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       OutlinedButton(
                                //         style: OutlinedButton.styleFrom(
                                //             backgroundColor: Colors.white,
                                //             foregroundColor:
                                //             Colors.deepPurple[900]),
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
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Card(
                            elevation: 5.0,
                            margin: const EdgeInsets.fromLTRB(
                              12.50,
                              15.0,
                              12.50,
                              15.0,
                            ),
                            color: Theme.of(context)
                                .colorScheme
                                .primary, //Colors.deepPurple[300],
                            // shape: const Border.symmetric(),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  VerticalDivider(),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 12.00, 15.0, 12.00),
                                    alignment: Alignment.topLeft,
                                    child: Center(
                                      child: Text(
                                        "Developers/ Engineers\nWho Worked In This Research",
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        // style: Theme.of(context).textTheme.headlineMedium,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily: 'SourGummy',
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              letterSpacing: 1,
                                            ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  // Divider(
                                  //   color:
                                  //       Theme.of(context).colorScheme.onPrimary,
                                  //   thickness: 2.50,
                                  //   indent: 15.0,
                                  //   endIndent: 15.0,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ProfileEach(
                          context,
                          id: "1",
                          namdev: "Tushar Mistry",
                          mailIdDev: "tusharmistry2022@vitbhopal.ac.in",
                          descriptions:
                              "Pre Final - U.G. Student at VIT Bhopal\nFlutter Mobile Application Developer (Beginner)\nM.L. (Beginner)",
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        ProfileEach(
                          context,
                          id: "2",
                          namdev: "Akshat Yadav",
                          mailIdDev: "akshatyadav2022@vitbhopal.ac.in",
                          descriptions:
                              "Pre Final - U.G. Student at VIT Bhopal",
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        ProfileEach(
                          context,
                          id: "3",
                          namdev: "Mahhamad Syed Arhan",
                          mailIdDev:
                              "mahhamadsyedarhantusharmistry2022@vitbhopal.ac.in",
                          descriptions:
                              "Pre Final - U.G. Student at VIT Bhopal",
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        ProfileEach(
                          context,
                          id: "4",
                          namdev: "Muskan Kumari",
                          mailIdDev: "muskankumari2022@vitbhopal.ac.in",
                          descriptions:
                              "Pre Final - U.G. Student at VIT Bhopal",
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        ProfileEach(
                          context,
                          id: "5",
                          namdev: "Hrishikesh Mishra",
                          mailIdDev: "hrishikeshmishra2022@vitbhopal.ac.in",
                          descriptions:
                              "Pre Final - U.G. Student at VIT Bhopal",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                return const AppbarCard(
                  titleAppBar: "About Us",
                  menu: SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  menuChildren: SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  showBackButton: true,
                  showMoreOption: false,
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
                //               size: Theme.of(context)
                //                   .textTheme
                //                   .headlineSmall
                //                   ?.fontSize,
                //               color: Theme.of(context).colorScheme.primary,
                //             ),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 8.0,
                //       ),
                //       Card(
                //         child: Padding(
                //           padding: const EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                //           child: Text(
                //             "About Us",
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
            ],
          ),
          drawer: Drawer(
            child: drawerItems,
          ),
        ),
      ),
    );
  }

  Card ProfileEach(BuildContext context,
      {required String id,
      required String namdev,
      required String mailIdDev,
      required String descriptions}) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(15.0),
      color: Theme.of(context).colorScheme.primary,
      // shape: const Border.symmetric(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 15.0,
              right: 15.0,
              bottom: 15.0,
            ),
            child:
                // ListTile(
                // trailing: GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         allowSnapshotting: false,
                //         builder: (context) => ShowPhoto(
                //           IDD: id,
                //         ),
                //       ),
                //     );
                //   },
                //   child: Hero(
                //     tag: "Profile-Photo-$id",
                //     child: CircleAvatar(
                //       backgroundColor: Theme.of(context).colorScheme.onPrimary,
                //       child: const Icon(
                //         Icons.person,
                //         // size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                // title:
                Text(
              namdev,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: 'SourGummy',
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onPrimary,
                    letterSpacing: 2,
                  ),
            ),
            // ),
          ),
          const Divider(
              // indent: 20.0,
              // endIndent: 20.0,
              ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 12.0, 20.0, 10.0),
            alignment: Alignment.topLeft,
            child: Center(
              child: Text(
                descriptions,
//                 '''M.L. Student -Intermediate | Flutter Developer
//
// He\'s ability to make a Machine Learning Model- Prediction Software/System/Program made a leader to this Programming APP.
// He is also a Flutter Developer making him work on the Intermediate Stage Challenges in an Efficient Manner.''',
                softWrap: true,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.onPrimary,
                      letterSpacing: 1,
                    ),
              ),
            ),
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 4.0),

                          // width: MediaQuery.sizeOf(context).width * 0.4,
                          // height: MediaQuery.sizeOf(context).width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              OutlinedButton(
                                onPressed: () async {
                                  debugPrint("Started");
                                  //TODO: mail:
                                  // final Uri emailLaunchUri = Uri(
                                  //   scheme: 'mailto',
                                  //   path: 'tusharmistry2022@vitbhopal.ac.in',
                                  //   // path: 'mistrytushar07@gmail.com',
                                  //   query:
                                  //       encodeQueryParameters(<String, String>{
                                  //     'subject':
                                  //         'Example Subject & Symbols are allowed!',
                                  //   }),
                                  // );
                                  // launchUrl(emailLaunchUri);

                                  // final Email email = Email(
                                  //   body: 'Email body',
                                  //   subject: 'Email subject',
                                  //   recipients: ['example@example.com'],
                                  //   cc: ['cc@example.com'],
                                  //   bcc: ['bcc@example.com'],
                                  //   attachmentPaths: [
                                  //     '/path/to/attachment.zip'
                                  //   ],
                                  //   isHTML: false,
                                  // );
                                  //
                                  // await FlutterEmailSender.send(email);
                                  final MailOptions mailOptions = MailOptions(
                                    body: 'Hello from Flutter',
                                    subject: 'FLUTTER',
                                    recipients: [mailIdDev],
                                    isHTML: false,
                                  );
                                  var platformResponse;

                                  final MailerResponse response =
                                      await FlutterMailer.send(mailOptions);
                                  switch (response) {
                                    case MailerResponse.saved:

                                      /// ios only
                                      platformResponse =
                                          'mail was saved to draft';
                                      break;
                                    case MailerResponse.sent:

                                      /// ios only
                                      platformResponse = 'mail was sent';
                                      break;
                                    case MailerResponse.cancelled:

                                      /// ios only
                                      platformResponse = 'mail was cancelled';
                                      break;
                                    case MailerResponse.android:
                                      platformResponse =
                                          'intent was successful';
                                      break;
                                    default:
                                      platformResponse = 'unknown';
                                      break;
                                  }
                                  debugPrint(platformResponse);

                                  // final Email emm = Email(
                                  //   isHTML: true,
                                  //   recipients: [mailIdDev],
                                  // );
                                  // await FlutterEmailSender.send(emm);
                                  // final _mailSenderPlugin = MailSender();
                                  //
                                  // _mailSenderPlugin.sendMail(
                                  //   recipient: [mailIdDev],
                                  //   subject: "Leave Application",
                                  //   body: "Some lengthy Body text",
                                  //   bcc: ["bcc@bcc.com"],
                                  //   cc: [
                                  //     "someGuy.promail@gmail.com",
                                  //     "msoffice@gmail.com"
                                  //   ],
                                  // );
                                  debugPrint("Done");
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  // backgroundColor: Colors.white,
                                  // foregroundColor: Colors.deepPurple[900],
                                ),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: 5.0,
                                    // ),
                                    const Icon(Icons.mail),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Send Mail",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                    ),
                                    // SizedBox(
                                    //   width: 7.50,
                                    // ),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //TODO: Linked-In
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      allowSnapshotting: false,
                                      builder: (context) => const InAppWeb(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: 5.0,
                                    // ),
                                    const Icon(Icons.person_add),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Linked-In",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                    ),
                                    // SizedBox(
                                    //   width: 7.50,
                                    // ),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //TODO: Instagram
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      allowSnapshotting: false,
                                      builder: (context) => InAppWeb(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: 5.0,
                                    // ),
                                    const Icon(Icons.broken_image),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Instagram",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                    ),
                                    // SizedBox(
                                    //   width: 7.50,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 4.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    allowSnapshotting: false,
                                    builder: (context) => ShowPhoto(
                                      IDD: id,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: "Profile-Photo-$id",
                                child: Card(
                                  color: Colors.transparent.withOpacity(0.75),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'files/images/img.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent
                                              .withOpacity(0.25),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Hero(
                      //   tag: "Profile-Photo-$id",
                      //   child: Card(
                      //     color: Theme.of(context).colorScheme.onPrimary,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Image.asset(
                      //         'files/images/img.png',
                      //         height: MediaQuery.sizeOf(context).width * 0.4,
                      //         width: MediaQuery.sizeOf(context).width * 0.4,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InAppWeb extends StatefulWidget {
  const InAppWeb({super.key});

  @override
  State<InAppWeb> createState() => _InAppWebState();
}

class _InAppWebState extends State<InAppWeb> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Center(
          child: Text(
            "Something Went Wrong.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: 'SourGummy',
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 2,
                ),
          ),
        ),
        //     body: InAppWebView(
        //   initialUrlRequest: URLRequest(
        //     url: WebUri(("https://tusharmistry.pythonanywhere.com/get")),
        //     // "Uri.parse("https://tusharmistry.pythonanywhere.com/get"),
        //   ),
        //   onWebViewCreated: (InAppWebViewController Controll) {
        //     Controller = Controll;
        //   },
        // )
        // body: InAppWebView(
        //   "https://tusharmistry.pythonanywhere.com/get",
        //   mDirection: TextDirection.ltr,
        //   appBarBGColor: const Color(0xFF262626),
        //   bottomNavColor: const Color(0xFF262626),
        //   defaultTitle: true,
        //   backIcon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        //   nextIcon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        //   closeIcon: const Icon(Icons.close, color: Colors.white),
        //   shareIcon: const Icon(Icons.share, color: Colors.white),
        //   refreshIcon: const Icon(Icons.refresh, color: Colors.white),
        //   actionWidget: const [],
        //   actionsIconTheme: const IconThemeData(),
        //   centerTitle: true,
        //   titleTextStyle: const TextStyle(),
        //   toolbarTextStyle: const TextStyle(),
        //   toolbarHeight: 56,
        // ),
      ),
    );
  }
}
