import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ffi';
import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:diseases/ML%20DATA/loading.dart';
import 'package:diseases/ML%20DATA/search.dart';
import 'package:diseases/Sign-in/about_us.dart';
import 'package:diseases/Sign-in/display_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'Home_Screen.dart';
import 'ML DATA/Results.dart';
import 'ML DATA/drop_down.dart';
import 'Sign-in/Setting_history.dart';
import 'Sign-in/details.dart';

var fullname = "", mail = '';
var name = '', name1 = '', name2 = '';
var mobile = '', dob = '', age = "", gender = "", dateSign = "";
List<bool> gen = [false, false, false];
bool sign = false, isdoctor = false, agreed = false;
late bool networkConnect;

// ModFont()

Text hinting = Text(
  'Choose',
  style: TextStyle(
    color: Colors.deepPurple[900],
  ),
);

EdgeInsets cardMargin = const EdgeInsets.fromLTRB(
  10.0,
  10.0,
  10.0,
  20.0,
);
EdgeInsets paddingCard = const EdgeInsets.only(
  right: 22.50,
  left: 4.0,
  top: 25.0,
  bottom: 25.0,
);
EdgeInsets bodyCardMargin =
    const EdgeInsets.only(top: 100.0, left: 5, right: 5, bottom: 5.0);

Icon arowicon = const Icon(
  Icons.arrow_downward,
  color: Colors.deepPurple,
);

var url = '', url2 = '';
var data = '', symptom = '';
dynamic decode;
String colorselection = "B", output = 'Not Accessible';
List<String> each_output = List.filled(12, "__disease__");

List<dynamic> historyListDatabase = List.empty(growable: true);
late Map<String, dynamic> historyEntry;

var s = "";
var Colorforeach;

