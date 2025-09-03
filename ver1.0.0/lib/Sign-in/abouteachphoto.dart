import 'package:flutter/material.dart';

class ShowPhoto extends StatefulWidget {
  final String IDD;
  const ShowPhoto({super.key, required this.IDD});

  get id => IDD;

  @override
  State<ShowPhoto> createState() => _ShowPhotoState();
}

class _ShowPhotoState extends State<ShowPhoto> {
  get id => widget.id;

  String name_id(String idd) {
    String nme = "Loading";
    if (idd == "1") {
      nme = "Tushar Mistry";
    } else if (idd == "2") {
      nme = "Akshat Yadav";
    } else if (idd == "3") {
      nme = "Mahhamad Syed Arhan";
    } else if (idd == "4") {
      nme = "Muskan Kumari";
    } else if (idd == "5") {
      nme = "Hrishikesh Mishra";
    }
    return nme;
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: Theme.of(context).colorScheme.secondary,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          title: Text(name_id(id)),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height * 0.10,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  thickness: 3.0,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "Profile-Photo-$id",
                      child: GestureDetector(
                        onHorizontalDragDown: (DragDownDetails dd) {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 5,
                          height: MediaQuery.sizeOf(context).width - 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(00),
                            image: const DecorationImage(
                              image: AssetImage('files/images/img.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Hero(
                    //   tag: "Profile-Photo-$id",
                    //   child: CircleAvatar(
                    //     // minRadius: 20.0,
                    //     // maxRadius: 20.0,
                    //     radius: 20.0,
                    //     backgroundColor: Colors.deepPurple[200],
                    //     child: const Icon(
                    //       Icons.person,
                    //       // size: 50.0,
                    //     ),
                    //   ),
                    // ),
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