int i = 0;
List<String> submittingList = List.filled(96, "np");
List<String> allsymptoms = [
  'back_pain',
  'constipation',
  'abdominal_pain',
  'diarrhoea',
  'mild_fever',
  'yellow_urine',
  'yellowing_of_eyes',
  'acute_liver_failure',
  'fluid_overload',
  'swelling_of_stomach',
  'swelled_lymph_nodes',
  'malaise',
  'blurred_and_distorted_vision',
  'phlegm',
  'throat_irritation',
  'redness_of_eyes',
  'sinus_pressure',
  'runny_nose',
  'congestion',
  'chest_pain',
  'weakness_in_limbs',
  'fast_heart_rate',
  'pain_during_bowel_movements',
  'pain_in_anal_region',
  'bloody_stool',
  'irritation_in_anus',
  'neck_pain',
  'dizziness',
  'cramps',
  'bruising',
  'obesity',
  'swollen_legs',
  'swollen_blood_vessels',
  'puffy_face_and_eyes',
  'enlarged_thyroid',
  'brittle_nails',
  'swollen_extremeties',
  'excessive_hunger',
  'extra_marital_contacts',
  'drying_and_tingling_lips',
  'slurred_speech',
  'knee_pain',
  'hip_joint_pain',
  'muscle_weakness',
  'stiff_neck',
  'swelling_joints',
  'movement_stiffness',
  'spinning_movements',
  'loss_of_balance',
  'unsteadiness',
  'weakness_of_one_body_side',
  'loss_of_smell',
  'bladder_discomfort',
  'foul_smell_of urine',
  'continuous_feel_of_urine',
  'passage_of_gases',
  'internal_itching',
  'toxic_look_(typhos)',
  'depression',
  'irritability',
  'muscle_pain',
  'altered_sensorium',
  'red_spots_over_body',
  'belly_pain',
  'abnormal_menstruation',
  'dischromic _patches',
  'watering_from_eyes',
  'increased_appetite',
  'polyuria',
  'family_history',
  'mucoid_sputum',
  'rusty_sputum',
  'lack_of_concentration',
  'visual_disturbances',
  'receiving_blood_transfusion',
  'receiving_unsterile_injections',
  'coma',
  'stomach_bleeding',
  'distention_of_abdomen',
  'history_of_alcohol_consumption',
  'blood_in_sputum',
  'prominent_veins_on_calf',
  'palpitations',
  'painful_walking',
  'pus_filled_pimples',
  'blackheads',
  'scurring',
  'skin_peeling',
  'silver_like_dusting',
  'small_dents_in_nails',
  'inflammatory_nails',
  'blister',
  'red_sore_around_nose',
  'yellow_crust_ooze',
];
Map<String, String> symptomDescriptions = {
  'back_pain': 'Pain experienced in the back region',
  'constipation': 'Difficulty in passing stools',
  'abdominal_pain': 'Pain in the abdominal area',
  'diarrhoea': 'Frequent bowel movements with loose or watery stools',
  'mild_fever': 'Slight increase in body temperature',
  'yellow_urine': 'Urine with a yellowish color',
  'yellowing_of_eyes': 'Yellowing of the whites of the eyes',
  'acute_liver_failure': 'Severe liver dysfunction',
  'fluid_overload': 'Excess fluid accumulation in the body',
  'swelling_of_stomach': 'Abnormal enlargement of the stomach',
  'swelled_lymph_nodes': 'Enlargement of lymph nodes',
  'malaise': 'General feeling of discomfort or unease',
  'blurred_and_distorted_vision': 'Unclear and distorted vision',
  'phlegm': 'Thick mucus secreted by the respiratory tract',
  'throat_irritation': 'Discomfort or scratchiness in the throat',
  'redness_of_eyes': 'Redness in the eyes',
  'sinus_pressure': 'Feeling of pressure or pain in the sinuses',
  'runny_nose': 'Excessive nasal discharge',
  'congestion': 'Blockage or obstruction in nasal passages',
  'chest_pain': 'Pain or discomfort in the chest area',
  'weakness_in_limbs': 'Decreased strength or ability in limbs',
  'fast_heart_rate': 'Increased heart rate or pulse',
  'pain_during_bowel_movements': 'Pain experienced during bowel movements',
  'pain_in_anal_region': 'Discomfort or pain in the anal region',
  'bloody_stool': 'Presence of blood in stool',
  'irritation_in_anus': 'Discomfort or itching in the anal area',
  'neck_pain': 'Pain or stiffness in the neck',
  'dizziness': 'Feeling lightheaded or unsteady',
  'cramps': 'Painful muscle contractions',
  'bruising': 'Discoloration of skin due to injury or trauma',
  'obesity': 'Excessive body weight or fat accumulation',
  'swollen_legs': 'Enlargement or puffiness of legs',
  'swollen_blood_vessels': 'Dilation or swelling of blood vessels',
  'puffy_face_and_eyes': 'Swelling or puffiness in the face and eyes',
  'enlarged_thyroid': 'Abnormal enlargement of the thyroid gland',
  'brittle_nails': 'Fragile or easily breakable nails',
  'swollen_extremeties': 'Enlargement or swelling of extremities',
  'excessive_hunger': 'Unusual or extreme feeling of hunger',
  'extra_marital_contacts': 'Engagement in sexual activities outside marriage',
  'drying_and_tingling_lips': 'Dryness and tingling sensation in lips',
  'slurred_speech': 'Difficulty in articulating words clearly',
  'knee_pain': 'Pain or discomfort in the knee joint',
  'hip_joint_pain': 'Pain or discomfort in the hip joint',
  'muscle_weakness': 'Decreased strength or function of muscles',
  'stiff_neck': 'Tightness or limited movement in the neck',
  'swelling_joints': 'Enlargement or puffiness of joints',
  'movement_stiffness': 'Difficulty in moving or stiffness in joints',
  'spinning_movements': 'Sensation of spinning or dizziness',
  'loss_of_balance': 'Difficulty maintaining balance or stability',
  'unsteadiness': 'Lack of steadiness or stability',
  'weakness_of_one_body_side':
      'Reduced strength or function on one side of the body',
  'loss_of_smell': 'Decreased ability to smell odors',
  'bladder_discomfort': 'Discomfort or pain in the bladder area',
  'foul_smell_of urine': 'Unpleasant or foul odor in urine',
  'continuous_feel_of_urine':
      'Persistent urge or sensation of needing to urinate',
  'passage_of_gases': 'Passing of gas or flatulence',
  'internal_itching': 'Itching sensation inside the body or organs',
  'toxic_look_(typhos)': 'Appearance of illness or toxicity',
  'depression': 'Persistent feeling of sadness or hopelessness',
  'irritability': 'Easily annoyed or agitated',
  'muscle_pain': 'Pain or discomfort in muscles',
  'altered_sensorium': 'Changes in consciousness or awareness',
  'red_spots_over_body': 'Red spots or patches on the skin',
  'belly_pain': 'Pain or discomfort in the abdomen or belly area',
  'abnormal_menstruation': 'Irregular or abnormal menstrual cycles',
  'dischromic _patches': 'Abnormal patches or discoloration on skin',
  'watering_from_eyes': 'Excessive tear production from eyes',
  'increased_appetite': 'Higher than usual desire for food or eating',
  'polyuria': 'Excessive urination',
  'family_history':
      'History of certain diseases or conditions in family members',
  'mucoid_sputum': 'Thick or viscous mucus coughed up from respiratory tract',
  'rusty_sputum': 'Sputum with a rusty or reddish color',
  'lack_of_concentration': 'Difficulty in focusing or concentrating',
  'visual_disturbances': 'Changes or disturbances in vision',
  'receiving_blood_transfusion': 'Receiving blood from a donor',
  'receiving_unsterile_injections':
      'Receiving injections with unsterile equipment',
  'coma': 'State of deep unconsciousness',
  'stomach_bleeding': 'Bleeding or hemorrhage in the stomach',
  'distention_of_abdomen': 'Abnormal enlargement or swelling of the abdomen',
  'history_of_alcohol_consumption':
      'Past or present alcohol consumption history',
  'blood_in_sputum': 'Presence of blood in respiratory secretions or sputum',
  'prominent_veins_on_calf': 'Clearly visible veins on the calf muscles',
  'palpitations': 'Awareness of rapid or irregular heartbeats',
  'painful_walking': 'Pain experienced while walking or moving',
  'pus_filled_pimples': 'Pimples or lesions filled with pus',
  'blackheads': 'Small dark spots or comedones on the skin',
  'scurring': 'Flaking or shedding of skin',
  'skin_peeling': 'Loss of outer skin layers in flakes or sheets',
  'silver_like_dusting': 'Appearance of silver-like dusting on skin',
  'small_dents_in_nails': 'Tiny depressions or dents in nails',
  'inflammatory_nails': 'Nails showing signs of inflammation',
  'blister': 'Fluid-filled sac or pocket on the skin',
  'red_sore_around_nose': 'Redness or soreness around the nose area',
  'yellow_crust_ooze': 'Yellowish crust or discharge from skin',
};
String selectionfordropdown = "";
List<String> descriptionsList = symptomDescriptions.values.toList();
List<String> alldisease = [
  'Fungal infection',
  'Allergy',
  'GERD',
  'Chronic Cholestasis',
  'Drug Reaction',
  'Peptic Ulcer Disease',
  'AIDS',
  'Diabetes',
  'Gastroenteritis',
  'Bronchial Asthma',
  'Hypertension',
  'Migraine',
  'Cervical spondylosis',
  'Paralysis (brain hemorrhage)',
  'Jaundice',
  'Malaria',
  'Chicken pox',
  'Dengue',
  'Typhoid',
  'hepatitis A',
  'Hepatitis B',
  'Hepatitis C',
  'Hepatitis D',
  'Hepatitis E',
  'Alcoholic hepatitis',
  'Tuberculosis',
  'Common Cold',
  'Pneumonia',
  'Dimorphic hemmorhoids(piles)',
  'Heartattack',
  'Varicoseveins',
  'Hypothyroidism',
  'Hyperthyroidism',
  'Hypoglycemia',
  'Osteoarthristis',
  'Arthritis',
  '(vertigo) Paroymsal  Positional Vertigo',
  'Acne',
  'Urinary tract infection',
  'Psoriasis',
  'Impetigo'
];
bool reqmeds = false;
List<String> remdisplay = List.filled(10, "Loading...");

bool reqdocs = false;
List<dynamic> docdisplay = List.filled(10, "Loading...");

final List<PopupMenuItem<String>> popUpMenuItems =
    ["Reset Symptoms", "Search", "Professional", "Recommended"]
        .map(
          (String value) => PopupMenuItem<String>(
            value: value,
            child: Text(value),
          ),
        )
        .toList();

symptom1() async {
  // if (allsymptoms[0] == "np") {
  //   url = 'https://tusharmistry.pythonanywhere.com/get';
  //   // url = 'http://10.0.2.2:5000/get?id=$i';
  //   // http.Response response = await TrustAllCertificates.sslClient().get(Uri.parse(url));
  //   http.Response response = await http.get(Uri.parse(url));
  //   var jsonSymp = response.body;
  //   print((jsonSymp));
  //   var value = jsonDecode(jsonSymp);
  //   print(value);
  //   var symptom_as_str =
  //       (value.toString().substring(10, value.toString().length - 1));
  //   allsymptoms = symptom_as_str.substring(1).split(",");
  //   for (int i = 0; i < 95; i++) {
  //     allsymptoms[i] = allsymptoms[i].replaceAll("_", " ").toUpperCase();
  //     print("------>${allsymptoms[i]}");
  //     // print(allsymptoms);
  //   }
  // } else {
  //   print("===============Already Done=============");
  // }
  for (int al = 0; al < 94; al++) {
    allsymptoms[al] = allsymptoms[al].replaceAll("_", " ").toUpperCase();
  }
  return allsymptoms;
}

display(context) {
  //TODO: is-signed boolean.
  if (mail == "") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const REGISTER(),
      ),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Display(
          title: 'Accounts',
        ),
      ),
    );
  }
}

fetch(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

Future<bool> netCheck() async {
  // var con = await (Connectivity().checkConnectivity());
  // if (con == ConnectivityResult.none) {
  //   return false;
  // }
  // return true;
  return false;
}

bool loadingAnimation = false;

FloatingActionButton buildingFloatingActionButton(
  BuildContext context, // dynamic StreamStatus, dynamic InternetStatus
) {
  return FloatingActionButton.extended(
    foregroundColor: Theme.of(context).colorScheme.onSecondary,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    label: ConnectionNotifierToggler(
      onConnectionStatusChanged: (connected) {
        /// that means it is still in the initialization phase.
        if (connected == null) return;
        debugPrint(connected.toString());
        networkConnect = !connected;
      },
      disconnected: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.58,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.signal_wifi_connected_no_internet_4,
                size: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(
                width: 12.50,
              ),
              Text(
                "No Internet",
                // 'You are Offline',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: 'SourGummy',
                    ),
              ),
            ],
          ),
        ),
      ),
      loading: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        child: Center(
          child: Text(
            "Loading...",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontFamily: 'SourGummy',
                ),
          ),
        ),
      ),
      connected: (loadingAnimation)
          ? CircularProgressIndicator()
          // ? SpinKitDoubleBounce(
          //     color: Theme.of(context).colorScheme.onSecondary,
          //     // color: Colors.deepPurpleAccent,
          //     size: 50.0,
          //   )
          : SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.34,
              // width: (null == StreamStatus)
              //     ? MediaQuery.sizeOf(context).width * 0.34
              //     : InternetStatus!
              //         ? MediaQuery.sizeOf(context).width * 0.34
              //         : MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "Predict",
                      // null == StreamStatus
                      //     ? 'Unknown State'
                      //     : InternetStatus!
                      //         ? "Submit"
                      //         : "You are Offline",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontFamily: 'SourGummy',
                          ),
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  // const Icon(Icons.arrow_forward)
                ],
              ),
            ),
    ),
    onPressed: () async {
      //TODO: Route to Loading Screen.
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoadingScreenForSubmit()),
      // );
      //TODO : Internet Connect or not
      // if (connectivityResult.contains(ConnectivityResult.mobile) &&
      //     (connectivityResult.contains(ConnectivityResult.wifi) ||
      //         connectivityResult.contains(ConnectivityResult.ethernet) ||
      //         connectivityResult.contains(ConnectivityResult.vpn))) {}
      // if (connectivityResult.contains(ConnectivityResult.mobile)) {

      // networkConnect = await netCheck();

      // bool isNotConnected = await (null == StreamStatus)
      //     ? true
      //     : InternetStatus!
      //         ? false
      //         : true;
      // Timer(
      //     const Duration(
      //       seconds: 0,
      //     ), () async {
      if (networkConnect) {
        //NO Internet:
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            // title: const Text('Trying...Still Loading...'),
            title: Text(
              'No Internet at this Time...',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'SourGummy',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                    // color: Colors.deepPurple,
                  ),
            ),
            content: Text(
              'Try again after some time. Try checking the Wifi Connection or Mobile Data and then try again',
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
      } else {
        //TODO: function for loading
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoadingScreenForSubmit(),
          ),
        );
      }
    },
  );
}

//TODO: request for  Remedy as function
reqformeds(String dis) async {
  data = await fetch('http://127.0.0.1:57858/get_remedies/$dis');
  // data = await fetch(
  //     'https://tusharmistry.pythonanywhere.com/get/api_tushar_mistry/RemedyandDoctor?=$dis');
  // data = await fetch('http://10.0.2.2:5000/apps?input=$s');
  if (kDebugMode) {
    print(data);
  }
  dynamic decoded = jsonDecode(data);
  output = decoded['remedy'];
  var splitting = output.split(":split:");
  print("Length of splitting: ${splitting.length}");
  print("Length of display: ${remdisplay.length}");
  for (int inttt = 0; inttt <= remdisplay.length - 1; inttt++) {
    remdisplay[inttt] = splitting[inttt];
    print(remdisplay[inttt]);
  }
}

alertandrequest(context, List s, String ss) async {
  String slecting;
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Confirm: Submission...?",
      ),
      content: ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          if (s[idx] != null && s[idx] != "None") {
            return ListTile(
              leading: Text('Symptom ${idx + 1}'),
              title: Text(s[idx]!),
            );
          } else {
            // Handle null or "None" values gracefully
            return null;
          }
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {Navigator.pop(context, 'Cancel')},
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => {
            slecting = s[0] ?? ss,
            for (int i = 01; i < 95; i++)
              {
                slecting += ",$s[i]",
              },
            print(slecting),
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestAndDisplay()),
            )
          },
          child: const Text("Yes"),
        )
      ],
    ),
  );
}

Column buildingListView(Widget drawerHeader, BuildContext context) {
  // final package = AppInfo.of(context).package;
  return Column(
    children: <Widget>[
      // drawerHeader,
      (agreed)
          ? Container(
              color: Theme.of(context).colorScheme.primary,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 27.50,
                    bottom: 10.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 15.0, 0.0, 15.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                radius: 30.0,
                                child: (fullname.isEmpty)
                                    ? Icon(
                                        Icons.account_circle_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 40.0,
                                      )
                                    : Text(
                                        (isdoctor)
                                            ? fullname.substring(4, 5)
                                            : fullname.substring(0, 1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.w900,
                                              // fontSize: 50.0,
                                              fontFamily: 'SourGummy',
                                            ),
                                      ),
                              ),
                            ),
                            // const VerticalDivider(
                            //   indent: 15.0,
                            //   endIndent: 15.0,
                            //   thickness: 2.0,
                            // ),
                            const SizedBox(
                              width: 17.5,
                            ),
                            Expanded(
                              // width: MediaQuery.sizeOf(context).width / 2.0,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                // alignment: Alignment.center,
                                child: Text(
                                  fullname,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontFamily: 'SourGummy',
                                        fontSize: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .fontSize! +
                                            3,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5,
                                      ),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        thickness: 1.50,
                        // endIndent: 15.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Align(
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            mail,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontFamily: 'SourGummy',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.25,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              color: Theme.of(context).colorScheme.primary,
              height: MediaQuery.sizeOf(context).height * 0.125,
            ),
      const SizedBox(
        height: 6.0,
      ),
      ListTile(
        leading: Icon(
          Icons.account_circle,
          color: (colorselection == "A")
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          (mail == "") ? "Create Account" : 'Account Settings',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'SourGummy',
                color: (colorselection == "A")
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.secondary,
              ),
        ),
        tileColor: (colorselection == "A")
            ? Theme.of(context).colorScheme.primary
            : Colors.purpleAccent[50],
        onTap: () async {
          colorselection = "A";
          display(context);
        },
      ),
      Divider(
        thickness: 3.5,
        color: Theme.of(context).colorScheme.secondary,
      ),
      ListTile(
        leading: Icon(
          Icons.home,
          color: (colorselection == "B")
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'Home:',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'SourGummy',
                color: (colorselection == "B")
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.secondary,
              ),
        ),
        // trailing: Icon(
        //   Icons.keyboard_arrow_down,
        //   color: (colorselection == "B")
        //       ? Theme.of(context).colorScheme.onPrimary
        //       : Theme.of(context).colorScheme.secondary,
        // ),
        tileColor: (colorselection == "B")
            ? Theme.of(context).colorScheme.primary
            : Colors.purpleAccent[50],
        onTap: () async {
          colorselection = "B";
          await symptom1();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          );
        },
      ),
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Combinations",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourGummy',
                    color: (colorselection == "C")
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Icon(
              Icons.list_alt,
              color: (colorselection == "C")
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
        tileColor: (colorselection == "C")
            ? Theme.of(context).colorScheme.primary
            : Colors.purpleAccent[50],
        onTap: () async {
          colorselection = "C";
          Colorforeach = Theme.of(context).colorScheme.primary;
          hinting = Text(
            ' Choose',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontFamily: 'SourGummy',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                  // color: Colors.deepPurple,
                ),
          );
          arowicon = Icon(
            Icons.arrow_downward,
            color: Theme.of(context).colorScheme.primary,
          );
          cardMargin = const EdgeInsets.fromLTRB(
            // MediaQuery.sizeOf(context).width * 0.005,
            // 10.0,
            // MediaQuery.sizeOf(context).width * 0.005,
            // 10.0,
            5.0, 1.0, 5.0, 12.50,
          );
          paddingCard = const EdgeInsets.only(
            right: 4.0,
            left: 4.0,
            top: 5.0,
            bottom: 4.0,
          );
          await symptom1();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DropDown()),
          );
        },
      ),
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search Symptom",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourGummy',
                    color: (colorselection == "D")
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Icon(
              Icons.search,
              color: (colorselection == "D")
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
        tileColor: (colorselection == "D")
            ? Theme.of(context).colorScheme.primary
            : Colors.purpleAccent[50],
        onTap: () async {
          colorselection = "D";
          await symptom1();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Searchable()),
          );
        },
      ),
      // ListTile(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         "Professional",
      //         style: TextStyle(
      //           color:
      //               (colorselection == "E") ? Colors.white : Colors.deepPurple,
      //         ),
      //       ),
      //       Icon(
      //         Icons.read_more,
      //         color: (colorselection == "E")
      //             ? Colors.white
      //             : Colors.deepPurple[300],
      //       ),
      //     ],
      //   ),
      //   tileColor: (colorselection == "E") ? Colors.deepPurple : Colors.white,
      //   onTap: () async {
      //     colorselection = "E";
      //     await symptom1();
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const DropDownSingle()),
      //     );
      //   },
      // ),

      Divider(
        thickness: 3.5,
        color: Theme.of(context).colorScheme.secondary,
      ),

      ListTile(
        leading: Icon(
          Icons.amp_stories,
          color: (colorselection == "F")
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'SourGummy',
                color: (colorselection == "F")
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.secondary,
              ),
        ),
        tileColor: (colorselection == "F")
            ? Theme.of(context).colorScheme.primary
            : Colors.purpleAccent[50],
        onTap: () {
          colorselection = "F";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AboutUs(),
            ),
          );
        },
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Version: 1.0.0 | Dart: ${Platform.version.substring(0, Platform.version.indexOf("(stable)"))}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'SourGummy',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
      // const Divider(),
      // ListTile(
      //   leading: Icon(
      //     Icons.amp_stories,
      //     color:
      //         (colorselection == "G") ? Colors.white : Colors.deepPurple[200],
      //   ),
      //   title: Text(
      //     'Hive',
      //     style: TextStyle(
      //       color: (colorselection == "G") ? Colors.white : Colors.deepPurple,
      //     ),
      //   ),
      //   tileColor: (colorselection == "G")
      //       ? Colors.deepPurple
      //       : Colors.purpleAccent[50],
      //   onTap: () {
      //     colorselection = "G";
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const RequestAndDisplay()),
      //     );
      //   },
      // ),
    ],
  );
}

Column buildingSymptomView(Widget drawerHeader, BuildContext context) {
  return Column(
    // physics: ClampingScrollPhysics(),
    children: <Widget>[
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0),
          child: Center(
            child: Text(
              "Your Selected Symptoms",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: 'SourGummy',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                    // color: Colors.deepPurple,
                  ),
            ),
          ),
        ),
      ),
      Divider(
        thickness: 2.5,
        color: Colors.deepPurple[900],
      ),
      SizedBox(
        // height: MediaQuery.of(context).size.height - 200.0,
        child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: submittingList.length,
          itemBuilder: (context, idx) {
            if (submittingList[idx] != "np") {
              return ListTile(
                leading: Text(
                  '${idx + 1}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        // fontSize: 25.0,
                        fontFamily: 'SourGummy',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                title: Text(
                  submittingList[idx],
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: 'SourGummy',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              );
            } else if (idx == 0) {
              return ListTile(
                title: Center(
                  child: Text(
                    "\nNO Symptoms Selected.",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontFamily: 'SourGummy',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              );
            } else {
              return null;
            }
          },
        ),
      ),
      const Expanded(
        child: SizedBox(
          height: 0,
          width: 0,
        ),
      ),
      Divider(
        thickness: 2.5,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Padding(
        padding: const EdgeInsets.all(12.50),
        child: Center(
          child: Text(
            '''It can take a bit of time to show them here. Re-opening the Page can solve the Problem. In response to any Failures, Crashes, We will try to Solve them respectively.''',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontFamily: 'SourGummy',
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
    ],
  );
}

Widget buildingUserAccountsDrawerHeader(context) {
  return (agreed)
      ? UserAccountsDrawerHeader(
          // decoration: BoxDecoration(color: Colors.deepPurple[200]),
          accountName: Text(
            fullname,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'SourGummy',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
          ),
          accountEmail: Text(
            mail,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'SourGummy',
                ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
              size: 50.0,
            ),
          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: (fullname.isEmpty)
                  ? Icon(
                      Icons.account_circle_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Text(
                      (isdoctor)
                          ? fullname.substring(4, 5)
                          : fullname.substring(0, 1),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'SourGummy',
                          ),
                    ),
            ),
          ],
        )
      : Container(
          color: Theme.of(context).colorScheme.primary,
          height: MediaQuery.sizeOf(context).height * 0.125,
        );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // var person = await Hive.openBox("information");
  //   // // person.put("fname","Tushar mistry tushar qwertyy");
  //   // fullname = person.get("fname") ?? "";
  //   // name = (person.get("name0")) ?? "";
  //   // name1 = (person.get("name1")) ?? "";
  //   // name2 = (person.get("name2")) ?? "";
  //   // mail = (person.get("mail-id")) ?? "";
  //   // age = (person.get("age")) ?? "";
  //   // gender = (person.get("gender")) ?? "";
  //   // dob = (person.get("dob")) ?? "";
  //   // dateSign = (person.get("date")) ?? "";
  //   // mobile = (person.get("mobile")) ?? "";
  //   // agreed = person.get("agrr") ?? false;
  //   // isdoctor = person.get("Is Doctor") ?? false;
  //   // (isdoctor) ? docsymp = person.get("Specialised Diseases") : null;
  //   // // person.delete("PredictionHistory");
  //   // historyListDatabase = person.get("PredictHistory") ??
  //   //     [
  //   //       // {"": ""}
  //   //     ];

  // List.empty(
  //   growable: true,
  // );

  allsymptoms.toSet().toList();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    // AppInfo(
    // data: await AppInfoData.get(),
    // child:
    MaterialApp(
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
      home: const IntroSplash(),
    ),
    // ),
  );
}

class IntroSplash extends StatefulWidget {
  const IntroSplash({super.key});

  @override
  State<IntroSplash> createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash> {
  void initial() async {
    var person = await Hive.openBox("information");
    // person.put("fname","Tushar mistry tushar qwertyy");
    fullname = person.get("fname") ?? "";
    name = (person.get("name0")) ?? "";
    name1 = (person.get("name1")) ?? "";
    name2 = (person.get("name2")) ?? "";
    mail = (person.get("mail-id")) ?? "";
    age = (person.get("age")) ?? "";
    gender = (person.get("gender")) ?? "";
    dob = (person.get("dob")) ?? "";
    dateSign = (person.get("date")) ?? "";
    mobile = (person.get("mobile")) ?? "";
    agreed = person.get("agrr") ?? false;
    isdoctor = person.get("Is Doctor") ?? false;
    (isdoctor) ? docsymp = person.get("Specialised Diseases") : null;
    // person.delete("PredictionHistory");
    historyListDatabase = person.get("PredictHistory") ??
        [
          // {"": ""}
        ];
    debugPrint("Hive : At Intro Splash");
  }

  @override
  void initState() {
    print("Hive : At Intro Splash");
    super.initState();

    for (int al = 0; al < 94; al++) {
      allsymptoms[al] = allsymptoms[al].replaceAll("_", " ").toUpperCase();
    }
    setState(() {
      initial();
    });
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const MyApp(),
        ),
      ),
    );
    // Timer(
    //   const Duration(seconds: 2),
    //   () {
    //     //TODO: Ask for Sign-in
    //     if (fullname == "" || mail == "") {
    //       showDialog<String>(
    //         context: context,
    //         builder: (BuildContext context) => AlertDialog(
    //           title: const Text(
    //             "Get Sign-In, to Have access to all Services.",
    //           ),
    //           actions: <Widget>[
    //             FilledButton(
    //               onPressed: () => {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => const REGISTER(),
    //                   ),
    //                 ),
    //               },
    //               child: const Text("Sign-In / Log-In"),
    //             ),
    //             OutlinedButton(
    //               onPressed: () => Navigator.pop(context, 'Cancel'),
    //               child: const Text("Ask me Later"),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          // appBar: AppBar(
          //   title: Text('Directionality Example'),
          // ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: 'SourGummy',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  'mProve Med\'s',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontFamily: 'SourGummy',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mProve Med\'s',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class GradientBackGround extends StatelessWidget {
  const GradientBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * (1-),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ],
        ),
      ),
    );
  }
}

class AppbarCard extends StatefulWidget {
  const AppbarCard({
    super.key,
    required this.titleAppBar,
    required this.menu,
    required this.menuChildren,
    required this.showBackButton,
    required this.showMoreOption,
  });
  final String titleAppBar;
  final bool showBackButton;
  final bool showMoreOption;
  final Widget menuChildren;
  final Widget menu;

  @override
  State<AppbarCard> createState() => _AppbarCardState();
}

class _AppbarCardState extends State<AppbarCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
      child: Align(
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        (widget.showBackButton)
                            ? Navigator.pop(context)
                            : Scaffold.of(context).openDrawer();
                      },
                      child: Card(
                        elevation: 5.0,
                        child: SizedBox(
                          height: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          width: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Icon(
                                (widget.showBackButton)
                                    ? Icons.arrow_back
                                    : Icons.menu,
                                // size: Theme.of(context)
                                //     .textTheme
                                //     .titleLarge
                                //     ?.fontSize,
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
                        height:
                            Theme.of(context).textTheme.displayMedium?.fontSize,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 10.0, 15.0, 10.0),
                          child: Center(
                            child: Text(
                              widget.titleAppBar,
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
                const Expanded(
                  // width: double.infinity,
                  // width: (MediaQuery.sizeOf(context).width * 1 / 10) -
                  //     15,
                  child: SizedBox(),
                ),
                (widget.showMoreOption)
                    ? widget.menu
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ],
            ),
            (widget.showMoreOption)
                ? const SizedBox(
                    height: 5.0,
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            widget.menuChildren
          ],
        ),
      ),
    );
  }
}

// class TrustAllCertificates {
//   static http.Client sslClient() {
//     var ioClient = HttpClient()
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) {
//         return (host.compareTo("domain-name.com") == 0);
//       };
//     http.Client client = IOClient(ioClient);
//     return client;
//   }
// }
//
// a(){
//   Map<String,dynamic> info = FileManager().readPersonalInfo() as Map<String, dynamic>;
//   setstate(){
//     fullname = info['name'];
//     mail = info['mail'];
//     age = info['age'];
//   }
//   print(fullname);
//   print(mail);
//   print(age);
// }
//
// class FileManager {
//   Future<File> get _localFile async {
//     final directory = await getApplicationDocumentsDirectory();
//     return File('${directory.path}/personal_info.txt');
//   }
//
//   Future<void> writePersonalInfo(String name, String email, String age) async {
//     final file = await _localFile;
//     final contents = '$name\n$email\n$age';
//
//     await file.writeAsString(contents);
//   }
//
//   Future<Map<String, dynamic>> readPersonalInfo() async {
//     try {
//       final file = await _localFile;
//       final contents = await file.readAsString();
//
//       final lines = contents.split('\n');
//       if (lines.length >= 3) {
//         return {
//           'name': lines[0],
//           'email': lines[1],
//           'age': lines[2], // Handle invalid age
//         };
//       }
//     } catch (e) {
//       print('Error reading personal info: $e');
//     }
//
//     return {}; // Return empty map if reading fails
//   }
// }
// Future<void> processInputData(String inputData) async {
// final response = await http.post(
//   Uri.parse('http://10.0.2.2:5000/api'),
//   headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//   body: jsonEncode(<String, dynamic>{
//     'input': inputData,
//   }),
// );
// if (response.statusCode == 200) {
//   Map<String, dynamic> data = jsonDecode(response.body);
//   var dataval = data['output'];
//   print('Processed data from server:'+ dataval);
//   Output=dataval;
// } else {
//   print('Failed to process data');
// }
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
// Future<void> initPlatformState() async {
//   String? pyResult;
//
//   Directory tempDir =
//   await (await getTemporaryDirectory()).createTemp("run_example");
//
//   String resultFileName = p.join(tempDir.path, "out.txt");
//   // String resultValue = getRandomString(20);
//
//   await SeriousPython.run("app/simple.py", sync: false);
//   var out = File(resultFileName);
//   pyth = await out.readAsString();
//   print(pyth);
// }

// Future<String> runPythonScript(String scriptContent) async {
//   // Check if Python is installed (optional)
//   var pythonInstalled = await hasProcess('python');
//   if (!pythonInstalled) {
//     throw Exception('Python is not installed on this device.');
//   }
//
//   // Create a temporary script file (optional, security improvement)
//   var tempScript = await _createTempFile(scriptContent);
//
//   var shell = Shell();
//   var result = await shell.run('python $tempScript');
//
//   // Delete temporary file (if created)
//   if (tempScript != null) {
//     await tempScript.delete();
//   }
//
//   if (result.exitCode == 0) {
//     return result.stdout;
//   } else {
//     return "Error running script: ${result.stderr}";
//   }
// }
//
// Future<File?> _createTempFile(String scriptContent) async {
//   var tempDir = Directory.systemTemp;
//   var tempFile = await tempDir.createTempFile('script.py', '');
//   await tempFile.writeAsString(scriptContent);
//   return tempFile;
// }
//
// Future<bool> hasProcess(String processName) async {
//   try {
//     final result = await Process.run('which', [processName]);
//     return result.exitCode == 0;
//   } catch (e) {
//     return false;
//   }
// }

// class _pagetwo2 extends MaterialPageRoute<String> {
//   String url = '';
//   var data , decode;
//   String Output ='null';
//
//   _pagetwo2(String nam, String number)
//       : super(builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('2nd Page'),
//               elevation: 1.0,
//             ),
//             body: Builder(
//                 builder: (BuildContext context) => Center(
//                     child: Column(
//                       children: [
//                         Text(
//                             "Hey $nam !!\nEnter OTP for $number as asked..."
//                         ),
//                         TextButton(
//                             onPressed: () async {
//                               data = await fetchdata(url);
//                               var decoded = jsonDecode(data);
//                               setState(() {
//                                 output = decoded['output'];
//                               });
//                             },
//                             child: const Text(
//                               'Fetch Value from Server',
//                               style: TextStyle(fontSize: 20),
//                             )),
//                         Text(
//                           output,
//                           style: const TextStyle(fontSize: 40, color: Colors.green),
//                         ),
//                       ],
//                     ),
//                 ),
//             ),
//           );
//         });
// }

//
// class _pageMl extends MaterialPageRoute<void>{
//   String input_data = '';
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
//       String res=data['result'];
//       print('Processed data from server: $res');
//     } else {
//       print('Failed to process data');
//     }
//   }
//   void  _mlinput(va) {
//     setState(() {
//       input_data = va;
//     });
//   }
//   _pageMl()
//       : super(builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Process Data with Python'),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TextField(
//                     onSubmitted: (va) => _mlinput(va),
//                     decoration: const InputDecoration(
//                       labelText: 'Enter data to process',
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () async {
//                       String inputData = _controller.text;
//                       await processInputData(inputData);
//                     },
//                     child: Text('Process Data'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
// }
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter= _counter +2;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
